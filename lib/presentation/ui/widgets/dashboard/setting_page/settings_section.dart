import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.dialogRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 8.h),
            child: Text(
              title,
              style: AppTypography.bodyMedium.medium().copyWith(
                color: AppColors.text,
              ),
            ),
          ),
          Divider(
            height: 1.h,
            thickness: 1,
            color: AppColors.border.withValues(alpha: 0.3),
          ),
          ...children,
        ],
      ),
    );
  }
}
