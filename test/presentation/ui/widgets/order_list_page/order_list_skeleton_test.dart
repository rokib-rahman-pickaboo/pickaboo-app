import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/order_list_page/order_list_skeleton.dart';

void main() {
  Widget buildTestWidget(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: child),
        ),
      ),
    );
  }

  group('OrderListSkeleton Tests', () {
    testWidgets('renders skeleton with default item count of 5', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(const OrderListSkeleton()),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(OrderListSkeleton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders custom item count', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(const OrderListSkeleton(itemCount: 3)),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(OrderListSkeleton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
