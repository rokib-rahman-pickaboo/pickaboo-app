// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';

/// Modern OrderSummarySection matching Pickaboo-App-UI design language.
class OrderSummarySection extends StatelessWidget {
  final OrderDetailEntity order;
  final bool showPayNow;
  final VoidCallback onPayNow;

  const OrderSummarySection({
    super.key,
    required this.order,
    this.showPayNow = false,
    required this.onPayNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: 4.h,
      ),
      padding: EdgeInsets.all(16.w),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Summary (${order.orderSummary.totalOrderQty})',
                style: AppTypography.sectionTitle,
              ),
              if (showPayNow)
                ElevatedButton(
                  onPressed: onPayNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pickabooBlue,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppRadius.cardRadius,
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
          SizedBox(height: 14.h),
          _buildSummaryRow(
            'Subtotal (${order.orderSummary.totalOrderQty} item)',
            '৳ ${order.orderSummary.subtotal.toStringAsFixed(0)}',
          ),
          _buildSummaryRow(
            'Shipping and Handeling',
            '৳ ${order.orderSummary.shippingFee.toStringAsFixed(0)}',
          ),
          if (order.orderSummary.discountAmount.abs() > 0)
            _buildSummaryRow(
              (order.couponCode != null && order.couponCode!.isNotEmpty)
                  ? 'Discount (${order.couponCode})'
                  : 'Discount',
              '- ৳ ${order.orderSummary.discountAmount.abs().toStringAsFixed(0)}',
              isDiscount: true,
            ),
          const Divider(height: 20, color: AppColors.border),
          _buildSummaryRow(
            'Total',
            '৳ ${order.orderSummary.grandTotal.toStringAsFixed(0)}',
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isBold = false,
    bool isDiscount = false,
  }) {
    Color valueColor = isBold ? AppColors.pickabooBlue : AppColors.navy;
    if (isDiscount) {
      valueColor = AppColors.green;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isBold ? AppTypography.cardTitle : AppTypography.bodyMuted,
          ),
          Text(
            value,
            style: isBold ? AppTypography.priceStandard.withColor(valueColor) : AppTypography.bodyRegular.withColor(valueColor),
          ),
        ],
      ),
    );
  }
}
