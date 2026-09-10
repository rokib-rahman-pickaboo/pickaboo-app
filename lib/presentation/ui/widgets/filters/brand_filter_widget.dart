import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// ============================================================================
/// 🏷️ UNIFIED BRAND FILTER WIDGET
/// Horizontal scrollable brand filter chip bar used across:
/// - SecondaryHomeWidget (Homepage feeds)
/// - CategoryAllProductsPage (Category product list)
///
/// Features:
/// - Uppercase rounded pills (26.h height, 6.r radius, border #E2E8F0, active #0099FF).
/// - Brand text strictly capitalized (UPPERCASE).
/// - Selected state highlighting with active brand indicator & clear option.
/// ============================================================================
class BrandFilterWidget extends StatelessWidget {
  final List<String> brandNames;
  final String? selectedBrand;
  final ValueChanged<String?> onBrandSelected;
  final String? categoryName;
  final double height;
  final EdgeInsetsGeometry? padding;

  const BrandFilterWidget({
    super.key,
    required this.brandNames,
    required this.selectedBrand,
    required this.onBrandSelected,
    this.categoryName,
    this.height = 26.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (categoryName == 'For You' || brandNames.isEmpty) {
      return const SizedBox.shrink();
    }

    final hasSelection = selectedBrand != null;
    final totalCount = hasSelection ? brandNames.length + 1 : brandNames.length;

    return SizedBox(
      height: height.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: padding ??
            EdgeInsets.symmetric(horizontal: AppSpacing.sameGroupItemSpacing.w),
        itemCount: totalCount,
        itemBuilder: (context, index) {
          if (hasSelection && index == 0) {
            // "ALL BRANDS" Clear Chip
            return Padding(
              padding:
                  EdgeInsets.only(right: AppSpacing.sameGroupItemSpacing.w),
              child: InkWell(
                onTap: () => onBrandSelected(null),
                borderRadius: BorderRadius.circular(6.r),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
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
                      Text(
                        'ALL BRANDS',
                        style: AppTypography.badgeStockOut.copyWith(
                          fontSize: 10.sp,
                          letterSpacing: 0.2,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Icon(Icons.close_rounded, size: 12.sp, color: AppColors.red),
                    ],
                  ),
                ),
              ),
            );
          }

          final brandIndex = hasSelection ? index - 1 : index;
          final brandName = brandNames[brandIndex];
          final isSelected = selectedBrand?.toLowerCase() == brandName.toLowerCase();

          return Padding(
            padding: EdgeInsets.only(right: AppSpacing.sameGroupItemSpacing.w),
            child: InkWell(
              onTap: () {
                onBrandSelected(isSelected ? null : brandName);
              },
              borderRadius: BorderRadius.circular(6.r),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.pickabooBlue : AppColors.white,
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    color: isSelected ? AppColors.pickabooBlue : AppColors.border,
                    width: 1.w,
                  ),
                ),
                child: Center(
                  child: Text(
                    brandName.toUpperCase(),
                    style: AppTypography.bodyMuted.copyWith(
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
