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

  String _formatPrice(double value, {bool floor = false}) {
    final absVal = floor ? value.abs().floor() : value.abs().round();
    final formatted = absVal.toString();
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
          Text(
            itemsCount > 0
                ? 'Order Summary ($itemsCount)'
                : 'Order Summary',
            style: AppTypography.titleMedium,
          ),
          SizedBox(height: 14.h),

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
              '-${_formatPrice(discountAmount.abs(), floor: true)}',
              isDiscount: true,
            ),
          ],

          if (clubPointDiscount != 0) ...[
            SizedBox(height: 10.h),
            _buildRow(
              Icons.stars_rounded,
              'Club Points Discount',
              '-${_formatPrice(clubPointDiscount.abs(), floor: true)}',
              isDiscount: true,
            ),
          ],

          SizedBox(height: 10.h),
          _buildRow(
            Icons.local_shipping_outlined,
            'Shipping',
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

          // ── Total ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppTypography.titleMedium,
              ),
              Text(
                _formatPrice(grandTotal),
                style: AppTypography.priceLarge.withColor(AppColors.pickabooBlue),
              ),
            ],
          ),

          // ── Savings Disclaimer Matching BK / Screenshot ──
          if (discountAmount != 0) ...[
            SizedBox(height: 14.h),
            Text(
              "You will save ${_formatPrice(discountAmount.abs(), floor: true)} on this order, may vary based on payment method.",
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.pickabooBlue,
                fontWeight: FontWeight.w500,
                height: 1.35,
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
    final Color valueColor = isDiscount ? AppColors.orange : AppColors.navy;

    return Row(
      children: [
        Icon(
          icon,
          size: 15.sp,
          color: isDiscount ? AppColors.orange : AppColors.mutedLight,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            label,
            style: AppTypography.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          value,
          style: isDiscount
              ? AppTypography.bodySmall.copyWith(
                  color: valueColor,
                  fontWeight: FontWeight.w600,
                )
              : AppTypography.priceStandard.withColor(valueColor),
        ),
      ],
    );
  }
}
