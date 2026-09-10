// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/slider_product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_section_card.dart';

/// 12. RECOMMENDATIONS SECTION ("You May Also Like" & "Similar Products")
class PdpRecommendationsSection extends StatelessWidget {
  final List<ProductEntity> youMayAlsoLike;
  final List<ProductEntity> similarProducts;
  final ValueChanged<ProductEntity> onProductTap;

  const PdpRecommendationsSection({
    super.key,
    required this.youMayAlsoLike,
    required this.similarProducts,
    required this.onProductTap,
  });

  double _calculateCarouselHeight(BuildContext context) {
    return SliderProductView.calculateCardHeight(context, 140.0);
  }

  @override
  Widget build(BuildContext context) {
    final hasYouMayLike = youMayAlsoLike.isNotEmpty;
    final hasSimilar = similarProducts.isNotEmpty;

    if (!hasYouMayLike && !hasSimilar) return const SizedBox.shrink();

    final railHeight = _calculateCarouselHeight(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasYouMayLike) ...[
          PdpSectionCard(
            customPadding: EdgeInsets.symmetric(vertical: AppSpacing.sameGroupItemSpacing.h),
            child: _buildProductRail(
              context,
              title: 'You May Also Like',
              products: youMayAlsoLike,
              railHeight: railHeight,
            ),
          ),
        ],
        if (hasSimilar) ...[
          PdpSectionCard(
            customPadding: EdgeInsets.symmetric(vertical: AppSpacing.sameGroupItemSpacing.h),
            child: _buildProductRail(
              context,
              title: 'Similar Products',
              products: similarProducts,
              railHeight: railHeight,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildProductRail(
    BuildContext context, {
    required String title,
    required List<ProductEntity> products,
    required double railHeight,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sameGroupItemSpacing.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTypography.sectionTitle,
              ),
              Text(
                '${products.length} Items',
                style: AppTypography.bodyMuted,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: railHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.sameGroupItemSpacing.w),
            itemCount: products.length,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              final product = products[index];
              return SizedBox(
                width: 140.w,
                child: SliderProductView(
                  product: product,
                  onTap: (p) => onProductTap(p),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
