import 'package:flutter/material.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/common_product_section_slider.dart';

import 'package:pickaboo/core/color/app_colors.dart';

class ProductSectionSlider extends StatelessWidget {
  final String title;
  final List<ProductEntity> products;
  final Function(ProductEntity)? onProductTap;
  final VoidCallback? onViewAll;

  const ProductSectionSlider({
    super.key,
    required this.title,
    required this.products,
    this.onProductTap,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return CommonProductSectionSlider(
      title: title,
      products: products,
      onProductTap: onProductTap,
      onViewAll: onViewAll,
      backgroundColor: AppColors.white,
    );
  }
}
