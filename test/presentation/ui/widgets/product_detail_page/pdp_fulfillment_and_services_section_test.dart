import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/delivery_charge/delivery_charge_entity.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/bloc/cms_content_bloc/cms_content_bloc.dart';
import 'package:pickaboo/presentation/bloc/delivery_charge_bloc/delivery_charge_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_delivery_location_selector.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_fulfillment_and_services_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_pickaboo_assured_card.dart';

class MockDeliveryChargeBloc
    extends MockBloc<DeliveryChargeEvent, DeliveryChargeState>
    implements DeliveryChargeBloc {}

class MockCmsContentBloc extends MockBloc<CmsContentEvent, CmsContentState>
    implements CmsContentBloc {}

ProductDetailEntity _dummyProduct({
  bool stockAvailable = true,
  int expressDelivery = 1,
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
      stockAvailable: stockAvailable,
      expressDelivery: expressDelivery,
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
    );

Widget _buildTestWidget({
  required ProductDetailEntity product,
  required DeliveryChargeBloc deliveryChargeBloc,
  required CmsContentBloc cmsContentBloc,
  PlacePickResultEntity? selectedDeliveryLocation,
  VoidCallback? onDeliveryLocationTap,
}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<DeliveryChargeBloc>.value(value: deliveryChargeBloc),
            BlocProvider<CmsContentBloc>.value(value: cmsContentBloc),
          ],
          child: SingleChildScrollView(
            child: PdpFulfillmentAndServicesSection(
              product: product,
              selectedDeliveryLocation: selectedDeliveryLocation,
              onDeliveryLocationTap: onDeliveryLocationTap,
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
  late MockDeliveryChargeBloc deliveryChargeBloc;
  late MockCmsContentBloc cmsContentBloc;

  setUp(() {
    deliveryChargeBloc = MockDeliveryChargeBloc();
    cmsContentBloc = MockCmsContentBloc();

    when(() => cmsContentBloc.state).thenReturn(
      const CmsContentState(isLoading: false),
    );
  });

  group('PdpFulfillmentAndServicesSection Tests', () {
    testWidgets('Renders DeliveryLocationSelector and AssuredCard when in stock',
        (WidgetTester tester) async {
      when(() => deliveryChargeBloc.state).thenReturn(
        const DeliveryChargeState.loaded(
          DeliveryChargeEntity(
            insideCharge: 60,
            outsideCharge: 120,
          ),
        ),
      );

      final product = _dummyProduct(stockAvailable: true);
      await tester.pumpWidget(
        _buildTestWidget(
          product: product,
          deliveryChargeBloc: deliveryChargeBloc,
          cmsContentBloc: cmsContentBloc,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PdpDeliveryLocationSelector), findsOneWidget);
      expect(find.byType(PdpPickabooAssuredCard), findsOneWidget);
    });

    testWidgets('Hides DeliveryLocationSelector when out of stock',
        (WidgetTester tester) async {
      when(() => deliveryChargeBloc.state).thenReturn(
        const DeliveryChargeState.initial(),
      );

      final product = _dummyProduct(stockAvailable: false);
      await tester.pumpWidget(
        _buildTestWidget(
          product: product,
          deliveryChargeBloc: deliveryChargeBloc,
          cmsContentBloc: cmsContentBloc,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PdpDeliveryLocationSelector), findsNothing);
      expect(find.byType(PdpPickabooAssuredCard), findsOneWidget);
    });

    testWidgets('Invokes onDeliveryLocationTap callback when selector tapped',
        (WidgetTester tester) async {
      when(() => deliveryChargeBloc.state).thenReturn(
        const DeliveryChargeState.initial(),
      );

      bool tapped = false;
      final product = _dummyProduct(stockAvailable: true);
      await tester.pumpWidget(
        _buildTestWidget(
          product: product,
          deliveryChargeBloc: deliveryChargeBloc,
          cmsContentBloc: cmsContentBloc,
          onDeliveryLocationTap: () => tapped = true,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(PdpDeliveryLocationSelector));
      expect(tapped, isTrue);
    });
  });
}
