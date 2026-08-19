import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/product_api_service.dart';
import 'package:pickaboo/data/mapper/delivery_charge_mapper/delivery_charge_mapper.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/delivery_charge/delivery_charge_entity.dart';
import 'package:pickaboo/domain/repository/delivery_charge_repository.dart';

@LazySingleton(as: DeliveryChargeRepository)
class DeliveryChargeRepositoryImpl implements DeliveryChargeRepository {
  final ProductApiService _apiService;

  DeliveryChargeRepositoryImpl(this._apiService);

  @override
  Future<Either<AppErrorEntity, DeliveryChargeEntity>> getDeliveryCharge({
    required String productId,
  }) async {
    final result = await _apiService.getDeliveryCharge(productId: productId);

    return result.fold(
      (error) {
        if (kDebugMode) {
          debugPrint("delivery_charge_repo_error -> ${error.message}");
        }
        return left(error.toEntity());
      },
      (response) => right(response.toEntity()),
    );
  }
}
