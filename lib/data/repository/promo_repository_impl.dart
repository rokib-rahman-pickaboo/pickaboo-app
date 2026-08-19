import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/product_api_service.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/data/mapper/promo_mapper/promo_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/promo/promo_entity.dart';
import 'package:pickaboo/domain/repository/promo_repository.dart';

@LazySingleton(as: PromoRepository)
class PromoRepositoryImpl implements PromoRepository {
  final ProductApiService _apiService;

  PromoRepositoryImpl(this._apiService);

  @override
  Future<Either<AppErrorEntity, PromoEntity>> getPromoCode({
    required String slug,
  }) async {
    final result = await _apiService.getPromoCode(slug: slug);

    return result.fold(
      (error) {
        if (kDebugMode) {
          debugPrint("promo_repo_error -> ${error.message}");
        }
        return left(error.toEntity());
      },
      (response) => right(response.toEntity()),
    );
  }
}
