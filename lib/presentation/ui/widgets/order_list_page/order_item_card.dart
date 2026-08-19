import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/date_time_utils.dart';
import 'package:pickaboo/domain/entity/order/order_item_entity.dart';

class OrderItemCard extends StatefulWidget {
  final OrderItemEntity order;
  final VoidCallback onTap;
  final VoidCallback onCancel;
  final VoidCallback onBuy;
  final VoidCallback onPay;
  final VoidCallback onReview;

  const OrderItemCard({
    super.key,
    required this.order,
    required this.onTap,
    required this.onCancel,
    required this.onBuy,
    required this.onPay,
    required this.onReview,
  });

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  bool _payPressed = false;

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

    switch (status.toLowerCase()) {
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
        return OrderStatusAttributes(
          text: status,
          backgroundColor: defaultColor,
        );
    }
  }

  bool _shouldShowPayNow(OrderItemEntity order) {
    if (order.state.toLowerCase() == 'pending payment') {
      if (order.status.toLowerCase() != 'processing') {
        final method = order.paymentMethod.toLowerCase();

        if (method != 'cashondelivery' && method != 'cardondelivery') {
          if (method != 'cemi') {
            if (order.paymentMode.toLowerCase() != 'card on delivery') {
              if (order.remoteIp.isNotEmpty) {
                return true;
              }
            }
          }
        }
      }
    }
    return false;
  }

  bool _shouldShowCancel(OrderItemEntity order) {
    if (order.state.toLowerCase() != 'pending payment') return false;
    if (order.paymentMethod.toLowerCase() == 'cemi') return false;
    return true;
  }

  bool _shouldShowReview(OrderItemEntity order) {
    return order.status.toLowerCase() == 'delivered';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;
    final statusAttributes = _getStatusAttributes(widget.order.status);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h, left: 2.w, right: 2.w),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order #${widget.order.orderNumber}",
                                style: textStyles.orderNumber.copyWith(
                                  color: colors.text,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 12.r,
                                    color: colors.textLight,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    _formatDate(widget.order.createdAt),
                                    style: textStyles.orderDate.copyWith(
                                      color: colors.textLight,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: statusAttributes.backgroundColor
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: statusAttributes.backgroundColor
                                      .withValues(alpha: 0.2),
                                  width: 1.w,
                                ),
                              ),
                              child: Text(
                                statusAttributes.text,
                                style: textStyles.badgeSmall.copyWith(
                                  color: statusAttributes.backgroundColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total",
                              style: textStyles.bodyTiny.copyWith(
                                color: colors.textLight,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "৳ ${widget.order.grandtotal.toStringAsFixed(0)}",
                              style: textStyles.orderTotal.copyWith(
                                color: colors.primary,
                              ),
                            ),
                          ],
                        ),
                        if (_shouldShowPayNow(widget.order))
                          ElevatedButton(
                            onPressed: _payPressed
                                ? null
                                : () {
                                    if (_payPressed) return;
                                    setState(() => _payPressed = true);
                                    widget.onPay();
                                    Future.delayed(
                                      const Duration(seconds: 2),
                                      () {
                                        if (mounted) {
                                          setState(() => _payPressed = false);
                                        }
                                      },
                                    );
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.primary,
                              foregroundColor: colors.white,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              "Pay Now",
                              style: textStyles.buttonSmall.copyWith(
                                color: colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: colors.backgroundGray.withValues(alpha: 0.3),
                  border: Border(
                    top: BorderSide(color: colors.borderColor, width: 0.5),
                  ),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          Icons.shopping_cart_outlined,
                          "Buy Again",
                          colors.primary,
                          textStyles,
                          widget.onBuy,
                        ),
                      ),
                      if (_shouldShowCancel(widget.order)) ...[
                        VerticalDivider(
                          width: 1.w,
                          indent: 12,
                          endIndent: 12,
                          color: colors.borderColor,
                        ),
                        Expanded(
                          child: _buildActionButton(
                            Icons.cancel_outlined,
                            "Cancel",
                            colors.red,
                            textStyles,
                            widget.onCancel,
                          ),
                        ),
                      ],
                      if (_shouldShowReview(widget.order)) ...[
                        VerticalDivider(
                          width: 1.w,
                          indent: 12,
                          endIndent: 12,
                          color: colors.borderColor,
                        ),
                        Expanded(
                          child: _buildActionButton(
                            Icons.star_outline_rounded,
                            "Review",
                            colors.primary,
                            textStyles,
                            widget.onReview,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    IconData icon,
    String label,
    Color color,
    AppTextStyles textStyles,
    VoidCallback onTap,
  ) {
    return Material(
      color: color.withValues(alpha: 0.0),
      child: InkWell(
        onTap: onTap,
        splashColor: color.withValues(alpha: 0.1),
        highlightColor: color.withValues(alpha: 0.05),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16.r, color: color),
              SizedBox(width: 6.w),
              Text(label, style: textStyles.buttonSmall.copyWith(color: color)),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    final date = parseServerDateTime(dateString);
    if (date == null) return dateString;
    return DateFormat('dd MMMM yyyy, hh:mm a').format(date).toLowerCase();
  }
}

class OrderStatusAttributes {
  final String text;
  final Color backgroundColor;

  OrderStatusAttributes({required this.text, required this.backgroundColor});
}
