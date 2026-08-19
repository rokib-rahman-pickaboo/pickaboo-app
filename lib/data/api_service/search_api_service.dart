import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/search_response/search_response.dart';

abstract class SearchApiService {
  Future<Either<ErrorResponse, SearchResponse>> search({
    required String query,
    String? categoryId,
    int startIndex = 0,
    int maxResults = 10,
    Map<String, String>? filters,
    String? sortBy,
    String? sortOrder,
  });
}
