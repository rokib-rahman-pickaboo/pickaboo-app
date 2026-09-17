import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/bloc/recommended_products_bloc/recommended_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/related_products_bloc/related_products_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_section_card.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_frequently_bought_together.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_section_slider.dart';

/// 9. PDP CROSS SELL & RECOMMENDATIONS SECTION
/// Combines Frequently Bought Together and Related / Recommended Sliders
/// into a single cohesive bottom discovery block.
class PdpCrossSellSection extends StatelessWidget {
  final ProductDetailEntity product;
  final Function(List<BuyTogetherEntity>)? onAddBuyTogetherToCart;
  final Function(List<BuyTogetherEntity>)? onAddBundleToCart;

  const PdpCrossSellSection({
    super.key,
    required this.product,
    this.onAddBuyTogetherToCart,
    this.onAddBundleToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Frequently Bought Together ──
        if (product.buysTogather.isNotEmpty)
          PdpSectionCard(
            child: ProductFrequentlyBoughtTogether(
              mainProduct: product,
              items: product.buysTogather,
              onAddToCart: onAddBuyTogetherToCart,
              onAddBundleToCart: onAddBundleToCart,
            ),
          ),

        // ── Related Products Slider ──
        BlocBuilder<RelatedProductsBloc, RelatedProductsState>(
          builder: (context, relatedState) {
            return relatedState.maybeWhen(
              loaded: (entity) {
                if (entity.relatedProducts.isEmpty) {
                  return const SizedBox.shrink();
                }
                return PdpSectionCard(
                  customPadding: EdgeInsets.zero,
                  child: ProductSectionSlider(
                    title: 'Related Products',
                    products: entity.relatedProducts,
                    onProductTap: (product) {
                      context.goToProductDetail(
                        product.id.toString(),
                        slug: product.slug,
                        productName: product.productName,
                      );
                    },
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),

        // ── Recommended For You Slider ──
        BlocBuilder<RecommendedProductsBloc, RecommendedProductsState>(
          builder: (context, recommendedState) {
            return recommendedState.maybeWhen(
              loaded: (entity) {
                if (entity.sellerRecommendedProducts.isEmpty) {
                  return const SizedBox.shrink();
                }
                return PdpSectionCard(
                  customPadding: EdgeInsets.zero,
                  child: ProductSectionSlider(
                    title: 'Recommended For You',
                    products: entity.sellerRecommendedProducts,
                    onProductTap: (product) {
                      context.goToProductDetail(
                        product.id.toString(),
                        slug: product.slug,
                        productName: product.productName,
                      );
                    },
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
