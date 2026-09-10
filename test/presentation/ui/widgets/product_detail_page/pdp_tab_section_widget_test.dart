import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_tab_section_widget.dart';

Widget createWidgetUnderTest(ProductDetailEntity product) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: PdpTabSectionWidget(product: product),
        ),
      ),
    ),
  );
}

ProductDetailEntity _dummyProduct({
  required List<MoreInformationEntity> moreInformation,
}) =>
    ProductDetailEntity(
      id: 101,
      sku: 'TV-101',
      slug: 'smart-4k-uhd-tv',
      typeId: 'simple',
      name: 'Smart 4K UHD TV',
      prodOfferPrice: 0,
      bestPrice: 0,
      freeDelivery: 0,
      categoryIds: const [],
      metaTitle: '',
      metaKeywords: '',
      metaDescription: '',
      images: const [],
      isWishlisted: false,
      isEligibleForReview: true,
      shareUrl: '',
      regularPrice: 50000,
      spacialPrice: 45000,
      discount: 10,
      stockAvailable: true,
      expressDelivery: 0,
      comingSoon: false,
      clubPoints: 0,
      brandId: '1',
      brand: 'Samsung',
      soldByVendorUrlKey: '',
      soldBy: 'Pickaboo',
      offers: '',
      warranty: '',
      emi: 0,
      varient: const [],
      extraOptions: const [],
      buysTogather: const [],
      productDetails: '',
      ratingSummaryValue: 5.0,
      ratingSummary: 100,
      reviewsCount: 0,
      detailedRatings: const [],
      detailedSummary: const [],
      allReviewImages: const [],
      reviewsCollection: const [],
      similarProducts: const [],
      youMayAlsoLike: const [],
      otherBrands: const [],
      recentlyViewedProducts: const [],
      cacheTime: DateTime(2026),
      moreInformation: moreInformation,
    );

void main() {
  group('PdpTabSectionWidget Specification Redesign', () {
    testWidgets(
        'Renders specifications in unified container with zebra-striped alternating row colors',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final testProduct = _dummyProduct(
        moreInformation: const [
          MoreInformationEntity(
            groupLabel: 'General',
            attrList: [
              AttrListEntity(label: 'Feature', value: '4K'),
              AttrListEntity(
                label: 'Warranty Information',
                value: '5 Years Service Warranty Without Parts & Panele',
              ),
              AttrListEntity(label: 'Screen Size', value: '55 Inch'),
            ],
          ),
        ],
      );

      await tester.pumpWidget(createWidgetUnderTest(testProduct));
      await tester.pumpAndSettle();

      // Check tab header
      expect(find.text('Specifications'), findsOneWidget);

      // Check labels and values
      expect(find.text('Feature'), findsOneWidget);
      expect(find.text('4K'), findsOneWidget);
      expect(find.text('Warranty Information'), findsOneWidget);
      expect(
        find.text('5 Years Service Warranty Without Parts & Panele'),
        findsOneWidget,
      );
      expect(find.text('Screen Size'), findsOneWidget);
      expect(find.text('55 Inch'), findsOneWidget);

      // Verify row containers have alternating colors (white, pageBg, white)
      final rowContainers = tester.widgetList<Container>(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              widget.decoration is BoxDecoration &&
              (widget.decoration as BoxDecoration).color != null &&
              ((widget.decoration as BoxDecoration).color == AppColors.white ||
                  (widget.decoration as BoxDecoration).color ==
                      AppColors.pageBg) &&
              widget.child is Row,
        ),
      );

      expect(rowContainers.length, 3);
      final list = rowContainers.toList();
      expect((list[0].decoration as BoxDecoration).color, AppColors.white);
      expect((list[1].decoration as BoxDecoration).color, AppColors.pageBg);
      expect((list[2].decoration as BoxDecoration).color, AppColors.white);
    });

    testWidgets(
        'Renders group titles matching exact API response casing instead of uppercase',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final testProduct = _dummyProduct(
        moreInformation: const [
          MoreInformationEntity(
            groupLabel: 'General Information',
            attrList: [
              AttrListEntity(label: 'Brand', value: 'Sony'),
            ],
          ),
          MoreInformationEntity(
            groupLabel: 'Display & Connectivity',
            attrList: [
              AttrListEntity(label: 'Resolution', value: '4K UHD'),
            ],
          ),
        ],
      );

      await tester.pumpWidget(createWidgetUnderTest(testProduct));
      await tester.pumpAndSettle();

      // Expect exact casing from API response
      expect(find.text('General Information'), findsOneWidget);
      expect(find.text('Display & Connectivity'), findsOneWidget);

      // Verify uppercase is NOT present
      expect(find.text('GENERAL INFORMATION'), findsNothing);
      expect(find.text('DISPLAY & CONNECTIVITY'), findsNothing);
    });
  });
}

