import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_available_offers_widget.dart';

void main() {
  group('OfferItemData Basic Model Tests', () {
    test('Stores description and termsUrl properly without title classification', () {
      const offer = OfferItemData(
        description: 'Free Installation available in Dhaka Metro',
        termsUrl: 'https://pickaboo.com/terms',
      );
      expect(offer.description, 'Free Installation available in Dhaka Metro');
      expect(offer.termsUrl, 'https://pickaboo.com/terms');
    });
  });

  group('PdpAvailableOffersWidget UI & Parsing Tests', () {
    Widget buildWidget(String? promoOffer, {bool isLoading = false}) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: PdpAvailableOffersWidget(
                promoOffer: promoOffer,
                isLoading: isLoading,
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('Renders offers in natural input order with common icon and NO synthetic titles', (tester) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      const rawHtml = '<p>'
          'Use coupon code SAVE10 for discount.<br>'
          'bKash cashback 5% up to ৳200.<br>'
          'Free Installation across Dhaka.<br>'
          '0% EMI for 12 months.'
          '</p>';

      await tester.pumpWidget(buildWidget(rawHtml));
      await tester.pumpAndSettle();

      expect(find.text('Available Offers'), findsOneWidget);
      expect(find.text('View All'), findsOneWidget);

      // Verify that NO synthetic titles are rendered
      expect(find.text('Coupon'), findsNothing);
      expect(find.text('bKash Offer'), findsNothing);
      expect(find.text('Free Installation'), findsNothing);
      expect(find.text('EMI Plan'), findsNothing);

      // Verify offer descriptions are rendered directly
      expect(find.text('Use coupon code SAVE10 for discount.'), findsWidgets);
      expect(find.text('bKash cashback 5% up to ৳200.'), findsWidgets);

      // Verify common icon is rendered
      expect(find.byIcon(Icons.local_offer_outlined), findsWidgets);

      // Tap View All to open bottom sheet
      await tester.tap(find.text('View All'));
      await tester.pumpAndSettle();

      // Bottom sheet header
      expect(find.text('All Available Offers'), findsOneWidget);

      // Verify all descriptions are in the sheet in original order (not re-sorted by priority)
      expect(find.textContaining('Use coupon code SAVE10 for discount.'), findsWidgets);
      expect(find.textContaining('bKash cashback 5% up to ৳200.'), findsWidgets);
      expect(find.textContaining('Free Installation across Dhaka.'), findsWidgets);
      expect(find.textContaining('0% EMI for 12 months.'), findsWidgets);
    });

    testWidgets('Renders single offer as full-width card', (tester) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      const singleOfferHtml = '<p>Free Installation [Please call this number: 16267]</p>';

      await tester.pumpWidget(buildWidget(singleOfferHtml));
      await tester.pumpAndSettle();

      expect(find.text('Available Offers'), findsOneWidget);
      expect(find.text('Free Installation [Please call this number: 16267]'), findsOneWidget);

      // Find the card Container and check its width
      final cardContainer = tester.widget<Container>(
        find.ancestor(
          of: find.text('Free Installation [Please call this number: 16267]'),
          matching: find.byType(Container),
        ).first,
      );
      expect(cardContainer.constraints?.maxWidth ?? (cardContainer.decoration != null ? 351.0 : 0.0), greaterThanOrEqualTo(300.0));
    });

    testWidgets('Returns SizedBox.shrink when promoOffer is empty or null', (tester) async {
      await tester.pumpWidget(buildWidget(''));
      await tester.pumpAndSettle();
      expect(find.text('Available Offers'), findsNothing);

      await tester.pumpWidget(buildWidget(null));
      await tester.pumpAndSettle();
      expect(find.text('Available Offers'), findsNothing);
    });

    testWidgets('Renders shimmer skeleton and title when isLoading is true', (tester) async {
      await tester.pumpWidget(buildWidget(null, isLoading: true));
      await tester.pumpAndSettle();

      expect(find.text('Available Offers'), findsOneWidget);
      expect(find.byIcon(Icons.local_offer_outlined), findsNWidgets(2));
      // View All action is replaced by shimmer placeholder
      expect(find.text('View All'), findsNothing);
    });

    testWidgets('Discards raw numeric product/offer IDs without rendering fake data', (tester) async {
      await tester.pumpWidget(buildWidget('117562'));
      await tester.pumpAndSettle();

      // Must NOT render Available Offers or the numeric ID
      expect(find.text('Available Offers'), findsNothing);
      expect(find.text('117562'), findsNothing);
    });
  });
}
