// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:url_launcher/url_launcher.dart';

class OfferItemData {
  final String description;
  final String? termsUrl;

  const OfferItemData({
    required this.description,
    this.termsUrl,
  });
}

/// 5. AVAILABLE OFFERS & BANK DISCOUNTS (Horizontal Rail + View All Bottom Sheet)
class PdpAvailableOffersWidget extends StatefulWidget {
  final String? promoOffer;
  final List<OfferItemData>? customOffers;

  const PdpAvailableOffersWidget({
    super.key,
    this.promoOffer,
    this.customOffers,
  });

  @override
  State<PdpAvailableOffersWidget> createState() => _PdpAvailableOffersWidgetState();
}

class _PdpAvailableOffersWidgetState extends State<PdpAvailableOffersWidget> {
  late final ScrollController _scrollController;
  Timer? _autoScrollTimer;
  double _cardStep = 175.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _startAutoScroll(int count) {
    if (count <= 1) return;
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted || !_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.offset + _cardStep,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  List<OfferItemData> _parseDynamicOffers(String? rawHtml) {
    if (rawHtml == null || rawHtml.trim().isEmpty) return [];
    try {
      final document = html_parser.parse(rawHtml);
      final paragraph = document.querySelector('p');
      final content = paragraph?.innerHtml ?? rawHtml;

      final splitItems = content.split(RegExp(r'<br\s*/?>|\r?\n'));

      final items = splitItems
          .map((item) {
            final parsedItem = html_parser.parse(item);
            final text = parsedItem.body?.text.trim() ?? '';
            final linkElement = parsedItem.querySelector('a');
            final href = linkElement?.attributes['href'];

            if (text.isEmpty) return null;

            final cleanText = text.replaceAll(RegExp(r'T&C', caseSensitive: false), '').trim();

            return OfferItemData(
              description: cleanText,
              termsUrl: href,
            );
          })
          .whereType<OfferItemData>()
          .toList();

      return items;
    } catch (e) {
      debugPrint('Error parsing dynamic offers: $e');
      return [];
    }
  }

  /// Displays all offers in a clean bottom sheet matching section style
  void _showOffersBottomSheet(BuildContext context, List<OfferItemData> offers) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(ctx).size.height * 0.75),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle Bar
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // Header Title & Close Button
            Row(
              children: [
                Expanded(
                  child: Text(
                    'All Available Offers',
                    style: AppTypography.sectionTitle,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: AppColors.navy, size: 20.sp),
                  onPressed: () => Navigator.pop(ctx),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            SizedBox(height: 14.h),

            // Offers List
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: offers.length,
                separatorBuilder: (_, _) => SizedBox(height: 8.h),
                itemBuilder: (context, index) {
                  final offer = offers[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColors.pageBg,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.border,
                        width: 1.w,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Icon(
                            Icons.local_offer_outlined,
                            color: AppColors.pickabooBlue,
                            size: 16.sp,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              style: AppTypography.cardTitle.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.text,
                                height: 1.4,
                              ),
                              children: [
                                TextSpan(text: offer.description),
                                if (offer.termsUrl != null && offer.termsUrl!.isNotEmpty) ...[
                                  const TextSpan(text: '  '),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.baseline,
                                    baseline: TextBaseline.alphabetic,
                                    child: GestureDetector(
                                      onTap: () async {
                                        final uri = Uri.tryParse(offer.termsUrl!);
                                        if (uri != null) {
                                          try {
                                            await launchUrl(uri, mode: LaunchMode.externalApplication);
                                          } catch (e) {
                                            debugPrint('Could not launch termsUrl: $e');
                                          }
                                        }
                                      },
                                      child: Text(
                                        'T&C',
                                        style: AppTypography.bodyMuted.copyWith(
                                          color: AppColors.pickabooBlue,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateCardWidth({
    required OfferItemData offer,
    required double availableWidth,
    required bool isSingleOffer,
  }) {
    if (isSingleOffer) {
      return availableWidth;
    }

    final minCardWidth = (availableWidth - AppSpacing.sameGroupItemSpacing.w) / 2.15;
    final effectiveMin = minCardWidth > 150.w ? minCardWidth : 165.w;
    final maxCardWidth = availableWidth * 0.88;

    final detailStyle = AppTypography.bodyMuted.copyWith(
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.text,
      height: 1.35,
    );

    final textPainter = TextPainter(
      text: TextSpan(text: offer.description, style: detailStyle),
      textDirection: TextDirection.ltr,
    )..layout();

    // The text displays in up to 2 lines.
    final textNeededWidth = (textPainter.width / 2);
    textPainter.dispose();

    // Card inner horizontal padding (10.w * 2 = 20.w + border 2.w = 22.w)
    // Icon (16.sp) + gap (8.w) = 24.w
    final totalExtraWidth = 46.w;

    final contentNeededWidth = textNeededWidth + totalExtraWidth;

    return contentNeededWidth.clamp(effectiveMin, maxCardWidth);
  }

  @override
  Widget build(BuildContext context) {
    final offers = widget.customOffers ?? _parseDynamicOffers(widget.promoOffer);
    if (offers.isEmpty) {
      return const SizedBox.shrink();
    }
    final allOffers = offers;
    final isSingleOffer = allOffers.length == 1;
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - (AppSpacing.sameGroupItemSpacing.w * 2);

    final minCardWidth = (availableWidth - AppSpacing.sameGroupItemSpacing.w) / 2.15;
    _cardStep = (minCardWidth > 150.w ? minCardWidth : 165.w) + AppSpacing.sameGroupItemSpacing.w;

    if (_autoScrollTimer == null && allOffers.length > 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startAutoScroll(allOffers.length);
      });
    }

    final isInfinite = allOffers.length > 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header Row with "View All >" ──
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sameGroupItemSpacing.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.pdpAvailableOffers,
                style: AppTypography.sectionTitle,
              ),
              InkWell(
                onTap: () => _showOffersBottomSheet(context, allOffers),
                borderRadius: BorderRadius.circular(6.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.viewAll,
                        style: AppTypography.brandActionText.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 15.sp,
                        color: AppColors.pickabooBlue,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8.h),

        // ── Horizontal Seamless Circular Looping Offer Cards ──
        SizedBox(
          height: 56.h,
          child: ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.sameGroupItemSpacing.w),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: isInfinite ? null : allOffers.length,
            itemBuilder: (context, index) {
              final offer = allOffers[index % allOffers.length];
              final cardWidth = _calculateCardWidth(
                offer: offer,
                availableWidth: availableWidth,
                isSingleOffer: isSingleOffer,
              );

              return GestureDetector(
                onTap: () => _showOffersBottomSheet(context, allOffers),
                child: Container(
                  width: cardWidth,
                  margin: EdgeInsets.only(
                    right: isSingleOffer ? 0 : AppSpacing.sameGroupItemSpacing.w,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.pageBg,
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    border: Border.all(color: AppColors.border, width: 1.w),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_offer_outlined,
                        color: AppColors.pickabooBlue,
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          offer.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.cardTitle.copyWith(
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.text,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
