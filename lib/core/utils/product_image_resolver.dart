import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:pickaboo/data/local_data_source/product_detail_local_data_source.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/injection.dart';

/// Centralized resolver & memory cache for product images.
/// Resolves product images when the backend cart API returns empty or broken
/// Magento placeholder URLs (e.g. ".../placeholder/.jpg").
class ProductImageResolver {
  ProductImageResolver._();

  static final Map<int, String> _memoryCache = {};
  static final Map<int, Future<String?>> _inFlightRequests = {};

  /// Checks if a given image URL is an empty or broken placeholder URL
  /// (e.g. Magento's ".../placeholder/.jpg", ".../placeholder/.png", or webapi_rest artifact).
  static bool isPlaceholderOrBroken(String? url) {
    if (url == null || url.trim().isEmpty) return true;
    final lower = url.toLowerCase().trim();
    if (lower.contains('placeholder/.jpg') ||
        lower.contains('placeholder/.png') ||
        lower.contains('magento_catalog/images/product/placeholder') ||
        lower.contains('/placeholder/default') ||
        lower.contains('pickaboo-plholder') ||
        lower.contains('plholder') ||
        lower.contains('/placeholder/') ||
        lower.endsWith('/.jpg') ||
        lower.endsWith('/.png')) {
      return true;
    }
    return false;
  }

  /// Manually store a valid product image URL in memory cache
  static void cacheImage(int productId, String? imageUrl) {
    if (productId <= 0 || isPlaceholderOrBroken(imageUrl)) return;
    _memoryCache[productId] = imageUrl!.trim();
  }

  /// Retrieve cached image URL if present and valid
  static String? getCachedImage(int productId) {
    if (productId <= 0) return null;
    final cached = _memoryCache[productId];
    if (cached != null && !isPlaceholderOrBroken(cached)) {
      return cached;
    }
    return null;
  }

  /// Asynchronously resolve a product image:
  /// 1. Checks if [currentUrl] is already valid
  /// 2. Checks in-memory cache
  /// 3. Checks local Hive cache via [ProductDetailLocalDataSource]
  /// 4. Queries [ProductRepository.getProductDetail] to fetch product info
  /// 5. Extracts primary image, stores in memory cache, and returns it
  static Future<String?> resolveImage({
    required int productId,
    String? currentUrl,
  }) async {
    if (productId <= 0) return null;

    // 1. Current URL valid?
    if (!isPlaceholderOrBroken(currentUrl)) {
      final valid = currentUrl!.trim();
      _memoryCache[productId] = valid;
      return valid;
    }

    // 2. Memory cache check
    final cached = getCachedImage(productId);
    if (cached != null) {
      return cached;
    }

    // 3. In-flight request deduplication
    if (_inFlightRequests.containsKey(productId)) {
      return await _inFlightRequests[productId];
    }

    final future = _fetchProductImage(productId);
    _inFlightRequests[productId] = future;

    try {
      final result = await future;
      if (result != null && !isPlaceholderOrBroken(result)) {
        _memoryCache[productId] = result;
      }
      return result;
    } finally {
      _inFlightRequests.remove(productId);
    }
  }

  static Future<String?> _fetchProductImage(int productId) async {
    try {
      // 1. Try local data source first (0ms latency if product was viewed)
      if (getIt.isRegistered<ProductDetailLocalDataSource>()) {
        try {
          final localDataSource = getIt<ProductDetailLocalDataSource>();
          final cachedProducts =
              await localDataSource.getProductDetailsIfValid();
          if (cachedProducts != null && cachedProducts.isNotEmpty) {
            final found = cachedProducts.firstWhereOrNull(
              (p) => p.id == productId,
            );
            if (found != null &&
                found.images != null &&
                found.images!.isNotEmpty) {
              final firstImg = found.images!.firstWhereOrNull(
                (img) => !isPlaceholderOrBroken(img),
              );
              if (firstImg != null) {
                if (kDebugMode) {
                  print(
                    '🖼️ [ProductImageResolver] Found image in Hive local cache for $productId: $firstImg',
                  );
                }
                return firstImg;
              }
            }
          }
        } catch (_) {}
      }

      // 2. Query ProductRepository to get product detail from API
      if (getIt.isRegistered<ProductRepository>()) {
        final repo = getIt<ProductRepository>();
        final result =
            await repo.getProductDetail(productId: productId.toString());
        return result.fold(
          (error) {
            if (kDebugMode) {
              print(
                '⚠️ [ProductImageResolver] Failed to fetch product $productId: ${error.message}',
              );
            }
            return null;
          },
          (detail) {
            if (detail.images.isNotEmpty) {
              final img = detail.images.firstWhereOrNull(
                (i) => !isPlaceholderOrBroken(i),
              );
              if (img != null) {
                if (kDebugMode) {
                  print(
                    '🖼️ [ProductImageResolver] Successfully fetched image for $productId: $img',
                  );
                }
                return img;
              }
            }
            return null;
          },
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(
          '⚠️ [ProductImageResolver] Error resolving image for $productId: $e',
        );
      }
    }
    return null;
  }
}
