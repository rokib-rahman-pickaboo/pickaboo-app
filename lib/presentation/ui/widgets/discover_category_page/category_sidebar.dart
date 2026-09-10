// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

/// ============================================================================
/// 📂 CATEGORY SIDEBAR (Pickaboo-App-UI Design Aligned)
/// Clean, high-contrast left navigation panel with soft-tint active states.
/// ============================================================================
class CategorySidebar extends StatelessWidget {
  final List<DiscoverCategoryEntity> categories;
  final int selectedIndex;
  final Function(DiscoverCategoryEntity category, int index) onCategoryTap;

  const CategorySidebar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88.w,
      color: AppColors.white,
      child: ListView.builder(
        itemCount: categories.length,
        padding: EdgeInsets.only(bottom: 110.h),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedIndex == index;

          return InkWell(
            onTap: () => onCategoryTap(category, index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 78.h,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.surfaceBlue : AppColors.white,
                border: Border(
                  left: BorderSide(
                    color: isSelected
                        ? AppColors.pickabooBlue
                        : AppColors.transparent,
                    width: 3.5.w,
                  ),
                  bottom: BorderSide(
                    color: AppColors.border.withValues(alpha: 0.6),
                    width: 0.8,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ── Category Icon (Transparent) ──
                  SizedBox(
                    width: 32.w,
                    height: 32.w,
                    child: AppImage(
                      imageUrl: category.logoUrl,
                      fit: BoxFit.contain,
                      errorWidget: Icon(
                        Icons.category_outlined,
                        size: 24.sp,
                        color: isSelected
                            ? AppColors.pickabooBlue
                            : AppColors.muted,
                      ),
                    ),
                  ),

                  SizedBox(height: 5.h),

                  // ── Category Label ──
                  Text(
                    category.menuName,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodyTiny,
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
