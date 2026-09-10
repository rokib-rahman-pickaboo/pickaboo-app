import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_details_page/order_details_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_header_section.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_item_card.dart';

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
    testWidgets('Does NOT render Buy Again button in OrderHeaderSection',
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
            showCancel: true,
            showReview: false,
            onCancel: () {},
            onReview: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      // "Buy Again" must NOT be in the top card
      expect(find.text('Buy Again'), findsNothing);
      // "Cancel Order" must be present
      expect(find.text('Cancel Order'), findsOneWidget);
    });

    testWidgets('Renders Review button when showReview is true and Cancel is false',
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
            showCancel: false,
            showReview: true,
            onCancel: () {},
            onReview: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Review'), findsOneWidget);
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
}
