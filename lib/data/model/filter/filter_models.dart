import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_models.freezed.dart';
part 'filter_models.g.dart';

@freezed
class FilterCategory with _$FilterCategory {
  const factory FilterCategory({
    required String filterCode,
    required String filterName,
    required List<FilterOption> items,
  }) = _FilterCategory;

  factory FilterCategory.fromJson(Map<String, dynamic> json) =>
      _$FilterCategoryFromJson(json);
}

@freezed
class FilterOption with _$FilterOption {
  const factory FilterOption({
    required String value,
    required String label,
    @Default(false) bool isSelected,
    String? icon,
    int? count,
  }) = _FilterOption;

  factory FilterOption.fromJson(Map<String, dynamic> json) =>
      _$FilterOptionFromJson(json);
}

@freezed
class AppliedFilters with _$AppliedFilters {
  const factory AppliedFilters({
    @Default({}) Map<String, List<String>> filters,
  }) = _AppliedFilters;

  factory AppliedFilters.fromJson(Map<String, dynamic> json) =>
      _$AppliedFiltersFromJson(json);
}
