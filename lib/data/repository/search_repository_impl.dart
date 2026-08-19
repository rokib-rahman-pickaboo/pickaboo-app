import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/search_api_service.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/data/mapper/search_mapper/search_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/search/search_result_entity.dart';
import 'package:pickaboo/domain/repository/search_repository.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  @override
  final SearchApiService apiService;

  SearchRepositoryImpl(this.apiService);

  @override
  Future<Either<AppErrorEntity, SearchResultEntity>> search({
    required String query,
    String? categoryId,
    int startIndex = 0,
    int maxResults = 10,
    Map<String, String>? filters,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final result = await apiService.search(
        query: query,
        categoryId: categoryId,
        startIndex: startIndex,
        maxResults: maxResults,
        filters: filters,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      return result.fold((error) => left(error.toEntity()), (response) {
        try {
          final entity = response.toDomain();
          return right(entity);
        } catch (e) {
          return left(
            AppErrorEntity(message: 'Failed to map search results: $e'),
          );
        }
      });
    } catch (e) {
      return left(AppErrorEntity(message: 'Unexpected error in search: $e'));
    }
  }
}
