import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class CardBinAppliedView extends StatelessWidget {
  final int discountAmount;
  final String binCode;
  final VoidCallback onRemove;
  final bool isRemoving;

  const CardBinAppliedView({
    super.key,
    required this.discountAmount,
    required this.binCode,
    required this.onRemove,
    this.isRemoving = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFC0EAC6), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Icon(Icons.check_circle_outline, color: const Color(0xFF00C853), size: 24.w),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    "Discount Applied",
                    style: textStyle.bodyLargeBold.copyWith(
                      color: colors.text,
                      height: 1.2,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: colors.borderColor, height: 1),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF1FCF4),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: const Color(0xFFC0EAC6)),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.credit_card, color: const Color(0xFF00C853), size: 20.w),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bank Discount Applied",
                              style: textStyle.bodyMediumBold.copyWith(color: colors.text),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "BIN: ......$binCode",
                              style: textStyle.bodySmall.copyWith(color: colors.textLight),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "-৳ $discountAmount",
                        style: textStyle.bodyMedium.copyWith(color: const Color(0xFF00C853)),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    height: 40.h,
                    child: OutlinedButton(
                      onPressed: isRemoving ? null : onRemove,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: colors.red,
                        side: BorderSide(color: colors.red.withOpacity(0.3)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        backgroundColor: colors.white,
                      ),
                      child: isRemoving
                          ? SizedBox(
                              width: 16.w,
                              height: 16.w,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: colors.red,
                              ),
                            )
                          : Text(
                              "Remove Discount",
                              style: textStyle.buttonMedium.copyWith(color: colors.red),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
