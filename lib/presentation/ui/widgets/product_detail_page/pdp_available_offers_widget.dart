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

import 'package:pickaboo/core/color/app_colors.dart';

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
  final bool isLoading;

  const PdpAvailableOffersWidget({
    super.key,
    this.promoOffer,
    this.customOffers,
    this.isLoading = false,
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
    final trimmed = rawHtml.trim();
    // Guard against numeric IDs (e.g. "117562", "69376") and strings without alphabetical text
    if (RegExp(r'^\d+$').hasMatch(trimmed) || !RegExp(r'[a-zA-Z]').hasMatch(trimmed)) {
      return [];
    }
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
      backgroundColor: AppColors.transparent,
      builder: (ctx) => Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(ctx).size.height * 0.75),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.pill)),
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
                decoration: const BoxDecoration(
                  color: AppColors.border,
                  borderRadius: AppRadius.badgeRadius,
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
                    style: AppTypography.titleMedium,
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
                      borderRadius: AppRadius.chipRadius,
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
                              style: AppTypography.titleSmall.copyWith(
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
                                        style: AppTypography.bodySmall.copyWith(
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

    final detailStyle = AppTypography.bodySmall.copyWith(
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
    if (widget.isLoading) {
      return _buildShimmerSkeleton(context);
    }

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
                style: AppTypography.titleMedium,
              ),
              InkWell(
                onTap: () => _showOffersBottomSheet(context, allOffers),
                borderRadius: AppRadius.smRadius,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.viewAll,
                        style: AppTypography.brandAction.copyWith(
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
                    borderRadius: AppRadius.cardRadius,
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
                          style: AppTypography.titleSmall.copyWith(
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

  Widget _buildShimmerSkeleton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header Row ──
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sameGroupItemSpacing.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.pdpAvailableOffers,
                style: AppTypography.titleMedium,
              ),
              Container(
                width: 48.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.pageBg,
                  borderRadius: BorderRadius.circular(AppRadius.badge),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8.h),

        // ── Horizontal Shimmer Offer Cards (matching exact 56.h height) ──
        SizedBox(
          height: 56.h,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.sameGroupItemSpacing.w),
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildShimmerCard(width: 175.w),
              SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
              _buildShimmerCard(width: 175.w),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerCard({required double width}) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.pageBg,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: AppColors.border, width: 1.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 22.w,
            height: 22.w,
            decoration: const BoxDecoration(
              color: AppColors.surfaceBlue,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.local_offer_outlined,
                color: AppColors.pickabooBlue.withValues(alpha: 0.5),
                size: 13.sp,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 10.h,
                  decoration: const BoxDecoration(
                    color: AppColors.border,
                    borderRadius: AppRadius.badgeRadius,
                  ),
                ),
                SizedBox(height: 6.h),
                Container(
                  width: 75.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: AppColors.border.withValues(alpha: 0.6),
                    borderRadius: AppRadius.badgeRadius,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
