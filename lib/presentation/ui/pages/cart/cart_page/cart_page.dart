import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/error_filters.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/cart_item_card.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/coupon_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/price_summary_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/reward_points_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/cart_page/empty_cart_view.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/cart_page/cart_checkout_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _cacheManager = getIt<AuthCacheManager>();
  bool _isSavingForLater = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadCart(context.read<CartBloc>());
    });
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

  void _requireAuth(BuildContext context, VoidCallback action) {
    final isAuthenticated = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (token, user) => true,
      orElse: () => false,
    );
    if (isAuthenticated) {
      action();
    } else {
      context.push(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: Text(
          'My Cart',
          style: context.textStyle.appBarTitle,
        ),
        actions: [
          AppBarButton(
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
            iconPath: 'assets/new/svg/favorite_icon.svg',
            width: 22.w,
            height: 20.h,
            iconColor: colors.primary,
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          state.maybeWhen(
            itemAdded: (cart, message) {
              SnackBarUtils.showSuccess(context, message);
            },
            couponApplied: (cart, couponCode) {
              SnackBarUtils.showSuccess(context, 'Coupon added successfully');
            },
            couponRemoved: (cart) {
              SnackBarUtils.showSuccess(context, 'Coupon removed successfully');
            },
            rewardPointsApplied: (cart, pointsUsed) {
              SnackBarUtils.showSuccess(context, 'Point applied successfully');
            },
            rewardPointsRemoved: (cart) {
              SnackBarUtils.showSuccess(context, 'Point canceled successfully');
            },
            loaded: (cart) {
              if (_isSavingForLater) {
                _isSavingForLater = false;
                SnackBarUtils.showSuccess(
                  context,
                  'Item has saved on wishlist successfully',
                );
              }
            },
            error: (error, lastCart) {
              if (_isSavingForLater) {
                _isSavingForLater = false;
              }
              if (isSilentCartError(error.message)) return;
              SnackBarUtils.showError(
                context,
                error.message,
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () =>
                Center(child: CircularProgressIndicator(color: colors.primary)),
            empty: () => const EmptyCartView(),
            loaded: (cart) => _buildCartContent(context, cart, false),
            operationInProgress: (cart, operation) =>
                _buildCartContent(context, cart, true),
            itemAdded: (cart, _) => _buildCartContent(context, cart, false),
            couponApplied: (cart, _) => _buildCartContent(context, cart, false),
            couponRemoved: (cart) => _buildCartContent(context, cart, false),
            rewardPointsApplied: (cart, _) =>
                _buildCartContent(context, cart, false),
            rewardPointsRemoved: (cart) =>
                _buildCartContent(context, cart, false),
            error: (error, lastCart) => lastCart != null
                ? _buildCartContent(context, lastCart, false)
                : _buildError(context, error.message),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
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
    );
  }

  Widget _buildError(BuildContext context, String message) {
    final colors = context.colors;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64.sp, color: colors.red),
          SizedBox(height: 16.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: context.textStyle.bodyLarge.withColor(colors.text),
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              context.read<CartBloc>().add(const CartEvent.getCart());
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, cart, bool isLoading) {
    final colors = context.colors;

    if (cart.items.isEmpty) {
      return const EmptyCartView();
    }

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        if (isLoading)
          SliverToBoxAdapter(
            child: LinearProgressIndicator(color: colors.primary),
          ),
        SliverToBoxAdapter(child: SizedBox(height: 12.h)),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = cart.items[index];
            return BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, profileState) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: CartItemCard(
                    item: item,
                    isQuantityModifiable: true,
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
                  ),
                );
              },
            );
          }, childCount: cart.items.length),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CouponWidget(
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
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Builder(
              builder: (context) {
                return RewardPointsWidget(
                  maxPoints: cart.maxSpendablePoints,
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
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: PriceSummaryWidget(
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
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
      ],
    );
  }
}
