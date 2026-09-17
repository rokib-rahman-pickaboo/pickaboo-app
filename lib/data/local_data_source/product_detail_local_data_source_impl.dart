import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/constants/db_constants.dart';
import 'package:pickaboo/data/local_data_source/product_detail_local_data_source.dart';
import 'package:pickaboo/data/model/cache/product_detail_cache_wrapper.dart';
import 'package:pickaboo/data/model/product_detail_response/product_detail_response.dart';

@LazySingleton(as: ProductDetailLocalDataSource)
class ProductDetailLocalDataSourceImpl implements ProductDetailLocalDataSource {
  static final Map<String, ProductDetailResponse> _memoryCache = {};
  static final Map<String, DateTime> _memoryTimestamps = {};
  static const Duration _memoryTtl = Duration(hours: 4);

  Future<Box<ProductDetailCacheWrapper>> _cacheBox() async {
    if (Hive.isBoxOpen(dbProductDetailName)) {
      return Hive.box<ProductDetailCacheWrapper>(dbProductDetailName);
    }
    return await Hive.openBox<ProductDetailCacheWrapper>(dbProductDetailName);
  }

  @override
  Future<List<ProductDetailResponse>?> getProductDetailsIfValid() async {
    // 1. Fast path: check in-memory cache first
    final now = DateTime.now();
    if (_memoryCache.isNotEmpty) {
      _memoryTimestamps.removeWhere((key, time) => now.difference(time) >= _memoryTtl);
      _memoryCache.removeWhere((key, _) => !_memoryTimestamps.containsKey(key));

      if (_memoryCache.isNotEmpty) {
        if (kDebugMode) {
          print('⚡ ProductDetail Cache: Serving from fast in-memory cache (${_memoryCache.length} items)');
        }
        return _memoryCache.values.toSet().toList();
      }
    }

    final box = await _cacheBox();

    if (box.isEmpty) {
      if (kDebugMode) {
        print('📦 ProductDetail Cache: Empty');
      }
      return null;
    }

    final wrapper = box.getAt(0);
    if (wrapper == null) {
      return null;
    }

    if (wrapper.isExpired) {
      if (kDebugMode) {
        print('⏰ ProductDetail Cache: Expired (cached ${wrapper.cachedAt})');
      }
      await box.clear();
      return null;
    }

    if (kDebugMode) {
      print('✅ ProductDetail Cache: Valid');
    }

    // Populate in-memory cache from Hive
    for (final p in wrapper.productDetails) {
      if (p.id != null) {
        _memoryCache[p.id.toString()] = p;
        _memoryTimestamps[p.id.toString()] = wrapper.cachedAt;
      }
      if (p.slug != null && p.slug!.isNotEmpty) {
        _memoryCache[p.slug!] = p;
        _memoryTimestamps[p.slug!] = wrapper.cachedAt;
      }
    }

    return wrapper.productDetails;
  }

  @override
  Future<void> saveProductDetail(ProductDetailResponse productDetail) async {
    final now = DateTime.now();
    if (productDetail.id != null) {
      _memoryCache[productDetail.id.toString()] = productDetail;
      _memoryTimestamps[productDetail.id.toString()] = now;
    }
    if (productDetail.slug != null && productDetail.slug!.isNotEmpty) {
      _memoryCache[productDetail.slug!] = productDetail;
      _memoryTimestamps[productDetail.slug!] = now;
    }

    try {
      final box = await _cacheBox();

      List<ProductDetailResponse> currentList = [];
      if (box.isNotEmpty) {
        final wrapper = box.getAt(0);
        if (wrapper != null) {
          currentList = List.from(wrapper.productDetails);
        }
      }

      currentList.removeWhere((p) => p.id == productDetail.id);

      currentList.insert(0, productDetail);

      if (currentList.length > 20) {
        currentList = currentList.sublist(0, 20);
      }

      await box.clear();

      final newWrapper = ProductDetailCacheWrapper(
        productDetails: currentList,
        cachedAt: DateTime.now(),
      );

      await box.add(newWrapper);

      if (kDebugMode) {
        print('📦 ProductDetail Cache: Saved product ${productDetail.id} at ${newWrapper.cachedAt}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ ProductDetail Cache: Error persisting to Hive disk box: $e');
      }
    }
  }
  @override
  Future<void> removeProductDetail(String productId) async {
    _memoryCache.remove(productId);
    _memoryTimestamps.remove(productId);

    final box = await _cacheBox();
    if (box.isEmpty) return;

    final wrapper = box.getAt(0);
    if (wrapper == null) return;

    List<ProductDetailResponse> currentList = List.from(wrapper.productDetails);

    final intId = int.tryParse(productId);
    if (intId == null) return;

    currentList.removeWhere((p) => p.id == intId);

    await box.clear();

    final newWrapper = ProductDetailCacheWrapper(
      productDetails: currentList,
      cachedAt: wrapper.cachedAt,
    );

    await box.add(newWrapper);

    if (kDebugMode) {
      print('📦 ProductDetail Cache: Removed product $productId');
    }
  }

  @override
  Future<void> clearProductDetails() async {
    _memoryCache.clear();
    _memoryTimestamps.clear();
    final box = await _cacheBox();
    await box.clear();
    if (kDebugMode) {
      print('📦 ProductDetail Cache: Cleared');
    }
  }
}
