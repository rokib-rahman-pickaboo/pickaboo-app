import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/domain/entity/order/order_item_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_placed_page/order_placed_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockOrderBloc extends MockBloc<OrderEvent, OrderState> implements OrderBloc {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

OrderDetailEntity _createTestOrder({String orderNumber = '0709942132'}) {
  return OrderDetailEntity(
    orderId: 12345,
    orderNumber: orderNumber,
    customerId: 99,
    createdAt: '2026-09-07 19:54:00',
    state: 'pending payment',
    status: 'pending',
    items: const [],
    spentRewardPoints: 0,
    orderSummary: const OrderSummaryDetailEntity(
      subtotal: 24665,
      totalOrderQty: 3,
      discountAmount: 0,
      rewardsDiscount: 0,
      shippingFee: 0,
      grandTotal: 24665,
      rewardEarned: 50,
    ),
    shippingMethod: 'Express',
    paymentMethod: 'cashondelivery',
    paymentInformation: const [],
    statusHistory: const [],
  );
}

void main() {
  late MockCartBloc mockCartBloc;
  late MockOrderBloc mockOrderBloc;
  late MockAnalyticsService mockAnalyticsService;

  setUp(() {
    mockCartBloc = MockCartBloc();
    mockOrderBloc = MockOrderBloc();
    mockAnalyticsService = MockAnalyticsService();

    when(() => mockCartBloc.state).thenReturn(const CartState.initial());
    when(() => mockOrderBloc.state).thenReturn(
      OrderState(
        pagingState: PagingState<int, OrderItemEntity>(),
        orderDetails: _createTestOrder(orderNumber: '0709942132'),
      ),
    );

    if (getIt.isRegistered<AnalyticsService>()) {
      getIt.unregister<AnalyticsService>();
    }
    getIt.registerSingleton<AnalyticsService>(mockAnalyticsService);

    when(
      () => mockAnalyticsService.logOrderSuccess(
        transactionId: any(named: 'transactionId'),
        value: any(named: 'value'),
        items: any(named: 'items'),
      ),
    ).thenAnswer((_) async {});
  });

  tearDown(() {
    if (getIt.isRegistered<AnalyticsService>()) {
      getIt.unregister<AnalyticsService>();
    }
  });

  Widget buildTestWidget({required VoidCallback onContinueShopping}) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>.value(value: mockCartBloc),
          BlocProvider<OrderBloc>.value(value: mockOrderBloc),
        ],
        child: MaterialApp(
          home: OrderPlacedPage(
            orderNumber: '0709942132',
            earnedPoints: 50,
            onContinueShopping: onContinueShopping,
          ),
        ),
      ),
    );
  }

  testWidgets('Renders order number card with view details hint and Continue Shopping button',
      (WidgetTester tester) async {
    bool continueShoppingTapped = false;

    await tester.pumpWidget(
      buildTestWidget(
        onContinueShopping: () {
          continueShoppingTapped = true;
        },
      ),
    );
    await tester.pumpAndSettle();

    // Verify order success headers
    expect(find.text('Thank you for shopping with Pickaboo!'), findsOneWidget);
    expect(find.text('Order placed successfully'), findsOneWidget);

    // Verify order number and tap hint
    expect(find.textContaining('0709942132', findRichText: true), findsOneWidget);
    expect(find.text('Tap to view order details'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios_rounded), findsOneWidget);

    // Verify Continue Shopping button with shopping bag icon
    expect(find.text('Continue Shopping'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    expect(find.byType(AppButton), findsOneWidget);

    // Tap Continue Shopping
    await tester.tap(find.text('Continue Shopping'));
    await tester.pump();
    expect(continueShoppingTapped, isTrue);
  });
}
