part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required PagingState<int, OrderItemEntity> pagingState,
    @Default(false) bool isLoading,
    OrderDetailEntity? orderDetails,
    OrderCancelEntity? cancelledOrder,
    String? successMessage,
    String? errorMessage,
  }) = _OrderState;
}
