import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/card_bin_bloc/card_bin_bloc.dart';
import 'package:pickaboo/presentation/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:pickaboo/presentation/bloc/just_for_you_bloc/just_for_you_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/bloc/saved_payment/saved_payment_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_cancelled_page/order_cancelled_page.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_details_page/order_details_page.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_failed_page/order_failed_page.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_list_page/order_list_page.dart';
import 'package:pickaboo/presentation/ui/pages/cart/payment_method_page/payment_method_page.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_placed_page/order_placed_page.dart';

/// Routes for order lifecycle, payment continuation, and order history.
final List<RouteBase> orderRoutes = [
  GoRoute(
    path: Routes.orderList,
    name: 'orderList',
    builder: (context, state) => const OrderListPage(),
  ),

  GoRoute(
    path: Routes.orderPlaced,
    name: 'orderPlaced',
    builder: (context, state) {
      final orderId = state.uri.queryParameters['orderId'];
      final earnedPointsRaw = state.uri.queryParameters['earnedPoints'];
      final earnedPoints = int.tryParse(earnedPointsRaw ?? '') ?? 0;
      return BlocProvider(
        create: (context) => getIt<OrderBloc>(),
        child: OrderPlacedPage(
          orderNumber: orderId ?? "Unknown",
          earnedPoints: earnedPoints,
          onContinueShopping: () => context.go(Routes.home),
        ),
      );
    },
  ),

  GoRoute(
    path: Routes.orderFailed,
    name: 'orderFailed',
    builder: (context, state) {
      final orderId = state.uri.queryParameters['orderId'];
      return BlocProvider(
        create: (context) => getIt<OrderBloc>(),
        child: OrderFailedPage(
          orderNumber: orderId,
          onContinueShopping: () => context.go(Routes.home),
        ),
      );
    },
  ),

  GoRoute(
    path: Routes.orderCancelled,
    name: 'orderCancelled',
    builder: (context, state) => OrderCancelledPage(order: state.extra),
  ),

  GoRoute(
    path: Routes.orderPayment,
    name: 'orderPayment',
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      final selectedMethod = extra?['selectedMethod'] as String?;
      final orderId = extra?['orderId'] as String?;
      final grandTotal = extra?['grandTotal'] as double?;
      final subtotal = extra?['subtotal'] as double?;
      final shippingAmount = extra?['shippingAmount'] as double?;
      final discountAmount = extra?['discountAmount'] as double?;
      final itemsCount = extra?['itemsCount'] as int?;
      final quoteId = extra?['quoteId'] as String?;

      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<CheckoutBloc>()),
          BlocProvider(create: (context) => getIt<SavedPaymentBloc>()),
          BlocProvider(create: (context) => getIt<CardBinBloc>()),
          BlocProvider(create: (context) => getIt<OrderBloc>()),
        ],
        child: PaymentMethodPage(
          selectedMethod: selectedMethod,
          orderId: orderId,
          cartId: quoteId,
          grandTotal: grandTotal,
          subtotal: subtotal,
          shippingAmount: shippingAmount,
          discountAmount: discountAmount,
          itemsCount: itemsCount,
        ),
      );
    },
  ),

  GoRoute(
    path: Routes.orderDetails,
    name: 'orderDetails',
    builder: (context, state) {
      final orderId = state.pathParameters['id'] ?? '';
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<OrderBloc>()),
          BlocProvider(create: (context) => getIt<JustForYouBloc>()),
        ],
        child: OrderDetailsPage(orderId: orderId),
      );
    },
  ),
];
