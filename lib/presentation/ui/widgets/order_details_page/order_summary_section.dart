import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';

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
    if (kDebugMode) {
      print('🛒 OrderSummarySection: order.couponCode = "${order.couponCode}"');
      for (var info in order.paymentInformation) {
        print('🛒 OrderSummarySection: paymentInfo [${info.code}] = ${info.title} : ${info.value}');
      }
    }
    final colors = context.colors;
    final textStyles = context.textStyle;

    return Container(
      color: colors.white,
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Summary (${order.orderSummary.totalOrderQty})',
                style: textStyles.headingSmall.copyWith(
                  color: colors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (showPayNow)
                ElevatedButton(
                  onPressed: onPayNow,
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
                    style: textStyles.buttonSmall.copyWith(color: colors.white),
                  ),
                ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildSummaryRow(
            'Subtotal (${order.orderSummary.totalOrderQty} item)',
            '৳ ${order.orderSummary.subtotal.toStringAsFixed(0)}',
            colors,
            textStyles,
          ),
          _buildSummaryRow(
            'Shipping',
            '৳ ${order.orderSummary.shippingFee.toStringAsFixed(0)}',
            colors,
            textStyles,
          ),
          if (order.orderSummary.discountAmount.abs() > 0)
            _buildSummaryRow(
              (order.couponCode != null && order.couponCode!.isNotEmpty)
                  ? 'Discount (${order.couponCode})'
                  : 'Discount',
              '- ৳ ${order.orderSummary.discountAmount.abs().toStringAsFixed(0)}',
              colors,
              textStyles,
            ),
          const Divider(),
          SizedBox(height: 8.h),
          _buildSummaryRow(
            'Total',
            '৳ ${order.orderSummary.grandTotal.toStringAsFixed(0)}',
            colors,
            textStyles,
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value,
    AppColors colors,
    AppTextStyles textStyles, {
    bool isBold = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: (isBold ? textStyles.bodyMediumBold : textStyles.bodyMedium)
                .copyWith(color: colors.text),
          ),
          Text(
            value,
            style: (isBold ? textStyles.bodyMediumBold : textStyles.bodyMedium)
                .copyWith(color: colors.text),
          ),
        ],
      ),
    );
  }
}
