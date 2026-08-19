import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/card_bin_remove_response/card_bin_remove_response.dart';
import 'package:pickaboo/data/model/card_bin_response/card_bin_response.dart';
import 'package:pickaboo/data/model/card_bin_status_response/card_bin_status_response.dart';
import 'package:pickaboo/data/model/card_bin_verify_response/card_bin_verify_response.dart';
import 'package:pickaboo/data/model/checkout/checkout_emi_response.dart';
import 'package:pickaboo/data/model/checkout/payment_methods_response.dart';
import 'package:pickaboo/data/model/checkout/shipping_method_model.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';

abstract class CheckoutApiService {
  Future<Either<ErrorResponse, List<ShippingMethodModel>>>
  estimateShippingMethods({required AddressEntity address});

  Future<Either<ErrorResponse, PaymentMethodsResponse>>
  saveShippingInformation({
    required AddressEntity address,
    required String carrierCode,
    required String methodCode,
    AddressEntity? billingAddress,
  });

  Future<Either<ErrorResponse, PaymentMethodsResponse>> getPaymentInfo({
    required String cartId,
  });

  Future<Either<ErrorResponse, bool>> selectPaymentMethod({
    required String cartId,
    required String method,
  });

  Future<Either<ErrorResponse, String>> placeOrder({
    required String cartId,
    required String paymentMethodCode,
  });

  Future<Either<ErrorResponse, bool>> updateOrderPayment({
    required String orderId,
    required String paymentMethod,
    String? paymentGateway,
  });

  Future<Either<ErrorResponse, String>> confirmOrder({required String orderId});

  Future<Either<ErrorResponse, String>> bkashGetInitialToken();

  Future<Either<ErrorResponse, Map<String, dynamic>>> bkashCreateAgreement({
    required String idToken,
    required String userId,
    required String returnPath,
  });

  Future<Either<ErrorResponse, Map<String, dynamic>>> bkashExecuteAgreement({
    required String idToken,
    required String paymentId,
  });

  Future<Either<ErrorResponse, Map<String, dynamic>>> bkashCreatePayment({
    required String idToken,
    required String agreementId,
    required String amount,
    required String orderId,
    required String returnPath,
  });

  Future<Either<ErrorResponse, Map<String, dynamic>>> bkashExecutePayment({
    required String idToken,
    required String paymentId,
  });

  Future<Either<ErrorResponse, bool>> bkashAgreementSave({
    required String orderId,
    required String paymentId,
    required String trxId,
    required String phoneNumber,
    required String agreementId,
    required String userId,
    bool isSaved = false,
  });

  Future<Either<ErrorResponse, Map<String, dynamic>>> createEblOrder({
    required String orderId,
  });

  Future<Either<ErrorResponse, String>> createDigitalOrder({
    required String orderId,
    required String paymentMethodCode,
    String? paymentGateway,
    String? returnPath,
  });

  Future<Either<ErrorResponse, CheckoutEmiResponse>> getEmiDetails({
    required String quoteId,
    required String orderId,
  });

  Future<Either<ErrorResponse, bool>> updateEmiQuote({
    required String quoteId,
    required String orderId,
    required String bankName,
    required String tenureMonths,
    required String paymentMethod,
    required String paymentMode,
  });

  Future<Either<ErrorResponse, CheckoutEmiResponse>> getCemiDetails({
    required String quoteId,
    required String orderId,
  });

  Future<Either<ErrorResponse, bool>> updateCemiQuote({
    required String quoteId,
    required String orderId,
    required String bankName,
    required String tenureMonths,
    required String paymentMethod,
    required String paymentMode,
  });

  Future<Either<ErrorResponse, bool>> nagadFinalizePayment({
    required Map<String, String> callbackParams,
  });

  Future<Either<ErrorResponse, CardBinVerifyResponse>> verifyCardBin({
    required String orderId,
  });

  Future<Either<ErrorResponse, CardBinResponse>> applyCardBin({
    required String orderId,
    required String cardBin,
  });

  Future<Either<ErrorResponse, CardBinRemoveResponse>> removeCardBin({
    required String orderId,
  });

  Future<Either<ErrorResponse, CardBinStatusResponse>> getCardBinStatus();
}
