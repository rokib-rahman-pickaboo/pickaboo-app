import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';

class BannerItemView extends StatelessWidget {
  final SliderEntity banner;
  final Function(SliderEntity slider)? onTap;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final BoxFit fit;

  final bool naturalHeight;

  final int? cacheWidth;

  const BannerItemView({
    super.key,
    required this.banner,
    this.onTap,
    this.height,
    this.width,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.naturalHeight = false,
    this.cacheWidth,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveWidth = width ?? double.maxFinite;
    final effectiveBorderRadius = borderRadius ?? AppRadius.cardRadius;
    final imageWidth = effectiveWidth == double.maxFinite
        ? MediaQuery.sizeOf(context).width - 2 * AppSpacing.sameGroupItemSpacing.w
        : effectiveWidth;

    final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final int calculatedCacheWidth =
        cacheWidth ?? (imageWidth * devicePixelRatio).round().clamp(400, 900);

    final imageChild = ClipRRect(
      borderRadius: effectiveBorderRadius,
      child: naturalHeight
          ? AppImage(
              imageUrl: banner.mobileImage,
              width: imageWidth,
              fit: BoxFit.fitWidth,
              cacheWidth: calculatedCacheWidth,
            )
          : AppImage(
              imageUrl: banner.mobileImage,
              width: imageWidth,
              height: height ?? 130.h,
              fit: fit,
              cacheWidth: calculatedCacheWidth,
            ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        debugPrint('TESTING: BannerItemView Tapped!');
        onTap?.call(banner);
      },
      child: Container(
        width: effectiveWidth,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: effectiveBorderRadius,
        ),
        child: imageChild,
      ),
    );
  }
}

