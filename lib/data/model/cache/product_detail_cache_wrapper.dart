import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pickaboo/data/model/product_detail_response/product_detail_response.dart';

part 'product_detail_cache_wrapper.freezed.dart';
part 'product_detail_cache_wrapper.g.dart';

@freezed
@HiveType(typeId: 31, adapterName: 'ProductDetailCacheWrapperAdapter')
class ProductDetailCacheWrapper with _$ProductDetailCacheWrapper {
  const factory ProductDetailCacheWrapper({
    @HiveField(0) required List<ProductDetailResponse> productDetails,
    @HiveField(1) required DateTime cachedAt,
  }) = _ProductDetailCacheWrapper;

  factory ProductDetailCacheWrapper.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailCacheWrapperFromJson(json);
}

extension ProductDetailCacheWrapperX on ProductDetailCacheWrapper {
  bool get isExpired {
    final now = DateTime.now();
    final difference = now.difference(cachedAt);
    return difference.inHours >= 24;
  }
}
