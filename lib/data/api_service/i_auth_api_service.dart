import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/api_service/auth_api_service.dart';
import 'package:pickaboo/data/model/auth/check_user_response/check_user_response.dart';
import 'package:pickaboo/data/model/auth/login_request/login_request.dart';
import 'package:pickaboo/data/model/auth/otp_response/otp_response.dart';
import 'package:pickaboo/data/model/auth/register_request/register_request.dart';
import 'package:pickaboo/data/model/auth/social_login_request/social_login_request.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import 'package:pickaboo/data/model/customer_status_response/customer_status_response.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

@LazySingleton(as: AuthApiService)
class IAuthApiService extends AuthApiService {
  final Dio _client;

  IAuthApiService(this._client);

  ErrorResponse checkErrorResponse(DioException err) {
    if (err.type == DioExceptionType.badResponse) {
      final errorData = err.response?.data;

      if (errorData is Map<String, dynamic>) {
        return ErrorResponse.fromJson(errorData);
      }
    }
    return const ErrorResponse(message: 'Something went wrong');
  }

  @override
  Future<Either<ErrorResponse, CustomerStatusResponse>> checkCustomer({
    required String phone,
  }) async {
    try {
      var data = json.encode({"mobile": phone});
      final response = await _client.post(
        ApiEndpoints.checkCustomerUrl,
        data: data,
      );

      if (kDebugMode) {
        print("check_customer -> ${response.data}");
      }

      final responseData = response.data;

      if (responseData is Map<String, dynamic>) {
        return right(CustomerStatusResponse.fromJson(responseData));
      }

      return left(
        const ErrorResponse(message: 'Invalid customer status response format'),
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print("check_customer_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> login(LoginRequest request) async {
    try {
      final response = await _client.post(
        ApiEndpoints.loginUrl,
        data: request.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("login -> ${response.data}");
      }

      if (response.data is String) {
        return right(response.data.toString().replaceAll('"', ''));
      }

      return left(const ErrorResponse(message: 'Invalid login response'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("login_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CheckUserResponse>> checkUserExists(
    String username,
  ) async {
    try {
      final response = await _client.post(
        ApiEndpoints.checkUserExistsUrl,
        data: json.encode({"mobile": username}),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("check_user_exists -> ${response.data}");
      }

      if (response.data is Map<String, dynamic>) {
        return right(CheckUserResponse.fromJson(response.data));
      }

      return left(const ErrorResponse(message: 'Invalid response'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("check_user_exists_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, OtpResponse>> sendOtp({
    required String encryptedMobile,
    required String eventType,
    bool resend = false,
    String? recaptchaToken,
  }) async {
    try {
      final platform = Platform.isAndroid ? 'android' : 'ios';

      if (kDebugMode) {
        print('[RECAPTCHA] sendOtp | rtokenPresent=${recaptchaToken != null} '
            'rtokenLen=${recaptchaToken?.length ?? 0} platform=$platform');
      }

      final response = await _client.post(
        ApiEndpoints.sendOtpUrl,
        queryParameters: {
          'resend': resend ? 1 : 0,
          'store_id': 1,
          'mobile': encryptedMobile,
          'event_type': eventType,
          'platform': platform,
          if (recaptchaToken != null) 'rtoken': recaptchaToken,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("send_otp -> ${json.encode(response.data)}");
      }

      if (response.data is Map<String, dynamic>) {
        return right(OtpResponse.fromJson(response.data));
      }

      return left(const ErrorResponse(message: 'Invalid OTP response'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("send_otp_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> verifyOtp({
    required String mobile,
    required String otp,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.verifyOtpUrl,
        queryParameters: {'store_id': 1, 'mobile': mobile, 'otp': otp},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("verify_otp -> ${json.encode(response.data)}");
      }

      if (response.data is String) {
        final responseData = response.data.toString();
        if (responseData == "Verified") {
          return right(responseData);
        } else if (responseData == "Not Verified") {
          return left(const ErrorResponse(message: 'Invalid OTP'));
        }
        return right(responseData);
      }

      return left(const ErrorResponse(message: 'OTP verification failed'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("verify_otp_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, UserResponse>> registerUser(
    RegisterRequest request,
  ) async {
    try {
      final response = await _client.post(
        ApiEndpoints.registerUserUrl,
        data: request.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("register_user -> ${response.data}");
        print("register_user_type -> ${response.data.runtimeType}");
      }

      if (response.data is Map<String, dynamic>) {
        return right(UserResponse.fromJson(response.data));
      } else if (response.data is String &&
          (response.data as String).isNotEmpty) {
        return right(
          const UserResponse(),
        );
      }

      return left(const ErrorResponse(message: 'Registration failed'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("register_user_error -> $e");
        print("register_user_error_data -> ${e.response?.data}");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, OtpResponse>> sendEmailOtp(
    String email, {
    String? recaptchaToken,
  }) async {
    try {
      final platform = Platform.isAndroid ? 'android' : 'ios';

      if (kDebugMode) {
        print('[RECAPTCHA] sendEmailOtp | rtokenPresent=${recaptchaToken != null} '
            'rtokenLen=${recaptchaToken?.length ?? 0} platform=$platform');
      }

      final response = await _client.post(
        ApiEndpoints.sendEmailOtpUrl,
        queryParameters: {
          'customer_email': email,
          'platform': platform,
          if (recaptchaToken != null) 'rtoken': recaptchaToken,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("send_email_otp -> ${response.data}");
      }

      if (response.data is Map<String, dynamic>) {
        return right(OtpResponse.fromJson(response.data));
      }

      return left(const ErrorResponse(message: 'Failed to send email OTP'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("send_email_otp_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> verifyEmailOtp({
    required String email,
    required String code,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.verifyEmailOtpUrl,
        queryParameters: {'customer_email': email, 'code': code},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("verify_email_otp -> ${response.data}");
      }

      if (response.data is String) {
        return right(response.data.toString());
      }

      return left(const ErrorResponse(message: 'Email verification failed'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("verify_email_otp_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, OtpResponse>> sendForgotPasswordOtp({
    String? email,
    String? mobile,
    String? recaptchaToken,
  }) async {
    try {
      final platform = Platform.isAndroid ? 'android' : 'ios';
      final body = <String, dynamic>{};
      if (recaptchaToken != null) {
        body['rtoken'] = recaptchaToken;
      }
      if (email != null) {
        body['email'] = email;
      }
      if (mobile != null) {
        body['mobile'] = mobile;
      }
      body['platform'] = platform;

      final encodedBody = json.encode(body);
      print('[RECAPTCHA] sendForgotPasswordOtp | rtokenPresent='
          '${recaptchaToken != null} rtokenLen=${recaptchaToken?.length ?? 0}');
      print('[RECAPTCHA] sendForgotPasswordOtp | email=$email | mobile=$mobile | platform=$platform');
      final curlCommand = 'curl -X POST ${ApiEndpoints.sendForgotPasswordOtpUrl} -H "Content-Type: application/json" -d \'$encodedBody\'';
      print('--- START CURL ---');
      for (var i = 0; i < curlCommand.length; i += 1000) {
        print(curlCommand.substring(i, i + 1000 > curlCommand.length ? curlCommand.length : i + 1000));
      }
      print('--- END CURL ---');

      final response = await _client.post(
        ApiEndpoints.sendForgotPasswordOtpUrl,
        data: body,
      );

      print('[RECAPTCHA] sendForgotPasswordOtp RESPONSE | status='
          '${response.statusCode} data=${json.encode(response.data)}');

      if (response.data is Map<String, dynamic>) {
        return right(OtpResponse.fromJson(response.data));
      }

      return left(ErrorResponse(message: response.data.toString()));
    } on DioException catch (e) {
      print('[RECAPTCHA] sendForgotPasswordOtp ERROR | status='
          '${e.response?.statusCode} data=${e.response?.data} msg=${e.message}');
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> resetPassword({
    String? mobile,
    String? email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'otp': otp,
        'new_password': newPassword,
      };

      if (mobile != null) {
        body['mobile'] = mobile;
      }
      if (email != null) {
        body['email'] = email;
      }

      final response = await _client.post(
        ApiEndpoints.resetPasswordUrl,
        data: body,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      print('[RECAPTCHA] resetPassword RESPONSE | status='
          '${response.statusCode} data=${json.encode(response.data)}');

      if (response.data is String) {
        return right(response.data.toString());
      }

      if (response.data is Map<String, dynamic> &&
          response.data['status'] == true) {
        return right(response.data['message'] ?? 'Password reset successful');
      }

      return left(const ErrorResponse(message: 'Password reset failed'));
    } on DioException catch (e) {
      print('[RECAPTCHA] resetPassword ERROR | status='
          '${e.response?.statusCode} data=${e.response?.data} msg=${e.message}');
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> socialLogin(
    SocialLoginRequest request,
  ) async {
    try {
      final response = await _client.post(
        ApiEndpoints.socialLoginUrl,
        data: request.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("social_login -> ${response.data}");
      }

      if (response.data is String) {
        return right(response.data.toString().replaceAll('"', ''));
      }

      return left(const ErrorResponse(message: 'Social login failed'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("social_login_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, UserResponse>> getCurrentUser({
    String? token,
  }) async {
    try {
      final headers = {'Content-Type': 'application/json'};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await _client.get(
        ApiEndpoints.getCurrentUserUrl,
        options: Options(headers: headers),
      );

      if (kDebugMode) {
        print("get_current_user -> ${response.data}");
      }

      if (response.data is Map<String, dynamic>) {
        return right(UserResponse.fromJson(response.data));
      }

      return left(const ErrorResponse(message: 'Failed to get user'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("get_current_user_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> loginWithGoogle() async {
    try {
      if (kDebugMode) {
        print('🔵 [API Service] loginWithGoogle: Starting...');
      }

      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        if (kDebugMode) {
          print('⚠️ [API Service] loginWithGoogle: User cancelled sign-in');
        }
        return left(const ErrorResponse(message: 'Google sign-in cancelled'));
      }

      if (kDebugMode) {
        print(
          '🔵 [API Service] loginWithGoogle: User signed in: ${googleUser.email}',
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? accessToken = googleAuth.accessToken;

      if (kDebugMode) {
        print(
          '🔵 [API Service] loginWithGoogle: Access token received: ${accessToken != null ? "✅ Yes" : "❌ No"}',
        );
        if (accessToken != null) {
          print('   - Token length: ${accessToken.length}');
          print(
            '   - Token preview: ${accessToken.substring(0, accessToken.length > 20 ? 20 : accessToken.length)}...',
          );
        }
      }

      if (accessToken == null) {
        if (kDebugMode) {
          print('❌ [API Service] loginWithGoogle: Failed to get access token');
        }
        return left(
          const ErrorResponse(message: 'Failed to get Google access token'),
        );
      }

      final source = Platform.isAndroid ? 'android' : 'ios';
      final request = SocialLoginRequest(
        accessToken: accessToken,
        type: 'google',
        source: source,
      );

      if (kDebugMode) {
        print('🔵 [API Service] loginWithGoogle: Calling socialLogin API...');
        print('   - Provider: google');
        print('   - Source: $source');
        print('   - Endpoint: ${ApiEndpoints.socialLoginUrl}');
      }

      final result = await socialLogin(request);

      result.fold(
        (error) {
          if (kDebugMode) {
            print('❌ [API Service] loginWithGoogle: API call failed');
            print('   - Error: ${error.message}');
          }
        },
        (token) {
          if (kDebugMode) {
            print('✅ [API Service] loginWithGoogle: API call successful');
            print('   - Auth token received (length: ${token.length})');
          }
        },
      );

      return result;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('❌ [API Service] loginWithGoogle: Exception occurred');
        print('   - Error: $e');
        print('   - Stack trace: $stackTrace');
      }
      return left(
        ErrorResponse(message: 'Google Sign-In failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, String>> loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.cancelled) {
        return left(const ErrorResponse(message: 'Facebook sign-in cancelled'));
      }

      if (result.status != LoginStatus.success) {
        return left(
          ErrorResponse(
            message:
                'Facebook Sign-In failed: ${result.message ?? "Unknown error"}',
          ),
        );
      }

      final AccessToken? accessToken = result.accessToken;

      if (accessToken == null) {
        return left(
          const ErrorResponse(message: 'Failed to get Facebook access token'),
        );
      }

      final source = Platform.isAndroid ? 'android' : 'ios';
      final request = SocialLoginRequest(
        accessToken: accessToken.tokenString,
        type: 'facebook',
        source: source,
      );

      if (kDebugMode) {
        print("login_with_facebook -> initiating with source: $source");
      }

      return await socialLogin(request);
    } catch (e) {
      if (kDebugMode) {
        print("login_with_facebook_error -> $e");
      }
      return left(
        ErrorResponse(message: 'Facebook Sign-In failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, String>> loginWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final String? identityToken = credential.identityToken;

      if (identityToken == null) {
        return left(
          const ErrorResponse(message: 'Failed to get Apple identity token'),
        );
      }

      final request = SocialLoginRequest(
        accessToken: identityToken,
        type: 'apple',
        source: 'ios',
      );

      if (kDebugMode) {
        print("login_with_apple -> initiating");
      }

      return await socialLogin(request);
    } catch (e) {
      if (kDebugMode) {
        print("login_with_apple_error -> $e");
      }
      return left(
        ErrorResponse(message: 'Apple Sign-In failed: ${e.toString()}'),
      );
    }
  }
}
