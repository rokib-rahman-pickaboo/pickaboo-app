import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/domain/entity/order/order_cancel_entity.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/domain/entity/order/order_item_entity.dart';
import 'package:pickaboo/domain/repository/user_profile_repository.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

@injectable
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final UserProfileRepository _repository;

  OrderBloc(this._repository) : super(OrderState(pagingState: PagingState())) {
    on<_GetOrders>(_onGetOrders);
    on<_Refresh>(_onRefresh);
    on<_LoadOrderDetails>(_onLoadOrderDetails);
    on<_CancelOrder>(_onCancelOrder);
    on<_Reorder>(_onReorder);
    on<_ClearCancellation>(_onClearCancellation);
  }

  void _onClearCancellation(
    _ClearCancellation event,
    Emitter<OrderState> emit,
  ) {
    emit(
      state.copyWith(
        cancelledOrder: null,
        successMessage: null,
        errorMessage: null,
      ),
    );
  }

  Future<void> _onGetOrders(_GetOrders event, Emitter<OrderState> emit) async {
    final currentState = state.pagingState;
    final int nextPageKey = (currentState.keys?.last ?? 0) + 1;

    if (currentState.isLoading || !currentState.hasNextPage) {
      return;
    }

    emit(
      state.copyWith(
        pagingState: currentState.copyWith(isLoading: true),
        errorMessage: null,
      ),
    );

    final result = await _repository.getOrders(
      currentPage: nextPageKey,
      limit: 10,
    );

    result.fold(
      (error) => emit(
        state.copyWith(
          pagingState: currentState.copyWith(isLoading: false, error: error),
          errorMessage: error.message,
        ),
      ),
      (orderListEntity) {
        final newItems = orderListEntity.items;
        final bool isLastPage = newItems.isEmpty || newItems.length < 10;

        emit(
          state.copyWith(
            pagingState: currentState.copyWith(
              isLoading: false,
              hasNextPage: !isLastPage,
              pages: [...currentState.pages ?? [], newItems],
              keys: [...currentState.keys ?? [], nextPageKey],
            ),
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> _onRefresh(_Refresh event, Emitter<OrderState> emit) async {
    emit(
      state.copyWith(
        pagingState: PagingState(),
        errorMessage: null,
        successMessage: null,
      ),
    );
    add(const OrderEvent.getOrders());
  }

  Future<void> _onLoadOrderDetails(
    _LoadOrderDetails event,
    Emitter<OrderState> emit,
  ) async {
    emit(
      state.copyWith(errorMessage: null, orderDetails: null, isLoading: true),
    );

    final result = await _repository.getOrderDetails(event.orderId);

    result.fold(
      (error) =>
          emit(state.copyWith(errorMessage: error.message, isLoading: false)),
      (orderDetails) =>
          emit(state.copyWith(orderDetails: orderDetails, isLoading: false)),
    );
  }

  Future<void> _onCancelOrder(
    _CancelOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(
      state.copyWith(errorMessage: null, successMessage: null, isLoading: true),
    );

    final result = await _repository.cancelOrder(
      orderId: event.orderId,
      note: event.note,
      reason: event.reason,
    );

    result.fold(
      (error) =>
          emit(state.copyWith(errorMessage: error.message, isLoading: false)),
      (cancelledOrder) {
        final enrichedItems = cancelledOrder.items.map((item) {
          final detailItem = state.orderDetails?.items.firstWhere(
            (detail) => detail.itemId == item.itemId,
            orElse: () => const OrderItemDetailEntity(
              itemId: 0,
              itemName: '',
              productId: 0,
              productSlug: '',
              productCategoryIds: [],
              productCategoryNames: [],
              qty: 0,
              regularPrice: 0,
              finalPrice: 0,
              discount: 0,
            ),
          );

          return OrderCancelItemEntity(
            itemId: item.itemId,
            name: item.name,
            sku: item.sku,
            qtyOrdered: item.qtyOrdered,
            price: item.price,
            image: detailItem?.image,
            soldBy: detailItem?.soldBy,
          );
        }).toList();

        final updatedCancelledOrder = OrderCancelEntity(
          entityId: cancelledOrder.entityId,
          incrementId: cancelledOrder.incrementId,
          state: cancelledOrder.state,
          status: cancelledOrder.status,
          createdAt: cancelledOrder.createdAt,
          grandTotal: cancelledOrder.grandTotal,
          items: enrichedItems,
          statusHistories: cancelledOrder.statusHistories,
        );

        emit(
          state.copyWith(
            successMessage: 'Order cancelled successfully',
            cancelledOrder: updatedCancelledOrder,
            isLoading: false,
          ),
        );
        add(const OrderEvent.refresh());
        add(OrderEvent.loadOrderDetails(event.orderId));
      },
    );
  }

  Future<void> _onReorder(_Reorder event, Emitter<OrderState> emit) async {
    emit(
      state.copyWith(errorMessage: null, successMessage: null, isLoading: true),
    );

    final result = await _repository.reorder(event.orderId);

    result.fold(
      (error) =>
          emit(state.copyWith(errorMessage: error.message, isLoading: false)),
      (_) {
        emit(
          state.copyWith(
            successMessage: 'Items added to cart',
            isLoading: false,
          ),
        );
        add(const OrderEvent.refresh());
      },
    );
  }
}
