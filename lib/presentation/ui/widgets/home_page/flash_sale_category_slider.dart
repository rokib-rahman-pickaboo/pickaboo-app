import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/home_flash_sale/home_flash_sale_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/common_product_section_slider.dart';

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

  @override
  Widget build(BuildContext context) {
    if (category.products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.groupToGroupSpacing.h),
      child: CommonProductSectionSlider(
        title: title,
        products: category.products,
        onProductTap: onProductTap,
        onViewAll: onViewAll,
      ),
    );
  }
}
