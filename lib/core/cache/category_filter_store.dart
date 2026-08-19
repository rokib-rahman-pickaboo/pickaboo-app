import 'package:injectable/injectable.dart';

class CategoryFilterSelection {
  final Map<String, List<String>> filters;
  final String? sort;

  const CategoryFilterSelection({required this.filters, this.sort});

  bool get isEmpty => filters.isEmpty && sort == null;
}

@lazySingleton
class CategoryFilterStore {
  final Map<String, CategoryFilterSelection> _byCategoryKey = {};

  CategoryFilterSelection? read(String categoryKey) => _byCategoryKey[categoryKey];

  void save(
    String categoryKey, {
    Map<String, List<String>>? filters,
    String? sort,
  }) {
    final existing = _byCategoryKey[categoryKey];
    final nextFilters = filters ?? existing?.filters ?? const {};
    final nextSort = sort ?? existing?.sort;

    _byCategoryKey[categoryKey] = CategoryFilterSelection(
      filters: {
        for (final entry in nextFilters.entries)
          entry.key: List<String>.from(entry.value),
      },
      sort: nextSort,
    );
  }

  void clear(String categoryKey) => _byCategoryKey.remove(categoryKey);

  void clearAll() => _byCategoryKey.clear();
}
