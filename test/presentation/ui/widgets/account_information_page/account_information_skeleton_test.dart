import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/account_information_page/account_information_skeleton.dart';

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

  group('AccountInformationSkeleton Tests', () {
    testWidgets('renders AccountInformationSkeleton correctly', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(const AccountInformationSkeleton()),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(AccountInformationSkeleton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
