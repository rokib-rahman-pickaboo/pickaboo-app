import 'package:dartz/dartz.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/promo/promo_entity.dart';

abstract class PromoRepository {
  Future<Either<AppErrorEntity, PromoEntity>> getPromoCode({
    required String slug,
  });
}
