// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/error_filters.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/demo/payment_models.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/cart/address_added_result.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/cart_item_card.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_review_page/billing_address_toggle.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_review_page/payment_review_section.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_review_page/place_order_bottom_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/price_summary_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/payment_review_page/address_card.dart';
import 'package:pickaboo/presentation/ui/widgets/payment_review_page/delivery_options_widget.dart';

/// Modernized PaymentReviewPage matching Pickaboo-App-UI design language.
class PaymentReviewPage extends StatefulWidget {
  const PaymentReviewPage({super.key});

  @override
  State<PaymentReviewPage> createState() => _PaymentReviewPageState();
}

class _PaymentReviewPageState extends State<PaymentReviewPage> {
  bool _sameAsShipping = true;

  AddressAddedResult? _pendingShippingResult;
  AddressAddedResult? _pendingBillingResult;

  Set<int> _knownShippingAddressIds = const {};
  Set<int> _knownBillingAddressIds = const {};

  bool _placeOrderDispatched = false;

  @override
  void initState() {
    super.initState();
    context.read<CheckoutBloc>().add(const CheckoutEvent.loadCheckout());
  }

  Set<int> _addressIds(CheckoutEntity? checkout) => {
    for (final a in checkout?.cart.customer?.addresses ?? const [])
      if (a.id != null && a.id! > 0) a.id!,
  };

  AddressEntity? _resolveAddedAddress(
    List<AddressEntity> addresses,
    Set<int> knownIds,
    AddressAddedResult pending, {
    required bool shipping,
  }) {
    for (final a in addresses.reversed) {
      final id = a.id;
      if (id != null && id > 0 && !knownIds.contains(id)) return a;
    }
    return pending.resolveIn(addresses, shipping: shipping);
  }

  void _applyPendingAddressSelection(CheckoutEntity checkout) {
    final pendingShipping = _pendingShippingResult;
    final pendingBilling = _pendingBillingResult;
    if (pendingShipping == null && pendingBilling == null) return;

    final addresses = checkout.cart.customer?.addresses ?? const [];
    if (addresses.isEmpty) {
      _pendingShippingResult = null;
      _pendingBillingResult = null;
      return;
    }

    final bloc = context.read<CheckoutBloc>();

    if (pendingShipping != null) {
      _pendingShippingResult = null;
      final address = _resolveAddedAddress(
        addresses,
        _knownShippingAddressIds,
        pendingShipping,
        shipping: true,
      );
      if (address != null) {
        bloc.add(CheckoutEvent.updateShippingAddress(address: address));
        if (pendingShipping.isTemporary) {
          SnackBarUtils.showSuccess(
            context,
            'Address applied to this order only',
          );
        }
      }
    }

    if (pendingBilling != null) {
      _pendingBillingResult = null;
      final address = _resolveAddedAddress(
        addresses,
        _knownBillingAddressIds,
        pendingBilling,
        shipping: false,
      );
      if (address != null) {
        bloc.add(CheckoutEvent.updateBillingAddress(address: address));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: "Checkout",
      ),
      body: BlocConsumer<CheckoutBloc, CheckoutState>(
        listener: (context, state) {
          state.maybeWhen(
            orderPlaced: (orderId, totalAmount, paymentMethod, checkout, availablePaymentMethods) {
              context.read<CartBloc>().add(const CartEvent.getCart());
              context.goToPaymentMethod(
                orderId: orderId,
                selectedMethod: paymentMethod,
                cartId: checkout.cart.id.toString(),
                availablePaymentMethods: availablePaymentMethods,
              );
            },
            paymentFailed: (orderId, errorMessage) {
              context.goToOrderFailed(orderId: orderId);
              SnackBarUtils.showError(
                context,
                errorMessage.isNotEmpty
                    ? errorMessage
                    : AppStrings.somethingWentWrong,
              );
            },
            error: (error, _) {
              _placeOrderDispatched = false;
              if (isSilentCartError(error.message)) return;
              SnackBarUtils.showError(
                context,
                error.message.isNotEmpty
                    ? error.message
                    : AppStrings.somethingWentWrong,
              );
            },
            checkoutLoaded: (checkout, _, _, _, _, _, _) {
              _applyPendingAddressSelection(checkout);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: (_) => const AppLoader.fullPage(),
            placingOrder: (_) => const AppLoader.fullPage(),
            orderPlaced: (_, _, _, _, _) => const AppLoader.fullPage(),
            paymentFailed: (_, _) => const AppLoader.fullPage(),
            checkoutLoaded: (
              checkout,
              shippingAddress,
              billingAddress,
              selectedPaymentMethod,
              selectedShippingMethodCode,
              availableShippingMethods,
              availablePaymentMethods,
            ) {
              AddressEntity? shipping = shippingAddress;
              AddressEntity? billing = billingAddress;

              if (shipping == null) {
                if (checkout.cart.shippingAddress?.firstname?.isNotEmpty == true) {
                  shipping = checkout.cart.shippingAddress;
                } else if ((checkout.cart.customer?.addresses.isNotEmpty ?? false)) {
                  shipping = checkout.cart.customer!.addresses.firstWhere(
                    (element) => element.defaultShipping,
                    orElse: () => checkout.cart.customer!.addresses.first,
                  );
                }
              }

              if (billing == null) {
                if (checkout.cart.billingAddress?.firstname?.isNotEmpty == true) {
                  billing = checkout.cart.billingAddress;
                }
              }

              final deliveryMethods = availableShippingMethods
                  .map(
                    (method) => DeliveryMethod(
                      carrierCode: method.carrierCode,
                      methodCode: method.methodCode,
                      carrierTitle: method.carrierTitle,
                      methodTitle: method.methodTitle,
                      amount: method.amount,
                      isSelected: selectedShippingMethodCode ==
                          '${method.carrierCode}_${method.methodCode}',
                    ),
                  )
                  .toList();

              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // ── SHIPPING ADDRESS ──
                  SliverToBoxAdapter(
                    child: PaymentReviewSection(
                      title: "Shipping Address",
                      child: AddressCard(
                        address: shipping,
                        onChange: () async {
                          _knownShippingAddressIds = _addressIds(checkout);
                          final result = await context.push<Object?>(
                            Routes.changeAddressCart,
                            extra: {
                              'addresses':
                                  checkout.cart.customer?.addresses ?? [],
                              'selectedAddress': shipping,
                              'title': 'Shipping Information',
                            },
                          );
                          if (!context.mounted) return;
                          if (result is AddressAddedResult) {
                            _pendingShippingResult = result;
                            context.read<CheckoutBloc>().add(
                              const CheckoutEvent.loadCheckout(),
                            );
                          } else if (result is AddressEntity) {
                            context.read<CheckoutBloc>().add(
                              CheckoutEvent.updateShippingAddress(
                                address: result,
                              ),
                            );
                          }
                        },
                        onAddNew: () async {
                          _knownShippingAddressIds = _addressIds(checkout);
                          final result = await context.push<Object?>(
                            Routes.newAddressCart,
                            extra: 'Shipping Information',
                          );
                          if (result is AddressAddedResult && context.mounted) {
                            _pendingShippingResult = result;
                            context.read<CheckoutBloc>().add(
                              const CheckoutEvent.loadCheckout(),
                            );
                          }
                        },
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: AppSpacing.groupToGroupSpacing.h),
                  ),

                  // ── BILLING ADDRESS ──
                  SliverToBoxAdapter(
                    child: PaymentReviewSection(
                      title: "Billing Address",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BillingAddressToggle(
                            value: _sameAsShipping,
                            onChanged: (val) {
                              setState(() {
                                _sameAsShipping = val;
                              });
                            },
                          ),
                          if (!_sameAsShipping)
                            Padding(
                              padding: EdgeInsets.only(top: 12.h),
                              child: AddressCard(
                                address: billing,
                                onChange: () async {
                                  _knownBillingAddressIds = _addressIds(checkout);
                                  final result = await context.push<Object?>(
                                    Routes.changeAddressCart,
                                    extra: {
                                      'addresses':
                                          checkout.cart.customer?.addresses ??
                                              [],
                                      'selectedAddress': billing,
                                      'title': 'Billing Information',
                                    },
                                  );
                                  if (!context.mounted) return;
                                  if (result is AddressAddedResult) {
                                    _pendingBillingResult = result;
                                    context.read<CheckoutBloc>().add(
                                      const CheckoutEvent.loadCheckout(),
                                    );
                                  } else if (result is AddressEntity) {
                                    context.read<CheckoutBloc>().add(
                                      CheckoutEvent.updateBillingAddress(
                                        address: result,
                                      ),
                                    );
                                  }
                                },
                                onAddNew: () async {
                                  _knownBillingAddressIds = _addressIds(checkout);
                                  final result = await context.push<Object?>(
                                    Routes.newAddressCart,
                                    extra: 'Billing Information',
                                  );
                                  if (result is AddressAddedResult &&
                                      context.mounted) {
                                    _pendingBillingResult = result;
                                    context.read<CheckoutBloc>().add(
                                      const CheckoutEvent.loadCheckout(),
                                    );
                                  }
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: AppSpacing.groupToGroupSpacing.h),
                  ),

                  // ── CART ITEMS REVIEW (ALL IN 1 CARD) ──
                  if (checkout.cart.items.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.sameGroupItemSpacing.w,
                        ),
                        child: Container(
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
                              for (int i = 0;
                                  i < checkout.cart.items.length;
                                  i++)
                                CartItemCard(
                                  item: checkout.cart.items[i],
                                  showActions: false,
                                  showOuterCard: false,
                                  showDivider:
                                      i < checkout.cart.items.length - 1,
                                  onQuantityChanged: (_) {},
                                  onRemove: () {},
                                  onSaveForLater: () {},
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: AppSpacing.groupToGroupSpacing.h),
                    ),
                  ],

                  // ── DELIVERY METHODS ──
                  if (deliveryMethods.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: DeliveryOptionsWidget(
                        methods: deliveryMethods,
                        onSameMethodSelected: (method) {
                          context.read<CheckoutBloc>().add(
                            CheckoutEvent.selectShippingMethod(
                              carrierCode: method.carrierCode,
                              methodCode: method.methodCode,
                            ),
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: AppSpacing.groupToGroupSpacing.h),
                    ),
                  ],

                  // ── PRICE SUMMARY ──
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sameGroupItemSpacing.w,
                      ),
                      child: Builder(
                        builder: (context) {
                          double shippingCost =
                              checkout.cartTotals.shippingAmount;
                          double grandTotal = checkout.cartTotals.grandTotal;

                          if (shippingCost == 0 &&
                              selectedShippingMethodCode != null) {
                            try {
                              final selectedMethod =
                                  availableShippingMethods.firstWhere(
                                (m) =>
                                    '${m.carrierCode}_${m.methodCode}' ==
                                    selectedShippingMethodCode,
                              );
                              shippingCost = selectedMethod.amount;
                              grandTotal += shippingCost;
                            } catch (_) {}
                          }

                          String discountTitle = 'Discount';
                          final couponCode = checkout.cartTotals.couponCode;
                          if (couponCode.isNotEmpty) {
                            discountTitle = 'Discount ($couponCode)';
                          } else {
                            for (final segment
                                in checkout.cartTotals.totalSegments) {
                              if (segment.code == 'discount') {
                                discountTitle = segment.title.isNotEmpty
                                    ? segment.title
                                    : 'Discount';
                                break;
                              }
                            }
                          }

                          double clubPointDiscount = 0;
                          for (final segment
                                in checkout.cartTotals.totalSegments) {
                            if (segment.code == 'rewards-spend-amount') {
                              clubPointDiscount = segment.value.abs();
                              break;
                            }
                          }

                          return PriceSummaryWidget(
                            subtotal: checkout.cartTotals.subtotal,
                            grandTotal: grandTotal,
                            discountAmount:
                                checkout.cartTotals.discountAmount.abs(),
                            shippingAmount: shippingCost,
                            discountTitle: discountTitle,
                            clubPointDiscount: clubPointDiscount,
                            itemsCount: checkout.cart.itemsCount,
                          );
                        },
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: AppSpacing.groupToGroupSpacing.h),
                  ),
                ],
              );
            },
            orElse: () => Center(
              child: Text(
                "Something went wrong",
                style: AppTypography.bodyRegular,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          return state.maybeWhen(
            checkoutLoaded: (checkout, shippingAddress, billingAddress, _, _, _, _) {
              return PlaceOrderBottomBar(
                total: checkout.cartTotals.grandTotal,
                onPlaceOrder: () {
                  _handlePlaceOrder(
                    checkout,
                    shippingAddress,
                    billingAddress,
                    context,
                  );
                },
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  void _handlePlaceOrder(
    dynamic checkout,
    AddressEntity? selectedShipping,
    AddressEntity? selectedBilling,
    BuildContext context,
  ) {
    if (_placeOrderDispatched) return;

    AddressEntity? shipping = selectedShipping;
    AddressEntity? billing = selectedBilling;

    if (shipping == null) {
      if (checkout.cart.shippingAddress?.firstname != null) {
        shipping = checkout.cart.shippingAddress;
      } else if ((checkout.cart.customer?.addresses.isNotEmpty ?? false)) {
        shipping = checkout.cart.customer!.addresses.firstWhere(
          (element) => element.defaultShipping,
          orElse: () => checkout.cart.customer!.addresses.first,
        );
      }
    }

    if (_sameAsShipping && shipping != null) {
      billing = shipping;
    }

    if (billing == null) {
      if (checkout.cart.billingAddress?.firstname != null) {
        billing = checkout.cart.billingAddress;
      }
    }

    if (shipping != null && billing != null) {
      if (selectedShipping == null) {
        context.read<CheckoutBloc>().add(
          CheckoutEvent.updateShippingAddress(address: shipping),
        );
      }
      if (selectedBilling == null) {
        context.read<CheckoutBloc>().add(
          CheckoutEvent.updateBillingAddress(address: billing),
        );
      }

      final double shipValue = (checkout.cartTotals.grandTotal as num).toDouble();
      final String shipCoupon = checkout.cartTotals.couponCode as String;
      final List<Map<String, dynamic>> shipItems = (checkout.cart.items as List)
          .map<Map<String, dynamic>>(
            (item) => {
              'id': item.sku,
              'name': item.name,
              'price': item.price,
              'quantity': item.qty,
              'brand': item.brand,
            },
          )
          .toList();
      getIt<AnalyticsService>().logAddShippingInfo(
        value: shipValue,
        coupon: shipCoupon.isNotEmpty ? shipCoupon : null,
        items: shipItems,
      );

      _placeOrderDispatched = true;
      context.read<CheckoutBloc>().add(const CheckoutEvent.placeOrder());
    } else {
      SnackBarUtils.showWarning(
        context,
        "Please select shipping and billing address",
      );
    }
  }
}
