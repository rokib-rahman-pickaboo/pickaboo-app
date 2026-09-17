import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_order_summary.dart';

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

  group('PaymentOrderSummary floor() and discount visibility tests', () {
    testWidgets('floors fractional discount (374.5 -> 374) and shows savings banner', (tester) async {
      const totals = CartTotalsEntity(
        grandTotal: 7166,
        baseGrandTotal: 7166,
        subtotal: 7490,
        baseSubtotal: 7490,
        discountAmount: 374.5,
        baseDiscountAmount: 374.5,
        subtotalWithDiscount: 7115.5,
        baseSubtotalWithDiscount: 7115.5,
        shippingAmount: 50,
        baseShippingAmount: 50,
        shippingDiscountAmount: 0,
        baseShippingDiscountAmount: 0,
        taxAmount: 0,
        baseTaxAmount: 0,
        shippingTaxAmount: 0,
        baseShippingTaxAmount: 0,
        subtotalInclTax: 7490,
        shippingInclTax: 50,
        baseShippingInclTax: 50,
        baseCurrencyCode: 'BDT',
        quoteCurrencyCode: 'BDT',
        couponCode: 'EBL',
        itemsQty: 1,
        items: [],
        totalSegments: [],
      );

      await tester.pumpWidget(
        wrapWithScreenUtil(
          const PaymentOrderSummary(
            totals: totals,
            itemsCount: 1,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Subtotal (1 item)'), findsOneWidget);
      expect(find.text('৳7,490'), findsOneWidget);
      expect(find.text('Discount (EBL)'), findsOneWidget);
      // Confirms floor(): 374.5 -> -৳374
      expect(find.text('-৳374'), findsOneWidget);
      expect(find.text('Shipping and Handeling'), findsOneWidget);
      expect(find.text('৳50'), findsOneWidget);
      expect(find.text('Total Payable'), findsOneWidget);
      expect(find.text('৳7,166'), findsOneWidget);
      expect(find.text("You're saving ৳374 on this order!"), findsOneWidget);
    });

    testWidgets('hides discount row and savings banner when discount is 0 (Nagad selection)', (tester) async {
      const totals = CartTotalsEntity(
        grandTotal: 7540,
        baseGrandTotal: 7540,
        subtotal: 7490,
        baseSubtotal: 7490,
        discountAmount: 0,
        baseDiscountAmount: 0,
        subtotalWithDiscount: 7490,
        baseSubtotalWithDiscount: 7490,
        shippingAmount: 50,
        baseShippingAmount: 50,
        shippingDiscountAmount: 0,
        baseShippingDiscountAmount: 0,
        taxAmount: 0,
        baseTaxAmount: 0,
        shippingTaxAmount: 0,
        baseShippingTaxAmount: 0,
        subtotalInclTax: 7490,
        shippingInclTax: 50,
        baseShippingInclTax: 50,
        baseCurrencyCode: 'BDT',
        quoteCurrencyCode: 'BDT',
        couponCode: '',
        itemsQty: 1,
        items: [],
        totalSegments: [],
      );

      await tester.pumpWidget(
        wrapWithScreenUtil(
          const PaymentOrderSummary(
            totals: totals,
            itemsCount: 1,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Subtotal (1 item)'), findsOneWidget);
      expect(find.text('৳7,490'), findsOneWidget);
      // No discount row
      expect(find.textContaining('Discount'), findsNothing);
      expect(find.text('Shipping and Handeling'), findsOneWidget);
      expect(find.text('৳50'), findsOneWidget);
      expect(find.text('Total Payable'), findsOneWidget);
      expect(find.text('৳7,540'), findsOneWidget);
      // No savings banner
      expect(find.textContaining("You're saving"), findsNothing);
    });
  });
}
