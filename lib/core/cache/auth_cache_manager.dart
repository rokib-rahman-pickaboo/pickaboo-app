import 'package:injectable/injectable.dart';
import 'cache_manager.dart';
import 'fast_cache_manager.dart';
import 'key.dart';

@lazySingleton
class AuthCacheManager {
  String? _tokenCache;
  bool _tokenWarmed = false;

  Future<void> warmUp() async {
    _tokenCache = await CacheManager.getString(Key.token.keyValue);
    _tokenWarmed = true;
  }

  Future<void> signOut() async {
    _tokenCache = null;
    _tokenWarmed = true;
    await CacheManager.clearAll();
    await FastCacheManager.clearAll();
  }

  Future<String?> getToken() async {
    if (_tokenWarmed) return _tokenCache;
    _tokenCache = await CacheManager.getString(Key.token.keyValue);
    _tokenWarmed = true;
    return _tokenCache;
  }

  Future<void> setToken({required String? token}) async {
    _tokenCache = token;
    _tokenWarmed = true;
    if (token != null) {
      await CacheManager.setString(Key.token.keyValue, token);
    } else if (await CacheManager.containsKey(Key.token.keyValue)) {
      await CacheManager.remove(Key.token.keyValue);
    }
  }

  Future<String?> getUserId() async =>
      FastCacheManager.getString(Key.userId.keyValue);

  Future<void> setUserId({required String userId}) =>
      FastCacheManager.setString(Key.userId.keyValue, userId);

  Future<String?> getGuestCartId() async =>
      FastCacheManager.getString(Key.guestCartId.keyValue);

  Future<void> setGuestCartId({required String cartId}) =>
      FastCacheManager.setString(Key.guestCartId.keyValue, cartId);

  Future<void> clearGuestCartId() async {
    if (FastCacheManager.containsKey(Key.guestCartId.keyValue)) {
      await FastCacheManager.remove(Key.guestCartId.keyValue);
    }
  }

  Future<String?> getAuthQuoteId() async =>
      FastCacheManager.getString(Key.authQuoteId.keyValue);

  Future<void> setAuthQuoteId({required String quoteId}) =>
      FastCacheManager.setString(Key.authQuoteId.keyValue, quoteId);

  Future<void> clearAuthQuoteId() async {
    if (FastCacheManager.containsKey(Key.authQuoteId.keyValue)) {
      await FastCacheManager.remove(Key.authQuoteId.keyValue);
    }
  }
}
