import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class SavedWalletItem extends StatelessWidget {
  final String linkedMasked;
  final String last4;
  final bool isSelected;
  final VoidCallback onTap;

  const SavedWalletItem({
    super.key,
    required this.linkedMasked,
    required this.last4,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: isSelected
              ? Border.all(color: colors.primary, width: 2)
              : Border.all(
                  color: colors.black.withValues(alpha: 0.1),
                  width: 1,
                ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: colors.black.withValues(alpha: 0.1),
                ),
              ),
              child: SvgPicture.asset(
                'assets/new/svg/payment/bkash_icon.svg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'bKash',
                        style: textStyle.listSubtitle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colors.text,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: colors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          'Saved',
                          style: textStyle.bodySmall.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: colors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Linked: $linkedMasked',
                    style: textStyle.listCaption.copyWith(
                      color: colors.textLight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
