import 'package:dartz/dartz.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/delivery_charge/delivery_charge_entity.dart';

abstract class DeliveryChargeRepository {
  Future<Either<AppErrorEntity, DeliveryChargeEntity>> getDeliveryCharge({
    required String productId,
  });
}
