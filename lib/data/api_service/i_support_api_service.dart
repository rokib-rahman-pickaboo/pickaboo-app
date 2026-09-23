
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/data/api_service/support_api_service.dart';
import 'package:pickaboo/data/model/content_response/content_response.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/support_article_response/support_article_response.dart';
import 'package:pickaboo/data/model/support_category_response/support_category_response.dart';

@LazySingleton(as: SupportApiService)
class ISupportApiService extends SupportApiService {
  final Dio _client;

  ISupportApiService(this._client);

  ErrorResponse checkErrorResponse(DioException err) {
    return ApiErrorParser.parse(err);
  }

  @override
  Future<Either<ErrorResponse, List<SupportCategoryResponse>>>
  getAllSupportCategories() async {
    try {
      final response = await _client.get(ApiEndpoints.allSupportCategoryUrl);

      final data = response.data;

      if (data is List && data.isNotEmpty && data.first is List) {
        final List<dynamic> innerList = data.first as List<dynamic>;

        final result = innerList
            .map(
              (e) =>
                  SupportCategoryResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList();

        return right(result);
      }

      return left(
        const ErrorResponse(
          message: 'Invalid support category response format',
        ),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<SupportArticleResponse>>>
  getSupportArticle({required String categoryId}) async {
    try {
      final response = await _client.get(
        ApiEndpoints.supportArticleUrl(categoryId: categoryId),
      );

      final data = response.data;

      if (data is List) {
        final result = data
            .map(
              (e) => SupportArticleResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid category Article response format',
          ),
        );
      }
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<SupportArticleResponse>>>
  searchSupportArticle({required String query}) async {
    try {
      final response = await _client.get(
        ApiEndpoints.searchSupportArticleUrl(query: query),
      );

      final data = response.data;

      if (data is List) {
        final result = data
            .map(
              (e) => SupportArticleResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid category Article response format',
          ),
        );
      }
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<ContentResponse>>>
  getTermsAndConditions() async {
    try {
      final response = await _client.get(ApiEndpoints.termsAndConditionUrl);

      final data = response.data;

      if (data is List) {
        final result = data
            .map((e) => ContentResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid Terms and Condition response format',
          ),
        );
      }
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<ContentResponse>>>
  getPrivacyPolicy() async {
    try {
      final response = await _client.get(ApiEndpoints.privacyPolicyUrl);

      final data = response.data;

      if (data is List) {
        final result = data
            .map((e) => ContentResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid Terms and Condition response format',
          ),
        );
      }
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<ContentResponse>>> getReturnPolicy() async {
    try {
      final response = await _client.get(ApiEndpoints.returnPolicyUrl);

      final data = response.data;

      if (data is List) {
        final result = data
            .map((e) => ContentResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(result);
      } else {
        return left(
          const ErrorResponse(
            message: 'Invalid Terms and Condition response format',
          ),
        );
      }
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }
}
