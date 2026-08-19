import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/api_service/saved_payment_api_service.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/payment/saved_payment_model.dart';

@LazySingleton(as: SavedPaymentApiService)
class ISavedPaymentApiService extends SavedPaymentApiService {
  final Dio _client;

  ISavedPaymentApiService(this._client);

  @override
  Future<Either<ErrorResponse, List<SavedPaymentModel>>> getSavedPayments(
    String customerId,
  ) async {
    if (kDebugMode) {
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('[API] 💳 GET SAVED PAYMENTS');
      print('[API] CustomerID: $customerId');
      print('[API] Endpoint: ${ApiEndpoints.getAgreementsUrl}');
    }

    try {
      final response = await _client.get(
        ApiEndpoints.getAgreementsUrl,
        queryParameters: {'customer_id': customerId},
      );

      if (kDebugMode) {
        print('[API] Response data: ${response.data}');
      }

      if (response.data is List) {
        final payments = (response.data as List)
            .map((e) => SavedPaymentModel.fromJson(e as Map<String, dynamic>))
            .toList();

        if (kDebugMode) {
          print('[API] ✅ Loaded ${payments.length} saved payments');
          print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        }

        return Right(payments);
      }

      return const Right([]);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('[API] ❌ DioException: ${e.message}');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print('[API] ❌ Exception: $e');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> deleteSavedPayment(
    String customerId,
    String phoneNumber,
  ) async {
    if (kDebugMode) {
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('[API] 🗑️ DELETE SAVED PAYMENT');
      print('[API] CustomerID: $customerId');
      print('[API] Phone: $phoneNumber');
      print('[API] Endpoint: ${ApiEndpoints.deleteAgreementUrl}');
    }

    try {
      final response = await _client.post(
        ApiEndpoints.deleteAgreementUrl,
        data: {'customer_id': customerId, 'phone_number': phoneNumber},
      );

      final success = response.statusCode == 200 || response.data == true;

      if (kDebugMode) {
        print('[API] ✅ Delete result: $success');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }

      return Right(success);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('[API] ❌ DioException: ${e.message}');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print('[API] ❌ Exception: $e');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  ErrorResponse checkErrorResponse(DioException err) {
    if (err.type == DioExceptionType.badResponse) {
      final errorData = err.response?.data;
      if (errorData is Map<String, dynamic>) {
        return ErrorResponse.fromJson(errorData);
      }
    }
    return const ErrorResponse(message: 'Something went wrong');
  }
}
