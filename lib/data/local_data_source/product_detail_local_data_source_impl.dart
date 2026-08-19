import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/constants/db_constants.dart';
import 'package:pickaboo/data/local_data_source/product_detail_local_data_source.dart';
import 'package:pickaboo/data/model/cache/product_detail_cache_wrapper.dart';
import 'package:pickaboo/data/model/product_detail_response/product_detail_response.dart';

@LazySingleton(as: ProductDetailLocalDataSource)
class ProductDetailLocalDataSourceImpl implements ProductDetailLocalDataSource {
  Future<Box<ProductDetailCacheWrapper>> _cacheBox() async {
    if (Hive.isBoxOpen(dbProductDetailName)) {
      return Hive.box<ProductDetailCacheWrapper>(dbProductDetailName);
    }
    return await Hive.openBox<ProductDetailCacheWrapper>(dbProductDetailName);
  }

  @override
  Future<List<ProductDetailResponse>?> getProductDetailsIfValid() async {
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

    return wrapper.productDetails;
  }

  @override
  Future<void> saveProductDetail(ProductDetailResponse productDetail) async {
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
  }
  @override
  Future<void> removeProductDetail(String productId) async {
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
    final box = await _cacheBox();
    await box.clear();
    if (kDebugMode) {
      print('📦 ProductDetail Cache: Cleared');
    }
  }
}
