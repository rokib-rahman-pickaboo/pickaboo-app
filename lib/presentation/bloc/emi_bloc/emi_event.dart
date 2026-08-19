part of 'emi_bloc.dart';

@freezed
class EmiEvent with _$EmiEvent {
  const factory EmiEvent.load({required String productId}) = _Load;
}
