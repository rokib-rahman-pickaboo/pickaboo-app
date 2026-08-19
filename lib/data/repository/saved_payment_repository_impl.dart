import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/saved_payment_api_service.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/data/mapper/saved_payment_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/payment/saved_payment_entity.dart';
import 'package:pickaboo/domain/repository/saved_payment_repository.dart';

@LazySingleton(as: SavedPaymentRepository)
class SavedPaymentRepositoryImpl implements SavedPaymentRepository {
  final SavedPaymentApiService _apiService;
  final SavedPaymentMapper _mapper;

  SavedPaymentRepositoryImpl(this._apiService, this._mapper);

  @override
  Future<Either<AppErrorEntity, List<SavedPaymentEntity>>> getSavedPayments(
    String customerId,
  ) async {
    final result = await _apiService.getSavedPayments(customerId);
    return result.fold(
      (error) => Left(error.toEntity()),
      (models) => Right(_mapper.toEntityList(models)),
    );
  }

  @override
  Future<Either<AppErrorEntity, bool>> deleteSavedPayment(
    String customerId,
    String phoneNumber,
  ) async {
    final result = await _apiService.deleteSavedPayment(
      customerId,
      phoneNumber,
    );
    return result.fold(
      (error) => Left(error.toEntity()),
      (success) => Right(success),
    );
  }
}
