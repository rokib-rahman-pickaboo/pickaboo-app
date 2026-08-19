import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/api_service/search_api_service.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/search/search_result_entity.dart';

abstract class SearchRepository {
  final SearchApiService apiService;

  SearchRepository(this.apiService);

  Future<Either<AppErrorEntity, SearchResultEntity>> search({
    required String query,
    String? categoryId,
    int startIndex = 0,
    int maxResults = 10,
    Map<String, String>? filters,
    String? sortBy,
    String? sortOrder,
  });
}
