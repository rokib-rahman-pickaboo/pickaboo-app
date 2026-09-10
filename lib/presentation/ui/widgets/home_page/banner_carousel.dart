import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_item_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// 🖼️ CENTRALIZED BIG BANNER CAROUSEL
///
/// Configured according to specifications:
/// - Core: Native CarouselSlider.builder + smooth_page_indicator
/// - Non-Swipeable: User cannot manually drag (scrollPhysics: NeverScrollableScrollPhysics)
/// - Auto-Slide: Fixed rotation every 3.6s with 400ms easeInOutCubic animation
/// - Sizing & Peek: height 160.h, viewportFraction 0.95, enlargeCenterPage true (0.15 factor)
/// - Indicator: Overlaid inside image at bottom
/// - Smart Indicator: Hidden when banner count <= 1
class BannerCarousel extends StatefulWidget {
  final List<SliderEntity> banners;
  final Function(SliderEntity slider)? onBannerTap;

  const BannerCarousel({super.key, required this.banners, this.onBannerTap});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final Set<String> _viewedBannerIds = {};

  @override
  void initState() {
    super.initState();
    if (widget.banners.isNotEmpty) {
      _logBannerView(widget.banners.first);
    }
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  void _logBannerView(SliderEntity banner) {
    if (!_viewedBannerIds.add(banner.id)) return;
    getIt<AnalyticsService>().logBannerView(
      identifier: banner.urlKey,
      title: banner.title,
      entityId: banner.id,
      position: banner.order,
      imagePosition: banner.imagePosition,
      pageType: 'home',
      imageUrl: banner.image,
    );
  }

  void _logBannerClick(SliderEntity banner) {
    getIt<AnalyticsService>().logBannerClick(
      identifier: banner.urlKey,
      title: banner.title,
      entityId: banner.id,
      position: banner.order,
      imagePosition: banner.imagePosition,
      pageType: 'home',
      imageUrl: banner.image,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return const SizedBox.shrink();
    }

    final bool hasMultipleBanners = widget.banners.length > 1;

    return RepaintBoundary(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // ── 1. Carousel Slider (Non-swipeable by user, auto-slides via timer) ──
          CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: widget.banners.length,
            itemBuilder: (context, index, realIndex) {
              final banner = widget.banners[index];
              return BannerItemView(
                banner: banner,
                onTap: (slider) {
                  _logBannerClick(slider);
                  widget.onBannerTap?.call(slider);
                },
              );
            },
            options: CarouselOptions(
              height: 160.h,
              viewportFraction: 0.95,
              scrollPhysics:
                  const NeverScrollableScrollPhysics(), // Non-swipeable by user
              autoPlay: hasMultipleBanners,
              autoPlayInterval: const Duration(milliseconds: 3600), // 3.6s
              autoPlayAnimationDuration:
                  const Duration(milliseconds: 400), // 400ms
              autoPlayCurve: Curves.easeInOutCubic,
              pauseAutoPlayOnTouch: true,
              pauseAutoPlayOnManualNavigate: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.15,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
                if (index >= 0 && index < widget.banners.length) {
                  _logBannerView(widget.banners[index]);
                }
              },
            ),
          ),

          // ── 2. Indicator (Inside image, only shown if banners > 1) ──
          if (hasMultipleBanners)
            Positioned(
              bottom: 10.h,
              child: ValueListenableBuilder<int>(
                valueListenable: _currentIndex,
                builder: (context, currentIndex, _) => AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: widget.banners.length,
                  effect: WormEffect(
                    dotHeight: 3.h,
                    dotWidth: 10.w,
                    activeDotColor: AppColors.pickabooBlue,
                    dotColor: AppColors.white.withValues(alpha: 0.6),
                    spacing: 2.w,
                  ),
                  onDotClicked: (index) {
                    _carouselController.animateToPage(index);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
