import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/home_banner_response/home_banner_response.dart';
import 'i_home_banner_api_service.dart';

@LazySingleton(as: HomeBannerApiService)
class IHomeBannerApiService extends HomeBannerApiService {
  final Dio _client;

  IHomeBannerApiService(this._client);

  ErrorResponse checkErrorResponse(DioException err) {
    if (err.type == DioExceptionType.badResponse) {
      final errorData = err.response?.data;
      if (errorData is Map<String, dynamic>) {
        return ErrorResponse.fromJson(errorData);
      }
    }
    return const ErrorResponse();
  }

  @override
  Future<Either<ErrorResponse, List<HomeBannerResponse>>>
  getHomeBanners() async {
    try {
      final response = await _client.get(ApiEndpoints.homeBannersUrl);

      if (kDebugMode) {
        debugPrint("home_banners -> ${response.data}");
      }

      final data = response.data;
      if (data is List) {
        final result = data
            .map((e) => HomeBannerResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid home banners response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("home_banners_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }
}
