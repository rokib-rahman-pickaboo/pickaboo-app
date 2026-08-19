import 'package:dartz/dartz.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/payment/saved_payment_entity.dart';

abstract class SavedPaymentRepository {
  Future<Either<AppErrorEntity, List<SavedPaymentEntity>>> getSavedPayments(
    String customerId,
  );
  Future<Either<AppErrorEntity, bool>> deleteSavedPayment(
    String customerId,
    String phoneNumber,
  );
}
