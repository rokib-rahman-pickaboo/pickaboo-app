import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends ChangeNotifier {
  final GetStorage _storage = GetStorage();

  static const String _authTokenKey = 'auth_token';
  static const String _userIdKey = 'user_id';

  bool _isAuthenticated = false;
  String? _userToken;
  String? _userId;

  bool get isAuthenticated => _isAuthenticated;
  String? get userToken => _userToken;
  String? get userId => _userId;

  AuthService() {
    _initializeAuth();
  }

  Future<void> _initializeAuth() async {
    await checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    try {
      final token = _storage.read(_authTokenKey);
      final userId = _storage.read(_userIdKey);

      if (token != null && token.isNotEmpty) {
        _isAuthenticated = true;
        _userToken = token;
        _userId = userId;
        notifyListeners();
      } else {
        _isAuthenticated = false;
        _userToken = null;
        _userId = null;
      }
    } catch (e) {
      _isAuthenticated = false;
      _userToken = null;
      _userId = null;
    }
  }

  Future<void> login(
    String email,
    String password, {
    String? token,
    String? userId,
  }) async {
    try {

      final authToken =
          token ?? 'dummy-token-${DateTime.now().millisecondsSinceEpoch}';
      final userIdValue =
          userId ?? 'user-${DateTime.now().millisecondsSinceEpoch}';

      await _storage.write(_authTokenKey, authToken);
      await _storage.write(_userIdKey, userIdValue);

      _isAuthenticated = true;
      _userToken = authToken;
      _userId = userIdValue;

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Login error: $e');
      }
      rethrow;
    }
  }

  Future<void> setAuthentication(String token, String userId) async {
    await _storage.write(_authTokenKey, token);
    await _storage.write(_userIdKey, userId);

    _isAuthenticated = true;
    _userToken = token;
    _userId = userId;

    notifyListeners();
  }

  Future<void> logout() async {
    try {
      await _storage.remove(_authTokenKey);
      await _storage.remove(_userIdKey);

      _isAuthenticated = false;
      _userToken = null;
      _userId = null;

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Logout error: $e');
      }
      rethrow;
    }
  }

  Future<void> clearAuth() async {
    await logout();
  }
}
