part of 'filter_bloc.dart';

@freezed
class FilterState with _$FilterState {
  const FilterState._();

  const factory FilterState.initial() = _FilterInitial;

  const factory FilterState.loaded({
    required List<FilterCategory> categories,
    required String selectedCategoryCode,
    @Default({}) Map<String, int> selectionCounts,
  }) = _FilterLoaded;

  const factory FilterState.applying() = _FilterApplying;

  FilterCategory? get selectedCategory {
    return maybeWhen(
      loaded: (categories, selectedCategoryCode, selectionCounts) {
        try {
          return categories.firstWhere(
            (cat) => cat.filterCode == selectedCategoryCode,
          );
        } catch (_) {
          return categories.isNotEmpty ? categories.first : null;
        }
      },
      orElse: () => null,
    );
  }
}
