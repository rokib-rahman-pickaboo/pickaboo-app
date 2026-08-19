import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';

class CategoryDealsGrid extends StatelessWidget {
  final CategorySliderEntity categorySlider;
  final Function(SliderEntity)? onDealTap;
  final VoidCallback? onViewAll;

  const CategoryDealsGrid({
    super.key,
    required this.categorySlider,
    this.onDealTap,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    final deals = categorySlider.slides.take(4).toList();

    if (deals.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.whiteSmoke,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  categorySlider.name,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle.bodyMediumBold.copyWith(color: colors.text),
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: onViewAll,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 7.w,
                  ),
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: colors.primary.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    "assets/new/svg/forward_icon.svg",
                    width: 7.w,
                    height: 14.h,
                    colorFilter: ColorFilter.mode(
                      colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridColumnsFor(context),
              crossAxisSpacing: 18.w,
              mainAxisSpacing: 18.w,
              childAspectRatio: 0.95,
            ),
            itemCount: deals.length,
            itemBuilder: (context, index) {
              return _DealCard(
                deal: deals[index],
                onTap: () => onDealTap?.call(deals[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DealCard extends StatelessWidget {
  final SliderEntity deal;
  final VoidCallback? onTap;

  const _DealCard({required this.deal, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final imageCacheWidth =
        ((screenWidth - 82) / 2 * devicePixelRatio).round();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(6.r),
                    ),
                    child: AppImage(
                      imageUrl: deal.mobileImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      cacheWidth: imageCacheWidth,
                      placeholder: Container(
                        color: colors.whiteSmoke,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: colors.primary,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                      errorWidget: Container(
                        color: colors.whiteSmoke,
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: colors.gray,
                            size: 28.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.r),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            colors.black.withValues(alpha: 0.0),
                            colors.black.withValues(alpha: 0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    deal.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: textStyle.bodySmall.copyWith(
                      color: colors.text,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      height: 1.2.h,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
