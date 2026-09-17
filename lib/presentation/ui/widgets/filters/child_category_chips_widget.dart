import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';

/// ============================================================================
/// 🏷️ UNIFIED CHILD CATEGORY CHIPS WIDGET
/// Horizontal scrollable child category chip bar used across:
/// - SecondaryHomeWidget (Homepage category tab feed)
/// - CategoryProductPage (Category all products page)
///
/// Features:
/// - Displays child categories of the active parent category from /rest/V1/all-categories
/// - Uppercase rounded pills (26.h height, 6.r radius, border #E2E8F0, active #0099FF).
/// ============================================================================
class ChildCategoryChipsWidget extends StatelessWidget {
  final List<CategoryEntity> childCategories;
  final String? selectedChildId;
  final ValueChanged<CategoryEntity> onChildSelected;
  final double height;
  final EdgeInsetsGeometry? padding;

  const ChildCategoryChipsWidget({
    super.key,
    required this.childCategories,
    this.selectedChildId,
    required this.onChildSelected,
    this.height = 26.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (childCategories.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: height.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: padding ??
            EdgeInsets.symmetric(horizontal: AppSpacing.sameGroupItemSpacing.w),
        itemCount: childCategories.length,
        itemBuilder: (context, index) {
          final child = childCategories[index];
          final isSelected = selectedChildId != null &&
              (selectedChildId == child.id || selectedChildId == child.slug);

          return Padding(
            padding: EdgeInsets.only(right: AppSpacing.sameGroupItemSpacing.w),
            child: InkWell(
              onTap: () => onChildSelected(child),
              borderRadius: AppRadius.smRadius,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.pickabooBlue : AppColors.white,
                  borderRadius: AppRadius.smRadius,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.pickabooBlue
                        : AppColors.border,
                    width: 1.w,
                  ),
                ),
                child: Center(
                  child: Text(
                    child.name,
                    style: AppTypography.bodySmall.copyWith(
                      fontSize: 10.5.sp,
                      fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                      color: isSelected ? AppColors.white : AppColors.navy,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
