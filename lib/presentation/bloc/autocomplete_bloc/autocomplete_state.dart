part of 'autocomplete_bloc.dart';

enum AutocompleteStatus { initial, loading, success, error }

@freezed
class AutocompleteState with _$AutocompleteState {
  const factory AutocompleteState({
    @Default(AutocompleteStatus.initial) AutocompleteStatus status,
    @Default([]) List<PlacePickResultEntity> suggestions,
    AppErrorEntity? error,
  }) = _AutocompleteState;
}
