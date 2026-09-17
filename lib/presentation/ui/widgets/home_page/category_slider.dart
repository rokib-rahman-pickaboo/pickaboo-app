import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/common_product_section_slider.dart';

class CategorySlider extends StatelessWidget {
  final CategoryProductEntity categoryProduct;
  final Function(ProductEntity)? onProductTap;
  final Function(CategoryProductEntity)? onCategoryTap;

  const CategorySlider({
    super.key,
    required this.categoryProduct,
    required this.onProductTap,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    if (categoryProduct.products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.groupToGroupSpacing.h),
      child: CommonProductSectionSlider(
        title: categoryProduct.categoryName,
        products: categoryProduct.products,
        onProductTap: onProductTap,
        onViewAll: onCategoryTap != null ? () => onCategoryTap!(categoryProduct) : null,
      ),
    );
  }
}
