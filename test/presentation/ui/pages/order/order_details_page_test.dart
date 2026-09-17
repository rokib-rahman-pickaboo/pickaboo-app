import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_details_page/order_details_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_header_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_item_card.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_payment_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_summary_section.dart';

OrderDetailEntity _createTestOrder({
  String status = 'pending',
  String orderNumber = '0709942132',
}) {
  return OrderDetailEntity(
    orderId: 12345,
    orderNumber: orderNumber,
    customerId: 99,
    createdAt: '2026-09-07 19:54:00',
    state: 'pending payment',
    status: status,
    items: const [],
    spentRewardPoints: 0,
    orderSummary: const OrderSummaryDetailEntity(
      subtotal: 24665,
      totalOrderQty: 3,
      discountAmount: 0,
      rewardsDiscount: 0,
      shippingFee: 0,
      grandTotal: 24665,
      rewardEarned: 0,
    ),
    shippingMethod: 'Express',
    paymentMethod: 'cashondelivery',
    paymentInformation: const [],
    statusHistory: const [],
  );
}

void main() {
  Widget wrapWidget(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        home: Scaffold(body: child),
      ),
    );
  }

  group('OrderHeaderSection Tests', () {
    testWidgets('Renders Pay Now button at top header when showPayNow is true',
        (WidgetTester tester) async {
      final order = _createTestOrder();

      await tester.pumpWidget(
        wrapWidget(
          OrderHeaderSection(
            order: order,
            getStatusAttributes: (status) => OrderStatusAttributes(
              text: 'Order Placed',
              backgroundColor: const Color(0xFF1B5DD5),
            ),
            showPayNow: true,
            onPayNow: () {},
            showReview: false,
            onReview: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      // "Pay Now" must be rendered in the top card
      expect(find.text('Pay Now'), findsOneWidget);
      // "Buy Again" and "Cancel Order" must NOT be in the top card
      expect(find.text('Buy Again'), findsNothing);
      expect(find.text('Cancel Order'), findsNothing);
    });

    testWidgets('Renders Review button when showReview is true and Pay Now is false',
        (WidgetTester tester) async {
      final order = _createTestOrder(status: 'delivered');

      await tester.pumpWidget(
        wrapWidget(
          OrderHeaderSection(
            order: order,
            getStatusAttributes: (status) => OrderStatusAttributes(
              text: 'Delivered',
              backgroundColor: const Color(0xFF1B5DD5),
            ),
            showPayNow: false,
            showReview: true,
            onReview: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Review'), findsOneWidget);
      expect(find.text('Pay Now'), findsNothing);
      expect(find.text('Buy Again'), findsNothing);
      expect(find.text('Cancel Order'), findsNothing);
    });
  });

  group('OrderItemCard Tests', () {
    testWidgets('Does not display "Sold by: " when soldBy is empty or whitespace',
        (WidgetTester tester) async {
      const item = OrderItemDetailEntity(
        itemId: 1,
        itemName: 'Samsung RU7170 43" 4K Flat Wi-Fi UHD Smart TV',
        productId: 101,
        productSlug: 'samsung-tv',
        productCategoryIds: [],
        productCategoryNames: [],
        qty: 1,
        regularPrice: 5,
        finalPrice: 5,
        discount: 0,
        soldBy: '',
      );

      await tester.pumpWidget(wrapWidget(const OrderItemCard(item: item)));
      await tester.pumpAndSettle();

      expect(find.textContaining('Sold by'), findsNothing);
    });

    testWidgets('Displays "Sold by: <vendor>" when soldBy is provided',
        (WidgetTester tester) async {
      const item = OrderItemDetailEntity(
        itemId: 2,
        itemName: 'realme narzo 30A 4GB/64GB JM-Almond',
        productId: 102,
        productSlug: 'realme-narzo',
        productCategoryIds: [],
        productCategoryNames: [],
        qty: 2,
        regularPrice: 12330,
        finalPrice: 12330,
        discount: 0,
        soldBy: 'Rifat Kabir',
      );

      await tester.pumpWidget(wrapWidget(const OrderItemCard(item: item)));
      await tester.pumpAndSettle();

      expect(find.text('Sold by: Rifat Kabir'), findsOneWidget);
    });
  });

  group('PickabooAppBar Back Button Tests', () {
    testWidgets('Renders back button and triggers onBackTap',
        (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        wrapWidget(
          PickabooAppBar(
            title: 'Items Order',
            showBackButton: true,
            onBackTap: () => tapped = true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back_ios_new), findsOneWidget);
      expect(find.text('Items Order'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
      expect(tapped, isTrue);
    });
  });

  group('OrderSummarySection Convenience Fee Tests', () {
    testWidgets('Renders Convenience Fee with percentage and formatted amount',
        (WidgetTester tester) async {
      final order = OrderDetailEntity(
        orderId: 100,
        orderNumber: '0709942132',
        customerId: 1,
        createdAt: '2026-09-17 12:00:00',
        state: 'complete',
        status: 'complete',
        items: const [],
        spentRewardPoints: 0,
        orderSummary: const OrderSummaryDetailEntity(
          subtotal: 19990,
          totalOrderQty: 1,
          discountAmount: 0,
          rewardsDiscount: 0,
          shippingFee: 500,
          grandTotal: 22232,
          rewardEarned: 0,
          convenienceFee: 1741.65,
          convenienceFeePercent: '8.5%',
        ),
        shippingMethod: 'Regular Delivery',
        paymentMethod: 'emi',
        paymentInformation: const [],
        statusHistory: const [],
      );

      await tester.pumpWidget(
        wrapWidget(
          OrderSummarySection(
            order: order,
            showPayNow: false,
            onPayNow: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Convenience Fee (8.5%)'), findsOneWidget);
      expect(find.text('৳ 1,741.65'), findsOneWidget);
      expect(find.text('৳ 19,990'), findsOneWidget);
      expect(find.text('৳ 500'), findsOneWidget);
      expect(find.text('Grand Total'), findsOneWidget);
      expect(find.text('৳ 22,232'), findsOneWidget);
    });
  });

  group('OrderPaymentSection EMI Details Tests', () {
    testWidgets('Renders EMI payment information including mode, tenure, and bank',
        (WidgetTester tester) async {
      const paymentInfo = [
        PaymentInfoEntity(
          code: 'payment_mode',
          title: 'Payment Mode',
          value: 'Card on delivery',
        ),
        PaymentInfoEntity(
          code: 'emi_tenure',
          title: 'EMI Tenure',
          value: '12',
        ),
        PaymentInfoEntity(
          code: 'emi_bank',
          title: 'EMI Bank',
          value: 'United Commercial Bank',
        ),
      ];

      await tester.pumpWidget(
        wrapWidget(
          OrderPaymentSection(
            paymentMethod: 'emi',
            formatPaymentMethod: (m) => 'EMI (Credit Card Only)',
            paymentInformation: paymentInfo,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Payment Information'), findsOneWidget);
      expect(find.text('EMI (Credit Card Only)'), findsOneWidget);
      expect(find.text('The order was placed using BDT.'), findsOneWidget);
      expect(find.text('Payment Mode'), findsOneWidget);
      expect(find.text('Card on delivery'), findsOneWidget);
      expect(find.text('EMI Tenure'), findsOneWidget);
      expect(find.text('12'), findsOneWidget);
      expect(find.text('EMI Bank'), findsOneWidget);
      expect(find.text('United Commercial Bank'), findsOneWidget);
    });

    testWidgets('Filters out raw backend/accounting fields to match web presentation',
        (WidgetTester tester) async {
      const paymentInfo = [
        PaymentInfoEntity(code: 'amount_ordered', title: 'Amount Ordered', value: '20490'),
        PaymentInfoEntity(code: 'base_amount_ordered', title: 'Base Amount Ordered', value: '20490'),
        PaymentInfoEntity(code: 'base_shipping_amount', title: 'Base Shipping Amount', value: '500'),
        PaymentInfoEntity(code: 'entity_id', title: 'Entity Id', value: '1237063'),
        PaymentInfoEntity(code: 'parent_id', title: 'Parent Id', value: '1237657'),
        PaymentInfoEntity(code: 'shipping_amount', title: 'Shipping Amount', value: '500'),
        PaymentInfoEntity(code: 'bank_name', title: 'Bank Name', value: 'United Commercial Bank'),
        PaymentInfoEntity(code: 'cart_grand_total', title: 'Cart Grand Total', value: '20490'),
        PaymentInfoEntity(code: 'emi_interest_rate', title: 'Emi Interest Rate', value: '8.5'),
        PaymentInfoEntity(code: 'emi_tenure_months', title: 'Emi Tenure Months', value: '12'),
        PaymentInfoEntity(code: 'emi_interest_total', title: 'Emi Interest Total', value: '1741.65'),
        PaymentInfoEntity(code: 'monthly_payable', title: 'Monthly Payable', value: '1852.64'),
        PaymentInfoEntity(code: 'total_payable', title: 'Total Payable', value: '22231.65'),
        PaymentInfoEntity(code: 'payment_mode', title: 'Payment Mode', value: 'Card on delivery'),
      ];

      await tester.pumpWidget(
        wrapWidget(
          OrderPaymentSection(
            paymentMethod: 'emi',
            formatPaymentMethod: (m) => 'EMI (Credit Card Only)',
            paymentInformation: paymentInfo,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Only web-equivalent fields should be displayed
      expect(find.text('Payment Mode'), findsOneWidget);
      expect(find.text('Card on delivery'), findsOneWidget);
      expect(find.text('EMI Tenure'), findsOneWidget);
      expect(find.text('12'), findsOneWidget);
      expect(find.text('EMI Bank'), findsOneWidget);
      expect(find.text('United Commercial Bank'), findsOneWidget);

      // Raw internal backend fields should NOT be displayed
      expect(find.text('Amount Ordered'), findsNothing);
      expect(find.text('Base Amount Ordered'), findsNothing);
      expect(find.text('Entity Id'), findsNothing);
      expect(find.text('Parent Id'), findsNothing);
      expect(find.text('Cart Grand Total'), findsNothing);
      expect(find.text('Emi Interest Rate'), findsNothing);
      expect(find.text('Emi Interest Total'), findsNothing);
      expect(find.text('Monthly Payable'), findsNothing);
      expect(find.text('Total Payable'), findsNothing);
    });
  });
}

