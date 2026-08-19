part of 'filter_bloc.dart';

@freezed
class FilterEvent with _$FilterEvent {
  const factory FilterEvent.loadRequested({
    required List<FilterCategory> categories,
  }) = _FilterLoadRequested;

  const factory FilterEvent.optionToggled({
    required String filterCode,
    required FilterOption option,
  }) = _FilterOptionToggled;

  const factory FilterEvent.categoryChanged({required String filterCode}) =
      _FilterCategoryChanged;

  const factory FilterEvent.cleared() = _FiltersClearedEvent;

  const factory FilterEvent.applied() = _FiltersAppliedEvent;
}
