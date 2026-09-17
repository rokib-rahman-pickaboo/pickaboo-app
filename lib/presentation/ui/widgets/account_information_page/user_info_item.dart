import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

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
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20.sp, color: AppColors.pickabooBlue),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodySmall.copyWith(color: AppColors.muted),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    value,
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.text,
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
            color: AppColors.border.withAlpha(76),
          ),
      ],
    );
  }
}
