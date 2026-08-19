import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_item_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    final colors = context.colors;

    if (widget.banners.isEmpty) {
      return const SizedBox.shrink();
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
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
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
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

        Positioned(
          bottom: 10.h,
          child: ValueListenableBuilder<int>(
            valueListenable: _currentIndex,
            builder: (context, currentIndex, _) => AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: widget.banners.length,
              effect: WormEffect(
                dotHeight: 2.h,
                dotWidth: 10.w,
                activeDotColor: colors.primary,
                dotColor: colors.white.withValues(alpha: 0.5),
                spacing: 1.w,
              ),
              onDotClicked: (index) {
                _carouselController.animateToPage(index);
              },
            ),
          ),
        ),
      ],
    );
  }
}
