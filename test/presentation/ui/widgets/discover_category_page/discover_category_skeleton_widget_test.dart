import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/discover_category_skeleton_widget.dart';

void main() {
  Widget createTestWidget(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }

  group('DiscoverCategorySkeletonWidget Tests', () {
    testWidgets('renders DiscoverCategorySkeletonWidget cleanly without exceptions',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        createTestWidget(
          const DiscoverCategorySkeletonWidget(),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(DiscoverCategorySkeletonWidget), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders sidebar rail and content panel placeholders',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        createTestWidget(
          const DiscoverCategorySkeletonWidget(sidebarItemCount: 5),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(ListView), findsNWidgets(2)); // 1 in sidebar, 1 in content panel
      expect(tester.takeException(), isNull);
    });
  });
}
