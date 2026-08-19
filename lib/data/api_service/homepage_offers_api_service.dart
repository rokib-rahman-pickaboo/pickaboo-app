import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/homepage_offers/homepage_offers_response.dart';
import 'i_homepage_offers_api_service.dart';

@LazySingleton(as: HomepageOffersApiService)
class IHomepageOffersApiService extends HomepageOffersApiService {
  final Dio _client;

  IHomepageOffersApiService(this._client);

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
  Future<Either<ErrorResponse, HomepageOffersResponse>>
  getHomepageOffers() async {
    try {
      final response = await _client.get(ApiEndpoints.homepageOffersUrl);

      if (kDebugMode) {
        debugPrint("homepage_offers -> ${response.data}");
      }

      final data = response.data;

      if (data is Map<String, dynamic>) {
        final result = HomepageOffersResponse.fromJson(data);
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid homepage offers response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("homepage_offers_error ->$e");
      }
      return left(checkErrorResponse(e));
    }
  }
}
