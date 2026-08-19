import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/card_bin/card_bin_entity.dart';
import 'package:pickaboo/domain/entity/card_bin_verify/card_bin_verify_entity.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';

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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

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
    final displayGrandTotal =
        totals.grandTotal - extraDiscount + convenienceFee;

    final clubPointDiscount = totals.totalSegments
        .where((s) => s.code == 'rewards-spend-amount')
        .fold<double>(0, (_, s) => s.value.abs());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Summary ($itemsCount)",
          style: textStyle.subheading.copyWith(color: colors.text),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildSummaryRow(
                "Subtotal ($itemsCount item${itemsCount > 1 ? 's' : ''})",
                "৳ ${totals.subtotal.toStringAsFixed(0)}",
                colors,
                textStyle,
              ),
              if (totalDiscount.abs() > 0) ...[
                SizedBox(height: 12.h),
                _buildSummaryRow(
                  discountLabel,
                  "-৳${totalDiscount.abs().toStringAsFixed(0)}",
                  colors,
                  textStyle,
                ),
              ],
              if (convenienceFee > 0) ...[
                SizedBox(height: 12.h),
                _buildSummaryRow(
                  "Convenience Fee",
                  "৳ ${convenienceFee.toStringAsFixed(0)}",
                  colors,
                  textStyle,
                ),
              ],
              SizedBox(height: 12.h),
              _buildSummaryRow(
                "Shipping",
                "৳ ${totals.shippingAmount.toStringAsFixed(0)}",
                colors,
                textStyle,
              ),
              if (clubPointDiscount > 0) ...[
                SizedBox(height: 12.h),
                _buildSummaryRow(
                  "Club Point Discount Amount",
                  "-৳${clubPointDiscount.toStringAsFixed(0)}",
                  colors,
                  textStyle,
                ),
              ],
              SizedBox(height: 12.h),
              Divider(color: colors.borderColor),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: textStyle.cartItemPrice.copyWith(color: colors.text),
                  ),
                  Text(
                    "৳ ${displayGrandTotal.toStringAsFixed(0)}",
                    style: textStyle.cartItemPrice.copyWith(
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(
    String label,
    String amount,
    AppColors colors,
    AppTextStyles textStyle,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: textStyle.bodyMedium.copyWith(color: colors.text),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          amount,
          style: textStyle.bodyMedium.copyWith(
            color: colors.text,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
