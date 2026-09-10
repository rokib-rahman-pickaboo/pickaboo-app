import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/promotion_slider/promotion_slider_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

/// ============================================================================
/// 🏷️ PROMOTION BANNER SLIDER
/// Continuous auto-scrolling promotion cards styled after the Available Offers
/// component in Pickaboo-App-UI:
/// - No outer card enclosure.
/// - Full-width scrolling with peeking cards.
/// - Left: 65x65 (+20% size) product/promo thumbnail with tight padding.
/// - Right: Title (Navy bold) + Subtitle (Muted 2-line description).
/// - Precise step auto-scroll maintaining the leading margin on every cycle.
/// ============================================================================
class PromotionBannerSlider extends StatefulWidget {
  final List<PromotionSliderEntity> slides;
  final void Function(PromotionSliderEntity slide)? onSlideTap;

  const PromotionBannerSlider({
    super.key,
    required this.slides,
    this.onSlideTap,
  });

  @override
  State<PromotionBannerSlider> createState() => _PromotionBannerSliderState();
}

class _PromotionBannerSliderState extends State<PromotionBannerSlider> {
  late final ScrollController _scrollController;
  Timer? _autoScrollTimer;
  double _cardWidth = 190.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    if (widget.slides.length > 1) {
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted || !_scrollController.hasClients) return;
      if (Scrollable.recommendDeferredLoadingForContext(context)) return;
      final step = _cardWidth + AppSpacing.sameGroupItemSpacing.w;
      _scrollController.animateTo(
        _scrollController.offset + step,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.slides.isEmpty) return const SizedBox.shrink();

    // Peeking card width calculation matching Pickaboo-App-UI available offers with larger image
    final screenWidth = MediaQuery.of(context).size.width;
    final peekingWidth = (screenWidth - 24.w - 15.w) / 2.0;
    _cardWidth = peekingWidth > 175.w ? peekingWidth : 190.w;
    final isInfinite = widget.slides.length > 1;

    return RepaintBoundary(
      child: SizedBox(
        height: 78.h,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: true,
          addSemanticIndexes: false,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sameGroupItemSpacing.w,
          ),
          itemCount: isInfinite ? null : widget.slides.length,
          itemBuilder: (context, index) {
            final slide = widget.slides[index % widget.slides.length];
            final imageUrl = slide.mobileImageUrl.isNotEmpty
                ? slide.mobileImageUrl
                : slide.imageUrl;
            final subtitle = slide.subtitle.isNotEmpty
                ? slide.subtitle
                : slide.content;

            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onSlideTap != null
                  ? () => widget.onSlideTap!(slide)
                  : null,
              child: Container(
                width: _cardWidth,
                margin: EdgeInsets.only(right: AppSpacing.sameGroupItemSpacing.w),
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: AppColors.pageBg,
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  border: Border.all(
                    color: AppColors.border,
                    width: 1.w,
                  ),
                ),
                child: Row(
                  children: [
                    // ── Promo Thumbnail (Increased 20% to 65x65) ──
                    if (imageUrl.isNotEmpty) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: AppImage(
                          imageUrl: imageUrl,
                          width: 65.w,
                          height: 65.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 8.w),
                    ],

                    // ── Title & Subtitle ──
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            slide.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.cardTitle.copyWith(
                              fontSize: 11.5.sp,
                            ),
                          ),
                          if (subtitle.isNotEmpty) ...[
                            SizedBox(height: 2.h),
                            Text(
                              subtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.bodyMuted,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
