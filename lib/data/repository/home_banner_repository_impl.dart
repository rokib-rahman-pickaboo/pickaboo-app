import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/i_home_banner_api_service.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/data/mapper/home_banner_mapper/home_banner_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/home_banner/home_banner_entity.dart';
import 'package:pickaboo/domain/repository/home_banner_repository.dart';

@LazySingleton(as: HomeBannerRepository)
class HomeBannerRepositoryImpl implements HomeBannerRepository {
  final HomeBannerApiService apiService;

  HomeBannerRepositoryImpl(this.apiService);

  @override
  Future<Either<AppErrorEntity, List<HomeBannerEntity>>>
  getHomeBanners() async {
    final result = await apiService.getHomeBanners();
    return result.fold(
      (error) => left(error.toEntity()),
      (response) => right(response.map((e) => e.toEntity()).toList()),
    );
  }
}
