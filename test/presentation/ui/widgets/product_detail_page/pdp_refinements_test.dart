import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/dialog/product_media_dialog.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_delivery_location_selector.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_media_gallery_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_pickaboo_assured_card.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_trust_ribbon_widget.dart';

ProductDetailEntity _createTestProduct({
  String soldBy = 'Pickaboo Official',
  int freeDelivery = 1,
  bool stockAvailable = true,
  int expressDelivery = 1,
  List<YoutubeVideoEntity> youtubeVideos = const [],
  List<String> allReviewImages = const [],
}) =>
    ProductDetailEntity(
      id: 1,
      sku: 'SKU-1',
      slug: 'test-product',
      typeId: 'simple',
      name: 'Test Smartphone',
      prodOfferPrice: 0,
      bestPrice: 0,
      freeDelivery: freeDelivery,
      categoryIds: const [],
      metaTitle: '',
      metaKeywords: '',
      metaDescription: '',
      images: const ['https://via.placeholder.com/400'],
      isWishlisted: false,
      isEligibleForReview: true,
      shareUrl: 'https://pickaboo.com/product/test',
      regularPrice: 20000,
      spacialPrice: 18000,
      discount: 10,
      stockAvailable: stockAvailable,
      expressDelivery: expressDelivery,
      comingSoon: false,
      clubPoints: 50,
      brandId: '1',
      brand: 'Samsung',
      soldByVendorUrlKey: '',
      soldBy: soldBy,
      offers: '',
      warranty: '1 Year Official Warranty',
      emi: 0,
      varient: const [],
      extraOptions: const [],
      buysTogather: const [],
      productDetails: '',
      moreInformation: const [],
      ratingSummaryValue: 4.5,
      ratingSummary: 90,
      reviewsCount: 12,
      detailedRatings: const [],
      detailedSummary: const [],
      allReviewImages: allReviewImages,
      youtubeVideos: youtubeVideos,
      reviewsCollection: const [],
      similarProducts: const [],
      youMayAlsoLike: const [],
      otherBrands: const [],
      recentlyViewedProducts: const [],
      cacheTime: DateTime(2026),
    );

void main() {
  Widget wrapWidget(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: child),
        ),
      ),
    );
  }

  group('PdpDeliveryLocationSelector - Express Badge Removal', () {
    testWidgets('Does not render EXPRESS badge tag when isExpress is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        wrapWidget(
          PdpDeliveryLocationSelector(
            selectedAddress: 'Dhanmondi, Dhaka',
            deliveryCharge: '৳60',
            isExpress: true,
            onTap: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Dhanmondi, Dhaka'), findsOneWidget);
      expect(find.text('EXPRESS'), findsNothing);
    });
  });

  group('PdpPickabooAssuredCard - Seller Info Removal', () {
    testWidgets('Does not render Sold by merchant row in Pickaboo Assured card',
        (WidgetTester tester) async {
      final product = _createTestProduct(soldBy: 'Gadget Park BD');

      await tester.pumpWidget(
        wrapWidget(
          PdpPickabooAssuredCard(product: product),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Sold by Gadget Park BD'), findsNothing);
      expect(find.byIcon(Icons.store_mall_directory_outlined), findsNothing);
      expect(find.text('Authorized & verified merchant on Pickaboo'), findsNothing);
    });

    testWidgets('Does not render Express Delivery row even when expressDelivery is 1',
        (WidgetTester tester) async {
      final product = _createTestProduct(expressDelivery: 1);

      await tester.pumpWidget(
        wrapWidget(
          PdpPickabooAssuredCard(product: product),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Express Delivery'), findsNothing);
      expect(find.text('Get guaranteed fast delivery to your doorstep'), findsNothing);
    });
  });

  group('PdpTrustRibbonWidget - Sold by Transfer', () {
    testWidgets('Does not render Sold by text in the trust ribbon',
        (WidgetTester tester) async {
      final product = _createTestProduct(soldBy: 'Gadget Park BD');

      await tester.pumpWidget(
        wrapWidget(
          PdpTrustRibbonWidget(product: product),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Sold by Gadget Park BD'), findsNothing);
    });

    testWidgets('Renders 100% Authentic and Easy Return badges',
        (WidgetTester tester) async {
      final product = _createTestProduct(stockAvailable: true);

      await tester.pumpWidget(
        wrapWidget(
          PdpTrustRibbonWidget(product: product),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('100% Authentic'), findsOneWidget);
      expect(find.text('Easy Return'), findsOneWidget);
    });
  });

  group('PdpMediaGalleryWidget - Bottom Media Filter Horizontal Scroll', () {
    testWidgets(
        'Renders horizontally scrollable media filters when videos and customer images are present',
        (WidgetTester tester) async {
      final product = _createTestProduct(
        youtubeVideos: const [
          YoutubeVideoEntity(
            url: 'https://youtube.com/watch?v=123',
            title: 'Test Video',
          ),
        ],
        allReviewImages: ['https://example.com/customer1.jpg'],
      );

      await tester.pumpWidget(
        wrapWidget(
          PdpMediaGalleryWidget(
            product: product,
            activeImages: const ['https://via.placeholder.com/400'],
            onFavorite: () {},
            onShare: () {},
            onCompare: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find all 3 filter pills
      expect(find.text('Product Images (1)'), findsOneWidget);
      expect(find.text('Videos (1)'), findsOneWidget);
      expect(find.text('Customer Images (1)'), findsOneWidget);

      // Verify horizontal scroll view is used for media pills
      final scrollFinder = find.byWidgetPredicate(
        (widget) =>
            widget is SingleChildScrollView &&
            widget.scrollDirection == Axis.horizontal,
      );
      expect(scrollFinder, findsOneWidget);
    });
  });

  group('PdpMediaGalleryWidget - Video Default & Inline Switching', () {
    testWidgets('Selects video by default when videos are present and switches on pill tap',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      ProductMediaType? tappedType;
      int? tappedIndex;

      final product = _createTestProduct(
        youtubeVideos: const [
          YoutubeVideoEntity(
            url: 'https://youtube.com/watch?v=dQw4w9WgXcQ',
            title: 'Rick Astley',
          ),
        ],
        allReviewImages: ['https://example.com/customer1.jpg'],
      );

      await tester.pumpWidget(
        wrapWidget(
          PdpMediaGalleryWidget(
            product: product,
            activeImages: const ['https://via.placeholder.com/400'],
            onFavorite: () {},
            onShare: () {},
            onCompare: () {},
            onMediaTap: (type, index) {
              tappedType = type;
              tappedIndex = index;
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Videos is first pill and active by default
      expect(find.byKey(const ValueKey('pdp_videos_page_view')), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);

      // Tap on the video hero area -> invokes onMediaTap with videos type
      await tester.tap(find.byKey(const ValueKey('pdp_videos_page_view')));
      await tester.pump();
      expect(tappedType, ProductMediaType.videos);
      expect(tappedIndex, 0);

      // Tap Product Images pill -> switches hero view to product images on page
      await tester.tap(find.text('Product Images (1)'));
      await tester.pumpAndSettle();
      expect(find.byKey(const ValueKey('pdp_images_page_view')), findsOneWidget);
      expect(find.byKey(const ValueKey('pdp_videos_page_view')), findsNothing);

      // Tap on the image hero area -> invokes onMediaTap with productImages type
      await tester.tap(find.byKey(const ValueKey('pdp_images_page_view')));
      await tester.pump();
      expect(tappedType, ProductMediaType.productImages);
      expect(tappedIndex, 0);

      // Tap Customer Images pill -> switches hero view to customer images on page
      await tester.tap(find.text('Customer Images (1)'));
      await tester.pumpAndSettle();
      expect(find.byKey(const ValueKey('pdp_customer_page_view')), findsOneWidget);
      expect(find.byKey(const ValueKey('pdp_images_page_view')), findsNothing);

      // Tap on the customer image hero area -> invokes onMediaTap with customerImages type
      await tester.tap(find.byKey(const ValueKey('pdp_customer_page_view')));
      await tester.pump();
      expect(tappedType, ProductMediaType.customerImages);
      expect(tappedIndex, 0);
    });

    testWidgets('Selects Product Images by default when no videos are present',
        (WidgetTester tester) async {
      final product = _createTestProduct(
        youtubeVideos: const [],
        allReviewImages: ['https://example.com/customer1.jpg'],
      );

      await tester.pumpWidget(
        wrapWidget(
          PdpMediaGalleryWidget(
            product: product,
            activeImages: const ['https://via.placeholder.com/400'],
            onFavorite: () {},
            onShare: () {},
            onCompare: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('pdp_images_page_view')), findsOneWidget);
      expect(find.byKey(const ValueKey('pdp_videos_page_view')), findsNothing);
      expect(find.textContaining('Videos'), findsNothing);
    });
  });

  group('PdpMediaGalleryWidget - Compare Button Visibility Toggle', () {
    testWidgets('Hides compare button by default when showCompareButton is false',
        (WidgetTester tester) async {
      final product = _createTestProduct();

      await tester.pumpWidget(
        wrapWidget(
          PdpMediaGalleryWidget(
            product: product,
            activeImages: const ['https://via.placeholder.com/400'],
            showCompareButton: false,
            onFavorite: () {},
            onShare: () {},
            onCompare: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Compare button icon (Icons.sync_alt_rounded) must NOT be present
      expect(find.byIcon(Icons.sync_alt_rounded), findsNothing);
      // Heart / Wishlist and Share icons remain present
      expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
      expect(find.byIcon(Icons.share_outlined), findsOneWidget);
    });

    testWidgets('Shows compare button when showCompareButton is true',
        (WidgetTester tester) async {
      final product = _createTestProduct();

      await tester.pumpWidget(
        wrapWidget(
          PdpMediaGalleryWidget(
            product: product,
            activeImages: const ['https://via.placeholder.com/400'],
            showCompareButton: true,
            onFavorite: () {},
            onShare: () {},
            onCompare: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Compare button icon must be visible when enabled
      expect(find.byIcon(Icons.sync_alt_rounded), findsOneWidget);
    });
  });
}
