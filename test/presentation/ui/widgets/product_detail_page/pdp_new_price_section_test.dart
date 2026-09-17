import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/constants/app_assets.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_new_price_section.dart';

Finder findExpress() => find.byWidgetPredicate(
      (w) =>
          w is SvgPicture &&
          w.bytesLoader is SvgAssetLoader &&
          (w.bytesLoader as SvgAssetLoader).assetName == AppAssets.expressPdp,
    );

ProductDetailEntity _makeProduct({
  int id = 1,
  String name = 'Realme Narzo 30A',
  int expressDelivery = 1,
  bool stockAvailable = true,
  int regularPrice = 13990,
  int spacialPrice = 12990,
  int reviewsCount = 12,
  double ratingSummaryValue = 4.5,
  String warranty = '1 Year Official Warranty',
  double emi = 1200,
  String soldBy = '',
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
      soldBy: soldBy,
      offers: '',
      warranty: warranty,
      emi: emi,
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
    bool showTrustRibbon = true,
    VoidCallback? onBrandTap,
    VoidCallback? onRateTap,
    VoidCallback? onEmiTap,
    VoidCallback? onExpressDeliveryTap,
    VoidCallback? onSellerTap,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: PdpNewPriceSection(
              product: product,
              currentPrice: product.spacialPrice,
              originalPrice: product.regularPrice,
              saving: product.regularPrice - product.spacialPrice,
              showTrustRibbon: showTrustRibbon,
              onBrandTap: onBrandTap,
              onRateTap: onRateTap,
              onEmiTap: onEmiTap,
              onExpressDeliveryTap: onExpressDeliveryTap,
              onSellerTap: onSellerTap,
            ),
          ),
        ),
      ),
    );
  }

  group('PdpNewPriceSection - Card Redesign & Matrix Layout Tests', () {
    testWidgets('Case 1: All 4 data available -> Row 1: Price - Express, Row 2: Save - Rating (showTrustRibbon: true -> shows warranty box only)',
        (WidgetTester tester) async {
      final product = _makeProduct(
        regularPrice: 13990,
        spacialPrice: 12990,
        expressDelivery: 1,
        reviewsCount: 12,
        ratingSummaryValue: 4.5,
        warranty: '1 Year Official Warranty',
        emi: 1200,
      );

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.text('৳12,990'), findsOneWidget);
      expect(findExpress(), findsOneWidget); // Express in Row 1
      expect(find.textContaining('You save'), findsNothing); // Save omitted as requested
      expect(find.text('4.5 '), findsOneWidget); // Rating in Row 2
      expect(find.text('(12)'), findsOneWidget);
      expect(find.textContaining('Warranty:'), findsOneWidget);
      expect(find.textContaining('1 Year Official Warranty'), findsOneWidget);
      // When showTrustRibbon is true, "Shop with confidence" header and 3-item row are omitted
      expect(find.text('Shop with confidence'), findsNothing);
      expect(find.text('100% Authentic'), findsNothing);
      expect(find.text('Easy Return'), findsNothing);
    });

    testWidgets('Trust Ribbon false -> displays Shop with confidence header, warranty box, and 3-item trust row',
        (WidgetTester tester) async {
      final product = _makeProduct(
        regularPrice: 13990,
        spacialPrice: 12990,
        expressDelivery: 1,
        reviewsCount: 12,
        ratingSummaryValue: 4.5,
        warranty: '1 Year Official Warranty',
        emi: 1200,
        soldBy: 'Gadget Park BD',
      );

      await tester.pumpWidget(createWidgetUnderTest(product: product, showTrustRibbon: false));
      await tester.pumpAndSettle();

      expect(find.text('Shop with confidence'), findsOneWidget);
      expect(find.textContaining('Sold by'), findsOneWidget);
      expect(find.textContaining('Gadget Park BD'), findsOneWidget);
      expect(find.textContaining('Warranty:'), findsOneWidget);
      expect(find.textContaining('1 Year Official Warranty'), findsOneWidget);
      expect(find.text('100% Authentic'), findsOneWidget);
      expect(find.text('Easy Return'), findsOneWidget);
      expect(
        find.byWidgetPredicate((w) =>
            w is Text &&
            (w.data == 'Delivery by Today' || w.data == 'Delivery by Tomorrow')),
        findsOneWidget,
      );
    });

    testWidgets('Case 2a: Price and Express only (no save, no rating) -> Row 1: Price - Express',
        (WidgetTester tester) async {
      final product = _makeProduct(
        regularPrice: 12990,
        spacialPrice: 12990,
        expressDelivery: 1,
        reviewsCount: 0,
        ratingSummaryValue: 0.0,
      );

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.text('৳12,990'), findsOneWidget);
      expect(findExpress(), findsOneWidget);
      expect(find.textContaining('You save'), findsNothing);
      expect(find.textContaining('('), findsNothing);
    });

    testWidgets('Case 2b: Price and Rating only (no save, no express) -> Row 1: Price - Rating',
        (WidgetTester tester) async {
      final product = _makeProduct(
        regularPrice: 12990,
        spacialPrice: 12990,
        expressDelivery: 0,
        reviewsCount: 8,
        ratingSummaryValue: 4.2,
      );

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.text('৳12,990'), findsOneWidget);
      expect(findExpress(), findsNothing);
      expect(find.text('4.2 '), findsOneWidget);
      expect(find.text('(8)'), findsOneWidget);
      expect(find.textContaining('You save'), findsNothing);
    });

    testWidgets('Case 3: Price and Express & Rating (no save) -> Row 1: Price - Express, Row 2: Rating',
        (WidgetTester tester) async {
      final product = _makeProduct(
        regularPrice: 12990,
        spacialPrice: 12990,
        expressDelivery: 1,
        reviewsCount: 15,
        ratingSummaryValue: 4.6,
      );

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.text('৳12,990'), findsOneWidget);
      expect(findExpress(), findsOneWidget);
      expect(find.text('4.6 '), findsOneWidget);
      expect(find.text('(15)'), findsOneWidget);
      expect(find.textContaining('You save'), findsNothing);
    });

    testWidgets('Case 4: Price & discount and Express & Rating -> Row 1: Price - Express, Row 2: Save - Rating',
        (WidgetTester tester) async {
      final product = _makeProduct(
        regularPrice: 15000,
        spacialPrice: 12000,
        expressDelivery: 1,
        reviewsCount: 20,
        ratingSummaryValue: 4.9,
      );

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.text('৳12,000'), findsOneWidget);
      expect(findExpress(), findsOneWidget);
      expect(find.textContaining('You save'), findsNothing);
      expect(find.text('4.9 '), findsOneWidget);
      expect(find.text('(20)'), findsOneWidget);
    });

    testWidgets('Case 5a: Price & discount and Express (no rating) -> Row 1: Price - Express, Row 2: None',
        (WidgetTester tester) async {
      final product = _makeProduct(
        regularPrice: 15000,
        spacialPrice: 12000,
        expressDelivery: 1,
        reviewsCount: 0,
        ratingSummaryValue: 0.0,
      );

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.text('৳12,000'), findsOneWidget);
      expect(findExpress(), findsOneWidget);
      expect(find.textContaining('You save'), findsNothing);
      expect(find.textContaining('('), findsNothing);
    });

    testWidgets('Case 5b: Price & discount and Rating (no express) -> Row 1: Price - Rating, Row 2: None',
        (WidgetTester tester) async {
      final product = _makeProduct(
        regularPrice: 15000,
        spacialPrice: 12000,
        expressDelivery: 0,
        reviewsCount: 10,
        ratingSummaryValue: 4.7,
      );

      await tester.pumpWidget(createWidgetUnderTest(product: product));
      await tester.pumpAndSettle();

      expect(find.text('৳12,000'), findsOneWidget);
      expect(findExpress(), findsNothing);
      expect(find.text('4.7 '), findsOneWidget);
      expect(find.text('(10)'), findsOneWidget);
      expect(find.textContaining('You save'), findsNothing);
    });

    testWidgets('Does not render Express badge, Warranty, or Write a review when not provided',
        (WidgetTester tester) async {
      final product = _makeProduct(
        expressDelivery: 0,
        warranty: '',
        emi: 0,
        reviewsCount: 0,
        ratingSummaryValue: 0.0,
      );

      await tester.pumpWidget(
        createWidgetUnderTest(
          product: product,
          onRateTap: () {},
        ),
      );
      await tester.pumpAndSettle();

      expect(findExpress(), findsNothing);
      expect(find.textContaining('Warranty:'), findsNothing);
      expect(find.textContaining('EMI available from'), findsNothing);
      expect(find.text('Write a review'), findsNothing);
    });

    testWidgets('Triggers callbacks on tap', (WidgetTester tester) async {
      bool brandTapped = false;
      bool emiTapped = false;
      bool expressTapped = false;
      bool sellerTapped = false;

      final product = _makeProduct(
        expressDelivery: 1,
        emi: 1500,
        soldBy: 'Oraimo Official',
      );

      await tester.pumpWidget(
        createWidgetUnderTest(
          product: product,
          onBrandTap: () => brandTapped = true,
          onEmiTap: () => emiTapped = true,
          onExpressDeliveryTap: () => expressTapped = true,
          onSellerTap: () => sellerTapped = true,
          showTrustRibbon: false,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('REALME'));
      expect(brandTapped, isTrue);

      await tester.tap(findExpress());
      expect(expressTapped, isTrue);

      expect(find.text('Compare 36 banks & tenures'), findsOneWidget);
      await tester.tap(find.textContaining('EMI available from ৳1,500/month'));
      expect(emiTapped, isTrue);

      await tester.tap(find.textContaining('Oraimo Official'));
      expect(sellerTapped, isTrue);
    });
  });
}
