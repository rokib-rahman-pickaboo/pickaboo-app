// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

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
                style: AppTypography.titleMedium,
              ),
              if (showPayNow)
                AppButton.primary(
                  isFullWidth: false,
                  height: 32.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  borderRadius: AppRadius.cardRadius,
                  onPressed: onPayNow,
                  text: "Pay Now",
                ),
            ],
          ),
          SizedBox(height: 14.h),
          _buildSummaryRow(
            'Subtotal (${order.orderSummary.totalOrderQty} ${order.orderSummary.totalOrderQty > 1 ? 'items' : 'item'})',
            '৳ ${_formatAmount(order.orderSummary.subtotal)}',
          ),
          if (order.orderSummary.convenienceFee > 0)
            _buildSummaryRow(
              (order.orderSummary.convenienceFeePercent != null &&
                      order.orderSummary.convenienceFeePercent!.isNotEmpty)
                  ? 'Convenience Fee (${order.orderSummary.convenienceFeePercent})'
                  : 'Convenience Fee',
              '৳ ${_formatAmount(order.orderSummary.convenienceFee)}',
            ),
          _buildSummaryRow(
            'Shipping & Handling',
            '৳ ${_formatAmount(order.orderSummary.shippingFee)}',
          ),
          if (order.orderSummary.discountAmount.abs() > 0)
            _buildSummaryRow(
              (order.couponCode != null && order.couponCode!.isNotEmpty)
                  ? 'Discount (${order.couponCode})'
                  : 'Discount',
              '- ৳ ${_formatAmount(order.orderSummary.discountAmount.abs())}',
              isDiscount: true,
            ),
          const Divider(height: 20, color: AppColors.border),
          _buildSummaryRow(
            'Grand Total',
            '৳ ${_formatAmount(order.orderSummary.grandTotal)}',
            isBold: true,
          ),
        ],
      ),
    );
  }

  String _formatAmount(double amount) {
    final hasDecimals = (amount * 100).truncate() % 100 != 0;
    final formatted = hasDecimals
        ? amount.toStringAsFixed(2)
        : amount.toStringAsFixed(0);
    final parts = formatted.split('.');
    final withCommas = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    );
    return parts.length > 1 ? '$withCommas.${parts[1]}' : withCommas;
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
            style: isBold ? AppTypography.titleSmall : AppTypography.bodySmall,
          ),
          Text(
            value,
            style: isBold
                ? AppTypography.priceStandard.withColor(valueColor)
                : AppTypography.bodyMedium.withColor(valueColor),
          ),
        ],
      ),
    );
  }
}
