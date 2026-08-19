import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_banner_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

class CategoryBanner extends StatelessWidget {
  final List<DiscoverCategoryBannerEntity> banners;
  final String menuName;
  final VoidCallback? onTap;

  static const Color _backdropStart = Color(0xFFFFFFFF);
  static const Color _backdropEnd = Color(0xFFE7EAFB);

  static const double _height = 100;

  static const int _titleFlex = 55;
  static const int _artworkFlex = 45;

  const CategoryBanner({
    super.key,
    required this.banners,
    required this.menuName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) return const SizedBox.shrink();

    final colors = context.colors;
    final textStyles = context.textStyle;
    final banner = banners.first;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: _height.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [_backdropStart, _backdropEnd],
            stops: [0.15, 1.0],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: _titleFlex,
              child: Padding(
                padding: EdgeInsets.only(left: 14.w, right: 4.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    menuName,
                    style: textStyles.headingSmall
                        .withColor(colors.primary)
                        .copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          letterSpacing: -0.2,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: _artworkFlex,
              child: Padding(
                padding: EdgeInsets.only(right: 12.w, top: 8.h, bottom: 8.h),
                child: AppImage(
                  imageUrl: banner.imageUrl,
                  fit: BoxFit.contain,
                  errorWidget: const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
