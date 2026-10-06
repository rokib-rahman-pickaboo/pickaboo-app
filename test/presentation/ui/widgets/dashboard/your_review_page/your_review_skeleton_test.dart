import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/your_review_page/your_review_skeleton.dart';

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

  group('YourReviewSkeleton Tests', () {
    testWidgets('renders YourReviewSkeleton correctly', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(const YourReviewSkeleton()),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(YourReviewSkeleton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
