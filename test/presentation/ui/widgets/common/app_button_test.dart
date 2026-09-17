import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/profile_header_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget wrapWithScreenUtil(Widget child, {double width = 375, double height = 812}) {
    return ScreenUtilInit(
      designSize: Size(width, height),
      minTextAdapt: true,
      builder: (_, __) => MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: width,
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }

  group('AppButton width sizing tests', () {
    testWidgets('AppButton with isFullWidth: true expands to parent width', (tester) async {
      await tester.pumpWidget(
        wrapWithScreenUtil(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppButton.primary(
                text: 'Full Width Button',
                onPressed: () {},
                isFullWidth: true,
              ),
            ],
          ),
          width: 375,
        ),
      );
      await tester.pumpAndSettle();

      final buttonSize = tester.getSize(find.byType(AppButton));
      expect(buttonSize.width, 375.0);
    });

    testWidgets('AppButton with isFullWidth: false does NOT expand to full width', (tester) async {
      await tester.pumpWidget(
        wrapWithScreenUtil(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppButton.primary(
                text: 'Short',
                onPressed: () {},
                isFullWidth: false,
              ),
            ],
          ),
          width: 375,
        ),
      );
      await tester.pumpAndSettle();

      final buttonSize = tester.getSize(find.byType(AppButton));
      // Should size to text + padding, definitely much less than parent width 375
      expect(buttonSize.width, lessThan(150.0));
      expect(find.text('Short'), findsOneWidget);
    });

    testWidgets('AppButton.fitted sizes to content and does not expand to full width', (tester) async {
      await tester.pumpWidget(
        wrapWithScreenUtil(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppButton.fitted(
                text: 'Auto Width',
                onPressed: () {},
              ),
            ],
          ),
          width: 375,
        ),
      );
      await tester.pumpAndSettle();

      final buttonSize = tester.getSize(find.byType(AppButton));
      expect(buttonSize.width, lessThan(200.0));
      expect(find.text('Auto Width'), findsOneWidget);
    });
  });

  group('Cart Empty View Continue Shopping Button tests', () {
    testWidgets('Continue Shopping button has full text visible and sizes to content', (tester) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        wrapWithScreenUtil(
          AppEmptyView.cart(
            onContinueShopping: () {},
          ),
          width: 375,
        ),
      );
      await tester.pumpAndSettle();

      // Full text must be present
      expect(find.text('Continue Shopping'), findsOneWidget);

      final buttonFinder = find.byType(AppButton);
      expect(buttonFinder, findsOneWidget);

      final buttonSize = tester.getSize(buttonFinder);
      // Sized to content (~180-210px), not full screen width 375
      expect(buttonSize.width, lessThan(300.0));
      expect(buttonSize.width, greaterThan(150.0));
    });
  });

  group('ProfileHeaderCard Login/Register Button tests', () {
    testWidgets('Login / Register button in ProfileHeaderCard does not take full width', (tester) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        wrapWithScreenUtil(
          ProfileHeaderCard(
            isLoggedIn: false,
            onLoginTap: () {},
          ),
          width: 375,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('LOGIN / REGISTER'), findsOneWidget);

      final buttonFinder = find.byType(AppButton);
      expect(buttonFinder, findsOneWidget);

      final buttonSize = tester.getSize(buttonFinder);
      final cardFinder = find.byType(ProfileHeaderCard);
      final cardSize = tester.getSize(cardFinder);
      final columnFinder = find.ancestor(of: buttonFinder, matching: find.byType(Column)).first;
      final columnSize = tester.getSize(columnFinder);

      // Button width must NOT take full width of column or card
      expect(buttonSize.width, lessThan(columnSize.width));
      expect(buttonSize.width, lessThan(cardSize.width));
    });
  });
}
