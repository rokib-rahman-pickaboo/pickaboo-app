import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/constants/app_strings.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';

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

  const magentoCrash =
      'ReflectionException: Class "Magento\\Framework\\App\\Http\\Interceptor" does not exist in /var/www/html/vendor/magento/framework/Code/Reader/ClassReader.php:34\n'
      'Stack trace:\n'
      '#0 /var/www/html/vendor/magento/framework/Code/Reader/ClassReader.php(34): ReflectionClass->__construct()\n'
      '#1 /var/www/html/vendor/magento/framework/ObjectManager/Definition/Runtime.php(50): Magento\\Framework\\Code\\Reader\\ClassReader->getConstructor()\n'
      '#2 /var/www/html/vendor/magento/framework/ObjectManager/Factory/Dynamic/Developer.php(48): Magento\\Framework\\ObjectManager\\Definition\\Runtime->getParameters()\n'
      '#3 /var/www/html/vendor/magento/framework/ObjectManager/ObjectManager.php(59): Magento\\Framework\\ObjectManager\\Factory\\Dynamic\\Developer->create()\n'
      '#4 /var/www/html/vendor/magento/framework/App/Bootstrap.php: Magento\\Framework\\ObjectManager\\ObjectManager->create()\n'
      '#5 /var/www/html/pub/index.php(29): Magento\\Framework\\App\\Bootstrap->createApplication()\n'
      '#6 {main}';

  group('AppErrorView crash suppression tests', () {
    testWidgets('suppresses raw PHP/Magento crash trace and displays friendly fallback',
        (tester) async {
      await tester.pumpWidget(
        wrapWithScreenUtil(
          const AppErrorView(
            type: AppErrorType.generic,
            title: "Couldn't load this product",
            message: magentoCrash,
            retryLabel: 'Retry',
            secondaryLabel: 'Go Back',
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Ensure NO technical details are visible
      expect(find.textContaining('ReflectionException'), findsNothing);
      expect(find.textContaining('/var/www/'), findsNothing);
      expect(find.textContaining('ClassReader'), findsNothing);
      expect(find.textContaining('Stack trace'), findsNothing);
      expect(find.textContaining('Interceptor'), findsNothing);

      // Ensure friendly title and fallback message are visible
      expect(find.text("Couldn't load this product"), findsOneWidget);
      expect(find.text("We couldn't complete your request. Please try again."), findsOneWidget);
    });

    testWidgets('suppresses technical title if title contains crash string',
        (tester) async {
      await tester.pumpWidget(
        wrapWithScreenUtil(
          const AppErrorView(
            type: AppErrorType.server,
            title: 'Fatal error: Uncaught TypeError in /var/www/html/index.php:12',
            message: 'Server error occurred',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Fatal error'), findsNothing);
      expect(find.textContaining('/var/www/'), findsNothing);
      expect(find.text(AppStrings.somethingWentWrong), findsOneWidget);
    });

    testWidgets('renders legitimate user-friendly error message unchanged',
        (tester) async {
      const friendlyMsg = 'Something went wrong while loading this product. Please try again in a moment.';
      await tester.pumpWidget(
        wrapWithScreenUtil(
          const AppErrorView(
            type: AppErrorType.generic,
            title: "Couldn't load this product",
            message: friendlyMsg,
            retryLabel: 'Retry',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("Couldn't load this product"), findsOneWidget);
      expect(find.text(friendlyMsg), findsOneWidget);
    });

    testWidgets('calls onRetry and onSecondary callbacks when tapped',
        (tester) async {
      bool retried = false;
      bool navigatedBack = false;

      await tester.pumpWidget(
        wrapWithScreenUtil(
          AppErrorView(
            type: AppErrorType.generic,
            title: "Couldn't load this product",
            message: 'Something went wrong. Please try again.',
            retryLabel: 'Retry',
            onRetry: () => retried = true,
            secondaryLabel: 'Go Back',
            onSecondary: () => navigatedBack = true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Retry'));
      await tester.pump();
      expect(retried, isTrue);

      await tester.tap(find.text('Go Back'));
      await tester.pump();
      expect(navigatedBack, isTrue);
    });
  });
}
