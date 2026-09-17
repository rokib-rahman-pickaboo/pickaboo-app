import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_item_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// 🖼️ CENTRALIZED BIG BANNER CAROUSEL
///
/// Configured according to specifications:
/// - Core: Native CarouselSlider.builder + smooth_page_indicator
/// - Dynamic Resolution: Reads image resolution and adjusts height proportionally
/// - Non-Swipeable: User cannot manually drag (scrollPhysics: NeverScrollableScrollPhysics)
/// - Auto-Slide: Fixed rotation every 3.6s with 400ms easeInOutCubic animation
/// - Sizing & Peek: Dynamic height based on intrinsic aspect ratio, viewportFraction 0.95, enlargeCenterPage true (0.15 factor)
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

  // Intrinsic resolution cache across banner URLs
  static final Map<String, double> _aspectRatioCache = {};

  // Standard Pickaboo big banner intrinsic resolution is 1116x725 (~1.5393)
  static const double _kDefaultAspectRatio = 1116.0 / 725.0;

  double _currentAspectRatio = _kDefaultAspectRatio;

  @override
  void initState() {
    super.initState();
    _resolveBanners();
    if (widget.banners.isNotEmpty) {
      _logBannerView(widget.banners.first);
    }
  }

  @override
  void didUpdateWidget(covariant BannerCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.banners != oldWidget.banners) {
      _resolveBanners();
    }
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  String _getBannerImageUrl(SliderEntity banner) {
    return banner.mobileImage.isNotEmpty ? banner.mobileImage : banner.image;
  }

  String _getActiveBannerUrl() {
    if (widget.banners.isEmpty) return '';
    final idx = _currentIndex.value.clamp(0, widget.banners.length - 1);
    final rawUrl = _getBannerImageUrl(widget.banners[idx]);
    if (rawUrl.isEmpty) return '';
    return AppImage.provider(rawUrl).url;
  }

  void _resolveBanners() {
    if (widget.banners.isEmpty) return;

    final activeUrl = _getActiveBannerUrl();
    if (activeUrl.isNotEmpty && _aspectRatioCache.containsKey(activeUrl)) {
      _currentAspectRatio = _aspectRatioCache[activeUrl]!;
    }

    for (final banner in widget.banners) {
      final rawUrl = _getBannerImageUrl(banner);
      _resolveImageResolution(rawUrl);
    }
  }

  void _resolveImageResolution(String rawUrl) {
    if (rawUrl.isEmpty) return;
    final normalizedUrl = AppImage.provider(rawUrl).url;
    if (normalizedUrl.isEmpty) return;

    if (_aspectRatioCache.containsKey(normalizedUrl)) {
      final cached = _aspectRatioCache[normalizedUrl]!;
      if ((cached - _currentAspectRatio).abs() > 0.005) {
        if (mounted) {
          setState(() {
            _currentAspectRatio = cached;
          });
        }
      }
      return;
    }

    final ImageProvider provider = AppImage.provider(rawUrl);
    final ImageStream stream = provider.resolve(ImageConfiguration.empty);
    late ImageStreamListener listener;
    listener = ImageStreamListener(
      (ImageInfo info, bool synchronousCall) {
        final int w = info.image.width;
        final int h = info.image.height;
        if (w > 0 && h > 0) {
          final double ratio = w / h;
          _aspectRatioCache[normalizedUrl] = ratio;
          if (mounted) {
            final activeUrl = _getActiveBannerUrl();
            if (normalizedUrl == activeUrl ||
                (_currentAspectRatio == _kDefaultAspectRatio &&
                    (ratio - _currentAspectRatio).abs() > 0.005)) {
              setState(() {
                _currentAspectRatio = ratio;
              });
            }
          }
        }
        stream.removeListener(listener);
      },
      onError: (exception, stackTrace) {
        stream.removeListener(listener);
      },
    );
    stream.addListener(listener);
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
    final screenWidth = MediaQuery.sizeOf(context).width;
    const double viewportFraction = 0.95;
    final double itemWidth = screenWidth * viewportFraction;
    final double calculatedHeight = itemWidth / _currentAspectRatio;

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
                width: itemWidth,
                height: calculatedHeight,
                fit: BoxFit.cover,
                onTap: (slider) {
                  _logBannerClick(slider);
                  widget.onBannerTap?.call(slider);
                },
              );
            },
            options: CarouselOptions(
              height: calculatedHeight,
              viewportFraction: viewportFraction,
              enableInfiniteScroll: hasMultipleBanners,
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
                  final banner = widget.banners[index];
                  _logBannerView(banner);
                  final rawUrl = _getBannerImageUrl(banner);
                  final normalized = AppImage.provider(rawUrl).url;
                  if (_aspectRatioCache.containsKey(normalized)) {
                    final cached = _aspectRatioCache[normalized]!;
                    if ((cached - _currentAspectRatio).abs() > 0.005) {
                      setState(() {
                        _currentAspectRatio = cached;
                      });
                    }
                  } else {
                    _resolveImageResolution(rawUrl);
                  }
                }
              },
            ),
          ),

          // ── 2. Indicator (Inside image, only shown if banners > 1) ──
          if (hasMultipleBanners)
            Positioned(
              bottom: 8.h,
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
