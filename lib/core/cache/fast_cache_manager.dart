import 'package:get_storage/get_storage.dart';
import 'package:pickaboo/core/cache/cache_manager.dart';
import 'package:pickaboo/core/cache/key.dart';

class FastCacheManager {
  const FastCacheManager._();

  static final GetStorage _box = GetStorage();
  static const String _migrationFlag = 'CACHE_MIGRATED_V1';

  static const List<String> _legacyKeys = [
    'DELIVERY_LAST_LATITUDE',
    'DELIVERY_LAST_LONGITUDE',
  ];

  static Future<void> init() async {
    await GetStorage.init();
    await _migrateFromSecureStorage();
    for (final k in _legacyKeys) {
      if (_box.hasData(k)) await _box.remove(k);
    }
  }

  static String? getString(String key) => _box.read<String>(key);
  static bool containsKey(String key) => _box.hasData(key);

  static Future<void> setString(String key, String value) =>
      _box.write(key, value);
  static Future<void> remove(String key) => _box.remove(key);

  static const List<Key> _nonSecretKeys = [
    Key.userId,
    Key.guestSessionId,
    Key.guestCartId,
    Key.authQuoteId,
  ];

  static Future<void> _migrateFromSecureStorage() async {
    if (_box.read<bool>(_migrationFlag) == true) return;

    for (final k in _nonSecretKeys) {
      final v = await CacheManager.getString(k.keyValue);
      if (v != null) {
        await _box.write(k.keyValue, v);
        await CacheManager.remove(k.keyValue);
      }
    }

    for (final k in _legacyKeys) {
      await CacheManager.remove(k);
    }

    await _box.write(_migrationFlag, true);
  }

  static Future<void> clearAll() async {
    for (final k in _nonSecretKeys) {
      await _box.remove(k.keyValue);
    }
  }
}
