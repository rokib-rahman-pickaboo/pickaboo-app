// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// Modern RatingInputRow matching Pickaboo-App-UI design language.
class RatingInputRow extends StatelessWidget {
  final String label;
  final int rating;
  final Function(int) onRatingChanged;

  const RatingInputRow({
    super.key,
    required this.label,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: AppTypography.titleSmall,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(5, (index) {
                final isSelected = index < rating;
                return GestureDetector(
                  onTap: () => onRatingChanged(index + 1),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Icon(
                      isSelected ? Icons.star_rounded : Icons.star_outline_rounded,
                      color: isSelected
                          ? AppColors.amber
                          : AppColors.border,
                      size: 28.sp,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
