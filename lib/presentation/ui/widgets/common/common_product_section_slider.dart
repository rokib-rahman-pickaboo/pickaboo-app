import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_section_header.dart';
import 'package:pickaboo/presentation/ui/widgets/common/slider_product_view.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// ─────────────────────────────────────────────────────────────
/// 🎠 CENTRALIZED REUSABLE PRODUCT SECTION SLIDER
/// Unifies Section Title, "View All >" Action, and horizontal
/// Product Cards across Home, PDP, Category, and Brand pages.
/// ─────────────────────────────────────────────────────────────
class CommonProductSectionSlider extends StatelessWidget {
  final String title;
  final List<ProductEntity> products;
  final ValueChanged<ProductEntity>? onProductTap;
  final VoidCallback? onViewAll;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double cardWidth;
  final double? railHeight;

  const CommonProductSectionSlider({
    super.key,
    required this.title,
    required this.products,
    this.onProductTap,
    this.onViewAll,
    this.backgroundColor = AppColors.transparent,
    this.padding,
    this.cardWidth = 147.0,
    this.railHeight,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox.shrink();
    }

    final double computedRailHeight = railHeight != null
        ? railHeight!.h
        : SliderProductView.calculateCardHeight(context, cardWidth);

    return Container(
      color: backgroundColor,
      padding: padding ?? EdgeInsets.symmetric(vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── 1. Section Title & View All Action Header Row ──
          AppSectionHeader(
            title: title,
            onViewAll: onViewAll,
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
            ),
          ),
          SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

          // ── 2. Horizontal Product Card Rail ──
          RepaintBoundary(
            child: SizedBox(
              height: computedRailHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sameGroupItemSpacing.w,
                ),
                itemCount: products.length,
                separatorBuilder: (context, index) =>
                    SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
                itemBuilder: (context, index) {
                  return SliderProductView(
                    product: products[index],
                    width: cardWidth,
                    onTap: (p) => onProductTap?.call(p),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
