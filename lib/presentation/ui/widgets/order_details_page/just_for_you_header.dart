import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class JustForYouHeader extends StatelessWidget {
  const JustForYouHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    return Container(
      width: double.infinity,
      height: 44.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: colors.black,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: colors.yellow),
      ),
      alignment: Alignment.center,
      child: Text(
        "JUST FOR YOU",
        style: textStyles.bodyMediumBold.copyWith(
          color: colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
