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

/// Customer Order Management BLoC.
///
/// Coordinates order list pagination, order details retrieval, cancellation workflows,
/// and instant reordering.
///
/// ### Architectural Highlights:
/// - **SWR (Stale-While-Revalidate) for Page 1:** Automatically serves locally cached
///   first-page orders synchronously (~2ms) via [UserProfileRepository.getCachedFirstPageOrders],
///   eliminating skeleton loader flashes when navigating to Order History, while silently
///   fetching fresh orders in the background.
/// - **Paging Resilience:** Built on [PagingState] compatible with `infinite_scroll_pagination`.
///   Network errors on subsequent pages preserve already loaded items without resetting the list.
/// - **Order Cancellation Metadata Enrichment:** When an order is cancelled, the backend
///   response omits item visual metadata (product thumbnails, vendor `soldBy`).
///   [_onCancelOrder] enriches the cancelled entity with image and vendor details
///   from [state.orderDetails] so cancellation screens display full UI details.
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

  /// Clears cancellation feedback and transient entity state after modal dismissal.
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

  /// Handles paginated order fetching with Page 1 SWR cache support.
  ///
  /// Page 1: Emits cached orders immediately if available, then replaces with authoritative remote data.
  /// Subsequent pages: Appends new orders to existing pages in [PagingState].
  Future<void> _onGetOrders(_GetOrders event, Emitter<OrderState> emit) async {
    final currentState = state.pagingState;
    final int nextPageKey = (currentState.keys?.last ?? 0) + 1;

    if (currentState.isLoading || !currentState.hasNextPage) {
      return;
    }

    // SWR for Page 1: Serve cached orders immediately (~2ms)
    if (nextPageKey == 1 && (currentState.pages == null || currentState.pages!.isEmpty)) {
      final cached = _repository.getCachedFirstPageOrders();
      if (cached != null && cached.items.isNotEmpty) {
        emit(
          state.copyWith(
            pagingState: PagingState(
              pages: [cached.items],
              keys: const [1],
              hasNextPage: cached.items.length >= 10,
              isLoading: true,
            ),
            errorMessage: null,
          ),
        );
      } else {
        emit(
          state.copyWith(
            pagingState: currentState.copyWith(isLoading: true),
            errorMessage: null,
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          pagingState: currentState.copyWith(isLoading: true),
          errorMessage: null,
        ),
      );
    }

    final result = await _repository.getOrders(
      currentPage: nextPageKey,
      limit: 10,
    );

    result.fold(
      (error) {
        final hasExistingItems = state.pagingState.pages?.isNotEmpty == true &&
            state.pagingState.pages!.any((p) => p.isNotEmpty);
        if (hasExistingItems) {
          emit(
            state.copyWith(
              pagingState: state.pagingState.copyWith(isLoading: false),
            ),
          );
        } else {
          emit(
            state.copyWith(
              pagingState: currentState.copyWith(isLoading: false, error: error),
              errorMessage: error.message,
            ),
          );
        }
      },
      (orderListEntity) {
        final newItems = orderListEntity.items;
        final bool isLastPage = newItems.isEmpty || newItems.length < 10;

        if (nextPageKey == 1) {
          emit(
            state.copyWith(
              pagingState: PagingState(
                isLoading: false,
                hasNextPage: !isLastPage,
                pages: [newItems],
                keys: const [1],
              ),
              errorMessage: null,
            ),
          );
        } else {
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
        }
      },
    );
  }

  /// Resets pagination state and triggers a fresh Page 1 order fetch.
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

  /// Loads full details (shipping, payment method, line item pricing) for a single order.
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

  /// Cancels an order with reason/note, enriching response items with image and vendor metadata.
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

  /// Adds items from a past order back into active cart.
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
      },
    );
  }
}
