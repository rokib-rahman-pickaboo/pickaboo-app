// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class FilterChipData {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  final IconData? trailingIcon;

  const FilterChipData({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.trailingIcon,
  });
}

class FilterChipRow extends StatelessWidget {
  final List<FilterChipData> chips;

  const FilterChipRow({super.key, required this.chips});

  @override
  Widget build(BuildContext context) {
    if (chips.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
      child: SizedBox(
        height: 32.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: chips.length,
          separatorBuilder: (_, _) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            return _buildChip(chips[index]);
          },
        ),
      ),
    );
  }

  Widget _buildChip(
    FilterChipData chip,
  ) {
    final isSelected = chip.isSelected;

    return InkWell(
      onTap: chip.onTap,
      borderRadius: AppRadius.fullRadius,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.pickabooBlue : AppColors.white,
          borderRadius: AppRadius.fullRadius,
          border: Border.all(
            color: isSelected
                ? AppColors.pickabooBlue
                : AppColors.muted.withValues(alpha: 0.3),
            width: 1.w,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                chip.label,
                style: AppTypography.bodyMedium.copyWith(
                  color: isSelected ? AppColors.white : AppColors.text,
                ),
              ),
              if (chip.trailingIcon != null) ...[
                SizedBox(width: 6.w),
                Icon(
                  chip.trailingIcon,
                  size: 14.sp,
                  color: isSelected ? AppColors.white : AppColors.text,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
