import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/i_homepage_offers_api_service.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/data/mapper/homepage_offers_mapper/homepage_offers_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/homepage_offers/homepage_offers_entity.dart';
import 'package:pickaboo/domain/repository/homepage_offers_repository.dart';

@LazySingleton(as: HomepageOffersRepository)
class HomepageOffersRepositoryImpl implements HomepageOffersRepository {
  final HomepageOffersApiService apiService;

  HomepageOffersRepositoryImpl(this.apiService);

  @override
  Future<Either<AppErrorEntity, HomepageOffersEntity>>
  getHomepageOffers() async {
    final result = await apiService.getHomepageOffers();
    return result.fold(
      (error) => left(error.toEntity()),
      (response) => right(response.toEntity()),
    );
  }
}
