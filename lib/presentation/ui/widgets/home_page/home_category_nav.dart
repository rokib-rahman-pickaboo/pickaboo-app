// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// Modern Home Category Navigation Bar
/// Positioned directly below the Top Search Bar and before the Main Banner Carousel.
///
/// Features:
///   - Index 0: 'For You' (Default selected category with sparkle emoji)
///   - Indices 1..N: Live categories from API
///   - Last Index: 'View All' tile (navigates to Discover Category page)
///   - Darker/gray background when selected (no icon color change)
///   - Pickaboo Blue bottom active indicator bar
///   - Collapses icon boxes on scroll down to show ONLY category names
class HomeCategoryNav extends StatelessWidget {
  final List<CategoryListEntity> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;
  final VoidCallback onViewAll;
  final bool isCollapsed;

  const HomeCategoryNav({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.onViewAll,
    this.isCollapsed = false,
  });

  @override
  Widget build(BuildContext context) {
    final double textScale = MediaQuery.textScalerOf(context).scale(1.0);
    final double labelHeight = isCollapsed
        ? (20.0.h * textScale).clamp(18.0, 24.0)
        : (34.0.h * textScale).clamp(32.0, 44.0);
    final double itemWidth = isCollapsed
        ? (84.0.w).clamp(78.0, 92.0)
        : (78.0.w).clamp(74.0, 88.0);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.pageBg,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: 1.w,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: isCollapsed ? 4.h : 6.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── Index 0: 'For You' Category ──
            _buildForYouItem(context, labelHeight, itemWidth),

            // ── Indices 1..N: Live API Categories ──
            ...categories.map(
              (category) => _buildCategoryItem(context, category, labelHeight, itemWidth),
            ),

            // ── Last Index: 'View All' Tile ──
            _buildViewAllItem(context, labelHeight, itemWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildForYouItem(
    BuildContext context,
    double labelHeight,
    double itemWidth,
  ) {
    final isSelected = selectedCategory == 'For You';

    return InkWell(
      onTap: () => onCategorySelected('For You'),
      borderRadius: AppRadius.chipRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: itemWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon Box (Collapses when scrolling down)
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 250),
                crossFadeState:
                    isCollapsed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                firstChild: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppRadius.cardRadius,
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.navy.withValues(alpha: 0.08),
                                blurRadius: 4.r,
                                offset: Offset(0, 2.h),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        '✨',
                        style: AppTypography.heroTitle,
                      ),
                    ),
                  ),
                ),
                secondChild: const SizedBox.shrink(),
              ),

              // Category Label Text (NOT BOLD: Lighter Gray vs Deep Black)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: SizedBox(
                  height: labelHeight,
                  child: Center(
                    child: Text(
                      'For You',
                      textAlign: TextAlign.center,
                      maxLines: isCollapsed ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodyTiny.medium().navy.copyWith(
                        height: 1.2,
                        color: isSelected
                            ? AppColors.navy
                            : AppColors.muted,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 3.h),

              // Bottom Active Indicator Bar (Pickaboo Sky Blue #00AEEF)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2.5.h,
                width: isSelected ? (isCollapsed ? 32.w : 26.w) : 0,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.pickabooBlue
                      : AppColors.transparent,
                  borderRadius: AppRadius.badgeRadius,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context,
    CategoryListEntity category,
    double labelHeight,
    double itemWidth,
  ) {
    final isSelected = selectedCategory == category.name;

    return InkWell(
      onTap: () => onCategorySelected(category.name),
      borderRadius: AppRadius.chipRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: itemWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon Box (Collapses when scrolling down)
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 250),
                crossFadeState:
                    isCollapsed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                firstChild: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppRadius.cardRadius,
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.navy.withValues(alpha: 0.08),
                                blurRadius: 4.r,
                                offset: Offset(0, 2.h),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: category.icon.isNotEmpty
                          ? ClipRRect(
                              borderRadius: AppRadius.buttonRadius,
                              child: AppImage(
                                imageUrl: category.icon,
                                width: 40.w,
                                height: 40.w,
                                fit: BoxFit.contain,
                                placeholder:
                                    const AppLoader.inline(size: 16),
                                errorWidget: Icon(
                                  Icons.category_outlined,
                                  color: AppColors.muted,
                                  size: 22.sp,
                                ),
                              ),
                            )
                          : Icon(
                              Icons.category_outlined,
                              color: isSelected ? AppColors.pickabooBlue : AppColors.muted,
                              size: 22.sp,
                            ),
                    ),
                  ),
                ),
                secondChild: const SizedBox.shrink(),
              ),

              // Category Label Text (NOT BOLD: Lighter Gray vs Deep Black)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: SizedBox(
                  height: labelHeight,
                  child: Center(
                    child: Text(
                      category.name,
                      textAlign: TextAlign.center,
                      maxLines: isCollapsed ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodyTiny.medium().navy.copyWith(
                        height: 1.2,
                        color: isSelected
                            ? AppColors.navy
                            : AppColors.muted,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 3.h),

              // Bottom Active Indicator Bar (Pickaboo Sky Blue #00AEEF)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2.5.h,
                width: isSelected ? (isCollapsed ? 32.w : 26.w) : 0,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.pickabooBlue
                      : AppColors.transparent,
                  borderRadius: AppRadius.badgeRadius,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewAllItem(
    BuildContext context,
    double labelHeight,
    double itemWidth,
  ) {
    return InkWell(
      onTap: onViewAll,
      borderRadius: AppRadius.chipRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: itemWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // View All Icon Box (Collapses when scrolling down)
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 250),
                crossFadeState:
                    isCollapsed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                firstChild: Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppRadius.cardRadius,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.grid_view_rounded,
                        color: AppColors.pickabooBlue,
                        size: 22.sp,
                      ),
                    ),
                  ),
                ),
                secondChild: const SizedBox.shrink(),
              ),

              SizedBox(
                height: labelHeight,
                child: Center(
                  child: Text(
                    AppStrings.viewAll,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodyTiny.medium().navy.copyWith(
                      height: 1.2,
                      color: AppColors.pickabooBlue,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 3.h),

              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2.5.h,
                width: 0,
                decoration: const BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: AppRadius.badgeRadius,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
