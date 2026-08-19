part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded(CartEntity cart) = _Loaded;
  const factory CartState.empty() = _Empty;

  const factory CartState.operationInProgress({
    required CartEntity cart,
    required String operation,
  }) = _OperationInProgress;

  const factory CartState.itemAdded({
    required CartEntity cart,
    required String message,
  }) = _ItemAdded;

  const factory CartState.couponApplied({
    required CartEntity cart,
    required String couponCode,
  }) = _CouponApplied;

  const factory CartState.couponRemoved({required CartEntity cart}) =
      _CouponRemoved;

  const factory CartState.rewardPointsApplied({
    required CartEntity cart,
    required int pointsUsed,
  }) = _RewardPointsApplied;

  const factory CartState.rewardPointsRemoved({required CartEntity cart}) =
      _RewardPointsRemoved;

  const factory CartState.error({
    required AppErrorEntity error,
    CartEntity? lastCart,
  }) = _Error;
}
