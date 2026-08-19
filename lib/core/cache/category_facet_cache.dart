import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';

class CategoryFacets {
  final List<FilterAttributeEntity> attributes;
  final List<SortOptionEntity> sortOptions;

  final DateTime fetchedAt;

  const CategoryFacets({
    required this.attributes,
    required this.sortOptions,
    required this.fetchedAt,
  });

  bool get isEmpty => attributes.isEmpty && sortOptions.isEmpty;

  bool get isNotEmpty => !isEmpty;
}

@lazySingleton
class CategoryFacetCache {
  static const int maxEntries = 20;

  static const Duration defaultTtl = Duration(minutes: 30);

  final Map<String, CategoryFacets> _entries = {};

  CategoryFacets? read(Iterable<String> keys) {
    for (final key in keys) {
      if (key.isEmpty) continue;

      final entry = _entries[key];
      if (entry == null) continue;

      if (DateTime.now().difference(entry.fetchedAt) > defaultTtl) {
        _entries.remove(key);
        continue;
      }

      _entries.remove(key);
      _entries[key] = entry;
      return entry;
    }
    return null;
  }

  void save(
    Iterable<String> keys, {
    required List<FilterAttributeEntity> attributes,
    required List<SortOptionEntity> sortOptions,
  }) {
    if (attributes.isEmpty && sortOptions.isEmpty) return;

    final entry = CategoryFacets(
      attributes: List<FilterAttributeEntity>.unmodifiable(attributes),
      sortOptions: List<SortOptionEntity>.unmodifiable(sortOptions),
      fetchedAt: DateTime.now(),
    );

    for (final key in keys) {
      if (key.isEmpty) continue;
      _entries.remove(key);
      _entries[key] = entry;
    }

    while (_entries.length > maxEntries) {
      _entries.remove(_entries.keys.first);
    }
  }

  void clearAll() => _entries.clear();
}
