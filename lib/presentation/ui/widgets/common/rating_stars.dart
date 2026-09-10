import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

/// Rating stars widget matching Pickaboo-App-UI
class RatingStars extends StatelessWidget {
  final double rating;
  final double? size;

  const RatingStars({
    super.key,
    required this.rating,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final double starSize = size ?? 12.sp;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return Icon(Icons.star_rounded, size: starSize, color: AppColors.amber);
        } else if (index < rating && rating % 1 != 0) {
          return Icon(Icons.star_half_rounded, size: starSize, color: AppColors.amber);
        } else {
          return Icon(Icons.star_outline_rounded, size: starSize, color: AppColors.mutedLight);
        }
      }),
    );
  }
}
