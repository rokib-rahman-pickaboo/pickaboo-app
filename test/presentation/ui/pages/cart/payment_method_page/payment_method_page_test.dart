import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/card_bin_bloc/card_bin_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
// SavedPaymentEvent / SavedPaymentState are part files of this library.
import 'package:pickaboo/presentation/bloc/saved_payment/saved_payment_bloc.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';
import 'package:pickaboo/presentation/ui/pages/cart/bottom_sheet/emi_selection_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/cart/payment_method_page/payment_method_page.dart';
import 'package:pickaboo/core/theme/app_themes.dart';
import 'package:pickaboo/domain/entity/payment/saved_payment_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_method_skeleton_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_option_item.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_order_summary.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/saved_wallet_item.dart';

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockCheckoutBloc extends MockBloc<CheckoutEvent, CheckoutState>
    implements CheckoutBloc {}

/// PaymentMethodPage listens to OrderBloc + CardBinBloc and reads CardBinBloc
/// and SavedPaymentBloc from initState, so all three must be provided.
class MockOrderBloc extends MockBloc<OrderEvent, OrderState>
    implements OrderBloc {}

class MockCardBinBloc extends MockBloc<CardBinEvent, CardBinState>
    implements CardBinBloc {}

class MockSavedPaymentBloc
    extends MockBloc<SavedPaymentEvent, SavedPaymentState>
    implements SavedPaymentBloc {}

/// Pressing the confirm CTA logs `add_payment_info` through the service
/// locator before dispatching, so it has to be registered.
class MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  late MockCartBloc mockCartBloc;
  late MockCheckoutBloc mockCheckoutBloc;
  late MockOrderBloc mockOrderBloc;
  late MockCardBinBloc mockCardBinBloc;
  late MockSavedPaymentBloc mockSavedPaymentBloc;
  late MockAnalyticsService mockAnalyticsService;

  setUpAll(() {
    registerFallbackValue(const CheckoutEvent.loadCheckout());
    registerFallbackValue(
      const CheckoutEvent.selectPaymentMethod(paymentMethod: ''),
    );
    registerFallbackValue(
      const CheckoutEvent.syncOrderPaymentMethod(
        orderId: '',
        paymentMethod: '',
      ),
    );
    registerFallbackValue(
      const CheckoutEvent.updateOrderPayment(orderId: '', paymentMethod: ''),
    );
    registerFallbackValue(const CheckoutEvent.confirmOrder(orderId: ''));
    registerFallbackValue(const CardBinEvent.getStatus());
    registerFallbackValue(const OrderEvent.getOrders());
    registerFallbackValue(const OrderEvent.loadOrderDetails(''));
    registerFallbackValue(const SavedPaymentEvent.getSavedPayments(''));
    registerFallbackValue(
      const CheckoutEvent.loadEmiDetails(quoteId: '', orderId: ''),
    );
    registerFallbackValue(
      const CheckoutEvent.selectSavedBkashAgreement(agreementId: ''),
    );
    registerFallbackValue(const CheckoutEvent.clearSavedBkashAgreement());
  });

  setUp(() {
    mockCartBloc = MockCartBloc();
    mockCheckoutBloc = MockCheckoutBloc();
    mockOrderBloc = MockOrderBloc();
    mockCardBinBloc = MockCardBinBloc();
    mockSavedPaymentBloc = MockSavedPaymentBloc();
    mockAnalyticsService = MockAnalyticsService();

    if (getIt.isRegistered<AnalyticsService>()) {
      getIt.unregister<AnalyticsService>();
    }
    getIt.registerSingleton<AnalyticsService>(mockAnalyticsService);
    when(
      () => mockAnalyticsService.logAddPaymentInfo(
        value: any(named: 'value'),
        coupon: any(named: 'coupon'),
        paymentType: any(named: 'paymentType'),
        items: any(named: 'items'),
      ),
    ).thenAnswer((_) async {});

    when(() => mockCartBloc.state).thenReturn(const CartState.initial());
    when(
      () => mockCheckoutBloc.state,
    ).thenReturn(const CheckoutState.initial());
    when(
      () => mockOrderBloc.state,
    ).thenReturn(OrderState(pagingState: PagingState()));
    when(() => mockCardBinBloc.state).thenReturn(const CardBinState());
    when(
      () => mockSavedPaymentBloc.state,
    ).thenReturn(SavedPaymentState.initial());
  });

  Widget createWidgetUnderTest({
    String? selectedMethod,
    String? orderId,
    String? cartId,
    List<PaymentMethodEntity>? availablePaymentMethods,
    CartTotalsEntity? initialTotals,
    int? initialItemsCount,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: AppTheme.light(),
          home: MultiBlocProvider(
            providers: [
              BlocProvider<CartBloc>.value(value: mockCartBloc),
              BlocProvider<CheckoutBloc>.value(value: mockCheckoutBloc),
              BlocProvider<OrderBloc>.value(value: mockOrderBloc),
              BlocProvider<CardBinBloc>.value(value: mockCardBinBloc),
              BlocProvider<SavedPaymentBloc>.value(value: mockSavedPaymentBloc),
            ],
            child: PaymentMethodPage(
              selectedMethod: selectedMethod,
              orderId: orderId,
              cartId: cartId,
              availablePaymentMethods: availablePaymentMethods,
              initialTotals: initialTotals,
              initialItemsCount: initialItemsCount,
            ),
          ),
        );
      },
    );
  }

  CheckoutEntity createMockCheckout({double grandTotal = 100}) {
    const tCartItem = CartItemEntity(
      itemId: 1,
      sku: 'sku',
      qty: 1,
      name: 'Product 1',
      price: 100,
      productType: 'simple',
      quoteId: '1',
      rowTotal: 100,
      regularPrice: 100,
      specialPrice: 0,
      discount: '0',
      imageUrl: '',
      productUrlKey: '',
      productId: 1,
      brand: 'Brand',
      stockAvailable: true,
    );

    final tCartTotals = CartTotalsEntity(
      grandTotal: grandTotal,
      baseGrandTotal: grandTotal,
      subtotal: grandTotal,
      baseSubtotal: grandTotal,
      discountAmount: 0,
      baseDiscountAmount: 0,
      subtotalWithDiscount: grandTotal,
      baseSubtotalWithDiscount: grandTotal,
      shippingAmount: 0,
      baseShippingAmount: 0,
      shippingDiscountAmount: 0,
      baseShippingDiscountAmount: 0,
      taxAmount: 0,
      baseTaxAmount: 0,
      shippingTaxAmount: 0,
      baseShippingTaxAmount: 0,
      subtotalInclTax: grandTotal,
      shippingInclTax: 0,
      baseShippingInclTax: 0,
      baseCurrencyCode: 'BDT',
      quoteCurrencyCode: 'BDT',
      itemsQty: 1,
      items: [],
      totalSegments: [],
    );

    const tCartCheckout = CartCheckoutEntity(
      id: 1,
      isActive: true,
      isVirtual: false,
      items: [tCartItem],
      itemsCount: 1,
      itemsQty: 1,
      customerIsGuest: true,
      customerNoteNotify: false,
      storeId: 1,
    );

    return CheckoutEntity(cart: tCartCheckout, cartTotals: tCartTotals);
  }

  /// The page renders whatever `availablePaymentMethods` the checkout state
  /// carries — it is no longer a hard-coded list — and shows a spinner while
  /// that list is empty, which would hang `pumpAndSettle` forever.
  const tPaymentMethods = [
    PaymentMethodEntity(
      code: 'bkash',
      title: 'bKash Payment',
      subtitle: 'Pay online with your bKash account',
    ),
    PaymentMethodEntity(code: 'nagad', title: 'Nagad', subtitle: ''),
    PaymentMethodEntity(
      code: 'cashondelivery',
      title: 'Cash On Delivery',
      subtitle: 'Pay with cash upon delivery',
    ),
    PaymentMethodEntity(
      code: 'emi',
      title: 'EMI (Credit Card Only)',
      subtitle: '',
    ),
  ];

  group('PaymentMethodPage', () {
    testWidgets('shows payment methods and selection', (tester) async {
      tester.view.physicalSize = const Size(1000, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final tCheckout = createMockCheckout();
      when(() => mockCheckoutBloc.state).thenReturn(
        CheckoutState.checkoutLoaded(
          checkout: tCheckout,
          selectedPaymentMethod: 'bkash',
          availablePaymentMethods: tPaymentMethods,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Payment Method'), findsOneWidget);
      expect(find.text('Select Payment Method'), findsOneWidget);
      expect(find.text('bKash Payment'), findsOneWidget);
      expect(find.text('Pay online with your bKash account'), findsOneWidget);
      expect(find.text('Cash On Delivery'), findsOneWidget);
      expect(find.text('Pay with cash upon delivery'), findsOneWidget);

      final bkashItem = tester.widget<PaymentOptionItem>(
        find.widgetWithText(PaymentOptionItem, 'bKash Payment'),
      );
      expect(bkashItem.isSelected, isTrue);
    });

    testWidgets(
      'uses selectedMethod from constructor as initial selection (if explicitly passed)',
      (tester) async {
        tester.view.physicalSize = const Size(1000, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final tCheckout = createMockCheckout();
        when(() => mockCheckoutBloc.state).thenReturn(
          CheckoutState.checkoutLoaded(
            checkout: tCheckout,
            availablePaymentMethods: tPaymentMethods,
          ),
        );

        // Pass nagad as selectedMethod
        await tester.pumpWidget(createWidgetUnderTest(selectedMethod: 'nagad'));
        await tester.pumpAndSettle();

        final nagadItem = tester.widget<PaymentOptionItem>(
          find.widgetWithText(PaymentOptionItem, 'Nagad'),
        );
        expect(nagadItem.isSelected, isTrue);
      },
    );

    testWidgets(
      'dispatches selectPaymentMethod when a method is tapped (orderId is null)',
      (tester) async {
        tester.view.physicalSize = const Size(1000, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final tCheckout = createMockCheckout();
        when(() => mockCheckoutBloc.state).thenReturn(
          CheckoutState.checkoutLoaded(
            checkout: tCheckout,
            availablePaymentMethods: tPaymentMethods,
          ),
        );

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        await tester.tap(find.text('bKash Payment'));

        verify(
          () => mockCheckoutBloc.add(
            const CheckoutEvent.selectPaymentMethod(paymentMethod: 'bkash'),
          ),
        ).called(1);
      },
    );

    testWidgets('shows order summary when checkout is loaded', (tester) async {
      tester.view.physicalSize = const Size(1000, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final tCheckout = createMockCheckout();
      when(
        () => mockCheckoutBloc.state,
      ).thenReturn(
        CheckoutState.checkoutLoaded(
          checkout: tCheckout,
          availablePaymentMethods: tPaymentMethods,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(PaymentOrderSummary), findsOneWidget);
      expect(find.text('Subtotal (1 item)'), findsOneWidget);
    });

    testWidgets(
      'shows the confirm CTA and dispatches updateOrderPayment when orderId is provided',
      (tester) async {
        tester.view.physicalSize = const Size(1000, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final tCheckout = createMockCheckout();
        when(() => mockCheckoutBloc.state).thenReturn(
          CheckoutState.checkoutLoaded(
            checkout: tCheckout,
            availablePaymentMethods: tPaymentMethods,
          ),
        );

        // The page no longer pre-selects a method (`_currentSelection` starts
        // empty, mirroring RN), so the selection has to be passed in.
        await tester.pumpWidget(
          createWidgetUnderTest(
            orderId: 'ORDER123',
            selectedMethod: 'cashondelivery',
          ),
        );
        await tester.pumpAndSettle();

        // The "Order ID: …" label is commented out in the page (see
        // payment_method_page.dart:466), so only the button behaviour is
        // asserted here.
        //
        // The CTA reads "Confirm Order" (not "Pay Now") for cash/card on
        // delivery and free orders — `_confirmButtonLabel()`, mirroring RN.
        final confirmButton = find.text('Confirm Order');
        expect(confirmButton, findsOneWidget);

        await tester.tap(confirmButton);

        verify(
          () => mockCheckoutBloc.add(
            const CheckoutEvent.updateOrderPayment(
              orderId: 'ORDER123',
              paymentMethod: 'cashondelivery',
            ),
          ),
        ).called(1);
      },
    );

    testWidgets('shows error snackbar on error state', (tester) async {
      tester.view.physicalSize = const Size(1000, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      whenListen(
        mockCheckoutBloc,
        Stream.fromIterable([
          const CheckoutState.error(
            error: AppErrorEntity(message: 'Something went wrong'),
          ),
        ]),
        initialState: const CheckoutState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump(); // Handle state transition

      expect(find.text('Something went wrong'), findsOneWidget);
    });

    testWidgets(
      'dispatches confirmOrder when paymentMethodUpdated is successful and method is COD',
      (tester) async {
        tester.view.physicalSize = const Size(1000, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        whenListen(
          mockCheckoutBloc,
          Stream.fromIterable([
            const CheckoutState.paymentMethodUpdated(
              success: true,
              checkout: null,
            ),
          ]),
          initialState: const CheckoutState.initial(),
        );

        // COD is only confirmed directly when it is the current selection;
        // any other method goes through processPayment instead.
        await tester.pumpWidget(
          createWidgetUnderTest(
            orderId: 'ORDER123',
            selectedMethod: 'cashondelivery',
          ),
        );
        await tester.pump();

        verify(
          () => mockCheckoutBloc.add(
            const CheckoutEvent.confirmOrder(orderId: 'ORDER123'),
          ),
        ).called(1);
      },
    );

    testWidgets('dispatches loadOrderDetails on initState when orderId is provided', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(orderId: 'ORDER123'),
      );
      await tester.pump();

      verify(
        () => mockOrderBloc.add(
          const OrderEvent.loadOrderDetails('ORDER123'),
        ),
      ).called(1);
    });

    testWidgets('dispatches syncOrderPaymentMethod when EMI is tapped with orderId', (tester) async {
      tester.view.physicalSize = const Size(1000, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final tCheckout = createMockCheckout(grandTotal: 7490);
      when(() => mockCheckoutBloc.state).thenReturn(
        CheckoutState.checkoutLoaded(
          checkout: tCheckout,
          availablePaymentMethods: tPaymentMethods,
        ),
      );

      await tester.pumpWidget(
        createWidgetUnderTest(orderId: 'ORDER123'),
      );
      await tester.pumpAndSettle();

      final emiOption = find.widgetWithText(PaymentOptionItem, 'EMI (Credit Card Only)');
      expect(emiOption, findsOneWidget);
      await tester.tap(emiOption);
      await tester.pump();

      verify(
        () => mockCheckoutBloc.add(
          const CheckoutEvent.syncOrderPaymentMethod(
            orderId: 'ORDER123',
            paymentMethod: 'emi',
          ),
        ),
      ).called(1);
    });

    testWidgets('dispatches syncOrderPaymentMethod when Nagad is tapped with orderId', (tester) async {
      tester.view.physicalSize = const Size(1000, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final tCheckout = createMockCheckout();
      when(() => mockCheckoutBloc.state).thenReturn(
        CheckoutState.checkoutLoaded(
          checkout: tCheckout,
          availablePaymentMethods: tPaymentMethods,
        ),
      );

      await tester.pumpWidget(
        createWidgetUnderTest(orderId: 'ORDER123'),
      );
      await tester.pumpAndSettle();

      final nagadOption = find.widgetWithText(PaymentOptionItem, 'Nagad');
      expect(nagadOption, findsOneWidget);
      await tester.tap(nagadOption);
      await tester.pump();

      verify(
        () => mockCheckoutBloc.add(
          const CheckoutEvent.syncOrderPaymentMethod(
            orderId: 'ORDER123',
            paymentMethod: 'nagad',
          ),
        ),
      ).called(1);
    });

    testWidgets('reloads order details when orderPaymentMethodSynced succeeds', (tester) async {
      tester.view.physicalSize = const Size(1000, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      whenListen(
        mockCheckoutBloc,
        Stream.fromIterable([
          const CheckoutState.orderPaymentMethodSynced(
            success: true,
            paymentMethod: 'nagad',
          ),
        ]),
        initialState: const CheckoutState.initial(),
      );

      await tester.pumpWidget(
        createWidgetUnderTest(orderId: 'ORDER123'),
      );
      await tester.pump();

      // Once from initState, once from orderPaymentMethodSynced
      verify(
        () => mockOrderBloc.add(
          const OrderEvent.loadOrderDetails('ORDER123'),
        ),
      ).called(2);
    });

    testWidgets('renders initialTotals immediately and skips loadPaymentInfo when methods provided', (tester) async {
      tester.view.physicalSize = const Size(1000, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final mockCheckout = createMockCheckout(grandTotal: 1500);

      await tester.pumpWidget(
        createWidgetUnderTest(
          cartId: '1',
          availablePaymentMethods: tPaymentMethods,
          initialTotals: mockCheckout.cartTotals,
          initialItemsCount: 2,
        ),
      );
      await tester.pump();

      // Verify PaymentOrderSummary is rendered immediately on frame 0 without needing network
      expect(find.byType(PaymentOrderSummary), findsOneWidget);
      expect(find.text('৳1,500'), findsWidgets);

      // Verify loadPaymentInfo was NOT dispatched since methods were already provided
      verifyNever(
        () => mockCheckoutBloc.add(
          const CheckoutEvent.loadPaymentInfo(cartId: '1'),
        ),
      );
    });

    testWidgets('renders real API subtitle for AMEX when present and none when empty', (tester) async {
      tester.view.physicalSize = const Size(1000, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      const dynamicMethods = [
        PaymentMethodEntity(
          code: 'amex',
          title: 'AMEX',
          subtitle: '10% discount',
          paymentGateway: 'citybank',
        ),
        PaymentMethodEntity(
          code: 'nagad',
          title: 'Nagad',
          subtitle: '',
        ),
      ];

      final tCheckout = createMockCheckout();
      when(() => mockCheckoutBloc.state).thenReturn(
        CheckoutState.checkoutLoaded(
          checkout: tCheckout,
          availablePaymentMethods: dynamicMethods,
        ),
      );

      await tester.pumpWidget(
        createWidgetUnderTest(
          availablePaymentMethods: dynamicMethods,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('AMEX'), findsOneWidget);
      expect(find.text('10% discount'), findsOneWidget);
      expect(find.text('Nagad'), findsOneWidget);

      final amexItem = tester.widget<PaymentOptionItem>(
        find.widgetWithText(PaymentOptionItem, 'AMEX'),
      );
      expect(amexItem.subtitle, equals('10% discount'));

      final nagadItem = tester.widget<PaymentOptionItem>(
        find.widgetWithText(PaymentOptionItem, 'Nagad'),
      );
      expect(nagadItem.subtitle, isNull);
    });

    testWidgets(
      'dispatches syncOrderPaymentMethod and selectPaymentMethod when method is tapped with orderId and cartId',
      (tester) async {
        tester.view.physicalSize = const Size(1000, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final tCheckout = createMockCheckout();
        when(() => mockCheckoutBloc.state).thenReturn(
          CheckoutState.checkoutLoaded(
            checkout: tCheckout,
            availablePaymentMethods: tPaymentMethods,
          ),
        );

        await tester.pumpWidget(
          createWidgetUnderTest(
            orderId: 'ORDER123',
            cartId: 'QUOTE456',
            availablePaymentMethods: tPaymentMethods,
          ),
        );
        await tester.pumpAndSettle();

        final nagadOption = find.widgetWithText(PaymentOptionItem, 'Nagad');
        expect(nagadOption, findsOneWidget);
        await tester.tap(nagadOption);
        await tester.pump();

        verify(
          () => mockCheckoutBloc.add(
            const CheckoutEvent.syncOrderPaymentMethod(
              orderId: 'ORDER123',
              paymentMethod: 'nagad',
            ),
          ),
        ).called(1);

        verify(
          () => mockCheckoutBloc.add(
            const CheckoutEvent.selectPaymentMethod(paymentMethod: 'nagad'),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'updates order summary totals when paymentMethodsLoaded is emitted with updated totals',
      (tester) async {
        tester.view.physicalSize = const Size(1000, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        const initialTotals = CartTotalsEntity(
          grandTotal: 1000,
          baseGrandTotal: 1000,
          subtotal: 1000,
          baseSubtotal: 1000,
          discountAmount: 0,
          baseDiscountAmount: 0,
          subtotalWithDiscount: 1000,
          baseSubtotalWithDiscount: 1000,
          shippingAmount: 0,
          baseShippingAmount: 0,
          shippingDiscountAmount: 0,
          baseShippingDiscountAmount: 0,
          taxAmount: 0,
          baseTaxAmount: 0,
          shippingTaxAmount: 0,
          baseShippingTaxAmount: 0,
          subtotalInclTax: 1000,
          shippingInclTax: 0,
          baseShippingInclTax: 0,
          baseCurrencyCode: 'BDT',
          quoteCurrencyCode: 'BDT',
          itemsQty: 1,
          items: [],
          totalSegments: [],
        );

        const updatedTotals = CartTotalsEntity(
          grandTotal: 900,
          baseGrandTotal: 900,
          subtotal: 1000,
          baseSubtotal: 1000,
          discountAmount: -100,
          baseDiscountAmount: -100,
          subtotalWithDiscount: 900,
          baseSubtotalWithDiscount: 900,
          shippingAmount: 0,
          baseShippingAmount: 0,
          shippingDiscountAmount: 0,
          baseShippingDiscountAmount: 0,
          taxAmount: 0,
          baseTaxAmount: 0,
          shippingTaxAmount: 0,
          baseShippingTaxAmount: 0,
          subtotalInclTax: 1000,
          shippingInclTax: 0,
          baseShippingInclTax: 0,
          baseCurrencyCode: 'BDT',
          quoteCurrencyCode: 'BDT',
          itemsQty: 1,
          items: [],
          totalSegments: [],
        );

        whenListen(
          mockCheckoutBloc,
          Stream.fromIterable([
            const CheckoutState.paymentMethodsLoaded(
              availablePaymentMethods: tPaymentMethods,
              totals: updatedTotals,
            ),
          ]),
          initialState: const CheckoutState.initial(),
        );

        await tester.pumpWidget(
          createWidgetUnderTest(
            orderId: 'ORDER123',
            cartId: 'QUOTE456',
            initialTotals: initialTotals,
            availablePaymentMethods: tPaymentMethods,
          ),
        );
        await tester.pump();
        await tester.pumpAndSettle();

        // The updated total of 900 should now be rendered
        expect(find.text('৳900'), findsWidgets);
      },
    );

    testWidgets(
      'renders payment methods (including Card on Delivery) directly from API paymentMethodsLoaded when orderId is provided',
      (tester) async {
        tester.view.physicalSize = const Size(1000, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        const apiMethods = [
          PaymentMethodEntity(
            code: 'cashondelivery',
            title: 'Cash On Delivery',
            subtitle: '',
          ),
          PaymentMethodEntity(
            code: 'cardondelivery',
            title: 'Card On Delivery',
            subtitle: '',
          ),
          PaymentMethodEntity(
            code: 'amex',
            title: 'AMEX',
            subtitle: '10% discount',
            paymentGateway: 'citybank',
          ),
        ];

        final tCheckout = createMockCheckout();

        whenListen(
          mockCheckoutBloc,
          Stream.fromIterable([
            CheckoutState.paymentMethodsLoaded(
              availablePaymentMethods: apiMethods,
              totals: tCheckout.cartTotals,
            ),
          ]),
          initialState: const CheckoutState.initial(),
        );

        await tester.pumpWidget(
          createWidgetUnderTest(
            orderId: 'ORDER123',
            cartId: 'QUOTE456',
            initialTotals: tCheckout.cartTotals,
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.text('Cash On Delivery'), findsOneWidget);
        expect(find.text('Card On Delivery'), findsOneWidget);
        expect(find.text('AMEX'), findsOneWidget);
        expect(find.text('10% discount'), findsOneWidget);
      },
    );

    testWidgets(
      'renders PaymentMethodListSkeleton and PaymentSummarySkeleton when availablePaymentMethods and totals are not yet loaded',
      (tester) async {
        tester.view.physicalSize = const Size(1000, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        when(() => mockCheckoutBloc.state).thenReturn(
          const CheckoutState.initial(),
        );

        await tester.pumpWidget(
          createWidgetUnderTest(orderId: 'ORDER123'),
        );
        await tester.pump();

        expect(find.byType(PaymentMethodListSkeleton), findsOneWidget);
        expect(find.byType(PaymentSummarySkeleton), findsOneWidget);
      },
    );

    testWidgets(
      're-opens EMI bottom sheet immediately from memory when user selects another method and re-taps EMI',
      (tester) async {
        tester.view.physicalSize = const Size(1000, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final checkoutController = StreamController<CheckoutState>.broadcast();
        addTearDown(checkoutController.close);

        const tEmiData = CheckoutEmiEntity(
          bankEmiData: [
            BankEmiDataEntity(
              name: 'City Bank',
              paymentGateway: 'citybank',
              emiTenures: [
                EmiTenureDetailEntity(
                  tenure: 3,
                  price: '7490',
                  convenienceFee: '0',
                  conveniencePrice: '0',
                  cConvenienceFee: '0',
                  cConveniencePrice: '0',
                  monthlyPayable: '2496',
                  total: '7490',
                ),
              ],
              cemiTenures: [],
            ),
          ],
          quoteShippingCost: '0',
          quoteBillingCity: 'Dhaka',
        );

        final tCheckout = createMockCheckout(grandTotal: 7490);
        final initialLoaded = CheckoutState.checkoutLoaded(
          checkout: tCheckout,
          availablePaymentMethods: tPaymentMethods,
        );

        whenListen(
          mockCheckoutBloc,
          checkoutController.stream,
          initialState: initialLoaded,
        );
        when(() => mockCheckoutBloc.state).thenReturn(initialLoaded);

        await tester.pumpWidget(
          createWidgetUnderTest(orderId: 'ORDER123'),
        );
        await tester.pumpAndSettle();

        // 1. First tap on EMI: dispatches loadEmiDetails
        final emiOption = find.widgetWithText(PaymentOptionItem, 'EMI (Credit Card Only)');
        expect(emiOption, findsOneWidget);
        await tester.tap(emiOption);
        await tester.pump();

        verify(
          () => mockCheckoutBloc.add(
            const CheckoutEvent.loadEmiDetails(
              quoteId: '1',
              orderId: 'ORDER123',
            ),
          ),
        ).called(1);

        // 2. Emit emiDetailsLoaded from stream
        checkoutController.add(const CheckoutState.emiDetailsLoaded(emiData: tEmiData));
        await tester.pumpAndSettle();

        // Bottom sheet is now open
        expect(find.byType(EmiSelectionBottomSheet), findsOneWidget);

        // 3. Dismiss bottom sheet
        final closeBtn = find.byIcon(Icons.close);
        expect(closeBtn, findsOneWidget);
        await tester.tap(closeBtn);
        await tester.pumpAndSettle();
        expect(find.byType(EmiSelectionBottomSheet), findsNothing);

        // 4. User selects Nagad (another payment method)
        final nagadOption = find.widgetWithText(PaymentOptionItem, 'Nagad');
        await tester.tap(nagadOption);
        await tester.pumpAndSettle();

        // 5. User taps EMI AGAIN
        await tester.tap(emiOption);
        await tester.pumpAndSettle();

        // Bottom sheet MUST re-open immediately from memory without dispatching a 2nd loadEmiDetails!
        expect(find.byType(EmiSelectionBottomSheet), findsOneWidget);
        // loadEmiDetails was called ONLY ONCE in the whole lifecycle!
        verifyNever(
          () => mockCheckoutBloc.add(
            const CheckoutEvent.loadEmiDetails(
              quoteId: '1',
              orderId: 'ORDER123',
            ),
          ),
        );
      },
    );
  });

  group('Saved bKash vs Regular bKash Mutual Exclusivity', () {
    const savedBkashWallet = SavedPaymentEntity(
      network: 'bkash',
      phoneNumber: '01712345678',
      iconUrl: '',
      agreementId: 'AGREEMENT_999',
    );

    testWidgets(
      'When saved bKash agreement is selected, only SavedWalletItem is selected and regular bKash is NOT selected',
      (tester) async {
        final tCheckout = createMockCheckout();
        when(() => mockSavedPaymentBloc.state).thenReturn(
          const SavedPaymentState(
            isLoading: false,
            savedPayments: [savedBkashWallet],
          ),
        );
        when(() => mockCheckoutBloc.state).thenReturn(
          CheckoutState.checkoutLoaded(
            checkout: tCheckout,
            availablePaymentMethods: tPaymentMethods,
            selectedPaymentMethod: 'dynamicpaymentgateway',
          ),
        );

        await tester.pumpWidget(
          createWidgetUnderTest(
            orderId: 'ORD-123',
            cartId: 'CART-1',
            availablePaymentMethods: tPaymentMethods,
          ),
        );
        await tester.pumpAndSettle();

        // Saved bKash is rendered
        final savedTile = find.byType(SavedWalletItem);
        expect(savedTile, findsOneWidget);

        // Tap the saved wallet
        await tester.tap(savedTile);
        await tester.pumpAndSettle();

        // Verify SavedWalletItem has isSelected == true
        final savedWidget = tester.widget<SavedWalletItem>(savedTile);
        expect(savedWidget.isSelected, isTrue);

        // Verify regular bKash PaymentOptionItem has isSelected == false
        final regularBkashFinder = find.widgetWithText(PaymentOptionItem, 'bKash Payment');
        expect(regularBkashFinder, findsOneWidget);
        final regularBkashWidget = tester.widget<PaymentOptionItem>(regularBkashFinder);
        expect(regularBkashWidget.isSelected, isFalse);
      },
    );

    testWidgets(
      'When user taps regular bKash from bottom list, regular bKash is selected and SavedWalletItem is deselected',
      (tester) async {
        final tCheckout = createMockCheckout();
        when(() => mockSavedPaymentBloc.state).thenReturn(
          const SavedPaymentState(
            isLoading: false,
            savedPayments: [savedBkashWallet],
          ),
        );
        when(() => mockCheckoutBloc.state).thenReturn(
          CheckoutState.checkoutLoaded(
            checkout: tCheckout,
            availablePaymentMethods: tPaymentMethods,
            selectedPaymentMethod: 'dynamicpaymentgateway',
          ),
        );

        await tester.pumpWidget(
          createWidgetUnderTest(
            orderId: 'ORD-123',
            cartId: 'CART-1',
            availablePaymentMethods: tPaymentMethods,
          ),
        );
        await tester.pumpAndSettle();

        // 1. Select saved wallet first
        final savedTile = find.byType(SavedWalletItem);
        await tester.tap(savedTile);
        await tester.pumpAndSettle();
        expect(tester.widget<SavedWalletItem>(savedTile).isSelected, isTrue);

        final regularBkashFinder = find.widgetWithText(PaymentOptionItem, 'bKash Payment');
        expect(tester.widget<PaymentOptionItem>(regularBkashFinder).isSelected, isFalse);

        // 2. Now tap regular bKash from bottom list
        await tester.tap(regularBkashFinder);
        await tester.pumpAndSettle();

        // Verify regular bKash is now selected
        expect(tester.widget<PaymentOptionItem>(regularBkashFinder).isSelected, isTrue);
        // Verify saved wallet is now deselected
        expect(tester.widget<SavedWalletItem>(savedTile).isSelected, isFalse);

        // Verify clearSavedBkashAgreement was dispatched to CheckoutBloc
        verify(() => mockCheckoutBloc.add(const CheckoutEvent.clearSavedBkashAgreement())).called(greaterThanOrEqualTo(1));
      },
    );

    testWidgets(
      'renders and selects Pickaboo EBL Mastercard, dispatching correct gateway on Pay Now',
      (tester) async {
        final methodsWithEbl = [
          ...tPaymentMethods,
          const PaymentMethodEntity(
            code: 'pickabooeblmastercard',
            title: 'Pickaboo EBL Mastercard',
            subtitle: '',
            paymentGateway: 'eblbank',
          ),
        ];

        final tCheckout = createMockCheckout();
        when(() => mockCheckoutBloc.state).thenReturn(
          CheckoutState.checkoutLoaded(
            checkout: tCheckout,
            availableShippingMethods: const [],
            availablePaymentMethods: methodsWithEbl,
            selectedPaymentMethod: 'pickabooeblmastercard',
          ),
        );

        await tester.pumpWidget(
          createWidgetUnderTest(
            orderId: 'ORD-123',
            cartId: 'CART-1',
            availablePaymentMethods: methodsWithEbl,
            selectedMethod: 'pickabooeblmastercard',
          ),
        );
        await tester.pumpAndSettle();

        final eblOption = find.widgetWithText(PaymentOptionItem, 'Pickaboo EBL Mastercard');
        expect(eblOption, findsOneWidget);
        expect(tester.widget<PaymentOptionItem>(eblOption).isSelected, isTrue);

        // Tap Pay Now
        final payNowButton = find.text('Pay Now');
        await tester.tap(payNowButton);
        await tester.pumpAndSettle();

        verify(() => mockCheckoutBloc.add(
          const CheckoutEvent.updateOrderPayment(
            orderId: 'ORD-123',
            paymentMethod: 'pickabooeblmastercard',
            paymentGateway: 'eblbank',
          ),
        )).called(1);
      },
    );
  });
}
