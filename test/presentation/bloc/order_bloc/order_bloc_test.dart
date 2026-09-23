import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/order/order_item_entity.dart';
import 'package:pickaboo/domain/entity/order/order_list_entity.dart';
import 'package:pickaboo/domain/repository/user_profile_repository.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';

class MockUserProfileRepository extends Mock implements UserProfileRepository {}

void main() {
  late OrderBloc bloc;
  late MockUserProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockUserProfileRepository();
    bloc = OrderBloc(mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('OrderBloc SWR Tests', () {
    const tCachedOrderItem = OrderItemEntity(
      orderId: 101,
      orderNumber: 'ORD-101',
      createdAt: '2026-09-01',
      state: 'complete',
      status: 'Processing',
      subtotal: 1000,
      discountAmount: 0,
      shipping: 50,
      grandtotal: 1050,
      currencyCode: 'BDT',
      remoteIp: '127.0.0.1',
      paymentMode: 'Online',
      paymentMethod: 'bKash',
    );

    const tFreshOrderItem = OrderItemEntity(
      orderId: 101,
      orderNumber: 'ORD-101',
      createdAt: '2026-09-01',
      state: 'complete',
      status: 'Shipped',
      subtotal: 1000,
      discountAmount: 0,
      shipping: 50,
      grandtotal: 1050,
      currencyCode: 'BDT',
      remoteIp: '127.0.0.1',
      paymentMode: 'Online',
      paymentMethod: 'bKash',
    );

    const tCachedOrderList = OrderListEntity(
      customerId: 1,
      totalOrdersCount: 1,
      items: [tCachedOrderItem],
    );

    const tFreshOrderList = OrderListEntity(
      customerId: 1,
      totalOrdersCount: 1,
      items: [tFreshOrderItem],
    );

    test('initial state has empty PagingState', () {
      expect(bloc.state.pagingState.pages, isNull);
      expect(bloc.state.pagingState.keys, isNull);
    });

    blocTest<OrderBloc, OrderState>(
      'SWR: emits cached page 1 orders immediately, then updates with fresh network orders',
      build: () {
        when(() => mockRepository.getCachedFirstPageOrders())
            .thenReturn(tCachedOrderList);
        when(() => mockRepository.getOrders(currentPage: 1, limit: 10))
            .thenAnswer((_) async => const Right(tFreshOrderList));
        return bloc;
      },
      act: (bloc) => bloc.add(const OrderEvent.getOrders()),
      expect: () => [
        OrderState(
          pagingState: PagingState(
            pages: const [
              [tCachedOrderItem],
            ],
            keys: const [1],
            hasNextPage: false,
            isLoading: true,
          ),
          errorMessage: null,
        ),
        OrderState(
          pagingState: PagingState(
            pages: const [
              [tFreshOrderItem],
            ],
            keys: const [1],
            hasNextPage: false,
            isLoading: false,
          ),
          errorMessage: null,
        ),
      ],
      verify: (_) {
        verify(() => mockRepository.getCachedFirstPageOrders()).called(1);
        verify(() => mockRepository.getOrders(currentPage: 1, limit: 10)).called(1);
      },
    );

    blocTest<OrderBloc, OrderState>(
      'SWR: emits cached orders immediately and preserves them if network fails',
      build: () {
        when(() => mockRepository.getCachedFirstPageOrders())
            .thenReturn(tCachedOrderList);
        when(() => mockRepository.getOrders(currentPage: 1, limit: 10))
            .thenAnswer((_) async => const Left(AppErrorEntity(message: 'Network error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const OrderEvent.getOrders()),
      expect: () => [
        OrderState(
          pagingState: PagingState(
            pages: const [
              [tCachedOrderItem],
            ],
            keys: const [1],
            hasNextPage: false,
            isLoading: true,
          ),
          errorMessage: null,
        ),
        OrderState(
          pagingState: PagingState(
            pages: const [
              [tCachedOrderItem],
            ],
            keys: const [1],
            hasNextPage: false,
            isLoading: false,
          ),
          errorMessage: null,
        ),
      ],
    );

    blocTest<OrderBloc, OrderState>(
      'Cache miss: emits loading, then success when network returns',
      build: () {
        when(() => mockRepository.getCachedFirstPageOrders()).thenReturn(null);
        when(() => mockRepository.getOrders(currentPage: 1, limit: 10))
            .thenAnswer((_) async => const Right(tFreshOrderList));
        return bloc;
      },
      act: (bloc) => bloc.add(const OrderEvent.getOrders()),
      expect: () => [
        OrderState(
          pagingState: PagingState(
            isLoading: true,
          ),
          errorMessage: null,
        ),
        OrderState(
          pagingState: PagingState(
            pages: const [
              [tFreshOrderItem],
            ],
            keys: const [1],
            hasNextPage: false,
            isLoading: false,
          ),
          errorMessage: null,
        ),
      ],
    );

    blocTest<OrderBloc, OrderState>(
      'refresh retains cached first page orders',
      build: () {
        when(() => mockRepository.getCachedFirstPageOrders())
            .thenReturn(tCachedOrderList);
        when(() => mockRepository.getOrders(currentPage: 1, limit: 10))
            .thenAnswer((_) async => const Right(tFreshOrderList));
        return bloc;
      },
      act: (bloc) => bloc.add(const OrderEvent.refresh()),
      expect: () => [
        OrderState(
          pagingState: PagingState(),
          errorMessage: null,
          successMessage: null,
        ),
        OrderState(
          pagingState: PagingState(
            pages: const [
              [tCachedOrderItem],
            ],
            keys: const [1],
            hasNextPage: false,
            isLoading: true,
          ),
          errorMessage: null,
          successMessage: null,
        ),
        OrderState(
          pagingState: PagingState(
            pages: const [
              [tFreshOrderItem],
            ],
            keys: const [1],
            hasNextPage: false,
            isLoading: false,
          ),
          errorMessage: null,
          successMessage: null,
        ),
      ],
    );
  });
}
