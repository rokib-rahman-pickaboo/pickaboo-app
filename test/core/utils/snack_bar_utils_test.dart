import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';

void main() {
  group('SnackBarType & Extension Properties', () {
    test('Regular type configuration matches Informational blue variant', () {
      const type = SnackBarType.regular;
      expect(type.accentColor, AppColors.pickabooBlue);
      expect(type.surfaceColor, AppColors.surfaceBlue);
      expect(type.defaultIcon, Icons.info_outline_rounded);
      expect(type.defaultTitle, AppStrings.notice);
      expect(type.defaultTag, 'INFO');
    });

    test('Positive type configuration matches Confirmation green variant', () {
      const type = SnackBarType.positive;
      expect(type.accentColor, AppColors.green);
      expect(type.surfaceColor, AppColors.greenBg);
      expect(type.defaultIcon, Icons.check_rounded);
      expect(type.defaultTitle, AppStrings.success);
      expect(type.defaultTag, 'SUCCESS');
    });

    test('Negative type configuration matches Critical Alert red variant', () {
      const type = SnackBarType.negative;
      expect(type.accentColor, AppColors.red);
      expect(type.surfaceColor, AppColors.redBg);
      expect(type.defaultIcon, Icons.warning_amber_rounded);
      expect(type.defaultTitle, AppStrings.somethingWentWrong);
      expect(type.defaultTag, 'FAILED');
    });

    test('Warning type configuration matches Amber caution variant', () {
      const type = SnackBarType.warning;
      expect(type.accentColor, AppColors.amber);
      expect(type.surfaceColor, AppColors.amberBg);
      expect(type.defaultIcon, Icons.warning_amber_rounded);
      expect(type.defaultTitle, AppStrings.warning);
      expect(type.defaultTag, 'ALERT');
    });
  });

  group('SnackBarUtils Widget Tests', () {
    Widget buildTestHarness(void Function(BuildContext context) onTrigger) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (innerContext) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () => onTrigger(innerContext),
                      child: const Text('Show'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    }

    tearDown(() {
      SnackBarUtils.dismiss();
    });

    testWidgets('Renders Regular SnackBar with title, tag, message, and info icon', (tester) async {
      await tester.pumpWidget(
        buildTestHarness((context) {
          SnackBarUtils.showRegular(
            context,
            'This is a regular informational message',
          );
        }),
      );

      await tester.tap(find.text('Show'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 350));

      expect(find.text(AppStrings.notice), findsOneWidget);
      expect(find.text('INFO'), findsOneWidget);
      expect(find.text('This is a regular informational message'), findsOneWidget);
      expect(find.byIcon(Icons.info_outline_rounded), findsOneWidget);
      expect(find.byIcon(Icons.close_rounded), findsOneWidget);
    });

    testWidgets('Renders Positive SnackBar matching confirmation variant', (tester) async {
      await tester.pumpWidget(
        buildTestHarness((context) {
          SnackBarUtils.showPositive(
            context,
            'Order #ORD-8924 confirmed',
            title: 'Payment Successful',
            tagText: r'$142.50',
            actionLabel: 'Receipt',
            onAction: () {},
          );
        }),
      );

      await tester.tap(find.text('Show'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 350));

      expect(find.text('Payment Successful'), findsOneWidget);
      expect(find.text(r'$142.50'), findsOneWidget);
      expect(find.text('Order #ORD-8924 confirmed'), findsOneWidget);
      expect(find.text('Receipt'), findsOneWidget);
      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    });

    testWidgets('Renders Negative SnackBar matching critical alert variant with soft action', (tester) async {
      bool retried = false;
      await tester.pumpWidget(
        buildTestHarness((context) {
          SnackBarUtils.showNegative(
            context,
            'Could not verify checkout items. Try again.',
            title: 'Something went wrong',
            tagText: 'FAILED',
            actionLabel: 'Retry',
            onAction: () {
              retried = true;
            },
          );
        }),
      );

      await tester.tap(find.text('Show'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 350));

      expect(find.text('Something went wrong'), findsOneWidget);
      expect(find.text('FAILED'), findsOneWidget);
      expect(find.text('Could not verify checkout items. Try again.'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
      expect(find.byIcon(Icons.warning_amber_rounded), findsOneWidget);

      // Tap action button
      await tester.tap(find.text('Retry'));
      await tester.pump();
      expect(retried, isTrue);
    });

    testWidgets('Renders Cart Added SnackBar matching informational variant', (tester) async {
      await tester.pumpWidget(
        buildTestHarness((context) {
          SnackBarUtils.showCartItemAdded(
            context,
            itemName: 'Airflow Minimalist Sneakers (Size 42)',
            itemCount: 1,
          );
        }),
      );

      await tester.tap(find.text('Show'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 350));

      expect(find.text('Added to Cart'), findsOneWidget);
      expect(find.text('1 ITEM'), findsOneWidget);
      expect(find.text('Airflow Minimalist Sneakers (Size 42)'), findsOneWidget);
      expect(find.text('View Cart'), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    });

    testWidgets('Dismisses smoothly when close (X) button is tapped', (tester) async {
      await tester.pumpWidget(
        buildTestHarness((context) {
          SnackBarUtils.showRegular(
            context,
            'Dismissible message',
          );
        }),
      );

      await tester.tap(find.text('Show'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 350));

      expect(find.text('Dismissible message'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close_rounded));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Dismissible message'), findsNothing);
    });

    testWidgets('defaultMsgDuration is 1 second and auto-dismisses after 1s', (tester) async {
      expect(SnackBarUtils.defaultMsgDuration, const Duration(seconds: 1));

      await tester.pumpWidget(
        buildTestHarness((context) {
          SnackBarUtils.showRegular(
            context,
            'Auto dismissing in 2s',
          );
        }),
      );

      await tester.tap(find.text('Show'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 350));

      expect(find.text('Auto dismissing in 2s'), findsOneWidget);

      // Advance by 1.5 seconds - should still be present
      await tester.pump(const Duration(milliseconds: 1500));
      expect(find.text('Auto dismissing in 2s'), findsOneWidget);

      // Advance past the 2s mark (+ fade out)
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Auto dismissing in 2s'), findsNothing);
    });

    testWidgets('showCartItemAdded formats multiple items correctly', (tester) async {
      await tester.pumpWidget(
        buildTestHarness((context) {
          SnackBarUtils.showCartItemAdded(
            context,
            itemCount: 3,
            message: '3 items added to cart',
          );
        }),
      );

      await tester.tap(find.text('Show'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 350));

      expect(find.text('Added to Cart'), findsOneWidget);
      expect(find.text('3 ITEMS'), findsOneWidget);
      expect(find.text('3 items added to cart'), findsOneWidget);
      expect(find.text('View Cart'), findsOneWidget);
    });
  });
}
