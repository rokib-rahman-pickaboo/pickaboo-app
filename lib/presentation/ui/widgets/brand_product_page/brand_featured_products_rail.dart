import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/slider_product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/section_title.dart';

class BrandFeaturedProductsRail extends StatelessWidget {
  final List<ProductEntity> products;
  final void Function(ProductEntity) onProductTap;

  const BrandFeaturedProductsRail({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  double _railHeight(BuildContext context, double cardWidth) {
    return SliderProductView.calculateCardHeight(context, cardWidth);
  }

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox.shrink();
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = screenWidth * 0.43;

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(top: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const SectionTitle(title: 'Featured'),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            height: _railHeight(context, cardWidth),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: products.length,
              itemBuilder: (context, index) => SizedBox(
                width: cardWidth,
                child: SliderProductView(
                  product: products[index],
                  onTap: onProductTap,
                  isFirst: index == 0,
                  isLast: index == products.length - 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
