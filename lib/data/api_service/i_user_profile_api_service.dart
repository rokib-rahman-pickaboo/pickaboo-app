import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:pickaboo/core/endpoints/api_endpoints.dart';
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
    if (err.type == DioExceptionType.badResponse) {
      final errorData = err.response?.data;
      if (errorData is Map<String, dynamic>) {
        return ErrorResponse.fromJson(errorData);
      }
      if (errorData is String) {
        return ErrorResponse(message: errorData);
      }
    }
    return ErrorResponse(message: err.message ?? 'Unknown error');
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
  Future<Either<ErrorResponse, UserResponse>> updateEmail({
    required Map<String, dynamic> userMap,
    required String newEmail,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'customer': {...userMap, 'email': newEmail},
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
  Future<Either<ErrorResponse, OtpResponse>> sendPhoneUpdateOtp({
    required String mobile,
    String? recaptchaToken,
  }) async {
    try {
      final platform = Platform.isAndroid ? 'android' : 'ios';

      if (kDebugMode) {
        print('[RECAPTCHA] sendPhoneUpdateOtp | rtokenPresent=${recaptchaToken != null} '
            'rtokenLen=${recaptchaToken?.length ?? 0} platform=$platform');
      }

      final response = await _dio.post(
        ApiEndpoints.sendOtpUrl,
        queryParameters: {
          'resend': 0,
          'storeId': 1,
          'mobile': mobile,
          'eventType': 'customer_account_edit_otp',
          'platform': platform,
          if (recaptchaToken != null) 'rtoken': recaptchaToken,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return Right(OtpResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, UserResponse>> updatePhoneNumber({
    required Map<String, dynamic> userMap,
    required String mobile,
    required String otp,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'customer': {...userMap},
        'mobile': mobile,
        'otp': otp,
      };

      final customerId = userMap['id'];

      final response = await _dio.put(
        ApiEndpoints.updateCustomerUrl,
        queryParameters: {'customer_id': customerId},
        data: json.encode(body),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final data = response.data;
      final userResponse = UserResponse.fromJson(data);
      final hasValidCustomer =
          userResponse.id != null && userResponse.id != 0;

      if (!hasValidCustomer) {
        String? failureMessage;
        if (data is Map) {
          final rawMessage = data['message'] ?? data['error'];
          if (rawMessage != null && rawMessage.toString().trim().isNotEmpty) {
            failureMessage = rawMessage.toString();
          }
        }
        return Left(
          ErrorResponse(
            message: failureMessage ?? 'Failed to update mobile number',
          ),
        );
      }

      return Right(userResponse);
    } on DioException catch (e) {
      return Left(_checkErrorResponse(e));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
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
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return const Right(false);
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
      return Left(ErrorResponse(message: e.toString()));
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
          return Left(
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
        return Left(
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
      final response = await _dio.get(
        ApiEndpoints.getCityUrl,
        queryParameters: {'param': division},
      );

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
      final response = await _dio.get(
        ApiEndpoints.getAreaUrl,
        queryParameters: {'param': city},
      );

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
