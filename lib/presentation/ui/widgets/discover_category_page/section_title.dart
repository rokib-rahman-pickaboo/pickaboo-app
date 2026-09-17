import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTypography.titleMedium.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.navy,
        letterSpacing: -0.2,
      ),
    );
  }
}
