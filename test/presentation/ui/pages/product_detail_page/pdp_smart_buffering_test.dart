import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_bottom_action_bar.dart';

ProductEntity _createProductEntity({
  String id = '1234',
  String productName = 'Samsung Galaxy S24',
  int productPrice = 99999,
  int productSpecialPrice = 89999,
  int productDiscount = 10,
  String productImg = 'https://example.com/phone.jpg',
  String slug = 'samsung-galaxy-s24',
  String typeId = 'configurable',
  String sku = 'SM-S921B',
  bool stockAvailable = true,
  bool freeDelivery = false,
  bool expressDelivery = false,
  bool comingSoon = false,
  bool emiAvailable = true,
  String offers = '',
  double rating = 4.5,
  double clubPoint = 0,
  int ratingCount = 10,
}) {
  return ProductEntity(
    id: id,
    productName: productName,
    productPrice: productPrice,
    productSpecialPrice: productSpecialPrice,
    productDiscount: productDiscount,
    productImg: productImg,
    slug: slug,
    typeId: typeId,
    sku: sku,
    stockAvailable: stockAvailable,
    freeDelivery: freeDelivery,
    expressDelivery: expressDelivery,
    comingSoon: comingSoon,
    emiAvailable: emiAvailable,
    offers: offers,
    rating: rating,
    clubPoint: clubPoint,
    ratingCount: ratingCount,
  );
}

void main() {
  Widget createTestWidget(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }

  group('PDP Smart Buffering & Partial Product Tests', () {
    test('ProductDetailEntity.fromProductEntity sets isPartial to true', () {
      final productEntity = _createProductEntity(typeId: 'configurable');
      final partialProduct = ProductDetailEntity.fromProductEntity(productEntity);

      expect(partialProduct.isPartial, isTrue);
      expect(partialProduct.typeId, 'configurable');
      expect(partialProduct.variantGroups, isEmpty);
      expect(partialProduct.hasVariants, isFalse);
    });

    testWidgets('PdpBottomActionBar shows loading indicator and disables taps when isProcessing is true',
        (WidgetTester tester) async {
      bool addToCartTapped = false;
      bool buyNowTapped = false;

      final productEntity = _createProductEntity(typeId: 'configurable');
      final product = ProductDetailEntity.fromProductEntity(productEntity);

      await tester.pumpWidget(
        createTestWidget(
          PdpBottomActionBar(
            product: product,
            currentPrice: 89999,
            originalPrice: 99999,
            isProcessing: true, // Buffered action state
            onChatTap: () {},
            onAddToCart: () => addToCartTapped = true,
            onBuyNow: () => buyNowTapped = true,
          ),
        ),
      );
      await tester.pump();

      // CircularProgressIndicator should be visible on the Add to Cart button
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Buy Now button should be visible with disabled state
      final buyNowFinder = find.text('BUY NOW');
      expect(buyNowFinder, findsOneWidget);

      // Tap on Buy Now while processing
      await tester.tap(buyNowFinder);
      await tester.pump();

      // Callbacks must NOT be triggered because buttons are disabled/loading during processing
      expect(addToCartTapped, isFalse);
      expect(buyNowTapped, isFalse);
    });

    testWidgets('PdpBottomActionBar triggers callbacks normally when isProcessing is false',
        (WidgetTester tester) async {
      bool addToCartTapped = false;
      bool buyNowTapped = false;

      final productEntity = _createProductEntity(typeId: 'simple');
      final product = ProductDetailEntity.fromProductEntity(productEntity);

      await tester.pumpWidget(
        createTestWidget(
          PdpBottomActionBar(
            product: product,
            currentPrice: 89999,
            originalPrice: 99999,
            isProcessing: false,
            onChatTap: () {},
            onAddToCart: () => addToCartTapped = true,
            onBuyNow: () => buyNowTapped = true,
          ),
        ),
      );
      await tester.pump();

      // Tap on Add to Cart
      await tester.tap(find.text('ADD TO CART'));
      await tester.pump();
      expect(addToCartTapped, isTrue);

      // Tap on Buy Now
      await tester.tap(find.text('BUY NOW'));
      await tester.pump();
      expect(buyNowTapped, isTrue);
    });
  });
}

