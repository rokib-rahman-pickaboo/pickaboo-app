import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/injection.dart';

class CategoryPreloadData {
  final List<ProductEntity> products;
  final List<FilterAttributeEntity> filterAttributes;
  final List<SortOptionEntity> sortOptions;
  final List<CategoryBannerEntity> banners;
  final DateTime cachedAt;

  const CategoryPreloadData({
    required this.products,
    this.filterAttributes = const [],
    this.sortOptions = const [],
    this.banners = const [],
    required this.cachedAt,
  });

  bool get isFresh =>
      DateTime.now().difference(cachedAt) <= CategoryPreloadCache.freshTtl;

  bool get isStale => !isFresh && !isExpired;

  bool get isExpired =>
      DateTime.now().difference(cachedAt) > CategoryPreloadCache.defaultTtl;
}

@lazySingleton
class CategoryPreloadCache {
  static const int maxEntries = 25;
  static const Duration freshTtl = Duration(minutes: 5);
  static const Duration staleTtl = Duration(minutes: 20);
  static const Duration defaultTtl = Duration(minutes: 25);

  final Map<String, CategoryPreloadData> _entries = {};

  static CategoryPreloadCache? _fallbackInstance;

  /// Global accessor with fallback for testing and pre-injection contexts.
  static CategoryPreloadCache get instance {
    if (getIt.isRegistered<CategoryPreloadCache>()) {
      return getIt<CategoryPreloadCache>();
    }
    return _fallbackInstance ??= CategoryPreloadCache();
  }

  /// Checks whether a valid and fresh cache entry exists for [key].
  bool isCategoryFresh(String key) {
    if (key.isEmpty) return false;
    final entry = _entries[key] ?? _entries['cat:$key'] ?? _entries['spec:$key'];
    return entry != null && entry.isFresh;
  }

  /// Reads preloaded data matching any of the provided [keys].
  CategoryPreloadData? read(Iterable<String> keys) {
    final now = DateTime.now();
    for (final key in keys) {
      if (key.isEmpty) continue;
      final entry = _entries[key];
      if (entry == null) continue;

      if (now.difference(entry.cachedAt) > defaultTtl) {
        _entries.remove(key);
        continue;
      }

      // LRU refresh
      _entries.remove(key);
      _entries[key] = entry;
      return entry;
    }
    return null;
  }

  /// Saves preloaded products and optional metadata under the given [keys].
  void save(
    Iterable<String> keys, {
    required List<ProductEntity> products,
    List<FilterAttributeEntity> filterAttributes = const [],
    List<SortOptionEntity> sortOptions = const [],
    List<CategoryBannerEntity> banners = const [],
  }) {
    if (products.isEmpty) return;

    final entry = CategoryPreloadData(
      products: List<ProductEntity>.unmodifiable(products),
      filterAttributes:
          List<FilterAttributeEntity>.unmodifiable(filterAttributes),
      sortOptions: List<SortOptionEntity>.unmodifiable(sortOptions),
      banners: List<CategoryBannerEntity>.unmodifiable(banners),
      cachedAt: DateTime.now(),
    );

    for (final key in keys) {
      if (key.isNotEmpty) {
        _entries.remove(key);
        _entries[key] = entry;
      }
    }

    // LRU eviction
    while (_entries.length > maxEntries) {
      _entries.remove(_entries.keys.first);
    }
  }

  /// Synchronously seeds the preload cache directly from [homeFeed].
  ///
  /// Extracts the 5–10 preview products per category that were already
  /// fetched in the home payload, giving Frame 0 instant display at zero
  /// network cost.
  void seedFromHomeFeed(HomeContentEntity homeFeed) {
    for (final section in homeFeed.categoryProducts) {
      if (section.products.isEmpty) continue;

      final keys = <String>{
        if (section.categoryId.isNotEmpty) section.categoryId,
        if (section.categoryId.isNotEmpty) 'cat:${section.categoryId}',
        if (section.categorySlug.isNotEmpty) section.categorySlug,
        if (section.categorySlug.isNotEmpty) 'cat:${section.categorySlug}',
        if (section.categoryName.isNotEmpty) section.categoryName,
      };

      // Only seed if missing or currently expired
      final existing = read(keys);
      if (existing == null || existing.isExpired) {
        save(keys, products: section.products);
      }
    }
  }

  void clear(String key) {
    _entries.remove(key);
    _entries.remove('cat:$key');
    _entries.remove('spec:$key');
  }

  void clearAll() {
    _entries.clear();
  }
}
