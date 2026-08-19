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
import 'package:pickaboo/presentation/ui/pages/cart/payment_method_page/payment_method_page.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_option_item.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_order_summary.dart';

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
      const CheckoutEvent.updateOrderPayment(orderId: '', paymentMethod: ''),
    );
    registerFallbackValue(const CheckoutEvent.confirmOrder(orderId: ''));
    registerFallbackValue(const CardBinEvent.getStatus());
    registerFallbackValue(const OrderEvent.getOrders());
    registerFallbackValue(const SavedPaymentEvent.getSavedPayments(''));
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

  Widget createWidgetUnderTest({String? selectedMethod, String? orderId}) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            extensions: [
              AppColors.light(),
              AppTextStyles.build(Brightness.light),
            ],
          ),
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
            ),
          ),
        );
      },
    );
  }

  CheckoutEntity createMockCheckout() {
    final tCartItem = CartItemEntity(
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
      grandTotal: 100,
      baseGrandTotal: 100,
      subtotal: 100,
      baseSubtotal: 100,
      discountAmount: 0,
      baseDiscountAmount: 0,
      subtotalWithDiscount: 100,
      baseSubtotalWithDiscount: 100,
      shippingAmount: 0,
      baseShippingAmount: 0,
      shippingDiscountAmount: 0,
      baseShippingDiscountAmount: 0,
      taxAmount: 0,
      baseTaxAmount: 0,
      shippingTaxAmount: 0,
      baseShippingTaxAmount: 0,
      subtotalInclTax: 100,
      shippingInclTax: 0,
      baseShippingInclTax: 0,
      baseCurrencyCode: 'BDT',
      quoteCurrencyCode: 'BDT',
      itemsQty: 1,
      items: [],
      totalSegments: [],
    );

    final tCartCheckout = CartCheckoutEntity(
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
    PaymentMethodEntity(code: 'bkash', title: 'bKash Payment', subtitle: ''),
    PaymentMethodEntity(code: 'nagad', title: 'Nagad', subtitle: ''),
    PaymentMethodEntity(
      code: 'cashondelivery',
      title: 'Cash On Delivery',
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
      expect(find.text('Cash On Delivery'), findsOneWidget);

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
      expect(find.text('Order Summary (1)'), findsOneWidget);
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
  });
}
