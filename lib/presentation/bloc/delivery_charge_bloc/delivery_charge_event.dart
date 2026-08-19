part of 'delivery_charge_bloc.dart';

@freezed
class DeliveryChargeEvent with _$DeliveryChargeEvent {
  const factory DeliveryChargeEvent.fetch({
    required String productId,
  }) = _Fetch;
}
