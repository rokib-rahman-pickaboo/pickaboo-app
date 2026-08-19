part of 'place_picker_bloc.dart';

enum PlacePickerStatus { initial, searching, success, reverseGeocoding, error }

@freezed
class PlacePickerState with _$PlacePickerState {
  const factory PlacePickerState({
    @Default(PlacePickerStatus.initial) PlacePickerStatus status,
    @Default([]) List<PlacePickResultEntity> suggestions,
    PlacePickResultEntity? selectedPlace,
    AppErrorEntity? error,
  }) = _PlacePickerState;
}
