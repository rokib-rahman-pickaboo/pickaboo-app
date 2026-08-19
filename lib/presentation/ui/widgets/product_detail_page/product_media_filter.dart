import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';

class ProductMediaFilter extends StatelessWidget {
  final ProductDetailEntity product;
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const ProductMediaFilter({
    super.key,
    required this.product,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    final filters = [
      if (product.images.isNotEmpty)
        {'label': 'Product Images', 'count': product.images.length},
      if (product.youtubeVideos.isNotEmpty)
        {'label': 'Videos', 'count': product.youtubeVideos.length},
      if (product.allReviewImages.isNotEmpty)
        {'label': 'Customer Images', 'count': product.allReviewImages.length},
    ];

    if (filters.isEmpty) return const SizedBox.shrink();

    return Container(
      color: colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters.map((filter) {
            final label = filter['label'] as String;
            final count = filter['count'] as int;
            final isSelected = selectedFilter == label;

            return Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: GestureDetector(
                onTap: () => onFilterChanged(label),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? colors.solitude : colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: isSelected ? colors.primary : colors.borderColor,
                      width: 1.2.w,
                    ),
                  ),
                  child: Text(
                    '$label ($count)',
                    style: textStyle.bodySmall.copyWith(
                      color: isSelected ? colors.primary : colors.text,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
