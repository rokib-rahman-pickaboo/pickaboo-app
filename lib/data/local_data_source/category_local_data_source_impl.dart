import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/constants/db_constants.dart';
import 'package:pickaboo/data/model/cache/category_cache_wrapper.dart';
import 'package:pickaboo/data/model/category_response/category_response.dart';
import 'package:pickaboo/data/local_data_source/category_local_data_source.dart';

@LazySingleton(as: CategoryLocalDataSource)
class CategoryLocalDataSourceImpl extends CategoryLocalDataSource {
  Future<Box<CategoryCacheWrapper>> _cacheBox() async {
    if (Hive.isBoxOpen(dbCategoryName)) {
      return Hive.box<CategoryCacheWrapper>(dbCategoryName);
    }
    return await Hive.openBox<CategoryCacheWrapper>(dbCategoryName);
  }

  @override
  Future<List<CategoryResponse>?> getCategoriesIfValid() async {
    final box = await _cacheBox();

    if (box.isEmpty) {
      return null;
    }

    final wrapper = box.getAt(0);
    if (wrapper == null) {
      return null;
    }

    if (wrapper.isExpired) {
      await box.clear();
      return null;
    }

    if (kDebugMode) {
      final remaining = wrapper.timeUntilExpiration;
    }

    return wrapper.categories;
  }

  @override
  Future<List<CategoryResponse>?> getCachedCategories() async {
    final box = await _cacheBox();
    if (box.isEmpty) return null;
    final wrapper = box.getAt(0);
    return wrapper?.categories;
  }

  @override
  Future<void> insertCategories(List<CategoryResponse> categories) async {
    final box = await _cacheBox();
    await box.clear();

    final wrapper = CategoryCacheWrapper(
      categories: categories,
      cachedAt: DateTime.now(),
    );

    await box.add(wrapper);

  }

  @override
  Future<void> clearCategories() async {
    final box = await _cacheBox();
    await box.clear();
  }
}
