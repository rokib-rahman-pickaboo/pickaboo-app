part of 'address_bloc.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.loadCities({required String division}) =
      _LoadCities;
  const factory AddressEvent.loadAreas({required String city}) = _LoadAreas;
}
