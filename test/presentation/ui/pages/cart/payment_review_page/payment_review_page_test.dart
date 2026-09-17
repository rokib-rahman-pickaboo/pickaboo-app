import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/cart/payment_review_page/payment_review_page.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_themes.dart';
import 'package:pickaboo/core/theme/app_typography.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/cart_item_card.dart';
import 'package:pickaboo/presentation/ui/widgets/payment_review_page/address_card.dart';

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockCheckoutBloc extends MockBloc<CheckoutEvent, CheckoutState>
    implements CheckoutBloc {}

/// Placing an order fires analytics through the service locator, so it has to
/// be registered or the tap throws before the bloc event is dispatched.
class MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  late MockCartBloc mockCartBloc;
  late MockCheckoutBloc mockCheckoutBloc;
  late MockAnalyticsService mockAnalyticsService;

  setUpAll(() {
    registerFallbackValue(const CheckoutEvent.loadCheckout());
    registerFallbackValue(const CheckoutEvent.placeOrder());
  });

  setUp(() {
    mockCartBloc = MockCartBloc();
    mockCheckoutBloc = MockCheckoutBloc();
    mockAnalyticsService = MockAnalyticsService();

    if (getIt.isRegistered<AnalyticsService>()) {
      getIt.unregister<AnalyticsService>();
    }
    getIt.registerSingleton<AnalyticsService>(mockAnalyticsService);

    when(
      () => mockAnalyticsService.logAddShippingInfo(
        value: any(named: 'value'),
        coupon: any(named: 'coupon'),
        items: any(named: 'items'),
      ),
    ).thenAnswer((_) async {});

    when(() => mockCartBloc.state).thenReturn(const CartState.initial());
    when(
      () => mockCheckoutBloc.state,
    ).thenReturn(const CheckoutState.initial());
  });

  Widget createWidgetUnderTest() {
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
            ],
            child: const PaymentReviewPage(),
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

  group('PaymentReviewPage', () {
    testWidgets('shows loading indicator when state is loading', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1000, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      when(
        () => mockCheckoutBloc.state,
      ).thenReturn(const CheckoutState.loading());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows checkout content when state is checkoutLoaded', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1000, 2500);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final tCheckout = createMockCheckout();
      final tShippingAddress = AddressEntity(
        firstname: 'John',
        lastname: 'Doe',
        street: ['Street 1'],
        city: 'City',
        telephone: '123456',
      );

      when(() => mockCheckoutBloc.state).thenReturn(
        CheckoutState.checkoutLoaded(
          checkout: tCheckout,
          selectedShippingAddress: tShippingAddress,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Checkout'), findsOneWidget);
      // The page's sections are "Shipping Address" / "Billing Address"; there
      // is no "Price Details" heading in this layout.
      expect(find.text('Shipping Address'), findsOneWidget);

      // Verify AddressCard properties directly instead of RichText content which can be flaky in tests
      final addressCardFinder = find.byType(AddressCard).first;
      expect(addressCardFinder, findsOneWidget);
      final addressCard = tester.widget<AddressCard>(addressCardFinder);
      expect(addressCard.address?.firstname, 'John');
      expect(addressCard.address?.lastname, 'Doe');

      expect(find.text('Product 1'), findsOneWidget);
    });

    testWidgets('calls placeOrder when place order button is pressed', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1000, 2500);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final tCheckout = createMockCheckout();
      final tShippingAddress = AddressEntity(
        firstname: 'John',
        lastname: 'Doe',
        street: ['Street 1'],
        city: 'City',
        telephone: '123456',
      );

      when(() => mockCheckoutBloc.state).thenReturn(
        CheckoutState.checkoutLoaded(
          checkout: tCheckout,
          selectedShippingAddress: tShippingAddress,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final proceedButton = find.textContaining('Place Order');
      expect(proceedButton, findsOneWidget);

      await tester.tap(proceedButton);

      verify(
        () => mockCheckoutBloc.add(const CheckoutEvent.placeOrder()),
      ).called(1);
    });

    testWidgets('shows error snackbar when state is error', (tester) async {
      tester.view.physicalSize = const Size(1000, 2500);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      whenListen(
        mockCheckoutBloc,
        Stream.fromIterable([
          const CheckoutState.loading(),
          const CheckoutState.error(
            error: AppErrorEntity(message: 'Order failed'),
          ),
        ]),
        initialState: const CheckoutState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump(); // Handle state transition

      expect(find.text('Order failed'), findsOneWidget);
    });

    group('CartItemCard Interaction', () {
      testWidgets(
        'renders cart item card without summary actions in review page',
        (tester) async {
          tester.view.physicalSize = const Size(1000, 2500);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(() => tester.view.resetPhysicalSize());

          final tCheckout = createMockCheckout();
          when(
            () => mockCheckoutBloc.state,
          ).thenReturn(CheckoutState.checkoutLoaded(checkout: tCheckout));

          await tester.pumpWidget(createWidgetUnderTest());
          await tester.pumpAndSettle();

          final cartItemCard = tester.widget<CartItemCard>(
            find.byType(CartItemCard).first,
          );
          expect(cartItemCard.showActions, isFalse);

          expect(find.text('Remove'), findsNothing);
          expect(find.text('Save for later'), findsNothing);
        },
      );
    });
  });
}
