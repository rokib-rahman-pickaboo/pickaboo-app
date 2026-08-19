part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    @Default(false) bool isLoadingCities,
    @Default(false) bool isLoadingAreas,
    @Default([]) List<Map<String, dynamic>> cities,
    @Default([]) List<Map<String, dynamic>> areas,
    String? error,
  }) = _AddressState;

  factory AddressState.initial() => const AddressState();
}
