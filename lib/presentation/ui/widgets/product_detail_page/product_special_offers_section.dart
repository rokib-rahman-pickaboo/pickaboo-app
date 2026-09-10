// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/presentation/bloc/emi_bloc/emi_bloc.dart';
import 'package:pickaboo/presentation/bloc/cms_content_bloc/cms_content_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/emi_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class ProductSpecialOffersSection extends StatelessWidget {
  final ProductDetailEntity product;

  const ProductSpecialOffersSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.offers.isNotEmpty) ...[
            Text(
              'Special Offer',
              style: textStyle.robotoBold.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: 8.h),
            ...product.offers
                .split(RegExp(r'\r?\n'))
                .where((offer) => offer.trim().isNotEmpty)
                .map(
                  (offer) => _buildSimpleOfferItem(
                    context: context,
                    text: offer,
                    textStyle: textStyle,
                  ),
                ),
          ],

          BlocBuilder<CmsContentBloc, CmsContentState>(
            builder: (context, state) {
              return _buildCardOfferItem(
                text: 'Pickaboo Assured',
                icon: "assets/new/svg/detail/assured_icon.svg",
                hasArrow: true,
                textStyle: textStyle,
                onTap: () {
                  if (state.pickabooVerified != null &&
                      state.pickabooVerified?.active == true) {
                    context.pushNamed(
                      'cmsContent',
                      pathParameters: {'id': product.id.toString()},
                      extra: {'cmsBlock': state.pickabooVerified},
                    );
                  }
                },
              );
            },
          ),

          if (product.emi > 0) ...[
            _buildCardOfferItem(
              text: 'EMI\'s From: ৳${product.emi} / month ',
              icon: "assets/new/svg/detail/emi_icon.svg",
              hasArrow: true,
              textStyle: textStyle,
              onTap: () {
                final emiBloc = context.read<EmiBloc>();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  backgroundColor: AppColors.black.withValues(alpha: 0.0),
                  builder: (context) => BlocProvider.value(
                    value: emiBloc,
                    child: BlocConsumer<EmiBloc, EmiState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => Container(
                            height: 200.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.r),
                              ),
                            ),
                            child: const AppLoader.fullPage(),
                          ),
                          loaded: (emiOptions) => EmiBottomSheet(
                            emiOptions: emiOptions,
                            productPrice: product.bestPrice.toString(),
                          ),
                          error: (error) => Container(
                            height: 200.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.r),
                              ),
                            ),
                            padding: EdgeInsets.all(16.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 48.sp,
                                  color: AppColors.red,
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  error.message,
                                  style: textStyle.bodyMedium.copyWith(
                                    color: AppColors.text,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],

          if (product.expressDelivery == 1) ...[
            BlocBuilder<CmsContentBloc, CmsContentState>(
              builder: (context, state) {
                return _buildCardOfferItem(
                  text: 'Express Delivery',
                  icon: "assets/new/svg/detail/express_delivery_icon.svg",
                  hasArrow: true,
                  textStyle: textStyle,
                  onTap: () {
                    if (state.expressDelivery != null &&
                        state.expressDelivery?.active == true) {
                      context.pushNamed(
                        'cmsContent',
                        pathParameters: {'id': product.id.toString()},
                        extra: {'cmsBlock': state.expressDelivery},
                      );
                    }
                  },
                );
              },
            ),
          ],

          if (product.warranty.isNotEmpty) ...[
            _buildCardOfferItem(
              text: product.warranty,
              icon: "assets/new/svg/detail/offer_icon.svg",
              hasArrow: false,
              textStyle: textStyle,
              onTap: () {
                debugPrint('Tapped on Warranty');
              },
            ),
          ],

        ],
      ),
    );
  }

  Widget _buildSimpleOfferItem({
    required BuildContext context,
    required String text,
    required AppTextStyles textStyle,
  }) {
    final offers = _parseOffers(text);

    if (offers.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: offers.map((offer) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: SvgPicture.asset(
                  'assets/new/svg/offer_tag_icon.svg',
                  width: 14.w,
                  height: 14.w,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    AppColors.pickabooBlue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: 10.w),

              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: textStyle.bodySmall.copyWith(
                      color: AppColors.text,
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(text: offer.title),
                      if (offer.termsUrl != null) ...[
                        const TextSpan(text: ' '),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: GestureDetector(
                            onTap: () async {
                              final uri = Uri.tryParse(offer.termsUrl!);
                              if (uri != null) {
                                try {
                                  await launchUrl(
                                    uri,
                                    mode: LaunchMode.externalApplication,
                                  );
                                } catch (e) {
                                  debugPrint('Could not launch ${offer.termsUrl}: $e');
                                }
                              }
                            },
                            child: Text(
                              'T&C',
                              style: textStyle.bodySmall.copyWith(
                                color: AppColors.pickabooBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  List<_BankOffer> _parseOffers(String htmlText) {
    try {
      final document = html_parser.parse(htmlText);
      final paragraph = document.querySelector('p');
      final rawHtml = paragraph?.innerHtml ?? htmlText;

      final splitItems = rawHtml.split(RegExp(r'<br\s*/?>'));

      return splitItems
          .map((item) {
            final parsedItem = html_parser.parse(item);
            final text = parsedItem.body?.text.trim() ?? '';
            final linkElement = parsedItem.querySelector('a');
            final href = linkElement?.attributes['href'];

            if (text.isEmpty) return null;

            return _BankOffer(
              title: text.replaceAll('T&C', '').trim(),
              termsUrl: href,
            );
          })
          .whereType<_BankOffer>()
          .toList();
    } catch (e) {
      debugPrint('Error parsing offers HTML: $e');
      return [];
    }
  }

  Widget _buildCardOfferItem({
    required String text,
    required String icon,
    required bool hasArrow,
    required AppTextStyles textStyle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Material(
        color: AppColors.pageBg,
        borderRadius: BorderRadius.circular(8.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: AppColors.pickabooBlue,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: SvgPicture.asset(
                    icon,
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),

                Expanded(
                  child: Text(
                    text,
                    style: textStyle.bodyMedium.copyWith(
                      color: AppColors.text,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                if (hasArrow) ...[
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.chevron_right,
                    size: 24.sp,
                    color: AppColors.text.withValues(alpha: 0.3),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BankOffer {
  final String title;
  final String? termsUrl;

  const _BankOffer({required this.title, this.termsUrl});
}
