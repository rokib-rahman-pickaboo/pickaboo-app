import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pickaboo/data/model/category_response/category_response.dart';

part 'category_cache_wrapper.freezed.dart';
part 'category_cache_wrapper.g.dart';

@freezed
@HiveType(typeId: 2, adapterName: 'CategoryCacheWrapperAdapter')
class CategoryCacheWrapper with _$CategoryCacheWrapper {
  const factory CategoryCacheWrapper({
    @HiveField(0) required List<CategoryResponse> categories,
    @HiveField(1) required DateTime cachedAt,
  }) = _CategoryCacheWrapper;

  factory CategoryCacheWrapper.fromJson(Map<String, dynamic> json) =>
      _$CategoryCacheWrapperFromJson(json);
}

extension CategoryCacheWrapperX on CategoryCacheWrapper {
  bool get isExpired {
    final now = DateTime.now();
    final difference = now.difference(cachedAt);
    return difference.inHours >= 24;
  }

  Duration get timeUntilExpiration {
    final expiration = cachedAt.add(const Duration(hours: 24));
    return expiration.difference(DateTime.now());
  }
}
