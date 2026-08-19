import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textStyle.headingSmall.copyWith(
        fontWeight: FontWeight.w700,
        color: context.colors.black,
        fontSize: 15.sp,
        height: 1.2,
        letterSpacing: -0.2,
      ),
    );
  }
}
