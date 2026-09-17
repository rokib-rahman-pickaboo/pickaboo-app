import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class SettingToggleItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingToggleItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.white,
            activeTrackColor: AppColors.pickabooBlue,
            inactiveThumbColor: AppColors.white,
            inactiveTrackColor: AppColors.pageBg,
          ),
        ],
      ),
    );
  }
}
