import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/data/api_service/checkout_api_service.dart';
import 'package:pickaboo/data/model/card_bin_response/card_bin_response.dart';
import 'package:pickaboo/data/model/card_bin_status_response/card_bin_status_response.dart';
import 'package:pickaboo/data/model/card_bin_verify_response/card_bin_verify_response.dart';
import 'package:pickaboo/data/model/checkout/checkout_emi_response.dart';
import 'package:pickaboo/data/model/cart/checkout_response/checkout_response.dart';
import 'package:pickaboo/data/model/card_bin_remove_response/card_bin_remove_response.dart';
import 'package:pickaboo/data/model/checkout/payment_methods_response.dart';
import 'package:pickaboo/data/model/checkout/shipping_method_model.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';

@LazySingleton(as: CheckoutApiService)
class ICheckoutApiService extends CheckoutApiService {
  final Dio _client;

  ICheckoutApiService(this._client);

  ErrorResponse checkErrorResponse(DioException err) {
    return ApiErrorParser.parse(err);
  }

  ErrorResponse _detailedError(DioException err, String label) {
    final status = err.response?.statusCode;
    final data = err.response?.data;

    String? backendMessage;
    if (data is Map) {
      backendMessage = data['message']?.toString();
    } else if (data is String && data.isNotEmpty) {
      backendMessage = data;
    }

    final detail = (backendMessage != null && backendMessage.isNotEmpty)
        ? backendMessage
        : (data != null ? data.toString() : (err.message ?? 'Unknown error'));

    return ErrorResponse(
      success: false,
      message:
          '[$label] ${status != null ? 'HTTP $status: ' : ''}$detail',
    );
  }

  List<ShippingMethodModel> _parseShippingMethods(dynamic data) {
    if (data is! List) return const [];
    return data
        .whereType<Map<String, dynamic>>()
        .map(ShippingMethodModel.fromJson)
        .toList();
  }

  @override
  Future<Either<ErrorResponse, List<ShippingMethodModel>>>
  estimateShippingMethods({required AddressEntity address}) async {
    final addressId = address.id;
    if (addressId != null && addressId > 0) {
      final byId = await _estimateShippingMethodsByAddressId(addressId);
      final resolved = byId.fold((_) => null, (methods) => methods);
      if (resolved != null && resolved.isNotEmpty) return right(resolved);
    }

    try {
      final body = {
        "address": {
          "region": address.region?.region ?? "",
          "region_id": address.regionId ?? 0,
          "region_code": address.region?.regionCode ?? "",
          "country_id": address.countryId ?? "BD",
          "street": address.street,
          "postcode": address.postcode ?? "",
          "city": address.city ?? "",
          "firstname": address.firstname ?? "",
          "lastname": address.lastname ?? "",
          "customer_id": address.customerId,
          "email": address.email ?? "guest@example.com",
          "telephone": address.telephone ?? "",
          "same_as_billing": 1,
        },
      };

      final response = await _client.post(
        ApiEndpoints.estimateShippingUrl,
        data: body,
      );

      return right(_parseShippingMethods(response.data));
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  Future<Either<ErrorResponse, List<ShippingMethodModel>>>
  _estimateShippingMethodsByAddressId(int addressId) async {
    try {
      final response = await _client.post(
        ApiEndpoints.estimateShippingByAddressIdUrl,
        data: {"addressId": addressId},
      );

      return right(_parseShippingMethods(response.data));
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, PaymentMethodsResponse>>
  saveShippingInformation({
    required AddressEntity address,
    required String carrierCode,
    required String methodCode,
    AddressEntity? billingAddress,
  }) async {
    try {
      final shippingAddressData = {
        "region": address.region?.region ?? "",
        "region_id": address.regionId ?? 0,
        "region_code": address.region?.regionCode ?? "",
        "country_id": address.countryId ?? "BD",
        "street": address.street,
        "postcode": address.postcode ?? "",
        "city": address.city ?? "",
        "firstname": address.firstname ?? "",
        "lastname": address.lastname ?? "",
        "customer_id": address.customerId,
        "email": address.email ?? "guest@example.com",
        "telephone": address.telephone ?? "",
      };

      final billingAddr = billingAddress ?? address;
      final billingAddressData = {
        "region": billingAddr.region?.region ?? "",
        "region_id": billingAddr.regionId ?? 0,
        "region_code": billingAddr.region?.regionCode ?? "",
        "country_id": billingAddr.countryId ?? "BD",
        "street": billingAddr.street,
        "postcode": billingAddr.postcode ?? "",
        "city": billingAddr.city ?? "",
        "firstname": billingAddr.firstname ?? "",
        "lastname": billingAddr.lastname ?? "",
        "customer_id": billingAddr.customerId,
        "email": billingAddr.email ?? "guest@example.com",
        "telephone": billingAddr.telephone ?? "",
      };

      final body = {
        "addressInformation": {
          "shipping_address": shippingAddressData,
          "billing_address": billingAddressData,
          "shipping_carrier_code": carrierCode,
          "shipping_method_code": methodCode,
        },
      };

      final response = await _client.post(
        ApiEndpoints.shippingInformationUrl,
        data: body,
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        return right(PaymentMethodsResponse.fromJson(data));
      }
      return left(
        const ErrorResponse(message: 'Invalid shipping info response'),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, PaymentMethodsResponse>> getPaymentInfo({
    required String cartId,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.getPaymentInfoUrl(cartId),
      );
      final data = response.data;
      if (data is List) {
        final methods = data
            .whereType<Map<String, dynamic>>()
            .map((e) => PaymentMethodModel.fromJson(e))
            .toList();
        return right(PaymentMethodsResponse(paymentMethods: methods, totals: null));
      }
      if (data is Map<String, dynamic>) {
        List<PaymentMethodModel>? methods;
        final paymentMethodsRaw = data['payment_methods'];
        if (paymentMethodsRaw is List) {
          methods = paymentMethodsRaw
              .whereType<Map<String, dynamic>>()
              .map((e) => PaymentMethodModel.fromJson(e))
              .toList();
        }

        CartTotals? totals;
        final totalsRaw = data['totals'];
        if (totalsRaw is Map<String, dynamic>) {
          totals = CartTotals.fromJson(totalsRaw);
        }

        return right(PaymentMethodsResponse(
          paymentMethods: methods,
          totals: totals,
        ));
      }
      return left(
        const ErrorResponse(message: 'Invalid payment info response'),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> placeOrder({
    required String cartId,
    required String paymentMethodCode,
  }) async {
    try {
      final body = {"cart_id": cartId};

      final response = await _client.post(
        ApiEndpoints.placeOrderUrl,
        data: body,
      );

      return right(response.data.toString());
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> selectPaymentMethod({
    required String cartId,
    required String method,
  }) async {
    try {
      final body = {
        "cart_id": cartId,
        "paymentMethod": {"method": method},
      };

      final response = await _client.post(
        ApiEndpoints.paymentSelectUrl,
        data: body,
      );

      return right(response.data == true);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> updateOrderPayment({
    required String orderId,
    required String paymentMethod,
    String? paymentGateway,
  }) async {
    try {
      final body = <String, dynamic>{
        'orderId': orderId,
        'paymentMethod': paymentMethod,
      };
      // Only include paymentGetway when it is an actual third-party bank gateway
      // Direct methods like nagad, bkash, cashondelivery must NOT send paymentGetway
      const directMethods = {
        'nagad',
        'bkash',
        'dynamicpaymentgateway',
        'cashondelivery',
        'free',
      };
      if (paymentGateway != null &&
          paymentGateway.isNotEmpty &&
          !directMethods.contains(paymentGateway.toLowerCase().trim())) {
        body['paymentGetway'] = paymentGateway;
      }
      final response = await _client.post(
        ApiEndpoints.updateOrderPaymentUrl,
        data: body,
      );
      final data = response.data;
      final isSuccess = response.statusCode == 200 &&
          (data == true ||
              data == 1 ||
              data == 'true' ||
              (data is Map && data['status'] == true));
      return right(isSuccess);
    } on DioException catch (e) {
      return left(_detailedError(e, 'updateOrderPayment'));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> confirmOrder({
    required String orderId,
  }) async {
    try {
      final url = '${ApiEndpoints.dmOrderPlaceUrl}$orderId';
      final response = await _client.post(url);
      return right(response.statusCode == 200 ? 'Success' : 'Failed');
    } on DioException catch (e) {
      return left(_detailedError(e, 'confirmOrder'));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> bkashGetInitialToken() async {
    try {
      final response = await _client.post(ApiEndpoints.bkashGetTokenUrl);
      final data = response.data;

      Map<String, dynamic> responseMap;
      if (data is Map<String, dynamic>) {
        responseMap = data;
      } else if (data is List && data.isNotEmpty) {
        final first = data.first;
        if (first is Map<String, dynamic>) {
          responseMap = first;
        } else {
          return left(
            ErrorResponse(
              message: 'Unexpected bKash list item type: ${first.runtimeType}',
            ),
          );
        }
      } else if (data is String) {
        try {
          responseMap = jsonDecode(data);
        } catch (e) {
          return left(
            ErrorResponse(message: 'Invalid bKash response format: $data'),
          );
        }
      } else {
        return left(
          ErrorResponse(
            message: 'Unexpected bKash response type: ${data.runtimeType}',
          ),
        );
      }

      if (responseMap['id_token'] != null) {
        return right(responseMap['id_token'].toString());
      }
      return left(
        const ErrorResponse(
          message: 'Failed to find id_token in bKash response',
        ),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    } catch (e) {
      return left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, Map<String, dynamic>>> bkashCreateAgreement({
    required String idToken,
    required String userId,
    required String returnPath,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.bkashAgreementCreateUrl,
        queryParameters: {
          'token': idToken,
          'userid': userId,
          'return_path': returnPath,
        },
        data: {
          'token': idToken,
          'userid': userId,
          'idToken': idToken,
          'payerReference': userId,
          'return_path': returnPath,
        },
      );
      final data = response.data;

      if (data is Map<String, dynamic>) {
        return right(data);
      } else if (data is List && data.isNotEmpty) {
        final first = data.first;
        if (first is Map<String, dynamic>) {
          return right(first);
        }
      }
      return left(
        const ErrorResponse(
          message: 'Invalid bKash agreement response structure',
        ),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, Map<String, dynamic>>> bkashExecuteAgreement({
    required String idToken,
    required String paymentId,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.bkashAgreementExecuteUrl,
        queryParameters: {'token': idToken, 'paymentID': paymentId},
        data: {},
      );
      final data = response.data;
      if (data is Map<String, dynamic>) {
        return right(data);
      } else if (data is List && data.isNotEmpty) {
        final first = data.first;
        if (first is Map<String, dynamic>) {
          return right(first);
        }
      }
      return left(
        const ErrorResponse(
          message: 'Invalid bKash agreement execution response',
        ),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, Map<String, dynamic>>> bkashCreatePayment({
    required String idToken,
    required String agreementId,
    required String amount,
    required String orderId,
    required String returnPath,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.bkashPaymentCreateUrl,
        queryParameters: {
          'token': idToken,
          'agreementID': agreementId,
          'order_id': orderId,
          'amount': amount,
          'return_path': returnPath,
        },
        data: {
          'token': idToken,
          'agreementID': agreementId,
          'order_id': orderId,
          'amount': amount,
          'intent': 'sale',
          'currency': 'BDT',
          'return_path': returnPath,
        },
      );
      final data = response.data;
      if (data is Map<String, dynamic>) {
        return right(data);
      } else if (data is List && data.isNotEmpty) {
        final first = data.first;
        if (first is Map<String, dynamic>) {
          return right(first);
        }
      }
      return left(
        const ErrorResponse(message: 'Invalid bKash payment response'),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, Map<String, dynamic>>> bkashExecutePayment({
    required String idToken,
    required String paymentId,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.bkashPaymentExecuteUrl,
        queryParameters: {'token': idToken, 'paymentID': paymentId},
        data: {},
      );
      final data = response.data;
      if (data is Map<String, dynamic>) {
        return right(data);
      } else if (data is List && data.isNotEmpty) {
        final first = data.first;
        if (first is Map<String, dynamic>) {
          return right(first);
        }
      }
      return left(
        const ErrorResponse(message: 'Invalid bKash execution response'),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, Map<String, dynamic>>> createEblOrder({
    required String orderId,
  }) async {
    try {
      final response = await _client.post(
        '/rest/default/V1/dcastalia-ebl/payment-process',
        queryParameters: {"order_id": orderId},
        data: {},
        options: Options(
          followRedirects: false,
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      final data = response.data;

      Map<String, dynamic>? map;
      if (data is Map<String, dynamic>) {
        map = data;
      } else if (data is List && data.isNotEmpty && data.first is Map) {
        map = Map<String, dynamic>.from(data.first as Map);
      } else {
      }

      if (map != null && map.containsKey('url')) {
        final url = map['url'].toString();
        final formFields = Map<String, String>.fromEntries(
          map.entries
              .where((e) => e.key != 'url' && e.value != null)
              .map((e) => MapEntry(e.key, e.value.toString())),
        );
        return right({'url': url, 'formFields': formFields});
      }
      return left(const ErrorResponse(message: 'Invalid EBL response'));
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> createDigitalOrder({
    required String orderId,
    required String paymentMethodCode,
    String? paymentGateway,
    String? returnPath,
  }) async {
    try {

      String endpoint = '';
      Map<String, dynamic> params = {"order_id": orderId};

      final String gateway = paymentGateway?.toLowerCase().trim() ?? '';
      final String method = paymentMethodCode.toLowerCase().trim();

      if (gateway == 'citybank') {
        endpoint = ApiEndpoints.cityBankCreateOrderUrl;
      } else if (gateway == 'bracbank') {
        endpoint = ApiEndpoints.bracBankCreateOrderUrl;
        params = {"orderId": orderId};
      } else if (gateway == 'eblbank' || gateway.contains('ebl')) {
        endpoint = '/rest/default/V1/dcastalia-ebl/payment-process';
        params = {"order_id": orderId};
      } else if (gateway == 'mtb' || gateway.contains('mtb')) {
        endpoint = ApiEndpoints.mtbCreateOrderUrl;
        params = {"order_id": orderId, "orderId": orderId};
      }
      else if (method == 'nagad') {
        endpoint = ApiEndpoints.nagadCreateOrderUrl;
        params = {
          "orderId": orderId,
          if (returnPath != null) "returnPath": returnPath,
        };
      } else if (method == 'sslcommerz' || method == 'dbblnexus') {
        endpoint = ApiEndpoints.sslPaymentRequestUrl;
      } else if (method == 'bracbank' || method.contains('brac')) {
        endpoint = ApiEndpoints.bracBankCreateOrderUrl;
        params = {"orderId": orderId};
      } else if (method == 'citybank' || method.contains('city')) {
        endpoint = ApiEndpoints.cityBankCreateOrderUrl;
      } else if (method == 'mtb' || method.contains('mtb')) {
        endpoint = ApiEndpoints.mtbCreateOrderUrl;
        params = {"order_id": orderId};
      } else {
        endpoint = ApiEndpoints.cityBankCreateOrderUrl;
      }

      final isEblEndpoint = endpoint.contains('/dcastalia-ebl/');
      final response = await _client.post(
        endpoint,
        data: isEblEndpoint ? {} : params,
        queryParameters: params,
        options: Options(
          headers: {
            'User-Agent':
                'Mozilla/5.0 (Linux; Android 10; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36',
          },
          followRedirects: false,
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      final data = response.data;
      final int? statusCode = response.statusCode;

      if (statusCode != null && statusCode >= 300 && statusCode < 400) {
        final location = response.headers.value('location');
        if (location != null) {
          return right(location);
        }
      }

      if (data is String) {
        return right(data);
      } else if (data is Map<String, dynamic>) {
        String? url =
            data['gateway_url'] ??
            data['returnUrl'] ??
            data['retuenUrl'] ??
            data['redirect_url'] ??
            data['redirectUrl'] ??
            data['url'] ??
            data['bkashURL'];

        if (url != null) {
          if (endpoint == ApiEndpoints.cityBankCreateOrderUrl) {
            if (!url.contains('CardNo=')) {
              url = '$url&CardNo=';
            }
          }
          return right(url.toString());
        }
      } else if (data is List) {
        if (data.isNotEmpty) {
          final first = data.first;
          if (first is Map<String, dynamic>) {
            String? url =
                first['retuenUrl'] ??
                first['returnUrl'] ??
                first['gateway_url'] ??
                first['redirect_url'] ??
                first['url'];

            if (url != null) {
              if (endpoint == ApiEndpoints.cityBankCreateOrderUrl) {
                if (!url.contains('CardNo=')) {
                  url = '$url&CardNo=';
                }
              }
              return right(url.toString());
            }
          } else if (first is String) {
            return right(first);
          }
        } else if (isEblEndpoint) {
          return right(
            "${ApiEndpoints.baseUrl}/rest/default/V1/dcastalia-ebl/payment-process?order_id=$orderId",
          );
        }
      }

      return left(const ErrorResponse(message: 'Invalid gateway response'));
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    } catch (e) {
      return left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, CheckoutEmiResponse>> getEmiDetails({
    required String quoteId,
    required String orderId,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.getEmiDetailsUrl,
        queryParameters: {'quoteid': quoteId},
      );
      final data = response.data;

      Map<String, dynamic>? json;
      if (data is List && data.isNotEmpty) {
        final first = data.first;
        if (first is Map<String, dynamic>) json = first;
      } else if (data is Map<String, dynamic>) {
        json = data;
      }
      if (json == null) {
        return left(const ErrorResponse(message: 'Invalid EMI details response'));
      }
      return right(CheckoutEmiResponse.fromJson(json));
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> updateEmiQuote({
    required String quoteId,
    required String orderId,
    required String bankName,
    required String tenureMonths,
    required String paymentMethod,
    required String paymentMode,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.emiQuoteUpdateUrl,
        queryParameters: {
          'bank_name': bankName,
          'tenure_months': tenureMonths,
          'quote_id': quoteId,
          'order_id': orderId,
          'payment_method': paymentMethod,
          'payment_mode': paymentMode,
        },
      );
      return right(response.statusCode == 200 || response.data == true);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CheckoutEmiResponse>> getCemiDetails({
    required String quoteId,
    required String orderId,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.getCemiDetailsUrl,
        queryParameters: {'quoteid': quoteId},
      );
      final data = response.data;

      Map<String, dynamic>? json;
      if (data is List && data.isNotEmpty) {
        final first = data.first;
        if (first is Map<String, dynamic>) json = first;
      } else if (data is Map<String, dynamic>) {
        json = data;
      }
      if (json == null) {
        return left(const ErrorResponse(message: 'Invalid CEMI details response'));
      }
      return right(CheckoutEmiResponse.fromJson(json));
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> updateCemiQuote({
    required String quoteId,
    required String orderId,
    required String bankName,
    required String tenureMonths,
    required String paymentMethod,
    required String paymentMode,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.cemiQuoteUpdateUrl,
        queryParameters: {
          'bank_name': bankName,
          'tenure_months': tenureMonths,
          'quote_id': quoteId,
          'order_id': orderId,
          'payment_method': paymentMethod,
          'payment_mode': paymentMode,
        },
      );
      return right(response.statusCode == 200 || response.data == true);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> nagadFinalizePayment({
    required Map<String, String> callbackParams,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.nagadFinalizeUrl,
        queryParameters: callbackParams,
      );
      return right(response.statusCode == 200);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CardBinVerifyResponse>> verifyCardBin({
    required String orderId,
  }) async {
    try {

      final response = await _client.get(
        ApiEndpoints.cardBinVerifyUrl(orderId: orderId),
      );
      final data = response.data;

      return right(CardBinVerifyResponse.fromJson(data));
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CardBinResponse>> applyCardBin({
    required String orderId,
    required String cardBin,
  }) async {
    try {

      var headers = {
        'Content-Type': 'application/json',
      };

      final response = await _client.post(
        ApiEndpoints.cardBinApplyUrl(orderId: orderId),
        options: Options(
          headers: headers,
        ),
        data: {
          "orderId": int.tryParse(orderId) ?? 0,
          "binNumber": int.tryParse(cardBin) ?? 0,
        },
      );
      return right(CardBinResponse.fromJson(response.data));
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CardBinRemoveResponse>> removeCardBin({
    required String orderId,
  }) async {
    try {

      final response = await _client.delete(
        ApiEndpoints.cardBinRemoveUrl(orderId: orderId),
      );
      return right(CardBinRemoveResponse.fromJson(response.data));
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> bkashAgreementSave({
    required String orderId,
    required String paymentId,
    required String trxId,
    required String phoneNumber,
    required String agreementId,
    required String userId,
    bool isSaved = false,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.bkashAgreementSaveUrl,
        queryParameters: {
          'order_id': orderId,
          'bkash_payment_id': paymentId,
          'bkash_trx_id': trxId,
          'phone_number': phoneNumber,
          'agreement_id': agreementId,
          'customer_id': userId,
          if (isSaved) 'saved': '1',
        },
        options: Options(
          extra: {'noAuth': true},
          validateStatus: (status) => status != null,
        ),
      );
      return right(true);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CardBinStatusResponse>> getCardBinStatus() async {
    try {
      final response = await _client.get(
        ApiEndpoints.cardBinStatusUrl,
      );
      final data = response.data;
      if (data is Map<String, dynamic>) {
        return right(CardBinStatusResponse.fromJson(data));
      }
      return left(
        const ErrorResponse(message: 'Invalid card bin status response'),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }
}
