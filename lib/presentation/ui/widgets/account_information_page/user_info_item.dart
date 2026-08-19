import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class UserInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool showDivider;

  const UserInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20.sp, color: colors.primary),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodySmall.copyWith(color: colors.gray),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    value,
                    style: textTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colors.text,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (showDivider)
          Container(
            height: 1.h,
            margin: EdgeInsets.symmetric(vertical: 16.h),
            color: colors.borderColor.withAlpha(76),
          ),
      ],
    );
  }
}
