import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class JustForYouHeader extends StatelessWidget {
  const JustForYouHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyle;

    return Container(
      width: double.infinity,
      height: 44.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.amber),
      ),
      alignment: Alignment.center,
      child: Text(
        "JUST FOR YOU",
        style: textStyles.bodyMediumBold.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
