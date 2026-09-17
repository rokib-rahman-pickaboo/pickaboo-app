import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/domain/entity/order/order_item_entity.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_failed_page/order_failed_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class MockOrderBloc extends MockBloc<OrderEvent, OrderState> implements OrderBloc {}

OrderDetailEntity _createTestOrder({String orderNumber = '1609225531'}) {
  return OrderDetailEntity(
    orderId: 112847,
    orderNumber: orderNumber,
    customerId: 99,
    createdAt: '2026-09-17 15:00:00',
    state: 'pending payment',
    status: 'pending',
    items: const [],
    spentRewardPoints: 0,
    orderSummary: const OrderSummaryDetailEntity(
      subtotal: 54314,
      totalOrderQty: 1,
      discountAmount: 0,
      rewardsDiscount: 0,
      shippingFee: 0,
      grandTotal: 54314,
      rewardEarned: 0,
    ),
    shippingMethod: 'Express',
    paymentMethod: 'emi',
    paymentInformation: const [],
    statusHistory: const [],
  );
}

void main() {
  late MockOrderBloc mockOrderBloc;

  setUp(() {
    mockOrderBloc = MockOrderBloc();
  });

  Widget buildTestWidget({
    required String orderNumber,
    required VoidCallback onContinueShopping,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<OrderBloc>.value(value: mockOrderBloc),
        ],
        child: MaterialApp(
          home: OrderFailedPage(
            orderNumber: orderNumber,
            onContinueShopping: onContinueShopping,
          ),
        ),
      ),
    );
  }

  testWidgets('Displays loader and does NOT display entity ID before order details load',
      (WidgetTester tester) async {
    // State before orderDetails is loaded (loading in progress)
    when(() => mockOrderBloc.state).thenReturn(
      OrderState(
        pagingState: PagingState<int, OrderItemEntity>(),
        isLoading: true,
        orderDetails: null,
      ),
    );

    await tester.pumpWidget(
      buildTestWidget(
        orderNumber: '112847', // Raw entity ID passed into page
        onContinueShopping: () {},
      ),
    );
    await tester.pump();

    // Verify title is visible
    expect(find.text("We couldn't process your payment."), findsOneWidget);

    // Verify inline loader is showing
    expect(find.byType(AppLoader), findsOneWidget);

    // CRITICAL: Ensure entity ID '112847' is NEVER shown in the order number section
    expect(find.textContaining('112847', findRichText: true), findsNothing);
  });

  testWidgets('Displays actual order number when order details load',
      (WidgetTester tester) async {
    when(() => mockOrderBloc.state).thenReturn(
      OrderState(
        pagingState: PagingState<int, OrderItemEntity>(),
        isLoading: false,
        orderDetails: _createTestOrder(orderNumber: '1609225531'),
      ),
    );

    await tester.pumpWidget(
      buildTestWidget(
        orderNumber: '112847',
        onContinueShopping: () {},
      ),
    );
    await tester.pumpAndSettle();

    // Verify actual increment ID is shown
    expect(find.textContaining('1609225531', findRichText: true), findsOneWidget);
    expect(find.text('Tap to view order details'), findsOneWidget);
    expect(find.text('Continue Shopping'), findsOneWidget);
  });
}
