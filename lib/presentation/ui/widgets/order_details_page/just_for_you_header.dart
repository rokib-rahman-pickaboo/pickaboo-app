import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

class JustForYouHeader extends StatelessWidget {
  const JustForYouHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: AppRadius.buttonRadius,
        border: Border.all(color: AppColors.amber),
      ),
      alignment: Alignment.center,
      child: Text(
        AppStrings.justForYou,
        style: AppTypography.bodyMedium.bold().copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
