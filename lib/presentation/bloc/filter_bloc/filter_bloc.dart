import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/model/filter/filter_models.dart';

part 'filter_event.dart';
part 'filter_state.dart';
part 'filter_bloc.freezed.dart';

@injectable
class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState.initial()) {
    on<_FilterLoadRequested>(_onFilterLoadRequested);
    on<_FilterOptionToggled>(_onFilterOptionToggled);
    on<_FilterCategoryChanged>(_onFilterCategoryChanged);
    on<_FiltersClearedEvent>(_onFiltersCleared);
    on<_FiltersAppliedEvent>(_onFiltersApplied);
  }

  void _onFilterLoadRequested(
    _FilterLoadRequested event,
    Emitter<FilterState> emit,
  ) {
    if (event.categories.isEmpty) {
      emit(const FilterState.initial());
      return;
    }

    emit(
      FilterState.loaded(
        categories: event.categories,
        selectedCategoryCode: event.categories.first.filterCode,
        selectionCounts: _calculateSelectionCounts(event.categories),
      ),
    );
  }

  void _onFilterOptionToggled(
    _FilterOptionToggled event,
    Emitter<FilterState> emit,
  ) {
    state.maybeWhen(
      loaded: (categories, selectedCategoryCode, selectionCounts) {
        final updatedCategories = categories.map((category) {
          if (category.filterCode == event.filterCode) {
            if (event.filterCode == 'price') {
              return category.copyWith(
                items: category.items.map((item) {
                  return item.copyWith(
                    isSelected: item.value == event.option.value
                        ? !item.isSelected
                        : false,
                  );
                }).toList(),
              );
            }
            else {
              return category.copyWith(
                items: category.items.map((item) {
                  if (item.value == event.option.value) {
                    return item.copyWith(isSelected: !item.isSelected);
                  }
                  return item;
                }).toList(),
              );
            }
          }
          return category;
        }).toList();

        emit(
          FilterState.loaded(
            categories: updatedCategories,
            selectedCategoryCode: selectedCategoryCode,
            selectionCounts: _calculateSelectionCounts(updatedCategories),
          ),
        );
      },
      orElse: () {},
    );
  }

  void _onFilterCategoryChanged(
    _FilterCategoryChanged event,
    Emitter<FilterState> emit,
  ) {
    state.maybeWhen(
      loaded: (categories, selectedCategoryCode, selectionCounts) {
        emit(
          FilterState.loaded(
            categories: categories,
            selectedCategoryCode: event.filterCode,
            selectionCounts: selectionCounts,
          ),
        );
      },
      orElse: () {},
    );
  }

  void _onFiltersCleared(
    _FiltersClearedEvent event,
    Emitter<FilterState> emit,
  ) {
    state.maybeWhen(
      loaded: (categories, selectedCategoryCode, selectionCounts) {
        final clearedCategories = categories.map((category) {
          return category.copyWith(
            items: category.items.map((item) {
              return item.copyWith(isSelected: false);
            }).toList(),
          );
        }).toList();

        emit(
          FilterState.loaded(
            categories: clearedCategories,
            selectedCategoryCode: selectedCategoryCode,
            selectionCounts: {},
          ),
        );
      },
      orElse: () {},
    );
  }

  void _onFiltersApplied(
    _FiltersAppliedEvent event,
    Emitter<FilterState> emit,
  ) {
    state.maybeWhen(
      loaded: (categories, selectedCategoryCode, selectionCounts) {
        emit(const FilterState.applying());
      },
      orElse: () {},
    );
  }

  Map<String, int> _calculateSelectionCounts(List<FilterCategory> categories) {
    final counts = <String, int>{};
    for (final category in categories) {
      final selectedCount = category.items
          .where((item) => item.isSelected)
          .length;
      if (selectedCount > 0) {
        counts[category.filterCode] = selectedCount;
      }
    }
    return counts;
  }

  Map<String, List<String>> getSelectedFilters() {
    return state.maybeWhen(
      loaded: (categories, selectedCategoryCode, selectionCounts) {
        final selectedFilters = <String, List<String>>{};

        for (final category in categories) {
          final selectedValues = category.items
              .where((item) => item.isSelected)
              .map((item) => item.value)
              .toList();

          if (selectedValues.isNotEmpty) {
            selectedFilters[category.filterCode] = selectedValues;
          }
        }

        return selectedFilters;
      },
      orElse: () => {},
    );
  }
}
