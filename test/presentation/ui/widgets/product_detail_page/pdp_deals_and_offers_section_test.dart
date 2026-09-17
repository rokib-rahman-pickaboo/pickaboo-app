import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/product_flash_sale/product_flash_sale_entity.dart';
import 'package:pickaboo/presentation/bloc/product_flash_sale_bloc/product_flash_sale_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_available_offers_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_deals_and_offers_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_sale_timer_section.dart';

class MockProductFlashSaleBloc
    extends MockBloc<ProductFlashSaleEvent, ProductFlashSaleState>
    implements ProductFlashSaleBloc {}

ProductDetailEntity _dummyProduct({
  String offers = '',
  bool isPartial = false,
}) =>
    ProductDetailEntity(
      id: 101,
      sku: 'SKU-101',
      slug: 'test-slug',
      typeId: 'simple',
      name: 'Test Product',
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
      regularPrice: 1000,
      spacialPrice: 900,
      discount: 10,
      stockAvailable: true,
      expressDelivery: 0,
      comingSoon: false,
      clubPoints: 0,
      brandId: '1',
      brand: 'Brand',
      soldByVendorUrlKey: '',
      soldBy: 'Pickaboo',
      offers: offers,
      warranty: '',
      emi: 0,
      varient: const [],
      extraOptions: const [],
      buysTogather: const [],
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
      isPartial: isPartial,
    );

Widget _buildTestWidget({
  required ProductDetailEntity product,
  required ProductFlashSaleBloc flashSaleBloc,
}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: BlocProvider<ProductFlashSaleBloc>.value(
          value: flashSaleBloc,
          child: PdpDealsAndOffersSection(product: product),
        ),
      ),
    ),
  );
}

void main() {
  late MockProductFlashSaleBloc flashSaleBloc;

  setUp(() {
    flashSaleBloc = MockProductFlashSaleBloc();
  });

  group('PdpDealsAndOffersSection Tests', () {
    testWidgets('Renders flash sale timer when active in flash sale state',
        (WidgetTester tester) async {
      when(() => flashSaleBloc.state).thenReturn(
        ProductFlashSaleState(
          status: ProductFlashSaleStatus.success,
          flashSale: ProductFlashSaleEntity(
            inFlashSale: true,
            flashSale: FlashSaleDetailEntity(
              saleId: 1,
              title: 'Mega Flash Sale',
              shortDescription: 'Ending soon',
              endTime: DateTime.now().add(const Duration(hours: 2)),
              slug: 'mega-flash-sale',
            ),
          ),
        ),
      );

      final product = _dummyProduct(offers: '');
      await tester.pumpWidget(
        _buildTestWidget(product: product, flashSaleBloc: flashSaleBloc),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ProductSaleTimerSection), findsOneWidget);
      expect(find.text('Mega Flash Sale'), findsOneWidget);
    });

    testWidgets('Renders available offers widget when offers exist',
        (WidgetTester tester) async {
      when(() => flashSaleBloc.state).thenReturn(
        const ProductFlashSaleState(status: ProductFlashSaleStatus.initial),
      );

      final product = _dummyProduct(
        offers: '<p>10% Cashback on City Bank Cards</p>',
      );
      await tester.pumpWidget(
        _buildTestWidget(product: product, flashSaleBloc: flashSaleBloc),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ProductSaleTimerSection), findsNothing);
      expect(find.byType(PdpAvailableOffersWidget), findsOneWidget);
    });

    testWidgets('Hides offers when product has no offers and not partial',
        (WidgetTester tester) async {
      when(() => flashSaleBloc.state).thenReturn(
        const ProductFlashSaleState(status: ProductFlashSaleStatus.initial),
      );

      final product = _dummyProduct(offers: '');
      await tester.pumpWidget(
        _buildTestWidget(product: product, flashSaleBloc: flashSaleBloc),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ProductSaleTimerSection), findsNothing);
      expect(find.byType(PdpAvailableOffersWidget), findsNothing);
    });
  });
}
