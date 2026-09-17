import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_carousel.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_item_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MockAnalyticsService extends Mock implements AnalyticsService {}

SliderEntity createTestBanner({
  required String id,
  required String title,
  String image = '',
  String mobileImage = '',
}) {
  return SliderEntity(
    id: id,
    sliderId: 'slider_1',
    storeId: '1',
    title: title,
    mobileSlug: 'slug_$id',
    isSpecialCat: false,
    image: image,
    mobileImage: mobileImage,
    imagePosition: '1',
    link: 'https://pickaboo.com/$id',
    linkType: 'category',
    order: id,
    status: '1',
    urlKey: 'banner_$id',
    name: title,
    alias: '',
    delay: '3000',
    autoplay: '1',
    transition: 'fade',
    pagination: '1',
    arrows: '0',
    retinaImageSize: '1116x725',
    retinaMobileImageSize: '1116x725',
  );
}

Widget buildTestWidget({
  required List<SliderEntity> banners,
  Function(SliderEntity)? onBannerTap,
}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: BannerCarousel(
          banners: banners,
          onBannerTap: onBannerTap,
        ),
      ),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockAnalyticsService mockAnalyticsService;

  setUp(() {
    mockAnalyticsService = MockAnalyticsService();
    if (getIt.isRegistered<AnalyticsService>()) {
      getIt.unregister<AnalyticsService>();
    }
    getIt.registerSingleton<AnalyticsService>(mockAnalyticsService);

    when(() => mockAnalyticsService.logBannerView(
          identifier: any(named: 'identifier'),
          title: any(named: 'title'),
          entityId: any(named: 'entityId'),
          position: any(named: 'position'),
          imagePosition: any(named: 'imagePosition'),
          pageType: any(named: 'pageType'),
          imageUrl: any(named: 'imageUrl'),
        )).thenAnswer((_) async {});

    when(() => mockAnalyticsService.logBannerClick(
          identifier: any(named: 'identifier'),
          title: any(named: 'title'),
          entityId: any(named: 'entityId'),
          position: any(named: 'position'),
          imagePosition: any(named: 'imagePosition'),
          pageType: any(named: 'pageType'),
          imageUrl: any(named: 'imageUrl'),
        )).thenAnswer((_) async {});
  });

  tearDown(() {
    if (getIt.isRegistered<AnalyticsService>()) {
      getIt.unregister<AnalyticsService>();
    }
  });

  group('BannerCarousel', () {
    testWidgets('renders empty when banners list is empty', (tester) async {
      await tester.pumpWidget(buildTestWidget(banners: []));
      await tester.pumpAndSettle();

      expect(find.byType(BannerCarousel), findsOneWidget);
      expect(find.byType(BannerItemView), findsNothing);
    });

    testWidgets('renders single banner without smooth page indicator',
        (tester) async {
      final banners = [
        createTestBanner(id: '1', title: 'Single Banner'),
      ];

      await tester.pumpWidget(buildTestWidget(banners: banners));
      await tester.pump();

      expect(find.byType(BannerItemView), findsOneWidget);
      expect(find.byType(AnimatedSmoothIndicator), findsNothing);

      verify(() => mockAnalyticsService.logBannerView(
            identifier: 'banner_1',
            title: 'Single Banner',
            entityId: '1',
            position: '1',
            imagePosition: '1',
            pageType: 'home',
            imageUrl: '',
          )).called(1);
    });

    testWidgets('renders multiple banners with smooth page indicator and dynamic height',
        (tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final banners = [
        createTestBanner(id: '1', title: 'Banner 1'),
        createTestBanner(id: '2', title: 'Banner 2'),
      ];

      await tester.pumpWidget(buildTestWidget(banners: banners));
      await tester.pump();

      expect(find.byType(AnimatedSmoothIndicator), findsOneWidget);
      expect(find.byType(BannerItemView), findsWidgets);

      // Verify CarouselSlider rendered size matches dynamic aspect ratio calculation
      // Screen width = 375, viewportFraction = 0.95 => itemWidth = 356.25
      // Aspect ratio default = 1116 / 725 ≈ 1.5393 => calculatedHeight ≈ 231.43
      final carouselFinder = find.byType(CarouselSlider);
      final Size carouselSize = tester.getSize(carouselFinder);
      expect(carouselSize.height, closeTo((375 * 0.95) / (1116 / 725), 1.0));
    });

    testWidgets('tapping banner triggers callback and logs analytics',
        (tester) async {
      SliderEntity? tappedBanner;
      final banners = [
        createTestBanner(id: '10', title: 'Interactive Banner'),
      ];

      await tester.pumpWidget(buildTestWidget(
        banners: banners,
        onBannerTap: (b) => tappedBanner = b,
      ));
      await tester.pump();

      await tester.tap(find.byType(BannerCarousel));
      await tester.pump();

      expect(tappedBanner, isNotNull);
      expect(tappedBanner!.id, '10');

      verify(() => mockAnalyticsService.logBannerClick(
            identifier: 'banner_10',
            title: 'Interactive Banner',
            entityId: '10',
            position: '10',
            imagePosition: '1',
            pageType: 'home',
            imageUrl: '',
          )).called(1);
    });
  });
}
