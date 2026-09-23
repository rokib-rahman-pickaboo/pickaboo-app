import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/price_summary_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget wrapWithScreenUtil(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) => MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: child)),
      ),
    );
  }

  group('PriceSummaryWidget mathematical reconciliation tests', () {
    testWidgets(
      'reconciles discount when grandTotal is 8690 so 9434 - 944 + 200 = 8690',
      (tester) async {
        await tester.pumpWidget(
          wrapWithScreenUtil(
            const PriceSummaryWidget(
              subtotal: 9434.0,
              grandTotal: 8690.0,
              discountAmount: 943.4,
              shippingAmount: 200.0,
              discountTitle: 'Discount (Oraimo Offer)',
              clubPointDiscount: 0.0,
              itemsCount: 1,
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Subtotal (1 item)'), findsOneWidget);
        expect(find.text('৳9,434'), findsOneWidget);
        expect(find.text('Discount (Oraimo Offer)'), findsOneWidget);
        // Reconciled discount must display -৳944 so 9434 - 944 + 200 = 8690
        expect(find.text('-৳944'), findsOneWidget);
        expect(find.text('Shipping'), findsOneWidget);
        expect(find.text('৳200'), findsOneWidget);
        expect(find.text('Total'), findsOneWidget);
        expect(find.text('৳8,690'), findsOneWidget);
      },
    );

    testWidgets(
      'reconciles discount when grandTotal is 8691 so 9434 - 943 + 200 = 8691',
      (tester) async {
        await tester.pumpWidget(
          wrapWithScreenUtil(
            const PriceSummaryWidget(
              subtotal: 9434.0,
              grandTotal: 8691.0,
              discountAmount: 943.4,
              shippingAmount: 200.0,
              discountTitle: 'Discount (Oraimo Offer)',
              clubPointDiscount: 0.0,
              itemsCount: 1,
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('৳9,434'), findsOneWidget);
        expect(find.text('-৳943'), findsOneWidget);
        expect(find.text('৳200'), findsOneWidget);
        expect(find.text('৳8,691'), findsOneWidget);
      },
    );

    testWidgets(
      'displays 8641 for grandTotal 8640.6 with shipping 150 and discount 943.4 matching web',
      (tester) async {
        await tester.pumpWidget(
          wrapWithScreenUtil(
            const PriceSummaryWidget(
              subtotal: 9434.0,
              grandTotal: 8640.6,
              discountAmount: 943.4,
              shippingAmount: 150.0,
              discountTitle: 'Discount (Oraimo Offer)',
              clubPointDiscount: 0.0,
              itemsCount: 1,
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Subtotal (1 item)'), findsOneWidget);
        expect(find.text('৳9,434'), findsOneWidget);
        expect(find.text('Discount (Oraimo Offer)'), findsOneWidget);
        expect(find.text('-৳943'), findsOneWidget);
        expect(find.text('Shipping'), findsOneWidget);
        expect(find.text('৳150'), findsOneWidget);
        expect(find.text('Total'), findsOneWidget);
        expect(find.text('৳8,641'), findsOneWidget);
        expect(
          find.text(
            'You will save ৳943 on this order, may vary based on payment method.',
          ),
          findsOneWidget,
        );
      },
    );
  });
}
