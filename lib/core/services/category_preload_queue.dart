import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/cache/category_preload_cache.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/injection.dart';

/// Concurrency-controlled, sequential background preloading queue for category products.
///
/// Ensures that at most 1 background HTTP request is active at any time, with
/// throttled idle intervals to prevent network socket starvation and main-thread
/// contention.
@lazySingleton
class CategoryPreloadQueue {
  static const Duration _throttleDelay = Duration(milliseconds: 400);
  static const int _targetPreloadProductCount = 20;

  final CategoryPreloadCache _cache;
  final List<CategoryListEntity> _queue = [];

  bool _isProcessing = false;
  bool _isPaused = false;
  static CategoryPreloadQueue? _fallbackInstance;

  CategoryPreloadQueue([CategoryPreloadCache? cache])
      : _cache = cache ?? CategoryPreloadCache.instance;

  static CategoryPreloadQueue get instance {
    if (getIt.isRegistered<CategoryPreloadQueue>()) {
      return getIt<CategoryPreloadQueue>();
    }
    return _fallbackInstance ??= CategoryPreloadQueue();
  }

  /// Adds a list of categories to the prefetch queue in priority order.
  void enqueue(List<CategoryListEntity> categories) {
    for (final cat in categories) {
      final key = cat.id.isNotEmpty
          ? cat.id
          : (cat.slug.isNotEmpty ? cat.slug : cat.name);
      if (key.isEmpty) continue;

      // Skip if already fresh in cache
      if (_cache.isCategoryFresh(key)) continue;

      // Avoid duplicates in the queue
      final alreadyQueued = _queue.any(
        (c) =>
            (c.id.isNotEmpty && c.id == cat.id) ||
            (c.slug.isNotEmpty && c.slug == cat.slug) ||
            (c.name == cat.name),
      );

      if (!alreadyQueued) {
        _queue.add(cat);
      }
    }

    _processNext();
  }

  /// Pauses queue processing (e.g. during heavy user scrolling or navigation).
  void pause() {
    _isPaused = true;
  }

  /// Resumes queue processing.
  void resume() {
    _isPaused = false;
    _processNext();
  }

  /// Clears pending background prefetch jobs.
  void clear() {
    _queue.clear();
  }

  Future<void> _processNext() async {
    if (_isProcessing || _isPaused || _queue.isEmpty) return;

    _isProcessing = true;

    try {
      final category = _queue.removeAt(0);
      final cacheKey = category.id.isNotEmpty
          ? category.id
          : (category.slug.isNotEmpty ? category.slug : category.name);

      // Verify again in case it became fresh during the wait
      if (cacheKey.isNotEmpty && !_cache.isCategoryFresh(cacheKey)) {
        await _fetchCategory(category, cacheKey);
      }
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ [CategoryPreloadQueue] error: $e');
      }
    } finally {
      _isProcessing = false;
    }

    // Idle throttle delay between background requests
    if (_queue.isNotEmpty && !_isPaused) {
      await Future.delayed(_throttleDelay);
      _processNext();
    }
  }

  Future<void> _fetchCategory(
    CategoryListEntity category,
    String cacheKey,
  ) async {
    if (!getIt.isRegistered<ProductRepository>()) return;

    final repo = getIt<ProductRepository>();
    final key = category.id.isNotEmpty
        ? category.id
        : (category.slug.isNotEmpty ? category.slug : category.name);

    final result = category.isSpecial
        ? await repo.getSpecialCategoryProducts(
            categorySlug: category.slug,
            currentPage: 1,
            prodLimit: _targetPreloadProductCount,
            featProdLimit: _targetPreloadProductCount,
          )
        : await repo.getCategoryProducts(
            categoryKey: key,
            currentPage: 1,
            prodLimit: _targetPreloadProductCount,
            featProdLimit: _targetPreloadProductCount,
          );

    result.fold(
      (_) {},
      (categoryData) {
        final rawProducts = categoryData.products.isNotEmpty
            ? categoryData.products
            : categoryData.featuredProducts;
        final max20 = rawProducts.take(_targetPreloadProductCount).toList();

        if (max20.isNotEmpty) {
          _cache.save(
            [
              cacheKey,
              if (category.slug.isNotEmpty) category.slug,
              category.name,
              'cat:$cacheKey',
              if (category.slug.isNotEmpty) 'cat:${category.slug}',
              if (categoryData.categoryId != 0) '${categoryData.categoryId}',
              if (categoryData.categoryId != 0)
                'cat:${categoryData.categoryId}',
            ],
            products: max20,
            filterAttributes: categoryData.filterableAttributes,
            sortOptions: categoryData.sortOptions,
            banners: categoryData.banners,
          );
        }
      },
    );
  }
}
