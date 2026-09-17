import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/bloc/cms_content_bloc/cms_content_bloc.dart';
import 'package:pickaboo/presentation/bloc/delivery_charge_bloc/delivery_charge_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/cms_content_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_delivery_location_selector.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_pickaboo_assured_card.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_section_card.dart';
import 'package:url_launcher/url_launcher.dart';

/// 6. PDP FULFILLMENT & SERVICES SECTION
/// Combines Delivery location/shipping charge, Pickaboo Assured guarantee, and CMS promo banner.
class PdpFulfillmentAndServicesSection extends StatelessWidget {
  final ProductDetailEntity product;
  final PlacePickResultEntity? selectedDeliveryLocation;
  final bool isUserLocationNonDhaka;
  final bool isLoggedIn;
  final VoidCallback? onDeliveryLocationTap;

  const PdpFulfillmentAndServicesSection({
    super.key,
    required this.product,
    this.selectedDeliveryLocation,
    this.isUserLocationNonDhaka = false,
    this.isLoggedIn = false,
    this.onDeliveryLocationTap,
  });

  bool _isDhakaPlace(PlacePickResultEntity? place) {
    if (place == null) return false;
    final candidates = [
      place.district,
      place.division,
      place.city,
      place.address,
      place.placeName,
      place.area,
    ];
    return candidates.any((c) => c != null && c.toLowerCase().contains('dhaka'));
  }

  @override
  Widget build(BuildContext context) {
    final hasLocation = selectedDeliveryLocation != null;
    final isInsideDhaka = _isDhakaPlace(selectedDeliveryLocation);
    final isNonDhaka = (hasLocation && !isInsideDhaka) || isUserLocationNonDhaka;
    final effectiveIsExpress = product.expressDelivery == 1 && !isNonDhaka;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Delivery & Location Selector (Hidden when out of stock) ──
        if (product.stockAvailable)
          BlocBuilder<DeliveryChargeBloc, DeliveryChargeState>(
            builder: (context, deliveryChargeState) {
              final trailingText = deliveryChargeState.maybeWhen(
                loaded: (entity) => isInsideDhaka
                    ? entity.formattedInsideCharge
                    : entity.formattedOutsideCharge,
                orElse: () => null,
              );

              return PdpSectionCard(
                child: PdpDeliveryLocationSelector(
                  selectedAddress: selectedDeliveryLocation?.displayAddress,
                  deliveryCharge: trailingText,
                  isExpress: effectiveIsExpress,
                  onTap: onDeliveryLocationTap ?? () {},
                ),
              );
            },
          ),

        // ── Why Shop on Pickaboo (Assured, Express Delivery & Rewards) ──
        PdpSectionCard(
          child: PdpPickabooAssuredCard(
            product: product,
            onAssuredTap: () {
              final cmsState = context.read<CmsContentBloc>().state;
              if (cmsState.pickabooVerified != null &&
                  cmsState.pickabooVerified?.active == true) {
                CmsContentBottomSheet.show(
                  context,
                  cmsState.pickabooVerified!,
                );
              }
            },
            onExpressDeliveryTap: () {
              final cmsState = context.read<CmsContentBloc>().state;
              if (cmsState.expressDelivery != null &&
                  cmsState.expressDelivery?.active == true) {
                CmsContentBottomSheet.show(
                  context,
                  cmsState.expressDelivery!,
                );
              }
            },
            onClubPointsTap: () {
              if (isLoggedIn) {
                context.push(Routes.clubPoint);
              } else {
                context.push(Routes.login);
              }
            },
          ),
        ),

        // ── Product Offer Banner (CMS) ──
        BlocBuilder<CmsContentBloc, CmsContentState>(
          builder: (context, cmsState) {
            if (cmsState.productOffer != null &&
                cmsState.productOffer?.active == true) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.sameGroupItemSpacing.w,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        final String title = cmsState.productOffer?.title ?? "";
                        if (!title.contains('&&')) return;

                        final parts = title.split('&&');
                        final type = parts[0];
                        final link = parts.length > 1 ? parts[1] : '';
                        final name = parts.length > 2 ? parts[2] : null;

                        context.handleBannerTap(
                          linkType: type,
                          link: link,
                          categoryName: name,
                          urlKey: link,
                        );
                      },
                      child: AppHtml(
                        data: cmsState.productOffer?.content ?? "",
                        onLinkTap: (url, attributes, element) async {
                          if (url != null) {
                            final trimmedUrl = url.trim();
                            if (trimmedUrl.contains('privacy-policy')) {
                              context.push(Routes.privacyPolicy);
                            } else if (trimmedUrl.contains('slug=')) {
                              final uri = Uri.parse(trimmedUrl);
                              final slug = uri.queryParameters['slug'];
                              if (slug != null) {
                                context.pushNamed(
                                  'knowledgeBaseDetailsStandalone',
                                  pathParameters: {'id': slug},
                                  extra: {
                                    'categoryId': slug,
                                    'categoryName':
                                        element?.text ?? 'Help Articles',
                                  },
                                );
                              }
                            } else {
                              try {
                                await launchUrl(
                                  Uri.parse(trimmedUrl),
                                  mode: LaunchMode.externalApplication,
                                );
                              } catch (e) {
                                debugPrint('Could not launch $url: $e');
                              }
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: AppSpacing.groupToGroupSpacing * 0.5,
                    color: AppColors.pageBg,
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
