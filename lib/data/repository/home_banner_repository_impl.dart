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

  List<HomeBannerEntity>? _cachedBanners;
  DateTime? _cachedBannersTime;

  HomeBannerRepositoryImpl(this.apiService);

  @override
  Future<Either<AppErrorEntity, List<HomeBannerEntity>>>
  getHomeBanners({bool forceRefresh = false}) async {
    final now = DateTime.now();
    if (!forceRefresh &&
        _cachedBanners != null &&
        _cachedBannersTime != null &&
        now.difference(_cachedBannersTime!).inMinutes < 30) {
      return right(_cachedBanners!);
    }

    final result = await apiService.getHomeBanners();
    return result.fold(
      (error) {
        if (_cachedBanners != null) return right(_cachedBanners!);
        return left(error.toEntity());
      },
      (response) {
        final banners = response.map((e) => e.toEntity()).toList();
        _cachedBanners = banners;
        _cachedBannersTime = DateTime.now();
        return right(banners);
      },
    );
  }
}
