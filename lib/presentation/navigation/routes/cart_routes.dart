import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/card_bin_bloc/card_bin_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/bloc/saved_payment/saved_payment_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/cart/cart_page/cart_page.dart';
import 'package:pickaboo/presentation/ui/pages/cart/change_address_cart_page/change_address_cart_page.dart';
import 'package:pickaboo/presentation/ui/pages/cart/new_address_cart_page/new_address_cart_page.dart';
import 'package:pickaboo/presentation/ui/pages/cart/payment_method_page/payment_method_page.dart';
import 'package:pickaboo/presentation/ui/pages/cart/payment_review_page/payment_review_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/payment_web_view.dart';

/// Routes for shopping cart, checkout, payments, and cart-specific address changes.
final List<RouteBase> cartRoutes = [
  GoRoute(
    path: Routes.cart,
    name: 'cart',
    builder: (context, state) => const CartPage(),
  ),

  GoRoute(
    path: Routes.paymentReview,
    name: 'paymentReview',
    builder: (context, state) => const PaymentReviewPage(),
  ),

  GoRoute(
    path: Routes.paymentMethod,
    name: 'paymentMethod',
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      final selectedMethod = extra?['selectedMethod'] as String?;
      final orderId = extra?['orderId'] as String?;
      final cartId = extra?['cartId'] as String?;
      final availablePaymentMethods =
          extra?['availablePaymentMethods'] as List<PaymentMethodEntity>?;
      final initialTotals = extra?['totals'] as CartTotalsEntity?;
      final initialItemsCount = extra?['itemsCount'] as int?;
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<SavedPaymentBloc>()),
          BlocProvider(create: (context) => getIt<CardBinBloc>()),
          BlocProvider(create: (context) => getIt<OrderBloc>()),
        ],
        child: PaymentMethodPage(
          selectedMethod: selectedMethod,
          orderId: orderId,
          cartId: cartId,
          availablePaymentMethods: availablePaymentMethods,
          initialTotals: initialTotals,
          initialItemsCount: initialItemsCount,
        ),
      );
    },
  ),

  GoRoute(
    path: Routes.paymentWebView,
    name: 'paymentWebView',
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;
      final url = extra['url'] as String;
      final title = extra['title'] as String;
      final formFields = extra['formFields'] as Map<String, String>?;
      final onPaymentResult =
          extra['onPaymentResult'] as Function(bool, String?);
      final onBkashCallback =
          extra['onBkashCallback'] as void Function(String, String)?;
      final onNagadCallback =
          extra['onNagadCallback'] as void Function(Map<String, String>)?;
      final onUserClosed = extra['onUserClosed'] as VoidCallback?;

      return PaymentWebView(
        url: url,
        title: title,
        formFields: formFields,
        onPaymentResult: onPaymentResult,
        onBkashCallback: onBkashCallback,
        onNagadCallback: onNagadCallback,
        onUserClosed: onUserClosed,
      );
    },
  ),

  GoRoute(
    path: Routes.newAddressCart,
    name: 'newAddressCart',
    builder: (context, state) {
      final title = state.extra as String? ?? 'Shipping Information';
      return NewAddressCartPage(pageTitle: title);
    },
  ),

  GoRoute(
    path: Routes.changeAddressCart,
    name: 'changeAddressCart',
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      final addresses = (extra?['addresses'] as List<dynamic>?)
              ?.map((e) => e as dynamic)
              .toList() ??
          [];
      final selectedAddress = extra?['selectedAddress'] as AddressEntity?;
      final title = extra?['title'] as String? ?? 'Select Address';

      return ChangeAddressCartPage(
        addresses: addresses.cast<AddressEntity>(),
        selectedAddress: selectedAddress,
        pageTitle: title,
      );
    },
  ),
];
