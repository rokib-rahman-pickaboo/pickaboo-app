import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';

part 'user_profile_cache_wrapper.freezed.dart';
part 'user_profile_cache_wrapper.g.dart';

@freezed
@HiveType(typeId: 8, adapterName: 'UserProfileCacheWrapperAdapter')
class UserProfileCacheWrapper with _$UserProfileCacheWrapper {
  const factory UserProfileCacheWrapper({
    @HiveField(0) required UserResponse user,
    @HiveField(1) required DateTime cachedAt,
  }) = _UserProfileCacheWrapper;

  factory UserProfileCacheWrapper.fromJson(Map<String, dynamic> json) =>
      _$UserProfileCacheWrapperFromJson(json);
}

extension UserProfileCacheWrapperX on UserProfileCacheWrapper {
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
