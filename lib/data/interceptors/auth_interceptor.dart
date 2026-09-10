import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/core/config/api_config.dart';
import 'package:pickaboo/core/monitoring/crash_reporter.dart';
import 'package:pickaboo/core/navigation/app_navigator_key.dart';
import 'package:pickaboo/data/local_data_source/ticket_local_data_source.dart';
import 'package:pickaboo/data/local_data_source/user_profile_local_data_source.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';

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

    // If this token was issued by production (e.g. Facebook login on www.pickaboo.com),
    // route authenticated requests to productionURL so staging doesn't 401 reject it.
    final hasAuth =
        options.headers.containsKey('Authorization') || (!skipAuth && token != null);
    if (hasAuth && await _authCacheManager.isProdToken()) {
      if (options.path.startsWith(ApiConfig.developmentURL)) {
        options.path = options.path.replaceFirst(
          ApiConfig.developmentURL,
          ApiConfig.productionURL,
        );
      } else if (!options.path.startsWith('http')) {
        options.baseUrl = ApiConfig.productionURL;
      }
    }
    if (kDebugMode) {
      print('🌐 Request: ${options.method} ${options.baseUrl}${options.path}');
      print(
        'auth -> ${skipAuth ? 'SKIPPED (noAuth)' : (token != null ? 'Bearer attached' : 'no token')}',
      );
    }
    return handler.next(options);
  }

  static bool _handlingUnauthorized = false;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    CrashReporter.record(err, err.stackTrace);

    if (kDebugMode) {
      print('🔴 Error: ${err.response?.statusCode} → ${err.response?.requestOptions.path}');
    }

    final hadToken =
        err.requestOptions.headers['Authorization'] != null &&
        err.requestOptions.extra['noAuth'] != true;

    if (err.response?.statusCode == 401 && hadToken && !_handlingUnauthorized) {
      // If the current baseUrl is staging (developmentURL), the token may belong to production.
      // Retry the request against productionURL before triggering an unauthorized logout.
      if (ApiConfig.baseUrl != ApiConfig.productionURL &&
          err.requestOptions.extra['retried_on_prod'] != true) {
        try {
          final options = Options(
            method: err.requestOptions.method,
            headers: Map<String, dynamic>.from(err.requestOptions.headers),
            extra: Map<String, dynamic>.from(err.requestOptions.extra)
              ..['retried_on_prod'] = true,
            contentType: err.requestOptions.contentType,
            responseType: err.requestOptions.responseType,
          );

          final retryDio = Dio();
          final path = err.requestOptions.path;
          final prodUrl = path.startsWith('http')
              ? path.replaceFirst(ApiConfig.developmentURL, ApiConfig.productionURL)
              : '${ApiConfig.productionURL}$path';

          final response = await retryDio.request(
            prodUrl,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
            options: options,
          );

          if (response.statusCode != null &&
              response.statusCode! >= 200 &&
              response.statusCode! < 300) {
            if (kDebugMode) {
              print('🔄 [AuthInterceptor] 401 resolved via production: $prodUrl');
            }
            await _authCacheManager.setProdToken(true);
            return handler.resolve(response);
          }
        } catch (_) {
          // If production also returned 401, proceed to normal logout
        }
      }

      _handlingUnauthorized = true;
      try {
        if (kDebugMode) {
          print('🔐 401 detected — clearing session and redirecting to login');
        }

        await Future.wait([
          _authCacheManager.signOut(),
          _ticketLocalDataSource.clearTickets(),
          _userProfileLocalDataSource.clearUserProfile(),
        ]);

        final context = appNavigatorKey.currentContext;
        if (context != null && context.mounted) {
          context.go(Routes.login);
        }
      } finally {
        _handlingUnauthorized = false;
      }
    }

    return handler.next(err);
  }
}
