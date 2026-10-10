import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_rating_breakdown_card.dart';

void main() {
  group('PdpRatingBreakdownCard Tests', () {
    Widget buildWidget({
      double rating = 4.5,
      int totalReviews = 10,
      List<int> detailedSummary = const [7, 2, 1, 0, 0],
      Size screenSize = const Size(393, 852), // iPhone 14 Pro
    }) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: PdpRatingBreakdownCard(
                rating: rating,
                totalReviews: totalReviews,
                detailedSummary: detailedSummary,
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('Renders all star labels and rating bars without wrapping or overflow on iPhone 14 Pro', (tester) async {
      tester.view.physicalSize = const Size(393 * 3, 852 * 3);
      tester.view.devicePixelRatio = 3.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(buildWidget(rating: 0.0, totalReviews: 0, detailedSummary: [0, 0, 0, 0, 0]));
      await tester.pumpAndSettle();

      expect(find.text('Ratings & Reviews'), findsOneWidget);
      expect(find.text('0.0'), findsOneWidget);
      expect(find.text('0 Verified\nCustomer Ratings'), findsOneWidget);

      // Verify all 5 star levels are rendered cleanly
      expect(find.text('5 ★'), findsOneWidget);
      expect(find.text('4 ★'), findsOneWidget);
      expect(find.text('3 ★'), findsOneWidget);
      expect(find.text('2 ★'), findsOneWidget);
      expect(find.text('1 ★'), findsOneWidget);

      // Verify no RenderFlex overflow
      expect(tester.takeException(), isNull);
    });
  });
}
