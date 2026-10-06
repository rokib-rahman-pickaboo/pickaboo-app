import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/ticket_main_page/ticket_list_skeleton.dart';

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

  group('TicketListSkeleton Tests', () {
    testWidgets('renders TicketListSkeleton correctly', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(const TicketListSkeleton()),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(TicketListSkeleton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
