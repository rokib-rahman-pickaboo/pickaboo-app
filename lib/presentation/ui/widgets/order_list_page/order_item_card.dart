// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
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

  String _formatDate(String dateString) {
    final date = parseServerDateTime(dateString);
    if (date == null) return dateString;
    final formatted = DateFormat('dd MMMM yyyy, hh:mm a').format(date);
    return formatted.replaceAllMapped(
      RegExp(r'\b(AM|PM)\b'),
      (match) => match.group(0)!.toLowerCase(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusAttributes = _getStatusAttributes(widget.order.status);

    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.groupToGroupSpacing.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10.r,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppRadius.cardRadius,
        child: InkWell(
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
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
                                style: AppTypography.cardTitle,
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 13.sp,
                                    color: AppColors.muted,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    _formatDate(widget.order.createdAt),
                                    style: AppTypography.bodyMuted,
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
                                      .withValues(alpha: 0.25),
                                  width: 1.w,
                                ),
                              ),
                              child: Text(
                                statusAttributes.text,
                                style: AppTypography.badgeStockOut.withColor(statusAttributes.backgroundColor),
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
                              style: AppTypography.bodyMuted,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              "৳ ${widget.order.grandtotal.toStringAsFixed(0)}",
                              style: AppTypography.priceStandard.withColor(AppColors.pickabooBlue),
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
                              backgroundColor: AppColors.pickabooBlue,
                              foregroundColor: Colors.white,
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
                              style: AppTypography.buttonPrimary,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.border, width: 0.5.w),
                  ),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          Icons.shopping_cart_outlined,
                          "Buy Again",
                          AppColors.pickabooBlue,
                          widget.onBuy,
                        ),
                      ),
                      if (_shouldShowCancel(widget.order)) ...[
                        VerticalDivider(
                          width: 1.w,
                          indent: 12.h,
                          endIndent: 12.h,
                          color: AppColors.border,
                        ),
                        Expanded(
                          child: _buildActionButton(
                            Icons.cancel_outlined,
                            "Cancel",
                            AppColors.red,
                            widget.onCancel,
                          ),
                        ),
                      ],
                      if (_shouldShowReview(widget.order)) ...[
                        VerticalDivider(
                          width: 1.w,
                          indent: 12.h,
                          endIndent: 12.h,
                          color: AppColors.border,
                        ),
                        Expanded(
                          child: _buildActionButton(
                            Icons.star_outline_rounded,
                            "Review",
                            AppColors.pickabooBlue,
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
    VoidCallback onTap,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: color.withValues(alpha: 0.1),
        highlightColor: color.withValues(alpha: 0.05),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16.sp, color: color),
              SizedBox(width: 6.w),
              Text(
                label,
                style: AppTypography.cardTitle.withColor(color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderStatusAttributes {
  final String text;
  final Color backgroundColor;

  OrderStatusAttributes({required this.text, required this.backgroundColor});
}
