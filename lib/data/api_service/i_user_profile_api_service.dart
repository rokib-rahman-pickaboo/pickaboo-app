import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:pickaboo/core/config/api_config.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/data/api_service/user_profile_api_service.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import 'package:pickaboo/data/model/club_point/club_point_response.dart';
import 'package:pickaboo/data/model/common/area_response.dart';
import 'package:pickaboo/data/model/common/city_response.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/order/order_cancel_response/order_cancel_response.dart';
import 'package:pickaboo/data/model/order/order_detail_response/order_detail_response.dart';
import 'package:pickaboo/data/model/order/order_list_response/order_list_response.dart';
import 'package:pickaboo/data/model/otp_response/otp_response.dart';
import 'package:pickaboo/data/model/referral/referral_response.dart';

@LazySingleton(as: UserProfileApiService)
class IUserProfileApiService implements UserProfileApiService {
  final Dio _dio;

  IUserProfileApiService(this._dio);

  ErrorResponse _checkErrorResponse(DioException err) {
    return ApiErrorParser.parseDioError(err);
  }

  @override
  Future<Either<ErrorResponse, UserResponse>> getUserProfile() async {
    try {
      final response = await _dio.get(ApiEndpoints.customerMe);
      return Right(UserResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> getUserImage() async {
    try {
      final response = await _dio.get(ApiEndpoints.customerImageMine);
      return Right(response.data.toString());
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, UserResponse>> updateBasicProfile({
    required Map<String, dynamic> userMap,
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'customer': {
          ...userMap,
          'firstname': firstName,
          'lastname': lastName,
          'gender': int.tryParse(gender) ?? gender,
          'dob': dob,
        },
      };

      final customerId = userMap['id'];

      final response = await _dio.put(
        ApiEndpoints.updateCustomerUrl,
        queryParameters: {'customer_id': customerId},
        data: json.encode(body),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return Right(UserResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, OtpResponse>> sendEmailUpdateOtp({
    required String email,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.sendEmailVerificationCodeUrl,
        queryParameters: {
          'customer_email': email,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print('sendEmailVerificationCode -> ${response.data}');
      }

      dynamic resData = response.data;
      if (resData is List && resData.isNotEmpty) {
        resData = resData.first;
      }

      if (resData is Map<String, dynamic>) {
        final status = resData['status'];
        if (status == 400 || status == 409 || resData['success'] == false || status == 'failure') {
          final msg = ApiErrorParser.extractErrorMessage(resData, defaultMessage: 'Failed to send verification code');
          return Left(ErrorResponse(message: msg));
        }
        return Right(OtpResponse(
          status: 200,
          message: resData['message']?.toString() ?? 'Verification code has been sent to your email',
        ));
      }

      return const Right(OtpResponse(
        status: 200,
        message: 'Verification code has been sent to your email',
      ));
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: ApiErrorParser.extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> updateEmail({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dio.put(
        ApiEndpoints.updateCustomerEmailUrl,
        data: {
          'email': email,
          'otp': otp,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print('updateCustomerEmail -> ${response.data}');
      }

      dynamic resData = response.data;
      if (resData is List && resData.isNotEmpty) {
        resData = resData.first;
      }

      if (resData is Map<String, dynamic>) {
        final status = resData['status'];
        if (status == 400 || status == 409 || resData['success'] == false || status == 'failure') {
          final msg = ApiErrorParser.extractErrorMessage(resData, defaultMessage: 'Failed to update email address');
          return Left(ErrorResponse(message: msg));
        }
        final message = resData['message']?.toString() ?? 'Your email address has been updated successfully';
        return Right(message);
      }

      if (resData is String) {
        final str = resData.replaceAll('"', '').trim();
        return Right(str.isNotEmpty ? str : 'Your email address has been updated successfully');
      }

      return const Right('Your email address has been updated successfully');
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: ApiErrorParser.extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<ErrorResponse, OtpResponse>> sendPhoneUpdateOtp({
    required String mobile,
    bool resend = false,
    String? recaptchaToken,
  }) async {
    try {
      final platform = Platform.isAndroid ? 'android' : 'ios';

      if (kDebugMode) {
        print('[RECAPTCHA] sendPhoneUpdateOtp | resend=$resend rtokenPresent=${recaptchaToken != null} '
            'rtokenLen=${recaptchaToken?.length ?? 0} platform=$platform');
      }

      final payload = {
        'mobile': mobile,
        'resend': resend ? 1 : 0,
        'storeId': 1,
        'store_id': 1,
        'eventType': 'customer_account_edit_otp',
        'event_type': 'customer_account_edit_otp',
        'platform': platform,
        if (recaptchaToken != null && recaptchaToken.isNotEmpty) ...{
          'rtoken': recaptchaToken,
          'recaptcha_token': recaptchaToken,
        },
      };

      Response response;
      try {
        response = await _dio.post(
          ApiEndpoints.sendPhoneUpdateOtpUrl,
          data: payload,
          options: Options(headers: {'Content-Type': 'application/json'}),
        );
      } on DioException catch (e) {
        if (e.response?.statusCode == 404) {
          if (kDebugMode) {
            print('[API] Primary endpoint 404, trying fallback ${ApiEndpoints.sendPhoneUpdateOtpFallbackUrl}');
          }
          response = await _dio.post(
            ApiEndpoints.sendPhoneUpdateOtpFallbackUrl,
            data: payload,
            options: Options(headers: {'Content-Type': 'application/json'}),
          );
        } else {
          rethrow;
        }
      }

      if (kDebugMode) {
        print('[API] sendPhoneUpdateOtp response: ${response.statusCode} -> ${response.data}');
      }

      dynamic resData = response.data;
      if (resData is List && resData.isNotEmpty) {
        resData = resData.first;
      }

      if (resData is Map<String, dynamic>) {
        final status = resData['status'];
        final message = resData['message']?.toString();

        if (status == 302 || status == 409) {
          return Left(ErrorResponse(
            message: message ?? 'This mobile number is already registered with another account',
          ));
        }

        if (status == 400 || resData['success'] == false || status == 'failure') {
          final msg = ApiErrorParser.extractErrorMessage(resData, defaultMessage: 'Failed to send OTP');
          return Left(ErrorResponse(message: msg));
        }

        return Right(OtpResponse(
          status: 200,
          message: message ?? 'OTP has been sent to your mobile number',
        ));
      }

      return const Right(OtpResponse(status: 200, message: 'OTP has been sent to your mobile number'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print('[API] sendPhoneUpdateOtp DioException: ${e.response?.statusCode} -> ${e.response?.data}');
      }
      final statusCode = e.response?.statusCode;
      if (statusCode == 302 || statusCode == 409) {
        final data = e.response?.data;
        String? msg;
        if (data is Map) {
          msg = data['message']?.toString();
        }
        return Left(ErrorResponse(
          message: msg ?? 'This mobile number is already registered with another account',
        ));
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print('[API] sendPhoneUpdateOtp error: $e');
      }
      return Left(ErrorResponse(message: ApiErrorParser.extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> validateOtp({
    required String mobile,
    required String otp,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.verifyOtpUrl,
        data: {
          'mobile': mobile,
          'otp': otp,
          'storeId': 1,
          'store_id': 1,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print('validateOtp -> ${response.data}');
      }

      if (response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        if (data['status'] == 'failure' || data['success'] == false || data['status'] == 400) {
          final msg = ApiErrorParser.extractErrorMessage(data, defaultMessage: 'Invalid OTP');
          return Left(ErrorResponse(message: msg));
        }
        return Right(data['message']?.toString() ?? 'OTP verified successfully.');
      }

      if (response.data is String) {
        final str = response.data.toString().replaceAll('"', '').trim();
        if (str.toLowerCase().contains('invalid') || str.toLowerCase().contains('not verified')) {
          return Left(ErrorResponse(message: ApiErrorParser.sanitize(str, fallback: 'Invalid OTP')));
        }
        return Right(str.isNotEmpty ? str : 'OTP verified successfully.');
      }

      return const Right('OTP verified successfully.');
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: ApiErrorParser.extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> updatePhoneNumber({
    required String mobile,
    required String otp,
  }) async {
    try {
      final response = await _dio.put(
        ApiEndpoints.updateCustomerMobileUrl,
        data: {
          'mobile': mobile,
          'otp': otp,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print('updateCustomerMobile -> ${response.data}');
      }

      dynamic resData = response.data;
      if (resData is List && resData.isNotEmpty) {
        resData = resData.first;
      }

      if (resData is Map<String, dynamic>) {
        final status = resData['status'];
        if (status == 400 || status == 409 || resData['success'] == false || status == 'failure') {
          final msg = ApiErrorParser.extractErrorMessage(resData, defaultMessage: 'Failed to update mobile number');
          return Left(ErrorResponse(message: msg));
        }
        final message = resData['message']?.toString() ?? 'Your mobile number has been updated successfully';
        return Right(message);
      }

      if (resData is String) {
        final str = resData.replaceAll('"', '').trim();
        return Right(str.isNotEmpty ? str : 'Your mobile number has been updated successfully');
      }

      return const Right('Your mobile number has been updated successfully');
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: ApiErrorParser.extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> changePassword({
    required int customerId,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      };

      final response = await _dio.put(
        ApiEndpoints.changePasswordUrl,
        queryParameters: {'customer_id': customerId},
        data: json.encode(body),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200 && response.data != false) {
        return const Right(true);
      } else {
        return const Left(
          ErrorResponse(
            message: 'Failed to change password. Please check your current password.',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> uploadProfileImage({
    required File image,
  }) async {
    try {
      String filePath = image.path;
      String fileName = filePath.split('/').last;

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(filePath, filename: fileName),
      });

      final response = await _dio.post(
        ApiEndpoints.uploadProfileImageUrl,
        data: formData,
      );
      return Right(response.data.toString());
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, OrderListResponse>> getOrderList({
    int limit = 10,
    int currentPage = 1,
  }) async {
    try {
      if (kDebugMode) {
        print('📦 [ORDER API] Getting Order List');
        print('  URL: V1/orders/mine');
        print('  Params: limit=$limit, current_page=$currentPage');
      }

      final response = await _dio.get(
        ApiEndpoints.getOrderListUrl,
        queryParameters: {'limit': limit, 'current_page': currentPage},
      );

      if (kDebugMode) {
        print('📦 [ORDER API] Response received');
        print('  Status Code: ${response.statusCode}');
        print('  Response Type: ${response.data.runtimeType}');
      }

      if (response.data is String) {
        final stringData = response.data as String;
        if (kDebugMode) {
          print('⚠️ [ORDER API] Received String response instead of JSON');
        }

        if (stringData.trim().startsWith('{') ||
            stringData.trim().startsWith('[')) {
          return Left(
            ErrorResponse(
              message: 'Invalid response format. API returned: $stringData',
            ),
          );
        }

        return Left(ErrorResponse(message: stringData));
      }

      if (response.data == null || response.data is! Map<String, dynamic>) {
        return Left(
          ErrorResponse(
            message:
                'Invalid response format. Expected JSON object, got: ${response.data.runtimeType}',
          ),
        );
      }

      return Right(
        OrderListResponse.fromJson(response.data as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print('❌ [ORDER API] DioException: ${e.message}');
        print('  Response: ${e.response?.data}');
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print('❌ [ORDER API] Unexpected error: $e');
      }
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, OrderDetailResponse>> getOrderDetails({
    required String orderId,
  }) async {
    try {
      if (kDebugMode) {
        print('📦 [ORDER API] Getting Order Details');
        print('  Order ID: $orderId');
      }

      if (orderId.isEmpty) {
        throw Exception('Invalid order ID: $orderId');
      }

      final response = await _dio.get(
        ApiEndpoints.getOrderDetailsUrl(orderId: orderId),
      );

      return Right(
        OrderDetailResponse.fromJson(response.data as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: ApiErrorParser.sanitize(e.toString(), fallback: 'Failed to load order details. Please try again.')));
    }
  }

  @override
  Future<Either<ErrorResponse, OrderCancelResponse>> cancelOrder({
    required String orderId,
    required String note,
    required String reason,
  }) async {
    try {
      final requestPayload = {
        'order_id': int.tryParse(orderId) ?? orderId,
        'note': note,
        'reason': reason,
      };
      if (kDebugMode) {
        print('✅ [cancel order] request: $requestPayload');
      }
      final response = await _dio.post(
        ApiEndpoints.cancelOrderUrl,
        data: requestPayload,
      );

      if (kDebugMode) {
        print('✅ [cancel order] Response: ${response.data}');
      }

      final dynamic data = response.data;
      Map<String, dynamic>? payload;

      if (data is List) {
        if (data.isEmpty) {
          return const Left(
            ErrorResponse(message: 'Empty response from server'),
          );
        }
        final first = data.first;
        if (first is Map<String, dynamic>) {
          payload = first;
        }
      } else if (data is Map<String, dynamic>) {
        payload = data;
      }

      if (payload == null) {
        return const Left(
          ErrorResponse(message: 'Unexpected response from server'),
        );
      }

      if (payload['status']?.toString().toLowerCase() == 'error' &&
          payload['orderstat']?.toString().toLowerCase() != 'canceled_by_seller' &&
          payload['entity_id'] == null) {
        return Left(
          ErrorResponse(
            message:
                payload['message']?.toString() ?? 'Problem in canceling order.',
          ),
        );
      }

      return Right(OrderCancelResponse.fromJson(payload));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(' [cancel order error ] Response: ${e.response}');
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> reorder({
    required String orderId,
    required String customerId,
  }) async {
    try {
      await _dio.post(
        ApiEndpoints.reorderUrl(orderId: orderId),
        data: json.encode({'customer_id': customerId}),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return const Right(true);
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, ClubPointResponse>> getClubPoints({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.pickabooClub,
        queryParameters: {'currentPage': page, 'clubPointsHistoryLimit': limit},
      );

      if (kDebugMode) {
        print('✅ [CLUB POINTS API] Response Status: ${response.statusCode}');
      }

      return Right(ClubPointResponse.fromJson(response.data));
    } on DioException catch (e) {
      if (kDebugMode) {
        print('❌ [CLUB POINTS API] DioException: ${e.message}');
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, ReferralResponse>> getReferralHistory({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.referralHistory,
        queryParameters: {'page': page, 'limit': limit},
      );

      if (kDebugMode) {
        print('get_referral_history -> ${response.data}');
      }

      return right(ReferralResponse.fromJson(response.data));
    } on DioException catch (e) {
      if (kDebugMode) {
        print('get_referral_history_error -> $e');
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> inviteFriend(
    Map<String, dynamic> body,
  ) async {
    try {
      await _dio.post(ApiEndpoints.referralInvite, data: body);

      if (kDebugMode) {
        print('invite_friend -> Success');
      }

      return right(true);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('invite_friend_error -> $e');
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> updateAddressList(
    Map<String, dynamic> body,
  ) async {
    if (kDebugMode) {
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('[API] 💾 UPDATE ADDRESS LIST');
      print('[API] Endpoint: ${ApiEndpoints.updateCustomerUrl}');
      print(
        '[API] Addresses count: ${(body['customer']?['addresses'] as List?)?.length ?? 0}',
      );
      print('[API] Body keys: ${body.keys.toList()}');
      if (body['customer']?['addresses'] != null) {
        final addresses = body['customer']['addresses'] as List;
        for (var i = 0; i < addresses.length; i++) {
          print(
            '[API] Address $i: ${addresses[i]['city']} (default_shipping: ${addresses[i]['default_shipping']}, default_billing: ${addresses[i]['default_billing']})',
          );
        }
      }
    }

    try {
      final response = await _dio.put(
        ApiEndpoints.updateCustomerUrl,
        data: json.encode(body),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print('[API] Response status: ${response.statusCode}');
        print('[API] ✅ Address list updated successfully');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }

      return Right(response.statusCode == 200);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('[API] ❌ DioException on updateAddressList (${ApiEndpoints.updateCustomerUrl}): ${e.response?.statusCode}');
      }

      // If custom dcastalia-address endpoint fails (e.g. 400 DI TypeError or 404),
      // attempt fallback to standard Magento PUT /rest/default/V1/customers/me
      try {
        if (kDebugMode) {
          print('[API] 🔄 Trying fallback to standard Magento: PUT ${ApiEndpoints.customerMe}');
        }
        final fallbackResponse = await _dio.put(
          ApiEndpoints.customerMe,
          data: json.encode(body),
          options: Options(headers: {'Content-Type': 'application/json'}),
        );
        if (kDebugMode) {
          print('[API] Fallback response status: ${fallbackResponse.statusCode}');
        }
        if (fallbackResponse.statusCode == 200) {
          if (kDebugMode) {
            print('[API] ✅ Address list updated via standard customer endpoint successfully');
            print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
          }
          return const Right(true);
        }
      } catch (fallbackError) {
        if (kDebugMode) {
          print('[API] ❌ Fallback to standard customer endpoint also failed: $fallbackError');
        }
      }

      if (kDebugMode) {
        print('[API] Status: ${e.response?.statusCode}');
        print('[API] Error data: ${e.response?.data}');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print('[API] ❌ Exception: $e');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> addAddress(
    Map<String, dynamic> body,
  ) async {
    if (kDebugMode) {
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('[API] 🏠 ADD NEW ADDRESS');
      print('[API] Endpoint: POST ${ApiEndpoints.customerAddressUrl}');
      print('[API] Body: ${json.encode(body)}');
    }

    try {
      final response = await _dio.post(
        ApiEndpoints.customerAddressUrl,
        data: json.encode(body),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print('[API] Response status: ${response.statusCode}');
        print('[API] Response data: ${response.data}');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }

      dynamic resData = response.data;
      if (resData is List && resData.isNotEmpty) {
        resData = resData.first;
      }

      if (resData is Map<String, dynamic>) {
        final status = resData['status'];
        if (status != null && status != 200 && status != 201) {
          final msg = ApiErrorParser.extractErrorMessage(
            resData,
            defaultMessage: 'Failed to save address',
          );
          return Left(ErrorResponse(message: msg));
        }
        final message = resData['message']?.toString() ?? 'Address saved successfully.';
        return Right(message);
      }

      if (resData is String) {
        final str = resData.replaceAll('"', '').trim();
        return Right(str.isNotEmpty ? str : 'Address saved successfully.');
      }

      return const Right('Address saved successfully.');
    } on DioException catch (e) {
      if (kDebugMode) {
        print('[API] ❌ DioException on addAddress: ${e.response?.statusCode}');
        print('[API] Error data: ${e.response?.data}');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print('[API] ❌ Exception on addAddress: $e');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(ErrorResponse(message: ApiErrorParser.extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> updateAddress(
    Map<String, dynamic> body,
  ) async {
    if (kDebugMode) {
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('[API] ✏️ UPDATE ADDRESS');
      print('[API] Endpoint: PUT ${ApiEndpoints.customerAddressUrl}');
      print('[API] Body: ${json.encode(body)}');
    }

    try {
      final response = await _dio.put(
        ApiEndpoints.customerAddressUrl,
        data: json.encode(body),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print('[API] Response status: ${response.statusCode}');
        print('[API] Response data: ${response.data}');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }

      dynamic resData = response.data;
      if (resData is List && resData.isNotEmpty) {
        resData = resData.first;
      }

      if (resData is Map<String, dynamic>) {
        final status = resData['status'];
        if (status != null && status != 200 && status != 201) {
          final msg = ApiErrorParser.extractErrorMessage(
            resData,
            defaultMessage: 'Failed to update address',
          );
          return Left(ErrorResponse(message: msg));
        }
        final message = resData['message']?.toString() ?? 'Address updated successfully.';
        return Right(message);
      }

      if (resData is String) {
        final str = resData.replaceAll('"', '').trim();
        return Right(str.isNotEmpty ? str : 'Address updated successfully.');
      }

      return const Right('Address updated successfully.');
    } on DioException catch (e) {
      if (kDebugMode) {
        print('[API] ❌ DioException on updateAddress: ${e.response?.statusCode}');
        print('[API] Error data: ${e.response?.data}');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print('[API] ❌ Exception on updateAddress: $e');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(ErrorResponse(message: ApiErrorParser.extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> deleteAddress(
    int addressId,
  ) async {
    final endpoint = ApiEndpoints.deleteCustomerAddressUrl(addressId);
    if (kDebugMode) {
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('[API] 🗑️ DELETE ADDRESS');
      print('[API] Endpoint: DELETE $endpoint');
      print('[API] Address ID: $addressId');
    }

    try {
      final response = await _dio.delete(
        endpoint,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print('[API] Response status: ${response.statusCode}');
        print('[API] Response data: ${response.data}');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }

      dynamic resData = response.data;
      if (resData is List && resData.isNotEmpty) {
        resData = resData.first;
      }

      if (resData is Map<String, dynamic>) {
        final status = resData['status'];
        if (status != null && status != 200 && status != 201) {
          final msg = ApiErrorParser.extractErrorMessage(
            resData,
            defaultMessage: 'Failed to delete address',
          );
          return Left(ErrorResponse(message: msg));
        }
        final message = resData['message']?.toString() ?? 'Address deleted successfully.';
        return Right(message);
      }

      if (resData is String) {
        final str = resData.replaceAll('"', '').trim();
        return Right(str.isNotEmpty ? str : 'Address deleted successfully.');
      }

      return const Right('Address deleted successfully.');
    } on DioException catch (e) {
      if (kDebugMode) {
        print('[API] ❌ DioException on deleteAddress: ${e.response?.statusCode}');
        print('[API] Error data: ${e.response?.data}');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print('[API] ❌ Exception on deleteAddress: $e');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(ErrorResponse(message: ApiErrorParser.extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<ErrorResponse, List<CityResponse>>> getCities(
    String division,
  ) async {
    if (kDebugMode) {
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('[API] 🏙️ GET CITIES');
      print('[API] Division: $division');
      print('[API] Endpoint: ${ApiEndpoints.getCityUrl}');
      print('[API] Query: {param: $division}');
    }

    try {
      Response response;
      try {
        response = await _dio.get(
          ApiEndpoints.getCityUrl,
          queryParameters: {'param': division},
        );
      } on DioException catch (dioErr) {
        // If staging has a backend DI failure, automatically fallback to production
        if (_dio.options.baseUrl != ApiConfig.productionURL) {
          if (kDebugMode) {
            print(
              '[API] ⚠️ Staging getCity failed (${dioErr.response?.statusCode}), trying production fallback...',
            );
          }
          response = await _dio.get(
            '${ApiConfig.productionURL}${ApiEndpoints.getCityUrl}',
            queryParameters: {'param': division},
          );
        } else {
          rethrow;
        }
      }

      if (kDebugMode) {
        print('[API] Response type: ${response.data.runtimeType}');
        print('[API] Response data: ${response.data}');
      }

      if (response.data is List) {
        final cities = (response.data as List)
            .map((e) => CityResponse.fromJson(e as Map<String, dynamic>))
            .toList();

        if (kDebugMode) {
          print('[API] ✅ Loaded ${cities.length} cities');
          if (cities.isNotEmpty) {
            print('[API] First city: ${cities.first.citiesName}');
          }
          print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        }

        return Right(cities);
      }

      if (kDebugMode) {
        print('[API] ⚠️ Response is not a List, returning empty');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return const Right([]);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('[API] ❌ DioException');
        print('[API] Status: ${e.response?.statusCode}');
        print('[API] Error data: ${e.response?.data}');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print('[API] ❌ Exception: $e');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, List<AreaResponse>>> getAreas(
    String city,
  ) async {
    if (kDebugMode) {
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('[API] 📍 GET AREAS');
      print('[API] City: $city');
      print('[API] Endpoint: ${ApiEndpoints.getAreaUrl}');
      print('[API] Query: {param: $city}');
    }

    try {
      Response response;
      try {
        response = await _dio.get(
          ApiEndpoints.getAreaUrl,
          queryParameters: {'param': city},
        );
      } on DioException catch (dioErr) {
        // If staging has a backend DI failure, automatically fallback to production
        if (_dio.options.baseUrl != ApiConfig.productionURL) {
          if (kDebugMode) {
            print(
              '[API] ⚠️ Staging getArea failed (${dioErr.response?.statusCode}), trying production fallback...',
            );
          }
          response = await _dio.get(
            '${ApiConfig.productionURL}${ApiEndpoints.getAreaUrl}',
            queryParameters: {'param': city},
          );
        } else {
          rethrow;
        }
      }

      if (kDebugMode) {
        print('[API] Response type: ${response.data.runtimeType}');
        print('[API] Response data: ${response.data}');
      }

      if (response.data is List) {
        final areas = (response.data as List)
            .map((e) => AreaResponse.fromJson(e as Map<String, dynamic>))
            .toList();

        if (kDebugMode) {
          print('[API] ✅ Loaded ${areas.length} areas');
          if (areas.isNotEmpty) {
            print('[API] First area: ${areas.first.citiesName}');
          }
          print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        }

        return Right(areas);
      }

      if (kDebugMode) {
        print('[API] ⚠️ Response is not a List, returning empty');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return const Right([]);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('[API] ❌ DioException');
        print('[API] Status: ${e.response?.statusCode}');
        print('[API] Error data: ${e.response?.data}');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(_checkErrorResponse(e));
    } catch (e) {
      if (kDebugMode) {
        print('[API] ❌ Exception: $e');
        print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      }
      return Left(ErrorResponse(message: e.toString()));
    }
  }
}
