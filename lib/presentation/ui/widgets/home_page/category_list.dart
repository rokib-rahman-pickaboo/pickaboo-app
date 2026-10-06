// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryListEntity> categories;
  final Function(CategoryListEntity)? onCategoryTap;
  final VoidCallback? onViewAllTap;

  const CategoryList({
    super.key,
    required this.categories,
    this.onCategoryTap,
    this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {

    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: AppTypography.bodyMedium.bold().copyWith(
                  color: AppColors.text,
                ),
              ),
              if (onViewAllTap != null)
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onViewAllTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View All',
                          style: AppTypography.titleSmall,
                        ),
                        SizedBox(width: 2.w),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 16.sp,
                          color: AppColors.pickabooBlue,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),

        SizedBox(
          height: 110.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return _CategoryItem(
                category: category,
                onTap: () => onCategoryTap?.call(category),
              );
            },
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final CategoryListEntity category;
  final VoidCallback? onTap;

  const _CategoryItem({required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.k8,
      child: SizedBox(
        width: 80.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.w),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: AppRadius.k8,
                child: SizedBox(
                  width: 52.w,
                  height: 52.w,
                  child: category.icon.isNotEmpty
                      ? AppImage(
                          imageUrl: category.icon,
                          fit: BoxFit.cover,
                          width: 52.w,
                          height: 52.w,
                          placeholder: _buildSkeletonShade(),
                          errorWidget: _buildSkeletonShade(),
                        )
                      : _buildSkeletonShade(),
                ),
              ),
              SizedBox(height: 6.h),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    category.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyTiny.copyWith(color: AppColors.text,fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkeletonShade() {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: Container(
        width: 52.w,
        height: 52.w,
        decoration: BoxDecoration(
          color: AppColors.itemBackground,
          borderRadius: AppRadius.k8,
          border: Border.all(color: AppColors.border),
        ),
        child: Center(
          child: Icon(
            Icons.image_outlined,
            size: 24.sp,
            color: AppColors.skeletonBase,
          ),
        ),
      ),
    );
  }
}
