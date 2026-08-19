import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

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
    this.discountTitle = '',
    this.clubPointDiscount = 0,
    this.itemsCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveDiscountTitle =
        discountTitle.isNotEmpty ? discountTitle : 'Discount';

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1.w, color: context.colors.borderColor),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemsCount > 0
                  ? 'Order Summary ($itemsCount)'
                  : 'Order Summary',
              style: context.textStyle.bodyMediumBold,
            ),
            SizedBox(height: 16.h),

            _buildRow(
              context,
              itemsCount > 0
                  ? 'Subtotal ($itemsCount ${itemsCount == 1 ? "item" : "items"})'
                  : 'Subtotal',
              '৳${_formatNumber(subtotal)}',
              colors,
            ),

            if (discountAmount != 0) ...[
              SizedBox(height: 8.h),
              _buildRow(
                context,
                effectiveDiscountTitle,
                '-৳${_formatNumber(discountAmount.abs())}',
                colors,
                isDiscount: true,
              ),
            ],

            SizedBox(height: 8.h),
            _buildRow(
              context,
              'Shipping',
              '৳${_formatNumber(shippingAmount)}',
              colors,
            ),

            if (clubPointDiscount != 0) ...[
              SizedBox(height: 8.h),
              _buildRow(
                context,
                'Club Point Discount Amount',
                '-৳${_formatNumber(clubPointDiscount.abs())}',
                colors,
                isDiscount: true,
              ),
            ],

            Divider(height: 24.h, color: colors.borderColor),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: context.textStyle.cardTitle),
                Text(
                  '৳${_formatNumber(grandTotal)}',
                  style: context.textStyle.cardTitle.copyWith(
                    color: const Color(0xFF1B5DD5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            if (discountAmount != 0) ...[
              Divider(height: 24.h, color: colors.borderColor),
              Text(
                "You will save ৳${_formatNumber(discountAmount.abs())} on this order, may vary based on payment method.",
                style: context.textStyle.listSubtitle.withColor(colors.primary),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatNumber(double value) {
    final absValue = value.abs();
    final formatted = absValue.toStringAsFixed(0);
    final result = formatted.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    );
    return value < 0 ? '-$result' : result;
  }

  Widget _buildRow(
    BuildContext context,
    String label,
    String value,
    AppColors colors, {
    bool isDiscount = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: context.textStyle.listSubtitle.withColor(colors.gray),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          value,
          style: isDiscount
              ? context.textStyle.listSubtitle
                    .withColor(colors.orange)
                    .copyWith(fontWeight: FontWeight.w500)
              : context.textStyle.listSubtitle.withColor(colors.black),
        ),
      ],
    );
  }
}
