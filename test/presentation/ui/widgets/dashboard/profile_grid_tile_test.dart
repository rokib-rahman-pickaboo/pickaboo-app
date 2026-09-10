import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/profile_grid_tile.dart';

Widget createTileUnderTest({
  required String title,
  String? subtitle,
  VoidCallback? onTap,
}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 170,
            height: 68,
            child: ProfileGridTile(
              icon: Icons.local_shipping_outlined,
              title: title,
              subtitle: subtitle,
              accentColor: AppColors.pickabooBlue,
              onTap: onTap,
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
  group('ProfileGridTile', () {
    testWidgets('Renders title only and hides subtitle when subtitle is null',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        createTileUnderTest(title: 'My Orders'),
      );
      await tester.pumpAndSettle();

      expect(find.text('My Orders'), findsOneWidget);
      expect(find.text('Track & manage orders'), findsNothing);
    });

    testWidgets('Renders subtitle when subtitle is provided',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        createTileUnderTest(
          title: 'My Orders',
          subtitle: 'Track & manage orders',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('My Orders'), findsOneWidget);
      expect(find.text('Track & manage orders'), findsOneWidget);
    });

    testWidgets('Triggers onTap callback when pressed',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      bool tapped = false;
      await tester.pumpWidget(
        createTileUnderTest(
          title: 'Support Tickets',
          onTap: () => tapped = true,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Support Tickets'));
      expect(tapped, isTrue);
    });
  });
}
