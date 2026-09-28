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
      debugPrint('👤 [PROFILE_API] GET ${ApiEndpoints.customerMe}');
      final response = await _dio.get(ApiEndpoints.customerMe);
      debugPrint('👤 [PROFILE_API] customerMe status: ${response.statusCode}');
      if (response.data is Map) {
        final custAttrs = response.data['custom_attributes'];
        debugPrint('👤 [PROFILE_API] customerMe custom_attributes: $custAttrs');
      }
      return Right(UserResponse.fromJson(response.data));
    } on DioException catch (e) {
      debugPrint('👤 [PROFILE_API] ❌ DioException on getUserProfile: ${e.response?.statusCode} - ${e.response?.data}');
      return Left(_checkErrorResponse(e));
    } catch (e) {
      debugPrint('👤 [PROFILE_API] ❌ Exception on getUserProfile: $e');
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> getUserImage() async {
    try {
      debugPrint('📸 [GET_USER_IMAGE] GET ${ApiEndpoints.customerImageMine}');
      final response = await _dio.get(ApiEndpoints.customerImageMine);
      debugPrint('📸 [GET_USER_IMAGE] status: ${response.statusCode}');
      debugPrint('📸 [GET_USER_IMAGE] raw data type: ${response.data.runtimeType}, data: ${response.data}');
      dynamic data = response.data;
      if (data is List && data.isNotEmpty) data = data.first;
      if (data is Map) {
        data = data['url'] ?? data['image'] ?? data['profile_image'] ?? data['image_url'];
      }
      final cleanUrl = data?.toString().replaceAll('"', '').trim() ?? '';
      debugPrint('📸 [GET_USER_IMAGE] parsed cleanUrl: "$cleanUrl"');
      return Right(cleanUrl);
    } on DioException catch (e) {
      debugPrint('📸 [GET_USER_IMAGE] ❌ DioException: ${e.response?.statusCode} - ${e.response?.data}');
      return Left(_checkErrorResponse(e));
    } catch (e) {
      debugPrint('📸 [GET_USER_IMAGE] ❌ Exception: $e');
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
      final Map<String, dynamic> customerData = {
        'firstname': firstName.trim(),
        'lastname': lastName.trim(),
      };

      if (userMap['email'] != null) {
        customerData['email'] = userMap['email'];
      }
      if (userMap['website_id'] != null) {
        customerData['website_id'] = userMap['website_id'];
      }

      final parsedGender = int.tryParse(gender);
      if (parsedGender != null && parsedGender > 0) {
        customerData['gender'] = parsedGender;
      }

      if (dob.trim().isNotEmpty) {
        customerData['dob'] = dob.trim();
      }

      final Map<String, dynamic> body = {
        'customer': customerData,
      };

      final response = await _dio.put(
        ApiEndpoints.updateCustomerUrl,
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

      debugPrint('[RECAPTCHA_API] 🌐 sendPhoneUpdateOtp POST -> ${ApiEndpoints.sendPhoneUpdateOtpUrl}');
      debugPrint('[RECAPTCHA_API]    platform=$platform, mobile=$mobile, resend=$resend');
      debugPrint('[RECAPTCHA_API]    rtokenLen=${recaptchaToken?.length ?? 0}, rtokenPreview=${recaptchaToken != null && recaptchaToken.length > 20 ? recaptchaToken.substring(0, 20) : recaptchaToken}...');

      Response response;
      try {
        response = await _dio.post(
          ApiEndpoints.sendPhoneUpdateOtpUrl,
          data: payload,
          options: Options(headers: {'Content-Type': 'application/json'}),
        );
      } on DioException catch (e) {
        if (e.response?.statusCode == 404) {
          debugPrint('[RECAPTCHA_API] ⚠️ sendPhoneUpdateOtp got 404, attempting fallback -> ${ApiEndpoints.sendPhoneUpdateOtpFallbackUrl}');
          response = await _dio.post(
            ApiEndpoints.sendPhoneUpdateOtpFallbackUrl,
            data: payload,
            options: Options(headers: {'Content-Type': 'application/json'}),
          );
        } else {
          debugPrint('[RECAPTCHA_API] ❌ sendPhoneUpdateOtp DioException [${e.response?.statusCode}]: ${e.response?.data ?? e.message}');
          rethrow;
        }
      }

      debugPrint('[RECAPTCHA_API] 📥 sendPhoneUpdateOtp response [${response.statusCode}]: ${response.data}');

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
      debugPrint('[RECAPTCHA_API] ❌ sendPhoneUpdateOtp DioException [${e.response?.statusCode}]: ${e.response?.data ?? e.message}');
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
      debugPrint('[RECAPTCHA_API] ❌ sendPhoneUpdateOtp unexpected error: $e');
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
      final filePath = image.path;
      final fileName = filePath.split('/').last;

      final fileBytes = await image.readAsBytes();

      debugPrint('📸 [UPLOAD_IMAGE_API] ========================================');
      debugPrint('📸 [UPLOAD_IMAGE_API] Starting upload to: POST ${ApiEndpoints.uploadProfileImageUrl}');
      debugPrint('📸 [UPLOAD_IMAGE_API] File path: $filePath');
      debugPrint('📸 [UPLOAD_IMAGE_API] File size: ${fileBytes.length} bytes');
      debugPrint('📸 [UPLOAD_IMAGE_API] Sending FormData keys: "file" and "image"');

      // Send under both 'file' (Postman collection contract) and 'image' (legacy)
      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(fileBytes, filename: fileName),
        'image': MultipartFile.fromBytes(fileBytes, filename: fileName),
      });

      final response = await _dio.post(
        ApiEndpoints.uploadProfileImageUrl,
        data: formData,
      );

      debugPrint('📸 [UPLOAD_IMAGE_API] Response status: ${response.statusCode}');
      debugPrint('📸 [UPLOAD_IMAGE_API] Raw response type: ${response.data.runtimeType}');
      debugPrint('📸 [UPLOAD_IMAGE_API] Raw response body: ${response.data}');

      dynamic resData = response.data;
      if (resData is List && resData.isNotEmpty) {
        resData = resData.first;
      }
      if (resData is Map) {
        resData = resData['url'] ??
            resData['image'] ??
            resData['profile_image'] ??
            resData['image_url'] ??
            resData['data'];
      }

      final cleanResult = resData?.toString().replaceAll('"', '').trim() ?? '';
      debugPrint('📸 [UPLOAD_IMAGE_API] Parsed cleanResult: "$cleanResult"');
      debugPrint('📸 [UPLOAD_IMAGE_API] ========================================');
      return Right(cleanResult);
    } on DioException catch (e) {
      debugPrint('📸 [UPLOAD_IMAGE_API] ❌ DioException: ${e.response?.statusCode}');
      debugPrint('📸 [UPLOAD_IMAGE_API] ❌ Response data: ${e.response?.data}');
      debugPrint('📸 [UPLOAD_IMAGE_API] ❌ Message: ${e.message}');
      debugPrint('📸 [UPLOAD_IMAGE_API] ========================================');
      return Left(_checkErrorResponse(e));
    } catch (e) {
      debugPrint('📸 [UPLOAD_IMAGE_API] ❌ Exception: $e');
      debugPrint('📸 [UPLOAD_IMAGE_API] ========================================');
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, OrderListResponse>> getOrderList({
    int limit = 10,
    int currentPage = 1,
  }) async {
    try {

      final response = await _dio.get(
        ApiEndpoints.getOrderListUrl,
        queryParameters: {'limit': limit, 'current_page': currentPage},
      );

      if (response.data is String) {
        final stringData = response.data as String;

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
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, OrderDetailResponse>> getOrderDetails({
    required String orderId,
  }) async {
    try {

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
      final response = await _dio.post(
        ApiEndpoints.cancelOrderUrl,
        data: requestPayload,
      );

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
      debugPrint('🔄 [REORDER_API] POST ${ApiEndpoints.reorderUrl(orderId: orderId)} with customerId: $customerId');
      final stopwatch = Stopwatch()..start();
      final response = await _dio.post(
        ApiEndpoints.reorderUrl(orderId: orderId),
        data: json.encode({'customer_id': customerId}),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      stopwatch.stop();
      debugPrint('🔄 [REORDER_API] Completed in ${stopwatch.elapsedMilliseconds}ms. Response: ${response.data}');

      return const Right(true);
    } on DioException catch (e) {
      debugPrint('🔄 [REORDER_API] ❌ DioException: ${e.response?.statusCode} - ${e.response?.data}');
      return Left(_checkErrorResponse(e));
    } catch (e) {
      debugPrint('🔄 [REORDER_API] ❌ Exception: $e');
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

      return Right(ClubPointResponse.fromJson(response.data));
    } on DioException catch (e) {
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

      return right(ReferralResponse.fromJson(response.data));
    } on DioException catch (e) {
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

      return right(true);
    } on DioException catch (e) {
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
      if (body['customer']?['addresses'] != null) {
        final addresses = body['customer']['addresses'] as List;
        for (var i = 0; i < addresses.length; i++) {
        }
      }
    }

    try {
      final response = await _dio.put(
        ApiEndpoints.updateCustomerUrl,
        data: json.encode(body),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return Right(response.statusCode == 200);
    } on DioException catch (e) {

      // If custom dcastalia-address endpoint fails (e.g. 400 DI TypeError or 404),
      // attempt fallback to standard Magento PUT /rest/default/V1/customers/me
      try {
        final fallbackResponse = await _dio.put(
          ApiEndpoints.customerMe,
          data: json.encode(body),
          options: Options(headers: {'Content-Type': 'application/json'}),
        );
        if (fallbackResponse.statusCode == 200) {
          return const Right(true);
        }
      } catch (fallbackError) {
      }

      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> addAddress(
    Map<String, dynamic> body,
  ) async {

    try {
      final response = await _dio.post(
        ApiEndpoints.customerAddressUrl,
        data: json.encode(body),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

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
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: ApiErrorParser.extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> updateAddress(
    Map<String, dynamic> body,
  ) async {

    try {
      final response = await _dio.put(
        ApiEndpoints.customerAddressUrl,
        data: json.encode(body),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

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
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: ApiErrorParser.extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> deleteAddress(
    int addressId,
  ) async {
    final endpoint = ApiEndpoints.deleteCustomerAddressUrl(addressId);

    try {
      final response = await _dio.delete(
        endpoint,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

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
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: ApiErrorParser.extractErrorMessage(e)));
    }
  }

  @override
  Future<Either<ErrorResponse, List<CityResponse>>> getCities(
    String division,
  ) async {

    try {
      Response response;
      try {
        response = await _dio.get(
          ApiEndpoints.getCityUrl,
          queryParameters: {'param': division},
        );
      } on DioException {
        // If staging has a backend DI failure, automatically fallback to production
        if (_dio.options.baseUrl != ApiConfig.productionURL) {
          response = await _dio.get(
            '${ApiConfig.productionURL}${ApiEndpoints.getCityUrl}',
            queryParameters: {'param': division},
          );
        } else {
          rethrow;
        }
      }

      if (response.data is List) {
        final cities = (response.data as List)
            .map((e) => CityResponse.fromJson(e as Map<String, dynamic>))
            .toList();

        if (kDebugMode) {
          if (cities.isNotEmpty) {
          }
        }

        return Right(cities);
      }

      return const Right([]);
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, List<AreaResponse>>> getAreas(
    String city,
  ) async {

    try {
      Response response;
      try {
        response = await _dio.get(
          ApiEndpoints.getAreaUrl,
          queryParameters: {'param': city},
        );
      } on DioException {
        // If staging has a backend DI failure, automatically fallback to production
        if (_dio.options.baseUrl != ApiConfig.productionURL) {
          response = await _dio.get(
            '${ApiConfig.productionURL}${ApiEndpoints.getAreaUrl}',
            queryParameters: {'param': city},
          );
        } else {
          rethrow;
        }
      }

      if (response.data is List) {
        final areas = (response.data as List)
            .map((e) => AreaResponse.fromJson(e as Map<String, dynamic>))
            .toList();

        if (kDebugMode) {
          if (areas.isNotEmpty) {
          }
        }

        return Right(areas);
      }

      return const Right([]);
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }
}
