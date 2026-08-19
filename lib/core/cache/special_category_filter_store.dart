import 'package:injectable/injectable.dart';

class SpecialCategoryFilterSelection {
  final Map<String, List<String>> filters;
  final String? sort;

  const SpecialCategoryFilterSelection({required this.filters, this.sort});

  bool get isEmpty => filters.isEmpty && sort == null;
}

@lazySingleton
class SpecialCategoryFilterStore {
  final Map<String, SpecialCategoryFilterSelection> _byCategorySlug = {};

  SpecialCategoryFilterSelection? read(String categorySlug) => _byCategorySlug[categorySlug];

  void save(
    String categorySlug, {
    Map<String, List<String>>? filters,
    String? sort,
  }) {
    final existing = _byCategorySlug[categorySlug];
    final nextFilters = filters ?? existing?.filters ?? const {};
    final nextSort = sort ?? existing?.sort;

    _byCategorySlug[categorySlug] = SpecialCategoryFilterSelection(
      filters: {
        for (final entry in nextFilters.entries)
          entry.key: List<String>.from(entry.value),
      },
      sort: nextSort,
    );
  }

  void clear(String categorySlug) => _byCategorySlug.remove(categorySlug);

  void clearAll() => _byCategorySlug.clear();
}
