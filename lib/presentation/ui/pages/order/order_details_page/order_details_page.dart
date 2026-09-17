// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/just_for_you_bloc/just_for_you_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/order/bottom_sheet/order_review_product_bottom_sheet.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_address_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_header_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_item_card.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_payment_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_shipping_method_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_summary_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_timeline_section.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// Modernized OrderDetailsPage matching Pickaboo-App-UI design language.
class OrderDetailsPage extends StatefulWidget {
  final String orderId;
  final bool embedded;

  const OrderDetailsPage({
    super.key,
    required this.orderId,
    this.embedded = false,
  });

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderBloc>().add(
        OrderEvent.loadOrderDetails(widget.orderId),
      );
      context.read<JustForYouBloc>().add(const JustForYouEvent.getProducts());
    });
  }

  void _handleReorder(BuildContext context, String orderId) {
    context.read<OrderBloc>().add(OrderEvent.reorder(orderId));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(Routes.orderList);
        }
      },
      child: Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: widget.embedded
          ? null
          : PickabooAppBar(
              title: "Items Order",
              showBackButton: true,
              onBackTap: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(Routes.orderList);
                }
              },
            ),
      bottomNavigationBar: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state.orderDetails == null) return const SizedBox.shrink();
          final order = state.orderDetails!;
          final showCancel = _shouldShowCancel(order);

          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w * 2,
              vertical: 12.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: const Border(top: BorderSide(color: AppColors.border)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.navy.withValues(alpha: 0.05),
                  blurRadius: 10.r,
                  offset: Offset(0, -2.h),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: showCancel
                  ? Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: AppButton.outline(
                            height: 48.h,
                            borderRadius: AppRadius.cardRadius,
                            borderColor: AppColors.red,
                            textColor: AppColors.red,
                            text: 'Cancel Order',
                            onPressed: () {
                              context.push(Routes.orderCancelled, extra: order);
                            },
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          flex: 1,
                          child: AppButton.primary(
                            height: 48.h,
                            borderRadius: AppRadius.cardRadius,
                            text: 'Buy Again',
                            onPressed: () => _handleReorder(
                              context,
                              order.orderId.toString(),
                            ),
                          ),
                        ),
                      ],
                    )
                  : AppButton.primary(
                      height: 48.h,
                      borderRadius: AppRadius.cardRadius,
                      text: 'Buy Again',
                      onPressed: () =>
                          _handleReorder(context, order.orderId.toString()),
                    ),
            ),
          );
        },
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            final cartBloc = context.read<CartBloc>();
            cartBloc.markAdditionPending();
            cartBloc.add(const CartEvent.getCart());
            SnackBarUtils.showSuccess(
              context,
              state.successMessage ?? AppStrings.operationSuccessful,
            );
            context.push(Routes.cart);
          }
          if (state.errorMessage != null) {
            SnackBarUtils.showError(
              context,
              state.errorMessage ?? AppStrings.somethingWentWrong,
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.orderDetails == null) {
            return const AppLoader.fullPage();
          }

          if (state.orderDetails == null) {
            final isOffline = ConnectivityUtils.isNoInternet(state.errorMessage, context);
            return AppErrorView(
              type: isOffline ? AppErrorType.noInternet : AppErrorType.server,
              message: isOffline ? null : (state.errorMessage ?? "Failed to load order details"),
              onRetry: () {
                context.read<OrderBloc>().add(
                  OrderEvent.loadOrderDetails(widget.orderId),
                );
              },
              onSecondary: Navigator.of(context).canPop()
                  ? () => Navigator.of(context).pop()
                  : null,
              secondaryLabel: 'Go Back',
            );
          }

          final order = state.orderDetails!;

          return SafeArea(
            top: false,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: OrderHeaderSection(
                    order: order,
                    getStatusAttributes: _getStatusAttributes,
                    showPayNow: _shouldShowPayNow(order),
                    onPayNow: () {
                      context.goToOrderPayment(
                        orderId: order.orderId.toString(),
                        selectedMethod: order.paymentMethod,
                        grandTotal: order.orderSummary.grandTotal,
                        subtotal: order.orderSummary.subtotal,
                        shippingAmount: order.orderSummary.shippingFee,
                        discountAmount: order.orderSummary.discountAmount,
                        itemsCount: order.orderSummary.totalOrderQty,
                        quoteId: order.paymentAddress?.quoteId,
                      );
                    },
                    onReview: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: AppColors.transparent,
                        builder: (context) => OrderReviewProductBottomSheet(
                          items: order.items,
                          onProductSelected: (item) {
                            context.pushNamed(
                              'writeReviewOrder',
                              pathParameters: {
                                'id': item.productId.toString(),
                              },
                              extra: {
                                'productName': item.itemName,
                                'productImage': item.image ?? '',
                              },
                            );
                          },
                        ),
                      );
                    },
                    showReview: _shouldShowReview(order),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: OrderTimelineSection(
                  statusHistory: order.statusHistory,
                  formatStatusText: _formatStatusText,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => OrderItemCard(item: order.items[index]),
                  childCount: order.items.length,
                ),
              ),
              SliverToBoxAdapter(
                child: OrderSummarySection(
                  order: order,
                  showPayNow: _shouldShowPayNow(order),
                  onPayNow: () {
                    context.goToOrderPayment(
                      orderId: order.orderId.toString(),
                      selectedMethod: order.paymentMethod,
                      grandTotal: order.orderSummary.grandTotal,
                      subtotal: order.orderSummary.subtotal,
                      shippingAmount: order.orderSummary.shippingFee,
                      discountAmount: order.orderSummary.discountAmount,
                      itemsCount: order.orderSummary.totalOrderQty,
                      quoteId: order.paymentAddress?.quoteId,
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: OrderAddressSection(address: order.shippingAddress),
              ),
              SliverToBoxAdapter(
                child: OrderShippingMethodSection(
                  shippingMethod: order.shippingMethod,
                ),
              ),
              SliverToBoxAdapter(
                child: OrderPaymentSection(
                  paymentMethod: order.paymentMethod,
                  formatPaymentMethod: _formatPaymentMethod,
                  paymentInformation: order.paymentInformation,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            ],
          ),
        );
      },
    ),
    ),
  );
  }

  OrderStatusAttributes _getStatusAttributes(String status) {
    const Color defaultColor = AppColors.pickabooBlue;
    const Color cancelColor = AppColors.red;

    if (status.toLowerCase().contains('canceled') ||
        status.toLowerCase().contains('cancelled') ||
        status.toLowerCase() == 'closed' ||
        status.toLowerCase() == 'returned') {
      return OrderStatusAttributes(
        text: 'Canceled',
        backgroundColor: cancelColor,
      );
    }

    final normalizedStatus = status.toLowerCase().replaceAll('_', ' ');

    switch (normalizedStatus) {
      case 'delivered':
        return OrderStatusAttributes(
          text: 'Delivered',
          backgroundColor: defaultColor,
        );
      case 'processing for delivery':
      case 'at the hub requested':
      case 'being picked':
      case 'picked':
      case 'on the way to hub':
      case 'at the hub':
        return OrderStatusAttributes(
          text: 'Processing for Delivery',
          backgroundColor: defaultColor,
        );
      case 'complete':
        return OrderStatusAttributes(
          text: 'Complete',
          backgroundColor: defaultColor,
        );
      case 'pending':
        return OrderStatusAttributes(
          text: 'Order Placed',
          backgroundColor: defaultColor,
        );
      case 'authorized':
        return OrderStatusAttributes(
          text: 'Authorized',
          backgroundColor: defaultColor,
        );
      case 'on the way to hub requested':
        return OrderStatusAttributes(
          text: 'Pickup In Progress',
          backgroundColor: defaultColor,
        );
      case 'in delivery':
        return OrderStatusAttributes(
          text: 'In Delivery',
          backgroundColor: defaultColor,
        );
      case 'payment review':
      case 'processing':
        return OrderStatusAttributes(
          text: 'Processing',
          backgroundColor: defaultColor,
        );
      default:
        final formatted = status
            .replaceAll('_', ' ')
            .split(' ')
            .where((s) => s.isNotEmpty)
            .map((str) {
              if (str.isEmpty) return '';
              return str[0].toUpperCase() +
                  (str.length > 1 ? str.substring(1).toLowerCase() : '');
            })
            .join(' ');

        return OrderStatusAttributes(
          text: formatted,
          backgroundColor: defaultColor,
        );
    }
  }

  bool _shouldShowPayNow(OrderDetailEntity order) {
    if (order.state.toLowerCase() == 'pending payment') {
      if (order.status.toLowerCase() != 'processing') {
        final method = order.paymentMethod.toLowerCase();
        if (method != 'cashondelivery' && method != 'cardondelivery') {
          if (method != 'cemi') {
            final paymentMode =
                order.paymentInformation
                    .firstWhereOrNull((p) => p.code == 'payment_mode')
                    ?.value ??
                '';
            if (paymentMode.toLowerCase() != 'card on delivery') {
              final remoteIp = order.remoteIp ?? '';
              if (remoteIp.isNotEmpty) {
                return true;
              }
            }
          }
        }
      }
    }
    return false;
  }

  bool _shouldShowCancel(OrderDetailEntity order) {
    if (order.state.toLowerCase() != 'pending payment') return false;
    if (order.paymentMethod.toLowerCase() == 'cemi') return false;
    return true;
  }

  bool _shouldShowReview(OrderDetailEntity order) {
    return order.status.toLowerCase() == 'delivered';
  }

  String _formatStatusText(String status) {
    return _getStatusAttributes(status).text;
  }

  static const Map<String, String> _paymentMethodTitles = {
    'emi': 'EMI (Credit Card Only)',
    'cemi': 'Cardless EMI',
    'cashondelivery': 'Cash on Delivery',
    'cardondelivery': 'Card on Delivery',
    'bkash': 'bKash Payment',
    'nagad': 'Nagad',
    'visamaster': 'Visa/Master',
    'amex': 'AMEX',
    'pickabooeblmastercard': 'Pickaboo EBL Mastercard',
    'dynamicpaymentgateway': 'Saved Card',
    'paymentpending': 'Payment Pending',
    'sslcommerz': 'SSLCommerz',
    'rocket': 'Rocket',
    'free': 'Free',
  };

  String _formatPaymentMethod(String method) {
    return _paymentMethodTitles[method.toLowerCase().trim()] ?? method;
  }
}

class OrderStatusAttributes {
  final String text;
  final Color backgroundColor;

  OrderStatusAttributes({required this.text, required this.backgroundColor});
}
