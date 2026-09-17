import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

class CategoryPreviewBanner extends StatelessWidget {
  final List<CategoryBannerEntity> banners;
  final int index;

  const CategoryPreviewBanner({
    super.key,
    required this.banners,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    if (index < 0 || index >= banners.length) {
      return const SizedBox.shrink();
    }

    final banner = banners[index];
    final image = banner.mobileImageUrl.isNotEmpty
        ? banner.mobileImageUrl
        : banner.imageUrl;
    if (image.isEmpty) return const SizedBox.shrink();

    final width = MediaQuery.sizeOf(context).width - 32.w;

    final banimage = ClipRRect(
      borderRadius: AppRadius.buttonRadius,
      child: AppImage(imageUrl: image, width: width, fit: BoxFit.fitWidth),
    );

    return Padding(
      padding: EdgeInsets.only(top: 12.h, left: 16.w, right: 16.w),
      child: banner.link.isNotEmpty
          ? GestureDetector(
              onTap: () => context.handleBannerTap(
                linkType: banner.linkType,
                link: banner.link,
                categoryName: banner.name,
                urlKey: banner.urlKey,
              ),
              child: banimage,
            )
          : banimage,
    );
  }
}
