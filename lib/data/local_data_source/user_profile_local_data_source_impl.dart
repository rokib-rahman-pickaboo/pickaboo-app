import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/constants/db_constants.dart';
import 'package:pickaboo/data/local_data_source/user_profile_local_data_source.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import 'package:pickaboo/data/model/cache/user_profile_cache_wrapper.dart';

@LazySingleton(as: UserProfileLocalDataSource)
class UserProfileLocalDataSourceImpl implements UserProfileLocalDataSource {
  Future<Box<UserProfileCacheWrapper>> _cacheBox() async {
    if (Hive.isBoxOpen(dbUserProfileName)) {
      return Hive.box<UserProfileCacheWrapper>(dbUserProfileName);
    }
    return await Hive.openBox<UserProfileCacheWrapper>(dbUserProfileName);
  }

  @override
  Future<UserResponse?> getUserProfileIfValid() async {
    final box = await _cacheBox();

    if (box.isEmpty) {
      if (kDebugMode) {
        print('📦 User Profile Cache: Empty');
      }
      return null;
    }

    final wrapper = box.getAt(0);
    if (wrapper == null) {
      return null;
    }

    if (wrapper.isExpired) {
      if (kDebugMode) {
        print('⏰ User Profile Cache: Expired (cached ${wrapper.cachedAt})');
      }
      await box.clear();
      return null;
    }

    if (kDebugMode) {
      final remaining = wrapper.timeUntilExpiration;
      print(
        '✅ User Profile Cache: Valid (expires in ${remaining.inHours}h ${remaining.inMinutes % 60}m)',
      );
    }

    return wrapper.user;
  }

  @override
  Future<void> insertUserProfile(UserResponse user) async {
    final box = await _cacheBox();
    await box.clear();

    final wrapper = UserProfileCacheWrapper(
      user: user,
      cachedAt: DateTime.now(),
    );

    await box.add(wrapper);

    if (kDebugMode) {
      print('📦 User Profile Cache: Saved user profile at ${wrapper.cachedAt}');
    }
  }

  @override
  Future<void> clearUserProfile() async {
    final box = await _cacheBox();
    await box.clear();
    if (kDebugMode) {
      print('📦 User Profile Cache: Cleared');
    }
  }
}
