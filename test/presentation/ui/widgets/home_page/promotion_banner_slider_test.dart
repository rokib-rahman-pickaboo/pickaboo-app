import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/promotion_slider/promotion_slider_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/promotion_banner_slider.dart';

PromotionSliderEntity createDummySlide({
  required String id,
  required String title,
  String subtitle = '',
}) {
  return PromotionSliderEntity(
    slideId: id,
    sliderId: '1',
    storeId: '1',
    title: title,
    mobileSlug: '',
    targetUrl: '',
    linkTitleColor: '',
    backgroundColor: '',
    categorySortData: '',
    isSpecialCat: '0',
    subtitle: subtitle,
    content: '',
    contentColour: '',
    image: '',
    mobileImage: '',
    imagePosition: '',
    backgroundColour: '',
    link: '',
    linkType: 'category',
    order: '1',
    paginationContent: '',
    activeFrom: '',
    activeTo: '',
    status: '1',
    createdAt: '',
    updatedAt: '',
    urlKey: '',
    name: 'Promo',
    alias: '',
    tagretUrl: '',
    isCategoryStatus: '1',
    delay: '',
    autoplay: '',
    transition: '',
    pagination: '',
    arrows: '',
    retinaImageSize: '',
    retinaMobileImageSize: '',
    mobileImageUrl: '',
    imageUrl: '',
  );
}

Widget createSliderUnderTest({required List<PromotionSliderEntity> slides}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: PromotionBannerSlider(slides: slides),
      ),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PromotionBannerSlider', () {
    testWidgets('Renders slides with maxLines: 2 allowing full title display',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final slides = [
        createDummySlide(
          id: '1',
          title: '12 Months 0% EMI Facility',
        ),
        createDummySlide(
          id: '2',
          title: 'Free Delivery + Free Return',
        ),
      ];

      await tester.pumpWidget(createSliderUnderTest(slides: slides));
      await tester.pumpAndSettle();

      final title1Finder = find.text('12 Months 0% EMI Facility');
      final title2Finder = find.text('Free Delivery + Free Return');

      expect(title1Finder, findsOneWidget);
      expect(title2Finder, findsOneWidget);

      final Text textWidget1 = tester.widget(title1Finder);
      expect(textWidget1.maxLines, 2);

      final Text textWidget2 = tester.widget(title2Finder);
      expect(textWidget2.maxLines, 2);
    });
  });
}
