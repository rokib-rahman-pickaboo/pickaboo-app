import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/data/model/category_banner_response/category_banner_response.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'i_category_banner_api_service.dart';

@LazySingleton(as: CategoryBannerApiService)
class ICategoryBannerApiService extends CategoryBannerApiService {
  final Dio _client;

  ICategoryBannerApiService(this._client);

  ErrorResponse checkErrorResponse(DioException err) {
    return ApiErrorParser.parse(err);
  }

  @override
  Future<Either<ErrorResponse, List<CategoryBannerResponse>>> getCategoryBanners({
    required int categoryId,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.categoryBannersUrl(categoryId: categoryId),
      );

      if (kDebugMode) {
        debugPrint("category_banners($categoryId) -> ${response.data}");
      }

      final data = response.data;
      if (data is List) {
        final result = data
            .map(
              (e) => CategoryBannerResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid category banners response format',
          ),
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint("category_banners_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }
}
