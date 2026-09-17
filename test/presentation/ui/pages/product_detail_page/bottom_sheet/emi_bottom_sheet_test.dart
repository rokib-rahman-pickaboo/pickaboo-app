import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/emi/emi_entity.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/emi_bottom_sheet.dart';

List<EmiEntity> _makeMockEmiOptions() {
  return [
    const EmiEntity(
      bankName: 'Pickaboo EBL Mastercard',
      bankIcon: '',
      tenureOptions: [
        EmiTenureEntity(
          tenure: 3,
          price: '9434',
          convenienceFee: '0',
          conveniencePrice: '0',
          monthlyPayable: '3144.67',
          total: '9434',
        ),
        EmiTenureEntity(
          tenure: 6,
          price: '9434',
          convenienceFee: '3.5',
          conveniencePrice: '330.19',
          monthlyPayable: '1627.36',
          total: '9764.19',
        ),
        EmiTenureEntity(
          tenure: 12,
          price: '9434',
          convenienceFee: '5.0',
          conveniencePrice: '471.70',
          monthlyPayable: '825.48',
          total: '9905.70',
        ),
      ],
    ),
    const EmiEntity(
      bankName: 'City Bank',
      bankIcon: '',
      tenureOptions: [
        EmiTenureEntity(
          tenure: 6,
          price: '9434',
          convenienceFee: '4.0',
          conveniencePrice: '377.36',
          monthlyPayable: '1635.23',
          total: '9811.36',
        ),
        EmiTenureEntity(
          tenure: 9,
          price: '9434',
          convenienceFee: '6.0',
          conveniencePrice: '566.04',
          monthlyPayable: '1111.12',
          total: '10000.04',
        ),
      ],
    ),
  ];
}

void main() {
  Widget buildTestWidget({
    required List<EmiEntity> emiOptions,
    String productPrice = '9434',
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          body: EmiBottomSheet(
            emiOptions: emiOptions,
            productPrice: productPrice,
          ),
        ),
      ),
    );
  }

  group('EmiBottomSheet Widget Tests', () {
    testWidgets('Renders header bar with EMI Plans, T&C and close icon', (WidgetTester tester) async {
      final options = _makeMockEmiOptions();
      await tester.pumpWidget(buildTestWidget(emiOptions: options));
      await tester.pumpAndSettle();

      expect(find.text('EMI Plans'), findsOneWidget);
      expect(find.text('T&C'), findsOneWidget);
      expect(find.byIcon(Icons.close_rounded), findsOneWidget);
    });

    testWidgets('Renders initial bank, tenures and calculation summary accurately', (WidgetTester tester) async {
      final options = _makeMockEmiOptions();
      await tester.pumpWidget(buildTestWidget(emiOptions: options));
      await tester.pumpAndSettle();

      expect(find.text('Select Bank'), findsOneWidget);
      expect(find.text('Pickaboo EBL Mastercard'), findsOneWidget);
      expect(find.text('3 tenure options available'), findsOneWidget);

      expect(find.text('Select Tenure'), findsOneWidget);
      expect(find.text('3 Months'), findsOneWidget);
      expect(find.text('6 Months'), findsOneWidget);
      expect(find.text('12 Months'), findsOneWidget);

      // Calculation card displays formatted monthly rate and total
      expect(find.textContaining('৳3,144.67'), findsOneWidget);
      expect(find.textContaining('Pickaboo EBL Mastercard · 3 months tenure'), findsOneWidget);
      expect(find.textContaining('Convenience Fee: 0% (৳0)'), findsOneWidget);
      expect(find.textContaining('Total Payable Amount: ৳9,434'), findsOneWidget);
    });

    testWidgets('Switching tenure chip updates calculation card', (WidgetTester tester) async {
      final options = _makeMockEmiOptions();
      await tester.pumpWidget(buildTestWidget(emiOptions: options));
      await tester.pumpAndSettle();

      // Tap 6 Months tenure
      await tester.tap(find.text('6 Months'));
      await tester.pumpAndSettle();

      expect(find.textContaining('৳1,627.36'), findsOneWidget);
      expect(find.textContaining('Pickaboo EBL Mastercard · 6 months tenure'), findsOneWidget);
      expect(find.textContaining('Convenience Fee: 3.5% (৳330.19)'), findsOneWidget);
      expect(find.textContaining('Total Payable Amount: ৳9,764.19'), findsOneWidget);
    });

    testWidgets('Toggling bank dropdown displays options and switching bank updates tenures', (WidgetTester tester) async {
      final options = _makeMockEmiOptions();
      await tester.pumpWidget(buildTestWidget(emiOptions: options));
      await tester.pumpAndSettle();

      // Initially City Bank tenure options shouldn't be in tenure list
      expect(find.text('9 Months'), findsNothing);

      // Tap dropdown trigger
      await tester.tap(find.text('Pickaboo EBL Mastercard').first);
      await tester.pumpAndSettle();

      // Dropdown list appears with both banks
      expect(find.text('City Bank'), findsOneWidget);

      // Select City Bank
      await tester.tap(find.text('City Bank'));
      await tester.pumpAndSettle();

      // Selected bank is now City Bank, dropdown closed, tenures updated to 6 Months and 9 Months
      expect(find.text('2 tenure options available'), findsOneWidget);
      expect(find.text('9 Months'), findsOneWidget);
      expect(find.text('3 Months'), findsNothing);

      // Calculation card reflects City Bank 6-month default
      expect(find.textContaining('৳1,635.23'), findsOneWidget);
      expect(find.textContaining('City Bank · 6 months tenure'), findsOneWidget);
    });

    testWidgets('Empty options displays empty state message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(emiOptions: const []));
      await tester.pumpAndSettle();

      expect(find.text('No EMI plans available for this product'), findsOneWidget);
    });

    testWidgets('Opening bank dropdown overlaps content without changing bottom sheet height or pushing items down', (WidgetTester tester) async {
      final options = _makeMockEmiOptions();
      await tester.pumpWidget(buildTestWidget(emiOptions: options));
      await tester.pumpAndSettle();

      final sheetFinder = find.byType(EmiBottomSheet);
      final initialSize = tester.getSize(sheetFinder);
      final initialTenurePosition = tester.getTopLeft(find.text('Select Tenure'));

      // Tap to open bank dropdown
      await tester.tap(find.text('Pickaboo EBL Mastercard').first);
      await tester.pumpAndSettle();

      // Sheet height MUST NOT increase (matches Image 1 height, does NOT expand)
      final openSize = tester.getSize(sheetFinder);
      expect(openSize.height, equals(initialSize.height));

      // Items below (Select Tenure) MUST NOT be pushed down to the bottom
      final openTenurePosition = tester.getTopLeft(find.text('Select Tenure'));
      expect(openTenurePosition.dy, equals(initialTenurePosition.dy));

      // Overlapping dropdown list is displayed
      expect(find.text('City Bank'), findsOneWidget);

      // Tapping on the backdrop area below the dropdown list dismisses it
      await tester.tap(find.textContaining('Total Payable Amount'));
      await tester.pumpAndSettle();

      // Dropdown is dismissed and City Bank option in the list is no longer visible
      expect(find.text('City Bank'), findsNothing);
    });
  });
}
