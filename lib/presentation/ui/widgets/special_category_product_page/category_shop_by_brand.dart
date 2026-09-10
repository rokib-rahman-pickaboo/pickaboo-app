import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/section_title.dart';

class CategoryShopByBrand extends StatelessWidget {
  final List<CategoryBrandEntity> brands;

  const CategoryShopByBrand({super.key, required this.brands});

  @override
  Widget build(BuildContext context) {
    if (brands.isEmpty) return const SizedBox.shrink();
    final textStyle = context.textStyle;

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const SectionTitle(title: 'Shop by brands'),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 90.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: brands.length,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                final brand = brands[index];
                return GestureDetector(
                  onTap: () => context.pushToBrandProduct(
                    brandKey: brand.id,
                    brandName: brand.name,
                  ),
                  child: SizedBox(
                    width: 64.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 64.w,
                          height: 64.w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: AppColors.muted.withValues(alpha: 0.3),
                              width: 1.w,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: brand.icon.isNotEmpty
                              ? AppImage(
                                  imageUrl: brand.icon,
                                  fit: BoxFit.contain,
                                )
                              : Center(
                                  child: Text(
                                    brand.name.isNotEmpty
                                        ? brand.name[0].toUpperCase()
                                        : '?',
                                    style: textStyle.bodyLargeBold.withColor(
                                      AppColors.muted,
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          brand.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: textStyle.caption.withColor(AppColors.text),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
