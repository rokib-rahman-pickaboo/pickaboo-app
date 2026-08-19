part of 'delivery_charge_bloc.dart';

@freezed
class DeliveryChargeState with _$DeliveryChargeState {
  const factory DeliveryChargeState.initial() = _Initial;
  const factory DeliveryChargeState.loading() = _Loading;
  const factory DeliveryChargeState.loaded(DeliveryChargeEntity deliveryCharge) = _Loaded;
  const factory DeliveryChargeState.error(AppErrorEntity error) = _Error;
}
