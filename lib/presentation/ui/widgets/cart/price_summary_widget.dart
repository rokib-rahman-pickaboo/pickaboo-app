// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// Modern PriceSummaryWidget matching Image 3:
/// - Clean icon-prefixed breakdown rows
/// - Modern dashed separator (------)
/// - Bold "Total Payable" in Pickaboo Blue
/// - Consistent across Cart, Checkout, and Payment Method pages
class PriceSummaryWidget extends StatelessWidget {
  final double subtotal;
  final double grandTotal;
  final double discountAmount;
  final double shippingAmount;
  final String discountTitle;
  final double clubPointDiscount;
  final int itemsCount;

  const PriceSummaryWidget({
    super.key,
    required this.subtotal,
    required this.grandTotal,
    required this.discountAmount,
    required this.shippingAmount,
    required this.discountTitle,
    required this.clubPointDiscount,
    required this.itemsCount,
  });

  String _formatPrice(double value) {
    final absVal = value.abs();
    final formatted = absVal.toStringAsFixed(0);
    final result = formatted.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    );
    return value < 0 ? '-৳$result' : '৳$result';
  }

  @override
  Widget build(BuildContext context) {
    final effectiveDiscountTitle = discountTitle.isNotEmpty
        ? discountTitle
        : 'Discount';

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.02),
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(
            Icons.shopping_bag_outlined,
            'Subtotal ($itemsCount ${itemsCount == 1 ? "item" : "items"})',
            _formatPrice(subtotal),
          ),

          if (discountAmount != 0) ...[
            SizedBox(height: 10.h),
            _buildRow(
              Icons.local_offer_outlined,
              effectiveDiscountTitle,
              '-${_formatPrice(discountAmount.abs())}',
              isDiscount: true,
            ),
          ],

          if (clubPointDiscount != 0) ...[
            SizedBox(height: 10.h),
            _buildRow(
              Icons.stars_rounded,
              'Club Points Discount',
              '-${_formatPrice(clubPointDiscount.abs())}',
              isDiscount: true,
            ),
          ],

          SizedBox(height: 10.h),
          _buildRow(
            Icons.local_shipping_outlined,
            'Shipping and Handeling',
            shippingAmount > 0 ? _formatPrice(shippingAmount) : '৳0',
          ),

          // ── Modern Dashed Separator (------) ──
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: LayoutBuilder(
              builder: (context, constraints) {
                const dashWidth = 4.0;
                const dashGap = 4.0;
                final dashCount =
                    (constraints.maxWidth / (dashWidth + dashGap)).floor();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    dashCount,
                    (_) => Container(
                      width: dashWidth,
                      height: 1.2,
                      color: AppColors.border,
                    ),
                  ),
                );
              },
            ),
          ),

          // ── Grand Total ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Payable',
                style: AppTypography.sectionTitle,
              ),
              Text(
                _formatPrice(grandTotal),
                style: AppTypography.priceLarge.withColor(AppColors.pickabooBlue),
              ),
            ],
          ),

          // ── Savings Banner ──
          if (discountAmount != 0) ...[
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.amberBg,
                borderRadius: AppRadius.buttonRadius,
                border: Border.all(
                  color: AppColors.amber.withValues(alpha: 0.25),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.savings_outlined,
                    size: 16.sp,
                    color: AppColors.amber,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      "You're saving ${_formatPrice(discountAmount.abs())} on this order! 🎉",
                      style: AppTypography.bodyMuted.copyWith(
                        color: AppColors.amber,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRow(
    IconData icon,
    String label,
    String value, {
    bool isDiscount = false,
  }) {
    final Color valueColor = isDiscount ? AppColors.green : AppColors.navy;

    return Row(
      children: [
        Icon(
          icon,
          size: 15.sp,
          color: isDiscount ? AppColors.green : AppColors.mutedLight,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            label,
            style: AppTypography.bodyMuted,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          value,
          style: isDiscount ? AppTypography.savingsText.withColor(valueColor) : AppTypography.priceStandard.withColor(valueColor),
        ),
      ],
    );
  }
}
