// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/card_bin/card_bin_entity.dart';
import 'package:pickaboo/domain/entity/card_bin_verify/card_bin_verify_entity.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';

/// Modern PaymentOrderSummary matching Image 3:
/// - Clean icon-prefixed breakdown rows
/// - Modern dashed separator (------)
/// - Bold "Total Payable" in Pickaboo Blue
/// - Consistent across all 3 checkout flow pages
class PaymentOrderSummary extends StatelessWidget {
  final CartTotalsEntity totals;
  final int itemsCount;
  final CardBinEntity? cardBinResponse;
  final CardBinVerifyEntity? cardBinVerifyResponse;
  final EmiTenureDetailEntity? emiTenure;

  const PaymentOrderSummary({
    super.key,
    required this.totals,
    required this.itemsCount,
    this.cardBinResponse,
    this.cardBinVerifyResponse,
    this.emiTenure,
  });

  static double convenienceFeeFor(
    CartTotalsEntity totals,
    EmiTenureDetailEntity? tenure,
  ) =>
      tenure?.convenienceFeeOn(totals.grandTotal) ?? 0;

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
    double extraDiscount = 0.0;
    String? appliedCouponCode;
    if (cardBinResponse?.success == true) {
      extraDiscount = cardBinResponse!.discountAmount.toDouble();
      appliedCouponCode = cardBinResponse!.couponCode;
    } else if (cardBinVerifyResponse?.success == true) {
      extraDiscount = cardBinVerifyResponse!.discountAmount.toDouble();
      appliedCouponCode = cardBinVerifyResponse!.couponCode;
    }

    final String discountLabel = (appliedCouponCode != null && appliedCouponCode.isNotEmpty)
        ? "Discount ($appliedCouponCode)"
        : (totals.couponCode.isNotEmpty ? "Discount (${totals.couponCode})" : "Discount");

    final totalDiscount = totals.discountAmount + extraDiscount;
    final convenienceFee = convenienceFeeFor(totals, emiTenure);
    final displayGrandTotal = totals.grandTotal - extraDiscount + convenienceFee;

    final clubPointDiscount = totals.totalSegments
        .where((s) => s.code == 'rewards-spend-amount')
        .fold<double>(0, (_, s) => s.value.abs());

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
            "Subtotal ($itemsCount ${itemsCount == 1 ? 'item' : 'items'})",
            _formatPrice(totals.subtotal),
          ),

          if (totalDiscount.abs() > 0) ...[
            SizedBox(height: 10.h),
            _buildRow(
              Icons.local_offer_outlined,
              discountLabel,
              "-${_formatPrice(totalDiscount.abs())}",
              isDiscount: true,
            ),
          ],

          if (convenienceFee > 0) ...[
            SizedBox(height: 10.h),
            _buildRow(
              Icons.credit_card_outlined,
              "Convenience Fee",
              _formatPrice(convenienceFee),
            ),
          ],

          SizedBox(height: 10.h),
          _buildRow(
            Icons.local_shipping_outlined,
            "Shipping and Handeling",
            totals.shippingAmount > 0 ? _formatPrice(totals.shippingAmount) : "৳0",
          ),

          if (clubPointDiscount > 0) ...[
            SizedBox(height: 10.h),
            _buildRow(
              Icons.stars_rounded,
              "Club Point Discount",
              "-${_formatPrice(clubPointDiscount)}",
              isDiscount: true,
            ),
          ],

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
                "Total Payable",
                style: AppTypography.sectionTitle,
              ),
              Text(
                _formatPrice(displayGrandTotal),
                style: AppTypography.priceLarge.withColor(AppColors.pickabooBlue),
              ),
            ],
          ),

          // ── Savings Banner ──
          if (totalDiscount.abs() > 0) ...[
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
                      "You're saving ${_formatPrice(totalDiscount.abs())} on this order! 🎉",
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
    String amount, {
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
          amount,
          style: isDiscount ? AppTypography.savingsText.withColor(valueColor) : AppTypography.priceStandard.withColor(valueColor),
        ),
      ],
    );
  }
}
