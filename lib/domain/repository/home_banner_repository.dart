import 'package:dartz/dartz.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/home_banner/home_banner_entity.dart';

abstract class HomeBannerRepository {
  Future<Either<AppErrorEntity, List<HomeBannerEntity>>> getHomeBanners({
    bool forceRefresh = false,
  });
}
