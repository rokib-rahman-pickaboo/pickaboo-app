import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/recommended_product/recommended_product_entity.dart';
import 'package:pickaboo/domain/entity/related_product/related_product_entity.dart';
import 'package:pickaboo/presentation/bloc/recommended_products_bloc/recommended_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/related_products_bloc/related_products_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_cross_sell_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_frequently_bought_together.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_section_slider.dart';

class MockRelatedProductsBloc
    extends MockBloc<RelatedProductsEvent, RelatedProductsState>
    implements RelatedProductsBloc {}

class MockRecommendedProductsBloc
    extends MockBloc<RecommendedProductsEvent, RecommendedProductsState>
    implements RecommendedProductsBloc {}

ProductDetailEntity _dummyMainProduct({
  List<BuyTogetherEntity> buysTogather = const [],
  bool stockAvailable = true,
}) =>
    ProductDetailEntity(
      id: 101,
      sku: 'MAIN-101',
      slug: 'main-product',
      typeId: 'simple',
      name: 'Main Product',
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
      regularPrice: 5000,
      spacialPrice: 4500,
      discount: 10,
      stockAvailable: stockAvailable,
      expressDelivery: 0,
      comingSoon: false,
      clubPoints: 50,
      brandId: '1',
      brand: 'Brand',
      soldByVendorUrlKey: '',
      soldBy: 'Pickaboo',
      offers: '',
      warranty: '',
      emi: 0,
      varient: const [],
      extraOptions: const [],
      buysTogather: buysTogather,
      productDetails: '',
      ratingSummaryValue: 0,
      ratingSummary: 0,
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
      moreInformation: const [],
    );

ProductEntity _dummyProductItem(String id, String name) => ProductEntity(
      id: id,
      expressDelivery: false,
      productName: name,
      sku: 'SKU-$id',
      slug: 'slug-$id',
      typeId: 'simple',
      stockAvailable: true,
      freeDelivery: false,
      productPrice: 1000,
      productSpecialPrice: 900,
      productDiscount: 10,
      offers: '',
      rating: 4.5,
      clubPoint: 10,
      ratingCount: 5,
      productImg: '',
      emiAvailable: false,
      comingSoon: false,
      isAd: false,
      attributes: const [],
    );

Widget _buildTestWidget({
  required ProductDetailEntity product,
  required RelatedProductsBloc relatedBloc,
  required RecommendedProductsBloc recommendedBloc,
  Function(List<BuyTogetherEntity>)? onAddBuyTogetherToCart,
  Function(List<BuyTogetherEntity>)? onAddBundleToCart,
}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<RelatedProductsBloc>.value(value: relatedBloc),
            BlocProvider<RecommendedProductsBloc>.value(value: recommendedBloc),
          ],
          child: SingleChildScrollView(
            child: PdpCrossSellSection(
              product: product,
              onAddBuyTogetherToCart: onAddBuyTogetherToCart,
              onAddBundleToCart: onAddBundleToCart,
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
  late MockRelatedProductsBloc relatedBloc;
  late MockRecommendedProductsBloc recommendedBloc;

  setUp(() {
    relatedBloc = MockRelatedProductsBloc();
    recommendedBloc = MockRecommendedProductsBloc();
  });

  group('PdpCrossSellSection & FrequentlyBoughtTogether Tests', () {
    testWidgets(
        'Renders items directly with checkboxes and without accordion/plus icons',
        (WidgetTester tester) async {
      when(() => relatedBloc.state).thenReturn(
        const RelatedProductsState.initial(),
      );
      when(() => recommendedBloc.state).thenReturn(
        const RecommendedProductsState.initial(),
      );

      final dummyItems = [
        const BuyTogetherEntity(
          id: '201',
          sku: 'B-201',
          slug: 'accessory-item',
          typeId: 'simple',
          expressDelivery: '1',
          name: 'In-Stock Accessory',
          stockAvailable: true,
          price: 500,
          specialPrice: 450,
          discount: 10,
          rating: 4.5,
          ratingCount: 10,
          image: '',
        ),
        const BuyTogetherEntity(
          id: '202',
          sku: 'B-202',
          slug: 'out-of-stock-item',
          typeId: 'simple',
          expressDelivery: '0',
          name: 'Sold-Out Accessory',
          stockAvailable: false,
          price: 300,
          specialPrice: 0,
          discount: 0,
          rating: 0,
          ratingCount: 0,
          image: '',
        ),
      ];

      final product = _dummyMainProduct(buysTogather: dummyItems);

      await tester.pumpWidget(
        _buildTestWidget(
          product: product,
          relatedBloc: relatedBloc,
          recommendedBloc: recommendedBloc,
        ),
      );
      await tester.pumpAndSettle();

      // Verify FrequentlyBoughtTogether is rendered with internal Frequently Added Items header
      expect(find.byType(ProductFrequentlyBoughtTogether), findsOneWidget);
      expect(find.text('Frequently Added Items'), findsOneWidget);
      expect(find.text('Frequently Bought Together'), findsNothing);

      // Verify items are directly visible without tapping "Show Details"
      expect(find.text('In-Stock Accessory'), findsOneWidget);
      expect(find.text('Sold-Out Accessory'), findsOneWidget);

      // Verify accordion buttons and plus icon row are completely gone
      expect(find.text('Show Details'), findsNothing);
      expect(find.text('Hide Details'), findsNothing);
      expect(find.byIcon(Icons.add), findsNothing);

      // Verify out-of-stock badge is shown
      expect(find.text('Out of stock'), findsOneWidget);
    });

    testWidgets(
        'Out of stock items cannot be toggled and have disabled checkbox',
        (WidgetTester tester) async {
      when(() => relatedBloc.state).thenReturn(
        const RelatedProductsState.initial(),
      );
      when(() => recommendedBloc.state).thenReturn(
        const RecommendedProductsState.initial(),
      );

      final dummyItems = [
        const BuyTogetherEntity(
          id: '202',
          sku: 'B-202',
          slug: 'out-of-stock-item',
          typeId: 'simple',
          expressDelivery: '0',
          name: 'Sold-Out Accessory',
          stockAvailable: false,
          price: 300,
          specialPrice: 0,
          discount: 0,
          rating: 0,
          ratingCount: 0,
          image: '',
        ),
      ];

      final product = _dummyMainProduct(buysTogather: dummyItems);

      await tester.pumpWidget(
        _buildTestWidget(
          product: product,
          relatedBloc: relatedBloc,
          recommendedBloc: recommendedBloc,
        ),
      );
      await tester.pumpAndSettle();

      // Checkbox for out of stock item should have onChanged == null
      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.onChanged, isNull);
      expect(checkbox.value, isFalse);

      // Tapping the card should NOT toggle it
      await tester.tap(find.text('Sold-Out Accessory'));
      await tester.pumpAndSettle();

      final checkboxAfterTap = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkboxAfterTap.value, isFalse);
    });

    testWidgets(
        'Dual buttons: Selected Only triggers accessories add, Add Both to Cart triggers bundle add',
        (WidgetTester tester) async {
      when(() => relatedBloc.state).thenReturn(
        const RelatedProductsState.initial(),
      );
      when(() => recommendedBloc.state).thenReturn(
        const RecommendedProductsState.initial(),
      );

      List<BuyTogetherEntity>? selectedAccessoriesAdded;
      List<BuyTogetherEntity>? bundleAccessoriesAdded;

      final dummyItems = [
        const BuyTogetherEntity(
          id: '201',
          sku: 'B-201',
          slug: 'accessory-item',
          typeId: 'simple',
          expressDelivery: '1',
          name: 'In-Stock Accessory',
          stockAvailable: true,
          price: 500,
          specialPrice: 450,
          discount: 10,
          rating: 4.5,
          ratingCount: 10,
          image: '',
        ),
      ];

      final product = _dummyMainProduct(buysTogather: dummyItems);

      await tester.pumpWidget(
        _buildTestWidget(
          product: product,
          relatedBloc: relatedBloc,
          recommendedBloc: recommendedBloc,
          onAddBuyTogetherToCart: (items) => selectedAccessoriesAdded = items,
          onAddBundleToCart: (items) => bundleAccessoriesAdded = items,
        ),
      );
      await tester.pumpAndSettle();

      // Initially 0 items selected - bottom action bar & buttons are not visible
      expect(find.text('Add Selected to Cart'), findsNothing);
      expect(find.text('Add with Main to Cart'), findsNothing);
      expect(find.text('1 item selected'), findsNothing);

      // Tap to select the in-stock accessory
      await tester.tap(find.text('In-Stock Accessory'));
      await tester.pumpAndSettle();

      // Now 1 item is selected - bottom action bar and buttons appear
      expect(find.text('Add Selected (1) to Cart'), findsOneWidget);
      expect(find.text('Add Selected (1) with Main to Cart'), findsOneWidget);
      expect(find.text('1 item selected'), findsOneWidget);
      expect(find.text('৳ 450'), findsNWidgets(2));
      expect(find.text('(৳ 450)'), findsOneWidget);
      expect(find.text('(৳ 4,500)'), findsOneWidget);
      expect(find.text('৳ 4,950'), findsOneWidget);

      // Tap "Add Selected (1) to Cart"
      await tester.tap(find.text('Add Selected (1) to Cart'));
      await tester.pumpAndSettle();

      expect(selectedAccessoriesAdded, isNotNull);
      expect(selectedAccessoriesAdded!.first.id, '201');
      expect(bundleAccessoriesAdded, isNull);

      // Tap "Add Selected (1) with Main to Cart"
      await tester.tap(find.text('Add Selected (1) with Main to Cart'));
      await tester.pumpAndSettle();

      expect(bundleAccessoriesAdded, isNotNull);
      expect(bundleAccessoriesAdded!.first.id, '201');
    });

    testWidgets('Renders Related and Recommended Sliders when loaded',
        (WidgetTester tester) async {
      when(() => relatedBloc.state).thenReturn(
        RelatedProductsState.loaded(
          RelatedProductEntity(
            productId: 101,
            productName: 'Main Product',
            relatedProducts: [
              _dummyProductItem('301', 'Related Product'),
            ],
          ),
        ),
      );
      when(() => recommendedBloc.state).thenReturn(
        RecommendedProductsState.loaded(
          RecommendedProductEntity(
            productId: 101,
            productName: 'Main Product',
            sellerRecommendedProducts: [
              _dummyProductItem('401', 'Recommended Product'),
            ],
          ),
        ),
      );

      final product = _dummyMainProduct(buysTogather: const []);

      await tester.pumpWidget(
        _buildTestWidget(
          product: product,
          relatedBloc: relatedBloc,
          recommendedBloc: recommendedBloc,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ProductFrequentlyBoughtTogether), findsNothing);
      expect(find.byType(ProductSectionSlider), findsNWidgets(2));
      expect(find.text('Related Products'), findsOneWidget);
      expect(find.text('Recommended For You'), findsOneWidget);
    });
  });
}
