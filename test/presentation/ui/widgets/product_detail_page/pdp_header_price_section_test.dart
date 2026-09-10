import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_header_price_section.dart';

ProductDetailEntity _makeProduct({
  int id = 1,
  String name = 'Realme Narzo 30A',
  int expressDelivery = 1,
  bool stockAvailable = true,
  int regularPrice = 13990,
  int spacialPrice = 12990,
  int reviewsCount = 12,
  double ratingSummaryValue = 4.5,
  String warranty = '',
}) =>
    ProductDetailEntity(
      id: id,
      sku: 'SKU-$id',
      slug: 'realme-narzo-30a',
      typeId: 'simple',
      name: name,
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
      regularPrice: regularPrice,
      spacialPrice: spacialPrice,
      discount: 7,
      stockAvailable: stockAvailable,
      expressDelivery: expressDelivery,
      comingSoon: false,
      clubPoints: 0,
      brandId: '1',
      brand: 'Realme',
      soldByVendorUrlKey: '',
      soldBy: '',
      offers: '',
      warranty: warranty,
      emi: 0,
      varient: const [],
      extraOptions: const [],
      buysTogather: const [],
      productDetails: '',
      moreInformation: const [],
      ratingSummaryValue: ratingSummaryValue,
      ratingSummary: 90,
      reviewsCount: reviewsCount,
      detailedRatings: const [],
      detailedSummary: const [],
      allReviewImages: const [],
      reviewsCollection: const [],
      similarProducts: const [],
      youMayAlsoLike: const [],
      otherBrands: const [],
      recentlyViewedProducts: const [],
      cacheTime: DateTime(2026),
    );

void main() {
  Widget createWidgetUnderTest({
    required ProductDetailEntity product,
    VoidCallback? onExpressDeliveryTap,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: PdpHeaderPriceSection(
              product: product,
              currentPrice: product.spacialPrice,
              originalPrice: product.regularPrice,
              saving: product.regularPrice - product.spacialPrice,
              onExpressDeliveryTap: onExpressDeliveryTap,
            ),
          ),
        ),
      ),
    );
  }

  group('PdpHeaderPriceSection - Express Delivery Icon in Price Row', () {
    testWidgets('Shows Express icon in price row when product.expressDelivery == 1',
        (WidgetTester tester) async {
      final product = _makeProduct(expressDelivery: 1);

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      // Verify price text
      expect(find.text('৳12,990'), findsOneWidget);

      // Verify Express SVG is present
      final svgFinder = find.byType(SvgPicture);
      expect(svgFinder, findsOneWidget);

      // Verify Express icon is to the right of the price text
      final priceCenter = tester.getCenter(find.text('৳12,990'));
      final svgCenter = tester.getCenter(svgFinder);
      expect(svgCenter.dx, greaterThan(priceCenter.dx));
    });

    testWidgets('Hides Express icon in price row when product.expressDelivery == 0',
        (WidgetTester tester) async {
      final product = _makeProduct(expressDelivery: 0);

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.text('৳12,990'), findsOneWidget);
      expect(find.byType(SvgPicture), findsNothing);
    });

    testWidgets('Invokes onExpressDeliveryTap when Express icon is tapped',
        (WidgetTester tester) async {
      bool tapped = false;
      final product = _makeProduct(expressDelivery: 1);

      await tester.pumpWidget(
        createWidgetUnderTest(
          product: product,
          onExpressDeliveryTap: () => tapped = true,
        ),
      );
      await tester.pumpAndSettle();

      final svgFinder = find.byType(SvgPicture);
      expect(svgFinder, findsOneWidget);

      await tester.tap(svgFinder);
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('Hides review row and empty review prompt when product has 0 reviews',
        (WidgetTester tester) async {
      final product = _makeProduct(reviewsCount: 0, ratingSummaryValue: 0);

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.text('Be the first to review this product'), findsNothing);
      expect(find.textContaining('reviews'), findsNothing);
    });

    testWidgets('Shows review rating and reviews count when product has reviews',
        (WidgetTester tester) async {
      final product = _makeProduct(reviewsCount: 12, ratingSummaryValue: 4.5);

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.text('(12 reviews)'), findsOneWidget);
      expect(find.text('4.5 '), findsOneWidget);
    });

    testWidgets('Renders brand name with padding',
        (WidgetTester tester) async {
      final product = _makeProduct();

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.text('REALME'), findsOneWidget);
    });

    testWidgets('Shows official warranty row when product.warranty is non-empty',
        (WidgetTester tester) async {
      final product = _makeProduct(
        warranty: '5 Years Service Warranty Without Parts & Panel',
      );

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.textContaining('Warranty:'), findsOneWidget);
      expect(
        find.textContaining('5 Years Service Warranty Without Parts & Panel'),
        findsOneWidget,
      );

      // Verify the badge Image asset is NOT rendered (text only)
      final imageFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                'assets/images/official_warranty_badge.png',
      );
      expect(imageFinder, findsNothing);
    });

    testWidgets('Hides official warranty row when product.warranty is empty',
        (WidgetTester tester) async {
      final product = _makeProduct(warranty: '');

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.textContaining('Warranty:'), findsNothing);
      final imageFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                'assets/images/official_warranty_badge.png',
      );
      expect(imageFinder, findsNothing);
    });
  });
}
