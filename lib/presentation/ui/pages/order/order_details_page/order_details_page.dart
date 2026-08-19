import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/just_for_you_bloc/just_for_you_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_address_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_header_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_item_card.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_payment_section.dart';
import 'package:pickaboo/presentation/ui/pages/order/bottom_sheet/order_review_product_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_shipping_method_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_summary_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_timeline_section.dart';

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
    final colors = context.colors;
    final textStyles = context.textStyle;

    return Scaffold(
      backgroundColor: colors.scaffoldBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Items Order", style: context.textStyle.appBarTitle),
        leading: widget.embedded
            ? null
            : AppBarButton(
                iconPath: 'assets/new/svg/back_nav_icon.svg',
                width: 7.w,
                height: 14.h,
                onPressed: () => Navigator.of(context).pop(),
                iconColor: colors.text,
              ),
      ),
      bottomNavigationBar: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state.orderDetails == null) return const SizedBox.shrink();
          final order = state.orderDetails!;
          final showPayNow = _shouldShowPayNow(order);

          return Container(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: showPayNow
                  ? Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: OutlinedButton(
                            onPressed: () => _handleReorder(
                              context,
                              order.orderId.toString(),
                            ),
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(0, 48.h),
                              side: BorderSide(color: colors.primary),
                              foregroundColor: colors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text(
                              'Buy Again',
                              style: textStyles.buttonMedium.copyWith(
                                color: colors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () => context.goToOrderPayment(
                              orderId: order.orderId.toString(),
                              selectedMethod: order.paymentMethod,
                              grandTotal: order.orderSummary.grandTotal,
                              subtotal: order.orderSummary.subtotal,
                              shippingAmount: order.orderSummary.shippingFee,
                              discountAmount: order.orderSummary.discountAmount,
                              itemsCount: order.orderSummary.totalOrderQty,
                              quoteId: order.paymentAddress?.quoteId,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.primary,
                              foregroundColor: colors.white,
                              minimumSize: Size(0, 48.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Pay Now',
                              style: textStyles.buttonMedium.copyWith(
                                color: colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () =>
                          _handleReorder(context, order.orderId.toString()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary,
                        foregroundColor: colors.white,
                        minimumSize: Size(double.infinity, 48.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Buy Again',
                        style: textStyles.buttonMedium.copyWith(
                          color: colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            context.read<CartBloc>().add(const CartEvent.getCart());
            if (state.successMessage == 'Items added to cart') {
              context.push(Routes.cart);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.successMessage!,
                    style: textStyles.bodyMedium.copyWith(color: colors.white),
                  ),
                  backgroundColor: colors.green,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          if (state.orderDetails == null) {
            if (state.errorMessage != null) {
              return AppErrorView(
                type: AppErrorType.generic,
                title: "Couldn't load order details",
                message:
                    'Something went wrong while loading this order. '
                    'Please try again in a moment.',
                onRetry: () => context.read<OrderBloc>().add(
                  OrderEvent.loadOrderDetails(widget.orderId),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(color: colors.primary),
            );
          }

          final OrderDetailEntity order = state.orderDetails!;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: OrderHeaderSection(
                  order: order,
                  getStatusAttributes: _getStatusAttributes,
                  onBuyAgain: () =>
                      _handleReorder(context, order.orderId.toString()),
                  onReview: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      backgroundColor: colors.black.withValues(alpha: 0.0),
                      builder: (context) => OrderReviewProductBottomSheet(
                        items: order.items,
                        onProductSelected: (item) {
                          context.pushNamed(
                            'writeReviewOrder',
                            extra: {
                              'productId': item.productId.toString(),
                              'productName': item.itemName,
                              'productImage': item.image,
                            },
                          );
                        },
                      ),
                    );
                  },
                  showCancel: _shouldShowCancel(order),
                  showReview: _shouldShowReview(order),
                  onCancel: () {
                    context.push(Routes.orderCancelled, extra: order);
                  },
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
                ),
              ),
              SliverPadding(padding: EdgeInsets.only(bottom: 24.h)),
            ],
          );
        },
      ),
    );
  }

  OrderStatusAttributes _getStatusAttributes(String status) {
    const Color defaultColor = Color(0xFF1B5DD5);
    const Color cancelColor = Color(0xFFFF2222);

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
