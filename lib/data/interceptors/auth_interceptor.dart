import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/core/monitoring/crash_reporter.dart';
import 'package:pickaboo/core/navigation/session_expiration_notifier.dart';
import 'package:pickaboo/data/local_data_source/ticket_local_data_source.dart';
import 'package:pickaboo/data/local_data_source/user_profile_local_data_source.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final AuthCacheManager _authCacheManager;
  final TicketLocalDataSource _ticketLocalDataSource;
  final UserProfileLocalDataSource _userProfileLocalDataSource;

  AuthInterceptor(
    this._authCacheManager,
    this._ticketLocalDataSource,
    this._userProfileLocalDataSource,
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await _authCacheManager.getToken();
    options.headers['Accept'] = 'application/json';
    final skipAuth = options.extra['noAuth'] == true;
    if (!skipAuth && token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  static bool _handlingUnauthorized = false;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    CrashReporter.record(err, err.stackTrace);

    final hadToken =
        err.requestOptions.headers['Authorization'] != null &&
        err.requestOptions.extra['noAuth'] != true;

    if (err.response?.statusCode == 401 && hadToken && !_handlingUnauthorized) {
      _handlingUnauthorized = true;
      try {

        await Future.wait([
          _authCacheManager.signOut(),
          _ticketLocalDataSource.clearTickets(),
          _userProfileLocalDataSource.clearUserProfile(),
        ]);

        SessionExpirationNotifier.notifySessionExpired();
      } finally {
        _handlingUnauthorized = false;
      }
    }

    return handler.next(err);
  }
}
