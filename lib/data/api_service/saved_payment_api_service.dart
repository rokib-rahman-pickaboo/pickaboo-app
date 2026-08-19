import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/payment/saved_payment_model.dart';

abstract class SavedPaymentApiService {
  Future<Either<ErrorResponse, List<SavedPaymentModel>>> getSavedPayments(
    String customerId,
  );
  Future<Either<ErrorResponse, bool>> deleteSavedPayment(
    String customerId,
    String phoneNumber,
  );
}
