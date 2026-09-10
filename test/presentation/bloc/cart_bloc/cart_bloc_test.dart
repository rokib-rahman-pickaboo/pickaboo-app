import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/repository/cart_repository.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

class MockCartRepository extends Mock implements CartRepository {}

class MockAuthCacheManager extends Mock implements AuthCacheManager {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  late CartBloc cartBloc;
  late MockCartRepository mockRepository;
  late MockAuthCacheManager mockCacheManager;
  late MockAnalyticsService mockAnalytics;

  setUp(() {
    mockRepository = MockCartRepository();
    mockCacheManager = MockAuthCacheManager();
    mockAnalytics = MockAnalyticsService();

    // Default mock behavior for analytics
    when(
      () => mockAnalytics.logAddToCart(
        id: any(named: 'id'),
        name: any(named: 'name'),
        price: any(named: 'price'),
        quantity: any(named: 'quantity'),
      ),
    ).thenAnswer((_) async {});

    when(
      () => mockRepository.getCartCheckout(),
    ).thenAnswer((_) async => const Left(AppErrorEntity(message: 'No checkout')));

    when(
      () => mockRepository.applyRewardPoints(
        cartId: any(named: 'cartId'),
        pointAmount: any(named: 'pointAmount'),
      ),
    ).thenAnswer((_) async => const Right(true));

    cartBloc = CartBloc(mockRepository, mockCacheManager, mockAnalytics);
  });

  tearDown(() {
    cartBloc.close();
  });

  const tCartEntity = CartEntity(
    id: '1',
    itemsCount: 0,
    items: [],
    subtotal: 0,
    grandTotal: 0,
    discountAmount: 0,
    shippingAmount: 0,
    taxAmount: 0,
    couponCode: '',
  );

  const tCartItem = CartItemEntity(
    itemId: 1,
    sku: 'SKU1',
    qty: 1,
    name: 'Product 1',
    price: 100,
    productType: 'simple',
    quoteId: '1',
    rowTotal: 100,
    regularPrice: 100,
    specialPrice: 100,
    discount: '0',
    imageUrl: 'image.jpg',
    productUrlKey: 'p1',
    productId: 101,
    brand: 'Brand',
    stockAvailable: true,
  );

  final tCartWithItems = CartEntity(
    id: '1',
    itemsCount: 1,
    items: [tCartItem],
    subtotal: 100,
    grandTotal: 100,
    discountAmount: 0,
    shippingAmount: 0,
    taxAmount: 0,
    couponCode: '',
  );

  group('CartBloc', () {
    test('initial state should be CartState.initial()', () {
      expect(cartBloc.state, const CartState.initial());
    });

    group('GetCart', () {
      blocTest<CartBloc, CartState>(
        'emits [loading, empty] when GetCart is added and repository returns empty cart',
        build: () {
          when(
            () => mockCacheManager.getToken(),
          ).thenAnswer((_) async => 'token');
          when(
            () => mockRepository.getBasicCart(),
          ).thenAnswer((_) async => const Right(tCartEntity));
          when(
            () =>
                mockCacheManager.setAuthQuoteId(quoteId: any(named: 'quoteId')),
          ).thenAnswer((_) async {});
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.getCart()),
        expect: () => [const CartState.loading(), const CartState.empty()],
      );

      blocTest<CartBloc, CartState>(
        'emits [loading, loaded] when GetCart is added and repository returns cart with items',
        build: () {
          when(
            () => mockCacheManager.getToken(),
          ).thenAnswer((_) async => 'token');
          when(
            () => mockRepository.getBasicCart(),
          ).thenAnswer((_) async => Right(tCartWithItems));
          when(
            () =>
                mockCacheManager.setAuthQuoteId(quoteId: any(named: 'quoteId')),
          ).thenAnswer((_) async {});
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.getCart()),
        expect: () => [
          const CartState.loading(),
          CartState.loaded(tCartWithItems),
        ],
      );
    });

    group('AddToCart', () {
      blocTest<CartBloc, CartState>(
        'emits [loading, itemAdded, loaded] when AddToCart is successful',
        build: () {
          when(
            () => mockRepository.addItem(
              sku: any(named: 'sku'),
              qty: any(named: 'qty'),
              quoteId: any(named: 'quoteId'),
              productType: any(named: 'productType'),
              configurableOptions: any(named: 'configurableOptions'),
            ),
          ).thenAnswer((_) async => const Right(tCartItem));
          when(
            () => mockRepository.getBasicCart(),
          ).thenAnswer((_) async => Right(tCartWithItems));
          return cartBloc;
        },
        act: (bloc) => bloc.add(
          const CartEvent.addToCart(
            sku: 'SKU1',
            qty: 1,
            quoteId: '1',
            productType: 'simple',
          ),
        ),
        expect: () => [
          const CartState.loading(),
          CartState.itemAdded(
            cart: tCartWithItems,
            message: 'Item added to cart',
          ),
          CartState.loaded(tCartWithItems),
        ],
      );
    });

    group('UpdateItemQuantity', () {
      blocTest<CartBloc, CartState>(
        'emits [loading, loaded, operationInProgress, loaded] when UpdateItemQuantity is successful',
        build: () {
          when(
            () => mockCacheManager.getToken(),
          ).thenAnswer((_) async => 'token');
          when(
            () => mockRepository.getBasicCart(),
          ).thenAnswer((_) async => Right(tCartWithItems));
          when(
            () =>
                mockCacheManager.setAuthQuoteId(quoteId: any(named: 'quoteId')),
          ).thenAnswer((_) async {});
          when(
            () => mockRepository.updateItem(
              itemId: any(named: 'itemId'),
              qty: any(named: 'qty'),
              quoteId: any(named: 'quoteId'),
            ),
          ).thenAnswer((_) async => const Right(tCartItem));
          return cartBloc;
        },
        act: (bloc) async {
          bloc.add(const CartEvent.getCart());
          await Future.delayed(const Duration(milliseconds: 10));
          bloc.add(
            const CartEvent.updateItemQuantity(itemId: 1, qty: 2, quoteId: '1'),
          );
        },
        expect: () => [
          const CartState.loading(),
          CartState.loaded(tCartWithItems),
          CartState.operationInProgress(
            cart: tCartWithItems,
            operation: 'updating_quantity',
          ),
          CartState.loaded(tCartWithItems),
        ],
      );
    });

    group('RemoveItem', () {
      blocTest<CartBloc, CartState>(
        'emits [loading, loaded, operationInProgress, empty] when RemoveItem is successful',
        build: () {
          int callCount = 0;
          when(
            () => mockCacheManager.getToken(),
          ).thenAnswer((_) async => 'token');
          when(() => mockRepository.getBasicCart()).thenAnswer((_) async {
            if (callCount == 0) {
              callCount++;
              return Right(tCartWithItems);
            }
            return const Right(tCartEntity);
          });
          when(
            () =>
                mockCacheManager.setAuthQuoteId(quoteId: any(named: 'quoteId')),
          ).thenAnswer((_) async {});
          when(
            () => mockRepository.deleteItem(itemId: any(named: 'itemId')),
          ).thenAnswer((_) async => const Right(true));
          return cartBloc;
        },
        act: (bloc) async {
          bloc.add(const CartEvent.getCart());
          await Future.delayed(const Duration(milliseconds: 10));
          bloc.add(const CartEvent.removeItem(itemId: 1));
        },
        expect: () => [
          const CartState.loading(),
          CartState.loaded(tCartWithItems),
          CartState.operationInProgress(
            cart: tCartWithItems,
            operation: 'removing_item',
          ),
          const CartState.empty(),
        ],
      );
    });
  });
}
