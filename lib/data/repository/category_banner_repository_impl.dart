import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/i_category_banner_api_service.dart';
import 'package:pickaboo/data/mapper/category_banner_mapper/category_banner_mapper.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/category_banner/category_banner_entity.dart';
import 'package:pickaboo/domain/repository/category_banner_repository.dart';

@LazySingleton(as: CategoryBannerRepository)
class CategoryBannerRepositoryImpl implements CategoryBannerRepository {
  final CategoryBannerApiService apiService;

  CategoryBannerRepositoryImpl(this.apiService);

  @override
  Future<Either<AppErrorEntity, List<CategoryBannerEntity>>> getCategoryBanners({
    required int categoryId,
  }) async {
    final result = await apiService.getCategoryBanners(categoryId: categoryId);
    return result.fold(
      (error) => left(error.toEntity()),
      (response) => right(response.map((e) => e.toEntity()).toList()),
    );
  }
}
