import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/brand_products/brand_products_entity.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

class BrandFilterPromoScroller extends StatelessWidget {
  final List<BrandBannerEntity> filters;

  const BrandFilterPromoScroller({super.key, required this.filters});

  @override
  Widget build(BuildContext context) {
    if (filters.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: SizedBox(
        height: 110.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: filters.length,
          separatorBuilder: (_, __) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            final filter = filters[index];
            final image = filter.mobileImageUrl.isNotEmpty
                ? filter.mobileImageUrl
                : filter.imageUrl;
            if (image.isEmpty) return const SizedBox.shrink();

            final tile = ClipRRect(
              borderRadius: AppRadius.buttonRadius,
              child: AppImage(
                imageUrl: image,
                width: 150.w,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            );

            return filter.link.isNotEmpty
                ? GestureDetector(
                    onTap: () => context.handleBannerTap(
                      linkType: filter.linkType,
                      link: filter.link,
                      categoryName: filter.name,
                      urlKey: filter.urlKey,
                    ),
                    child: tile,
                  )
                : tile;
          },
        ),
      ),
    );
  }
}
