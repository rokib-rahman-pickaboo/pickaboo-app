import 'package:dartz/dartz.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/homepage_offers/homepage_offers_entity.dart';

abstract class HomepageOffersRepository {
  Future<Either<AppErrorEntity, HomepageOffersEntity>> getHomepageOffers();
}
