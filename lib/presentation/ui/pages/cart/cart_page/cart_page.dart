// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/error_filters.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_bloc.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_event.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_state.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/cart_item_card.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/cart_page/cart_checkout_button.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/cart_page/empty_cart_view.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/coupon_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/price_summary_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/reward_points_widget.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/no_internet_page/no_internet_page.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

// ============================================================================
// 🛒 CART PAGE — GOLDEN UX RULE (DO NOT VIOLATE!)
// ============================================================================
// ❌ NEVER show EmptyCartView while the cart is still loading or unverified.
// ❌ NEVER allow the flow: Empty Cart → Loading → Cart with Items.
//    This "flash of empty" destroys user confidence.
//
// ✅ ALWAYS show a loader (AppLoader.fullPage) until the backend has responded
//    at least once and we are 100% certain the cart is empty.
// ✅ Only AFTER backend confirmation (_isBackendVerified == true) AND the
//    cart truly has zero items, show EmptyCartView.
//
// The flag [_isBackendVerified] tracks whether the backend has responded at
// least once in this page session. It starts as false and is set to true
// only when we receive a definitive state (loaded, empty, itemAdded, error).
//
// If you are fixing any cart bug in the future, ensure this invariant holds:
//   "A user must NEVER see an empty cart that then fills with items."
// ============================================================================

/// Modernized CartPage matching Pickaboo-App-UI design language.
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _cacheManager = getIt<AuthCacheManager>();
  bool _isSavingForLater = false;

  /// Whether the backend has confirmed the cart state at least once in this
  /// page session. Until this is true, we MUST show a loader — never
  /// EmptyCartView. See GOLDEN UX RULE above.
  bool _isBackendVerified = false;

  @override
  void initState() {
    super.initState();
    final cartBloc = context.read<CartBloc>();
    if (cartBloc.isPendingAddition) {
      _isBackendVerified = false;
    } else {
      final existingCart = cartBloc.currentCart;
      _isBackendVerified = (existingCart != null && existingCart.items.isNotEmpty) ||
          cartBloc.state.maybeWhen(error: (_, __) => true, orElse: () => false);
      _loadCart(cartBloc);
    }

    final isAuthenticated = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (_, _) => true,
      orElse: () => false,
    );
    if (isAuthenticated) {
      context.read<ClubPointBloc>().add(
        const ClubPointEvent.getClubPoints(limit: 5),
      );
    }
  }

  Future<void> _loadCart(CartBloc bloc) async {
    final token = await _cacheManager.getToken();

    if (token != null && token.isNotEmpty) {
      bloc.add(const CartEvent.getCart());
    } else {
      final guestCartId = await _cacheManager.getGuestCartId();

      if (guestCartId != null && guestCartId.isNotEmpty) {
        bloc.add(CartEvent.loadGuestCart(guestCartId: guestCartId));
      } else {
        bloc.add(const CartEvent.createGuestCart());
      }
    }
  }

  void _requireAuth(BuildContext context, VoidCallback action) async {
    final isAuthenticated = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (token, user) => true,
      orElse: () => false,
    );
    if (isAuthenticated) {
      action();
    } else {
      await context.push(Routes.login);
      if (context.mounted) {
        final isNowAuth = context.read<AuthBloc>().state.maybeWhen(
          authenticated: (token, user) => true,
          orElse: () => false,
        );
        if (isNowAuth) {
          action();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listenWhen: (previous, current) =>
          previous.maybeWhen(disconnected: (_) => true, orElse: () => false) &&
          current.maybeWhen(connected: (_) => true, orElse: () => false),
      listener: (context, state) {
        context.read<CartBloc>().add(const CartEvent.getCart());
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(Routes.home);
          }
        },
        child: Scaffold(
        backgroundColor: AppColors.pageBg,
      appBar: PickabooAppBar(
        title: 'My Cart',
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border_rounded,
              color: AppColors.navy,
              size: 22.sp,
            ),
            onPressed: () {
              final isLoggedIn = context.read<AuthBloc>().state.maybeWhen(
                authenticated: (token, user) => true,
                orElse: () => false,
              );
              if (isLoggedIn) {
                context.push(Routes.wishlist);
              } else {
                context.push(Routes.login);
              }
            },
          ),
          SizedBox(width: 4.w),
        ],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          state.maybeWhen(
            itemAdded: (cart, message) {
              if (!_isBackendVerified) {
                setState(() => _isBackendVerified = true);
              }
              SnackBarUtils.showSuccess(
                context,
                message.isNotEmpty ? message : AppStrings.itemAddedToCart,
              );
            },
            couponApplied: (cart, couponCode) {
              SnackBarUtils.showSuccess(
                context,
                AppStrings.couponAddedSuccessfully,
              );
            },
            couponRemoved: (cart) {
              SnackBarUtils.showSuccess(
                context,
                AppStrings.couponRemovedSuccessfully,
              );
            },
            rewardPointsApplied: (cart, pointsUsed) {
              SnackBarUtils.showSuccess(
                context,
                AppStrings.pointAppliedSuccessfully,
              );
            },
            rewardPointsRemoved: (cart) {
              SnackBarUtils.showSuccess(
                context,
                AppStrings.pointCanceledSuccessfully,
              );
            },
            loaded: (cart) {
              if (!_isBackendVerified) {
                setState(() => _isBackendVerified = true);
              }
              if (_isSavingForLater) {
                _isSavingForLater = false;
                SnackBarUtils.showSuccess(
                  context,
                  AppStrings.itemAddedToWishlist,
                );
              }
            },
            empty: () {
              if (context.read<CartBloc>().isPendingAddition) {
                return;
              }
              if (!_isBackendVerified) {
                setState(() => _isBackendVerified = true);
              }
            },
            error: (error, lastCart) {
              if (context.read<CartBloc>().isPendingAddition) {
                return;
              }
              if (!_isBackendVerified) {
                setState(() => _isBackendVerified = true);
              }
              if (_isSavingForLater) {
                _isSavingForLater = false;
              }
              if (isSilentCartError(error.message)) return;
              if (ConnectivityUtils.isNoInternet(error.message, context)) return;
              SnackBarUtils.showError(
                context,
                error.message.isNotEmpty
                    ? error.message
                    : AppStrings.somethingWentWrong,
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isPending = context.read<CartBloc>().isPendingAddition;
          return state.when(
            initial: () {
              if (isPending) return const AppLoader.fullPage();
              final existingCart = context.read<CartBloc>().currentCart;
              if (existingCart != null && existingCart.items.isNotEmpty) {
                return _buildCartContent(context, existingCart, false);
              }
              return const AppLoader.fullPage();
            },
            loading: () {
              if (isPending) return const AppLoader.fullPage();
              final existingCart = context.read<CartBloc>().currentCart;
              if (existingCart != null && existingCart.items.isNotEmpty) {
                return _buildCartContent(context, existingCart, true);
              }
              return const AppLoader.fullPage();
            },
            empty: () {
              if (!_isBackendVerified || isPending) {
                return const AppLoader.fullPage();
              }
              return const EmptyCartView();
            },
            loaded: (cart) {
              if (isPending || (cart.items.isEmpty && !_isBackendVerified)) {
                return const AppLoader.fullPage();
              }
              if (cart.items.isEmpty) {
                return const EmptyCartView();
              }
              return _buildCartContent(context, cart, false);
            },
            operationInProgress: (cart, operation) {
              if (cart.items.isEmpty || isPending) {
                return const AppLoader.fullPage();
              }
              return _buildCartContent(context, cart, true);
            },
            itemAdded: (cart, _) => _buildCartContent(context, cart, false),
            couponApplied: (cart, _) => _buildCartContent(context, cart, false),
            couponRemoved: (cart) => _buildCartContent(context, cart, false),
            rewardPointsApplied: (cart, _) =>
                _buildCartContent(context, cart, false),
            rewardPointsRemoved: (cart) =>
                _buildCartContent(context, cart, false),
            error: (error, lastCart) {
              if (isPending || !_isBackendVerified) {
                return const AppLoader.fullPage();
              }
              if (lastCart != null && lastCart.items.isNotEmpty) {
                return _buildCartContent(context, lastCart, false);
              }
              return _buildError(context, error.message);
            },
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (ConnectivityUtils.isOffline(context)) {
              return const SizedBox.shrink();
            }

            final cart = state.maybeWhen(
              loaded: (cart) => cart,
              operationInProgress: (cart, _) => cart,
              itemAdded: (cart, _) => cart,
              couponApplied: (cart, _) => cart,
              couponRemoved: (cart) => cart,
              rewardPointsApplied: (cart, _) => cart,
              rewardPointsRemoved: (cart) => cart,
              orElse: () => null,
            );

            if (cart == null || cart.items.isEmpty) {
              return const SizedBox.shrink();
            }

            return CartCheckoutButton(
              grandTotal: cart.grandTotal,
              onCheckout: () {
                if (ConnectivityUtils.isOffline(context)) {
                  SnackBarUtils.showError(
                    context,
                    AppStrings.noInternetConnection,
                  );
                  return;
                }
                getIt<AnalyticsService>().logBeginCheckout(
                  value: cart.grandTotal,
                  coupon: cart.couponCode.isNotEmpty ? cart.couponCode : null,
                  items: cart.items
                      .map(
                        (item) => {
                          'id': item.sku,
                          'name': item.name,
                          'price': item.price,
                          'quantity': item.qty,
                          'brand': item.brand,
                        },
                      )
                      .toList(),
                );
                _requireAuth(context, () => context.push(Routes.paymentReview));
              },
            );
          },
        ),
      ),
    ),
    ),
  );
  }

  Widget _buildError(BuildContext context, String message) {
    final isOffline = ConnectivityUtils.isNoInternet(message, context);
    if (isOffline) {
      return NoInternetPage(
        showAppBar: false,
        onRetry: () {
          context.read<CartBloc>().add(const CartEvent.getCart());
        },
      );
    }
    return AppErrorView(
      type: AppErrorType.generic,
      title: 'Unable to Load Cart',
      message: message,
      onRetry: () {
        context.read<CartBloc>().add(const CartEvent.getCart());
      },
    );
  }

  Widget _buildCartContent(BuildContext context, CartEntity cart, bool isLoading) {
    if (cart.items.isEmpty) {
      // GOLDEN RULE: Show loader if still loading OR backend hasn't confirmed
      // the cart is truly empty, OR an addition is in flight. Never flash EmptyCartView prematurely.
      if (isLoading || !_isBackendVerified || context.read<CartBloc>().isPendingAddition) {
        return const AppLoader.fullPage();
      }
      return const EmptyCartView();
    }

    return Column(
      children: [
        if (isLoading)
          const AppLoader.linear(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              AppSpacing.sameGroupItemSpacing.w,
              0,
              AppSpacing.sameGroupItemSpacing.w,
              20.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── 1. GROUPED CART ITEMS CARD (ALL IN 1 CARD) ──
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: AppRadius.cardRadius,
                    border: Border.all(color: AppColors.border),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.navy.withValues(alpha: 0.03),
                        blurRadius: 8.r,
                        offset: Offset(0, 2.h),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      for (int i = 0; i < cart.items.length; i++) ...[
                        BlocBuilder<UserProfileBloc, UserProfileState>(
                          builder: (context, profileState) {
                            final item = cart.items[i];
                            return CartItemCard(
                              item: item,
                              isQuantityModifiable: true,
                              showOuterCard: false,
                              showDivider: i < cart.items.length - 1,
                              onQuantityChanged: (qty) {
                                context.read<CartBloc>().add(
                                  CartEvent.updateItemQuantity(
                                    itemId: item.itemId,
                                    qty: qty,
                                    quoteId: item.quoteId,
                                  ),
                                );
                              },
                              onRemove: () {
                                context.read<CartBloc>().add(
                                  CartEvent.removeItem(itemId: item.itemId),
                                );
                              },
                              onSaveForLater: () {
                                _requireAuth(context, () {
                                  final customerId = context
                                      .read<AuthBloc>()
                                      .state
                                      .maybeWhen(
                                        authenticated: (token, user) => user.id,
                                        orElse: () => null,
                                      );
                                  if (customerId == null) return;
                                  setState(() => _isSavingForLater = true);
                                  context.read<CartBloc>().add(
                                    CartEvent.saveForLater(
                                      customerId: customerId,
                                      cartId: cart.id,
                                      itemId: item.itemId,
                                    ),
                                  );
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ),

                SizedBox(height: AppSpacing.groupToGroupSpacing.h),

                // ── 2. APPLY DISCOUNT CODE CARD ──
                CouponWidget(
                  appliedCoupon: cart.couponCode,
                  onApply: (code) {
                    _requireAuth(context, () {
                      context.read<CartBloc>().add(
                        CartEvent.applyCoupon(cartId: cart.id, coupon: code),
                      );
                    });
                  },
                  onCancel: () {
                    _requireAuth(context, () {
                      context.read<CartBloc>().add(
                        CartEvent.removeCoupon(cartId: cart.id),
                      );
                    });
                  },
                ),

                SizedBox(height: AppSpacing.groupToGroupSpacing.h),

                // ── 3. USE CLUB POINTS CARD ──
                BlocBuilder<ClubPointBloc, ClubPointState>(
                  builder: (context, clubPointState) {
                    final availableClubPoints = clubPointState.maybeWhen(
                      loaded: (data) => data.myPoints,
                      orElse: () => 0,
                    );
                    final effectiveMaxPoints = cart.maxSpendablePoints > 0
                        ? cart.maxSpendablePoints
                        : (availableClubPoints > 0
                            ? availableClubPoints.clamp(0, cart.subtotal.toInt())
                            : 0);

                    return RewardPointsWidget(
                      maxPoints: effectiveMaxPoints,
                      minPoints: cart.minSpendablePoints,
                      pointsToEarn: cart.pointsToEarn,
                      appliedPoints: cart.appliedPoints,
                      onApply: (points) {
                        _requireAuth(context, () {
                          context.read<CartBloc>().add(
                            CartEvent.applyRewardPoints(
                              cartId: cart.id,
                              pointAmount: points,
                            ),
                          );
                        });
                      },
                      onCancel: () {
                        _requireAuth(context, () {
                          context.read<CartBloc>().add(
                            CartEvent.removeRewardPoints(cartId: cart.id),
                          );
                        });
                      },
                    );
                  },
                ),

                SizedBox(height: AppSpacing.groupToGroupSpacing.h),

                // ── 4. ORDER SUMMARY CARD ──
                PriceSummaryWidget(
                  subtotal: cart.subtotal,
                  grandTotal: cart.grandTotal,
                  discountAmount: cart.discountAmount,
                  shippingAmount: cart.shippingAmount,
                  discountTitle: cart.discountTitle.isNotEmpty
                      ? cart.discountTitle
                      : (cart.couponCode.isNotEmpty
                            ? 'Discount (${cart.couponCode})'
                            : 'Discount'),
                  clubPointDiscount: cart.rewardPointsDiscount,
                  itemsCount: cart.itemsCount,
                ),

                SizedBox(height: AppSpacing.groupToGroupSpacing.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
