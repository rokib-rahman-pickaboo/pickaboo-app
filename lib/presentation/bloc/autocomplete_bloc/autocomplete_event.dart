part of 'autocomplete_bloc.dart';

@freezed
class AutocompleteEvent with _$AutocompleteEvent {
  const factory AutocompleteEvent.fetch({
    required String q,
    @Default(true) bool subArea,
    @Default(true) bool subDistrict,
  }) = _Fetch;

  const factory AutocompleteEvent.clear() = _Clear;
}
