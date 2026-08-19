part of 'place_picker_bloc.dart';

@freezed
class PlacePickerEvent with _$PlacePickerEvent {
  const factory PlacePickerEvent.search({required String query}) = _Search;

  const factory PlacePickerEvent.reverseGeocode({
    required double latitude,
    required double longitude,
  }) = _ReverseGeocode;

  const factory PlacePickerEvent.clearSuggestions() = _ClearSuggestions;

  const factory PlacePickerEvent.clearSelectedPlace() = _ClearSelectedPlace;
}
