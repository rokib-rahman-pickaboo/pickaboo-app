import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/constants/app_assets.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/slider_product_view.dart';

Finder findFastDelivery() => find.byWidgetPredicate(
      (w) =>
          w is SvgPicture &&
          w.bytesLoader is SvgAssetLoader &&
          (w.bytesLoader as SvgAssetLoader).assetName == AppAssets.fastDelivery,
    );

void main() {
  Widget createWidgetUnderTest(ProductEntity product) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 200,
            height: 350,
            child: ProductView(
              product: product,
              onTap: (_) {},
            ),
          ),
        ),
      ),
    );
  }

  Widget createSliderWidgetUnderTest(ProductEntity product) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 140,
            height: 270,
            child: SliderProductView(
              product: product,
              onTap: (_) {},
            ),
          ),
        ),
      ),
    );
  }

  // 1. 2-line name, in stock
  const sample2LineInStock = ProductEntity(
    id: '1',
    expressDelivery: true,
    productName: 'Realme Narzo 30A 4GB/64GB JM-Almond Special Edition',
    sku: 'REALME-30A',
    slug: 'realme-narzo-30a',
    typeId: 'simple',
    stockAvailable: true,
    freeDelivery: false,
    productPrice: 13990,
    productSpecialPrice: 12990,
    productDiscount: 7,
    offers: '',
    rating: 4.8,
    clubPoint: 10,
    ratingCount: 3,
    productImg: '',
    emiAvailable: true,
    comingSoon: false,
    deliveryInfo: 'Tomorrow, 4 Sep',
  );

  // 2. 1-line name, in stock
  const sample1LineInStock = ProductEntity(
    id: '2',
    expressDelivery: false,
    productName: 'Realme Narzo',
    sku: 'REALME-N',
    slug: 'realme-narzo',
    typeId: 'simple',
    stockAvailable: true,
    freeDelivery: false,
    productPrice: 13990,
    productSpecialPrice: 12990,
    productDiscount: 7,
    offers: '',
    rating: 4.8,
    clubPoint: 10,
    ratingCount: 3,
    productImg: '',
    emiAvailable: true,
    comingSoon: false,
    deliveryInfo: 'Tomorrow, 4 Sep',
  );

  // 3. 2-line name, out of stock
  const sample2LineOutOfStock = ProductEntity(
    id: '3',
    expressDelivery: true,
    productName: 'Realme Narzo 30A 4GB/64GB JM-Almond Special Edition',
    sku: 'REALME-30A-OOS',
    slug: 'realme-narzo-30a-oos',
    typeId: 'simple',
    stockAvailable: false,
    freeDelivery: false,
    productPrice: 13990,
    productSpecialPrice: 12990,
    productDiscount: 7,
    offers: '',
    rating: 4.8,
    clubPoint: 10,
    ratingCount: 3,
    productImg: '',
    emiAvailable: true,
    comingSoon: false,
  );

  // 4. 1-line name, out of stock
  const sample1LineOutOfStock = ProductEntity(
    id: '4',
    expressDelivery: false,
    productName: 'Realme Narzo',
    sku: 'REALME-N-OOS',
    slug: 'realme-narzo-oos',
    typeId: 'simple',
    stockAvailable: false,
    freeDelivery: false,
    productPrice: 13990,
    productSpecialPrice: 12990,
    productDiscount: 7,
    offers: '',
    rating: 4.8,
    clubPoint: 10,
    ratingCount: 3,
    productImg: '',
    emiAvailable: true,
    comingSoon: false,
  );

  group('ProductView 4 design states', () {
    testWidgets('Case 1: 2-line name, in stock -> shows Divider and delivery info',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(sample2LineInStock));
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsOneWidget);
      expect(findFastDelivery(), findsOneWidget);
      expect(find.text('৳12,990'), findsOneWidget);
      expect(find.text('Out of Stock'), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Case 2: 1-line name, in stock -> shows Divider and delivery info with height compensation',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(sample1LineInStock));
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsOneWidget);
      expect(findFastDelivery(), findsOneWidget);
      expect(find.text('৳12,990'), findsOneWidget);
      expect(find.text('Out of Stock'), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Case 3: 2-line name, out of stock -> shows ONLY Out of Stock tag (no price), no Divider',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(sample2LineOutOfStock));
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsNothing);
      expect(findFastDelivery(), findsNothing);
      expect(find.text('৳12,990'), findsNothing);
      expect(find.text('Out of Stock'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Case 4: 1-line name, out of stock -> shows ONLY Out of Stock tag (no price), empty spaces for height',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(sample1LineOutOfStock));
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsNothing);
      expect(findFastDelivery(), findsNothing);
      expect(find.text('৳12,990'), findsNothing);
      expect(find.text('Out of Stock'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('ProductView inside IntrinsicHeight (homepage/grid row) renders without throwing',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 375,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ProductView(
                          product: sample2LineInStock,
                          onTap: (_) {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProductView(
                          product: sample1LineOutOfStock,
                          onTap: (_) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.byType(ProductView), findsNWidgets(2));
    });
  });

  group('SliderProductView 4 design states', () {
    testWidgets('Case 1: 2-line name, in stock in slider -> no overflow',
        (WidgetTester tester) async {
      await tester.pumpWidget(createSliderWidgetUnderTest(sample2LineInStock));
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsOneWidget);
      expect(findFastDelivery(), findsOneWidget);
      expect(find.text('Out of Stock'), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Case 2: 1-line name, in stock in slider -> no overflow',
        (WidgetTester tester) async {
      await tester.pumpWidget(createSliderWidgetUnderTest(sample1LineInStock));
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsOneWidget);
      expect(findFastDelivery(), findsOneWidget);
      expect(find.text('Out of Stock'), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Case 3: 2-line name, out of stock in slider -> ONLY out of stock tag, no overflow',
        (WidgetTester tester) async {
      await tester.pumpWidget(createSliderWidgetUnderTest(sample2LineOutOfStock));
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsNothing);
      expect(find.text('Out of Stock'), findsOneWidget);
      expect(find.text('৳12,990'), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Case 4: 1-line name, out of stock in slider -> ONLY out of stock tag, no overflow',
        (WidgetTester tester) async {
      await tester.pumpWidget(createSliderWidgetUnderTest(sample1LineOutOfStock));
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsNothing);
      expect(find.text('Out of Stock'), findsOneWidget);
      expect(find.text('৳12,990'), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Card Height Invariant: all 4 states render with identical height',
        (WidgetTester tester) async {
      // 1. Measure Case 1 (2-line, in stock)
      await tester.pumpWidget(createSliderWidgetUnderTest(sample2LineInStock));
      await tester.pumpAndSettle();
      final size1 = tester.getSize(find.byType(SliderProductView));

      // 2. Measure Case 2 (1-line, in stock)
      await tester.pumpWidget(createSliderWidgetUnderTest(sample1LineInStock));
      await tester.pumpAndSettle();
      final size2 = tester.getSize(find.byType(SliderProductView));

      // 3. Measure Case 3 (2-line, out of stock)
      await tester.pumpWidget(createSliderWidgetUnderTest(sample2LineOutOfStock));
      await tester.pumpAndSettle();
      final size3 = tester.getSize(find.byType(SliderProductView));

      // 4. Measure Case 4 (1-line, out of stock)
      await tester.pumpWidget(createSliderWidgetUnderTest(sample1LineOutOfStock));
      await tester.pumpAndSettle();
      final size4 = tester.getSize(find.byType(SliderProductView));

      // Ensure heights are strictly equal
      expect(size2.height, equals(size1.height));
      expect(size3.height, equals(size1.height));
      expect(size4.height, equals(size1.height));
    });

    testWidgets('SliderProductView renders 2-3 days delivery text cleanly without overflow',
        (WidgetTester tester) async {
      const standardProduct = ProductEntity(
        id: '99',
        expressDelivery: false,
        productName: 'MI Pro 23 Cam',
        sku: 'MI-23',
        slug: 'mi-pro-23-cam',
        typeId: 'simple',
        stockAvailable: true,
        freeDelivery: false,
        productPrice: 1230,
        productSpecialPrice: 0,
        productDiscount: 0,
        offers: '',
        rating: 4.5,
        clubPoint: 5,
        ratingCount: 12,
        productImg: '',
        emiAvailable: false,
        comingSoon: false,
        deliveryInfo: '',
      );

      await tester.pumpWidget(createSliderWidgetUnderTest(standardProduct));
      await tester.pumpAndSettle();

      expect(findFastDelivery(), findsOneWidget);
      expect(find.textContaining('2-3 days'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  test('ProductEntityX handles delivery text formatting properly', () {
    const p1 = ProductEntity(
      id: '1',
      expressDelivery: true,
      productName: 'Test Phone',
      sku: 'SKU',
      slug: 'slug',
      typeId: 'simple',
      stockAvailable: true,
      freeDelivery: false,
      productPrice: 1000,
      productSpecialPrice: 0,
      productDiscount: 0,
      offers: '',
      rating: 4.0,
      clubPoint: 0,
      ratingCount: 1,
      productImg: '',
      emiAvailable: false,
      comingSoon: false,
      deliveryInfo: '',
    );
    expect(p1.deliveryLabelText, 'Delivery by ');

    const p2 = ProductEntity(
      id: '2',
      expressDelivery: true,
      productName: 'Test Phone 2',
      sku: 'SKU2',
      slug: 'slug2',
      typeId: 'simple',
      stockAvailable: true,
      freeDelivery: false,
      productPrice: 1000,
      productSpecialPrice: 0,
      productDiscount: 0,
      offers: '',
      rating: 4.0,
      clubPoint: 0,
      ratingCount: 1,
      productImg: '',
      emiAvailable: false,
      comingSoon: false,
    );
    final now = DateTime.now();
    final expectedExpressTarget =
        (now.weekday != DateTime.friday && now.hour < 12) ? 'Today' : 'Tomorrow';
    expect(p2.deliveryLabelText, 'Delivery by ');
    expect(p2.deliveryTargetText, expectedExpressTarget);

    const p3 = ProductEntity(
      id: '3',
      expressDelivery: false,
      productName: 'Test Phone 3',
      sku: 'SKU3',
      slug: 'slug3',
      typeId: 'simple',
      stockAvailable: true,
      freeDelivery: false,
      productPrice: 1000,
      productSpecialPrice: 0,
      productDiscount: 0,
      offers: '',
      rating: 4.0,
      clubPoint: 0,
      ratingCount: 1,
      productImg: '',
      emiAvailable: false,
      comingSoon: false,
    );
    expect(p3.deliveryLabelText, 'Tentative ');
    expect(p3.deliveryTargetText, '2-3 days');
    expect(p3.displayDeliveryText, 'Tentative 2-3 days');
  });
}
