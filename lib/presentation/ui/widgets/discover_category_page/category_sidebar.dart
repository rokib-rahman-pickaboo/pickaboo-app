import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';

class CategorySidebar extends StatelessWidget {
  final List<DiscoverCategoryEntity> categories;
  final int selectedIndex;
  final Function(DiscoverCategoryEntity category, int index) onCategoryTap;

  static const double _radius = 18;
  static const double _rowHeight = 74;

  const CategorySidebar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: 84.w,
      color: colors.white,
      child: ListView.builder(
        itemCount: categories.length,
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedIndex == index;
          final isPrev = index == selectedIndex - 1;
          final isNext = index == selectedIndex + 1;

          BorderRadius? borderRadius;
          if (isPrev) {
            borderRadius = BorderRadius.only(
              bottomRight: Radius.circular(_radius.r),
            );
          } else if (isNext) {
            borderRadius = BorderRadius.only(
              topRight: Radius.circular(_radius.r),
            );
          }

          return InkWell(
            onTap: () => onCategoryTap(category, index),
            child: Container(
              height: _rowHeight.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isSelected ? colors.white : colors.whiteSmoke,
                borderRadius: borderRadius,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.r),
                          child: AppImage(
                            imageUrl: category.logoUrl,
                            width: 30.w,
                            height: 30.w,
                            fit: BoxFit.contain,
                            errorWidget: Icon(
                              Icons.category_outlined,
                              size: 26.w,
                              color: isSelected ? colors.primary : colors.gray,
                            ),
                          ),
                        ),

                        SizedBox(height: 6.h),

                        SizedBox(
                          height: 26.h,
                          child: Center(
                            child: Text(
                              category.menuName,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyle.caption.copyWith(
                                fontSize: 10.sp,
                                height: 1.25,
                                color: isSelected
                                    ? colors.primary
                                    : colors.gray,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                  ),

                  if (isSelected)
                    Positioned(
                      left: 0,
                      top: 10.h,
                      bottom: 10.h,
                      child: Container(
                        width: 5.w,
                        decoration: BoxDecoration(
                          color: colors.primary,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(5.r),
                          ),
                        ),
                      ),
                    ),

                  if (!isSelected && !isPrev)
                    Positioned(
                      left: 14.w,
                      right: 14.w,
                      bottom: 0,
                      child: Container(
                        height: 1,
                        color: colors.gray.withValues(alpha: 0.12),
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
