import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/search_response/search_response.dart';
import 'search_api_service.dart';

@LazySingleton(as: SearchApiService)
class ISearchApiService extends SearchApiService {
  final Dio _client;

  ISearchApiService(this._client);

  ErrorResponse checkErrorResponse(DioException err) {
    return ApiErrorParser.parse(err);
  }

  @override
  Future<Either<ErrorResponse, SearchResponse>> search({
    required String query,
    String? categoryId,
    int startIndex = 0,
    int maxResults = 10,
    Map<String, String>? filters,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'api_key': ApiEndpoints.searchaniseApiKey,
        'q': query,
        'queryCorrection': 'true',
        'suggestions': 'true',
        'maxResults': maxResults.toString(),
        'categories': 'true',
        'facets': 'true',
        'restrictBy[visibility]': '3|4',
        'restrictBy[status]': '1',
        'startIndex': startIndex.toString(),
      };

      if (categoryId != null && categoryId.isNotEmpty) {
        queryParams['restrictBy[category_ids]'] = categoryId;
      }

      if (filters != null) {
        queryParams.addAll(filters);
      }

      if (sortBy != null && sortOrder != null) {
        queryParams['sortBy'] = sortBy;
        queryParams['sortOrder'] = sortOrder;
      }

      final uri = Uri.https(
        ApiEndpoints.searchaniseBaseUrl
            .replaceAll('https://', '')
            .replaceAll('http://', ''),
        ApiEndpoints.searchaniseUrl,
        queryParams,
      );

      final response = await _client.getUri(
        uri,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      dynamic jsonData = response.data;

      if (jsonData is String) {
        try {
          jsonData = jsonDecode(jsonData);
        } catch (e) {
          return left(ErrorResponse(message: 'Failed to decode JSON: $e'));
        }
      }

      if (jsonData is Map) {
        try {
          final data = jsonData is Map<String, dynamic>
              ? jsonData
              : Map<String, dynamic>.from(jsonData);

          final result = SearchResponse.fromJson(data);
          return right(result);
        } catch (e) {
          return left(
            ErrorResponse(message: 'Failed to parse search response: $e'),
          );
        }
      } else {
        return left(
          const ErrorResponse(message: 'Invalid search response format'),
        );
      }
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    } catch (e) {
      return left(ErrorResponse(message: 'Unexpected error: $e'));
    }
  }
}
