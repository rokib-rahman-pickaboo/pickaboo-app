import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/payment_review_page/payment_review_skeleton.dart';

void main() {
  Widget buildTestWidget(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }

  group('PaymentReviewSkeleton Tests', () {
    testWidgets('renders PaymentReviewSkeleton with Skeletonizer enabled', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(const PaymentReviewSkeleton()),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(PaymentReviewSkeleton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
