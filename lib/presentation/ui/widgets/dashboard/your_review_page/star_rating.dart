import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class StarRating extends StatelessWidget {
  final double score;
  final double size;

  const StarRating({super.key, required this.score, this.size = 14});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        if (score >= starIndex) {
          return Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: SvgPicture.asset(
              "assets/new/svg/star_icon.svg",
              width: size.w,
              height: size.w,
            ),
          );
        } else if (score >= starIndex - 0.5) {
          return Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: Icon(
              Icons.star_half,
              color: const Color(0xFFFFB800),
              size: (size + 2).sp,
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: Icon(
              Icons.star_outline,
              color: colors.gray.withValues(alpha: 0.3),
              size: (size + 2).sp,
            ),
          );
        }
      }),
    );
  }
}
