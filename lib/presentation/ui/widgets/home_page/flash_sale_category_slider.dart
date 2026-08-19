import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/home_flash_sale/home_flash_sale_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/slider_product_view.dart';

class FlashSaleCategorySlider extends StatelessWidget {
  final FlashSaleCategoryEntity category;
  final Function(ProductEntity)? onProductTap;
  final String title;
  final VoidCallback? onViewAll;

  const FlashSaleCategorySlider({
    super.key,
    required this.category,
    this.onProductTap,
    this.onViewAll,
    required this.title,
  });

  double _calculateCarouselHeight(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    const viewportFraction = 0.43;
    final cardWidth = screenWidth * viewportFraction;
    final imageHeight = cardWidth / 1.45;
    final imageTextGap = 4.h;
    final textScaleFactor = MediaQuery.textScalerOf(context).scale(1.0);
    final textContentHeight = (95.h * textScaleFactor).clamp(75.0, 130.0);
    final verticalPadding = 16.h;

    return imageHeight + imageTextGap + textContentHeight + verticalPadding;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    if (category.products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      color: colors.white,
      padding: EdgeInsets.only(top: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 6,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.bodyMediumBold.withColor(colors.text),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: TextButton(
                    onPressed: onViewAll,
                    child: Text(
                      'View All',
                      style: textStyle.link.withColor(colors.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),

          CarouselSlider.builder(
            itemCount: category.products.length,
            itemBuilder: (context, index, realIndex) {
              final product = category.products[index];

              return SliderProductView(
                product: product,
                onTap: (p) => onProductTap?.call(p),
                isLast: index == category.products.length - 1,
                isFirst: index == 0,
              );
            },
            options: CarouselOptions(
              height: _calculateCarouselHeight(context),
              viewportFraction: 0.43,
              autoPlay: false,
              enlargeCenterPage: false,
              padEnds: false,
              enableInfiniteScroll: false,
            ),
          ),
        ],
      ),
    );
  }
}
