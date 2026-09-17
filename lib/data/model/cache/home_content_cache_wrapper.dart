import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pickaboo/data/model/home_content_response/home_content_response.dart';

part 'home_content_cache_wrapper.freezed.dart';
part 'home_content_cache_wrapper.g.dart';

@freezed
@HiveType(typeId: 16, adapterName: 'HomeContentCacheWrapperAdapter')
class HomeContentCacheWrapper with _$HomeContentCacheWrapper {
  const factory HomeContentCacheWrapper({
    @HiveField(0) required HomeContentResponse homeContent,
    @HiveField(1) required DateTime cachedAt,
  }) = _HomeContentCacheWrapper;

  factory HomeContentCacheWrapper.fromJson(Map<String, dynamic> json) =>
      _$HomeContentCacheWrapperFromJson(json);
}

extension HomeContentCacheWrapperX on HomeContentCacheWrapper {
  bool get isExpired {
    final now = DateTime.now();
    final difference = now.difference(cachedAt);
    return difference.inMinutes >= 30;
  }

  bool get isStale {
    final now = DateTime.now();
    final difference = now.difference(cachedAt);
    return difference.inMinutes >= 5;
  }

  Duration get timeUntilExpiration {
    final expiration = cachedAt.add(const Duration(minutes: 30));
    return expiration.difference(DateTime.now());
  }
}
