import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'package:pickaboo/domain/entity/checkout/shipping_method_entity.dart';
import 'package:pickaboo/domain/repository/cart_repository.dart';
import 'package:pickaboo/presentation/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

class MockCartRepository extends Mock implements CartRepository {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  late CheckoutBloc checkoutBloc;
  late MockCartRepository mockRepository;
  late MockAnalyticsService mockAnalytics;

  setUpAll(() {
    registerFallbackValue(AddressEntity(street: []));
  });

  final tAddress = AddressEntity(
    id: 1,
    firstname: 'John',
    lastname: 'Doe',
    email: 'john@example.com',
    telephone: '123456789',
    street: ['Street 1'],
    city: 'City',
    countryId: 'BD',
    postcode: '1234',
    defaultShipping: true,
  );

  final tCartCheckout = CartCheckoutEntity(
    id: 1,
    isActive: true,
    isVirtual: false,
    items: [],
    itemsCount: 0,
    itemsQty: 0,
    customerIsGuest: false,
    customerNoteNotify: false,
    storeId: 1,
    shippingAddress: tAddress,
    billingAddress: tAddress,
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
    baseCurrencyCode: 'USD',
    quoteCurrencyCode: 'USD',
    itemsQty: 0,
    items: [],
    totalSegments: [],
  );

  final tCheckoutEntity = CheckoutEntity(
    cart: tCartCheckout,
    cartTotals: tCartTotals,
  );

  final tShippingMethod = ShippingMethodEntity(
    carrierCode: 'flatrate',
    methodCode: 'flatrate',
    carrierTitle: 'Flat Rate',
    methodTitle: 'Fixed',
    amount: 50,
    baseAmount: 50,
    available: true,
    errorMessage: '',
    priceExclTax: 50,
    priceInclTax: 50,
  );

  final tPaymentMethod = PaymentMethodEntity(code: 'bkash', title: 'bKash', subtitle: '');

  final tPaymentMethodsEntity = PaymentMethodsEntity(
    paymentMethods: [tPaymentMethod],
    totals: tCartTotals,
  );

  setUp(() {
    mockRepository = MockCartRepository();
    mockAnalytics = MockAnalyticsService();

    // Default mock behavior for analytics
    when(
      () => mockAnalytics.logPurchase(
        orderId: any(named: 'orderId'),
        total: any(named: 'total'),
        items: any(named: 'items'),
      ),
    ).thenAnswer((_) async {});

    when(
      () => mockRepository.getPaymentInfo(
        cartId: any(named: 'cartId'),
      ),
    ).thenAnswer((_) async => Right(tPaymentMethodsEntity));

    checkoutBloc = CheckoutBloc(mockRepository, mockAnalytics);
  });

  tearDown(() {
    checkoutBloc.close();
  });

  group('CheckoutBloc', () {
    test('initial state should be CheckoutState.initial()', () {
      expect(checkoutBloc.state, const CheckoutState.initial());
    });

    group('LoadCheckout', () {
      blocTest<CheckoutBloc, CheckoutState>(
        'emits [loading, checkoutLoaded] sequence when LoadCheckout is successful',
        build: () {
          when(
            () => mockRepository.getCartCheckout(),
          ).thenAnswer((_) async => Right(tCheckoutEntity));
          when(
            () => mockRepository.estimateShippingMethods(
              address: any(named: 'address'),
            ),
          ).thenAnswer((_) async => Right([tShippingMethod]));
          when(
            () => mockRepository.saveShippingInformation(
              address: any(named: 'address'),
              carrierCode: any(named: 'carrierCode'),
              methodCode: any(named: 'methodCode'),
              billingAddress: any(named: 'billingAddress'),
            ),
          ).thenAnswer((_) async => Right(tPaymentMethodsEntity));
          return checkoutBloc;
        },
        act: (bloc) => bloc.add(const CheckoutEvent.loadCheckout()),
        // Loading the checkout is a five-step sequence, not four: after the
        // cart lands it re-enters loading (carrying the previous checkout)
        // while shipping methods are estimated, then emits once for the
        // selected shipping method and once more for the payment methods.
        expect: () => [
          isA<CheckoutState>().having(
            (s) => s.maybeMap(loading: (_) => true, orElse: () => false),
            'loading',
            true,
          ),
          isA<CheckoutState>().having(
            (s) => s.maybeMap(
              checkoutLoaded: (l) => l.checkout.cart.id == 1,
              orElse: () => false,
            ),
            'cart loaded',
            true,
          ),
          isA<CheckoutState>().having(
            (s) => s.maybeMap(loading: (_) => true, orElse: () => false),
            'loading while estimating shipping',
            true,
          ),
          isA<CheckoutState>().having(
            (s) => s.maybeMap(
              checkoutLoaded: (l) =>
                  l.selectedShippingMethodCode == 'flatrate_flatrate',
              orElse: () => false,
            ),
            'shipping method selected',
            true,
          ),
          isA<CheckoutState>().having(
            (s) => s.maybeMap(
              checkoutLoaded: (l) => l.availablePaymentMethods.isNotEmpty,
              orElse: () => false,
            ),
            'payment methods available',
            true,
          ),
        ],
      );

      blocTest<CheckoutBloc, CheckoutState>(
        'emits [loading, error] when LoadCheckout fails',
        build: () {
          when(() => mockRepository.getCartCheckout()).thenAnswer(
            (_) async => const Left(AppErrorEntity(message: 'Error')),
          );
          return checkoutBloc;
        },
        act: (bloc) => bloc.add(const CheckoutEvent.loadCheckout()),
        expect: () => [isA<CheckoutState>(), isA<CheckoutState>()],
      );
    });

    group('PlaceOrder', () {
      blocTest<CheckoutBloc, CheckoutState>(
        'emits [placingOrder, orderPlaced] when PlaceOrder is successful',
        build: () {
          when(
            () => mockRepository.getCartCheckout(),
          ).thenAnswer((_) async => Right(tCheckoutEntity));
          when(
            () => mockRepository.estimateShippingMethods(
              address: any(named: 'address'),
            ),
          ).thenAnswer((_) async => Right([tShippingMethod]));
          when(
            () => mockRepository.saveShippingInformation(
              address: any(named: 'address'),
              carrierCode: any(named: 'carrierCode'),
              methodCode: any(named: 'methodCode'),
              billingAddress: any(named: 'billingAddress'),
            ),
          ).thenAnswer((_) async => Right(tPaymentMethodsEntity));

          when(
            () => mockRepository.selectPaymentMethod(
              cartId: any(named: 'cartId'),
              method: any(named: 'method'),
            ),
          ).thenAnswer((_) async => const Right(true));
          when(
            () => mockRepository.placeOrder(
              cartId: any(named: 'cartId'),
              paymentMethodCode: any(named: 'paymentMethodCode'),
            ),
          ).thenAnswer((_) async => const Right('10001'));
          return checkoutBloc;
        },
        act: (bloc) async {
          bloc.add(const CheckoutEvent.loadCheckout());
          await Future.delayed(const Duration(milliseconds: 50));
          bloc.add(const CheckoutEvent.placeOrder());
        },
        // loadCheckout emits five states before placeOrder starts.
        skip: 5,
        expect: () => [
          isA<CheckoutState>().having(
            (s) => s.maybeMap(placingOrder: (_) => true, orElse: () => false),
            'placingOrder',
            true,
          ),
          isA<CheckoutState>().having(
            (s) => s.maybeMap(
              orderPlaced: (p) => p.orderId == '10001',
              orElse: () => false,
            ),
            'orderPlaced',
            true,
          ),
        ],
      );
    });

    group('ProcessPayment', () {
      blocTest<CheckoutBloc, CheckoutState>(
        'emits navigateToPaymentGateway with exact title "Pickaboo EBL Mastercard" when Pickaboo EBL Mastercard is selected',
        build: () {
          when(
            () => mockRepository.createEblOrder(orderId: '12345'),
          ).thenAnswer(
            (_) async => const Right({
              'url': 'https://gateway.ebl.com.bd',
              'formFields': {'field1': 'val1'},
            }),
          );
          return checkoutBloc;
        },
        act: (bloc) => bloc.add(
          const CheckoutEvent.processPayment(
            orderId: '12345',
            paymentMethod: 'pickabooeblmastercard',
            paymentGateway: 'eblbank',
          ),
        ),
        expect: () => [
          isA<CheckoutState>().having(
            (s) => s.maybeMap(paymentProcessing: (_) => true, orElse: () => false),
            'paymentProcessing',
            true,
          ),
          isA<CheckoutState>().having(
            (s) => s.maybeMap(
              navigateToPaymentGateway: (g) =>
                  g.title == 'Pickaboo EBL Mastercard' &&
                  g.url == 'https://gateway.ebl.com.bd',
              orElse: () => false,
            ),
            'navigateToPaymentGateway',
            true,
          ),
        ],
      );

      blocTest<CheckoutBloc, CheckoutState>(
        'emits navigateToPaymentGateway with exact title "Visa/Master" for visamaster digital order',
        build: () {
          when(
            () => mockRepository.createDigitalOrder(
              orderId: '12345',
              paymentMethodCode: 'visamaster',
              paymentGateway: 'mtb',
              returnPath: any(named: 'returnPath'),
            ),
          ).thenAnswer(
            (_) async => const Right('https://gateway.mtb.com.bd'),
          );
          return checkoutBloc;
        },
        act: (bloc) => bloc.add(
          const CheckoutEvent.processPayment(
            orderId: '12345',
            paymentMethod: 'visamaster',
            paymentGateway: 'mtb',
          ),
        ),
        expect: () => [
          isA<CheckoutState>().having(
            (s) => s.maybeMap(paymentProcessing: (_) => true, orElse: () => false),
            'paymentProcessing',
            true,
          ),
          isA<CheckoutState>().having(
            (s) => s.maybeMap(
              navigateToPaymentGateway: (g) =>
                  g.title == 'Visa/Master' &&
                  g.url == 'https://gateway.mtb.com.bd',
              orElse: () => false,
            ),
            'navigateToPaymentGateway',
            true,
          ),
        ],
      );
    });
  });
}
