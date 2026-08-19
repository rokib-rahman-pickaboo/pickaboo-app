import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/promotion_slider/promotion_slider_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

class PromotionBannerSlider extends StatelessWidget {
  final List<PromotionSliderEntity> slides;
  final void Function(PromotionSliderEntity slide)? onSlideTap;

  const PromotionBannerSlider({
    super.key,
    required this.slides,
    this.onSlideTap,
  });

  @override
  Widget build(BuildContext context) {
    if (slides.isEmpty) return const SizedBox.shrink();

    final looping = slides.length > 1;

    return CarouselSlider.builder(
      itemCount: slides.length,
      itemBuilder: (context, index, realIndex) {
        final slide = slides[index];
        return _PromotionBannerItem(
          slide: slide,
          isFirst: !looping && index == 0,
          isLast: !looping && index == slides.length - 1,
          onTap: onSlideTap != null ? () => onSlideTap!(slide) : null,
        );
      },
      options: CarouselOptions(
        height: 90.h,
        viewportFraction: 0.60,
        autoPlay: looping,
        enlargeCenterPage: false,
        padEnds: false,
        enableInfiniteScroll: looping,
      ),
    );
  }
}

class _PromotionBannerItem extends StatelessWidget {
  final PromotionSliderEntity slide;
  final bool isFirst;
  final bool isLast;
  final VoidCallback? onTap;

  const _PromotionBannerItem({
    required this.slide,
    this.isFirst = false,
    this.isLast = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    final imageUrl =
        slide.mobileImageUrl.isNotEmpty ? slide.mobileImageUrl : slide.imageUrl;
    final subtitle =
        slide.subtitle.isNotEmpty ? slide.subtitle : slide.content;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(
          left: isFirst ? 12.w : 6.w,
          right: isLast ? 12.w : 6.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        color: colors.white,
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: AppImage(
                  imageUrl: imageUrl,
                  width: 62.w,
                  height: 62.h,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        slide.title,
                        style: textStyles.productName.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colors.text,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    if (subtitle.isNotEmpty) ...[
                      SizedBox(height: 2.h),
                      Text(
                        subtitle,
                        style: textStyles.productPrice.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
