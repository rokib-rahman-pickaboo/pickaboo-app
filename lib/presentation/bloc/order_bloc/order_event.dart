part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.getOrders() = _GetOrders;

  const factory OrderEvent.refresh() = _Refresh;

  const factory OrderEvent.loadOrderDetails(String orderId) = _LoadOrderDetails;

  const factory OrderEvent.cancelOrder({
    required String orderId,
    required String note,
    required String reason,
  }) = _CancelOrder;

  const factory OrderEvent.reorder(String orderId) = _Reorder;

  const factory OrderEvent.clearCancellation() = _ClearCancellation;
}
