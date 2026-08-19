import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/network/certificate_pinning.dart';
import 'package:pickaboo/data/interceptors/auth_interceptor.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 40),
        receiveTimeout: const Duration(seconds: 40),
        contentType: "application/json",
        responseType: ResponseType.json,
      ),
    );
    dio.interceptors.add(authInterceptor);
    applyCertificatePinning(dio);
    return dio;
  }

  @lazySingleton
  @Named('barikoi')
  Dio barikoiDio() {
    return Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.barikoiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
      ),
    );
  }
}
