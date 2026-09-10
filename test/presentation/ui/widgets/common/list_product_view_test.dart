import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/list_product_view.dart';

void main() {
  Widget createWidgetUnderTest({
    required ProductEntity product,
    void Function(ProductEntity)? onTap,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: ListProductView(
              product: product,
              onTap: onTap ?? (_) {},
            ),
          ),
        ),
      ),
    );
  }

  const baseProduct = ProductEntity(
    id: '101',
    expressDelivery: true,
    productName: 'Dove Deep Moisture Body Wash 500ml',
    sku: 'DOVE-BW-500',
    slug: 'dove-deep-moisture-body-wash-500ml',
    typeId: 'simple',
    stockAvailable: true,
    freeDelivery: true,
    productPrice: 750,
    productSpecialPrice: 650,
    productDiscount: 13,
    offers: '',
    rating: 4.6,
    clubPoint: 15,
    ratingCount: 38,
    productImg: 'https://example.com/dove.jpg',
    emiAvailable: false,
    comingSoon: false,
  );

  testWidgets('renders ListProductView without attributes cleanly', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest(product: baseProduct));
    await tester.pumpAndSettle();

    expect(find.text('Dove Deep Moisture Body Wash 500ml'), findsOneWidget);
    expect(find.text('৳650'), findsOneWidget);
    expect(find.text('৳750'), findsOneWidget);
    expect(find.text('-13%'), findsOneWidget);
    expect(find.byType(Wrap), findsNothing);
  });

  testWidgets('renders attribute tags when product has attributes', (tester) async {
    final productWithAttributes = baseProduct.copyWith(
      attributes: const [
        ProductAttributeEntity(
          code: 'manufacturer',
          label: 'Brand',
          value: 'Unilever',
        ),
        ProductAttributeEntity(
          code: 'volume',
          label: 'Volume',
          value: '500ml',
        ),
      ],
    );

    await tester.pumpWidget(createWidgetUnderTest(product: productWithAttributes));
    await tester.pumpAndSettle();

    expect(find.text('Dove Deep Moisture Body Wash 500ml'), findsOneWidget);
    expect(find.byType(Wrap), findsOneWidget);
    expect(find.textContaining('Brand : Unilever'), findsOneWidget);
    expect(find.textContaining('Volume : 500ml'), findsOneWidget);
  });

  testWidgets('deduplicates attribute tags with identical labels', (tester) async {
    final productWithDuplicates = baseProduct.copyWith(
      attributes: const [
        ProductAttributeEntity(
          code: 'manufacturer',
          label: 'Brand',
          value: 'Unilever',
        ),
        ProductAttributeEntity(
          code: 'brand_secondary',
          label: 'Brand',
          value: 'Dove Brand',
        ),
      ],
    );

    await tester.pumpWidget(createWidgetUnderTest(product: productWithDuplicates));
    await tester.pumpAndSettle();

    // Should only render the first one
    expect(find.textContaining('Brand : Unilever'), findsOneWidget);
    expect(find.textContaining('Brand : Dove Brand'), findsNothing);
  });

  testWidgets('triggers onTap callback when card is tapped', (tester) async {
    ProductEntity? tappedProduct;

    await tester.pumpWidget(
      createWidgetUnderTest(
        product: baseProduct,
        onTap: (p) => tappedProduct = p,
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ListProductView));
    expect(tappedProduct, equals(baseProduct));
  });

  testWidgets('renders "Sponsored" label when isAd is true', (tester) async {
    final adProduct = baseProduct.copyWith(isAd: true);

    await tester.pumpWidget(createWidgetUnderTest(product: adProduct));
    await tester.pumpAndSettle();

    expect(find.text('Sponsored'), findsOneWidget);
  });

  testWidgets('does not render "Sponsored" label when isAd is false', (tester) async {
    final nonAdProduct = baseProduct.copyWith(isAd: false);

    await tester.pumpWidget(createWidgetUnderTest(product: nonAdProduct));
    await tester.pumpAndSettle();

    expect(find.text('Sponsored'), findsNothing);
  });
}
