import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/bloc/product_flash_sale_bloc/product_flash_sale_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_available_offers_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_section_card.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_sale_timer_section.dart';

/// 5. PDP DEALS & OFFERS SECTION
/// Combines live Flash Sale countdown timer and available bank discounts / promo offers.
class PdpDealsAndOffersSection extends StatelessWidget {
  final ProductDetailEntity product;

  const PdpDealsAndOffersSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final offers = PdpAvailableOffersWidget.parseDynamicOffers(product.offers);
    final hasOffers = product.isPartial || offers.isNotEmpty;

    return BlocBuilder<ProductFlashSaleBloc, ProductFlashSaleState>(
      builder: (context, flashSaleState) {
        final sale = flashSaleState.flashSale?.flashSale;
        final isFlashSaleActive = flashSaleState.status == ProductFlashSaleStatus.success &&
            flashSaleState.flashSale?.inFlashSale == true &&
            sale?.endTime != null;

        if (!isFlashSaleActive && !hasOffers) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Flash Sale Timer Banner (if active) ──
            if (isFlashSaleActive && sale != null)
              ProductSaleTimerSection(
                title: sale.title,
                subtitle: sale.shortDescription,
                endTime: sale.endTime!,
                onLearnMore: () {
                  final segments = sale.slug
                      .split('/')
                      .where((s) => s.trim().isNotEmpty)
                      .toList();
                  if (segments.isNotEmpty) {
                    context.handleBannerTap(
                      linkType: 'special_category',
                      link: segments.last.trim(),
                      categoryName: sale.title,
                      urlKey: segments.last.trim(),
                    );
                  }
                },
              ),

            // ── Available Offers & Bank Discounts ──
            if (hasOffers)
              PdpSectionCard(
                customPadding: EdgeInsets.fromLTRB(
                  0,
                  AppSpacing.sameGroupItemSpacing.h,
                  0,
                  4.h,
                ),
                child: PdpAvailableOffersWidget(
                  promoOffer: product.isPartial ? null : product.offers,
                  customOffers: product.isPartial ? null : offers,
                  isLoading: product.isPartial,
                ),
              ),
          ],
        );
      },
    );
  }
}
