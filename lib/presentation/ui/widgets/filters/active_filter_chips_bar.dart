// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// ============================================================================
/// 🏷️ ACTIVE FILTER CHIPS BAR
/// Horizontal scrollable bar displaying currently answered filter questions with
/// a distinct "CLEAR ALL" button.
/// ============================================================================
class ActiveFilterChipsBar extends StatelessWidget {
  final Map<String, String> activeFilters; // filterCode -> displayLabel (e.g. 'capacity' -> 'Capacity: 1.5 Ton')
  final ValueChanged<String> onRemoveFilter;
  final VoidCallback onClearAll;
  final EdgeInsetsGeometry? padding;

  const ActiveFilterChipsBar({
    super.key,
    required this.activeFilters,
    required this.onRemoveFilter,
    required this.onClearAll,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (activeFilters.isEmpty) return const SizedBox.shrink();

    final filterEntries = activeFilters.entries.toList();

    return Container(
      height: 34.h,
      margin: EdgeInsets.only(bottom: 8.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: padding ??
            EdgeInsets.symmetric(horizontal: AppSpacing.sameGroupItemSpacing.w),
        itemCount: filterEntries.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            // "CLEAR ALL" button
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: InkWell(
                onTap: onClearAll,
                borderRadius: BorderRadius.circular(6.r),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.redBg,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: AppColors.red.withValues(alpha: 0.5),
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.close_rounded, size: 13.sp, color: AppColors.red),
                      SizedBox(width: 4.w),
                      Text(
                        'CLEAR ALL',
                        style: AppTypography.badgeStockOut,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          final entry = filterEntries[index - 1];
          final filterCode = entry.key;
          final displayLabel = entry.value;

          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.surfaceBlue,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  color: AppColors.pickabooBlue.withValues(alpha: 0.6),
                  width: 1.w,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    displayLabel,
                    style: AppTypography.brandActionText,
                  ),
                  SizedBox(width: 6.w),
                  InkWell(
                    onTap: () => onRemoveFilter(filterCode),
                    borderRadius: BorderRadius.circular(10.r),
                    child: Padding(
                      padding: EdgeInsets.all(2.w),
                      child: Icon(
                        Icons.close_rounded,
                        size: 13.sp,
                        color: AppColors.pickabooBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
