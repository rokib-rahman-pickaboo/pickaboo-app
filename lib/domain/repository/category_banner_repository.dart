import 'package:dartz/dartz.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/category_banner/category_banner_entity.dart';

abstract class CategoryBannerRepository {
  Future<Either<AppErrorEntity, List<CategoryBannerEntity>>> getCategoryBanners({
    required int categoryId,
  });
}
