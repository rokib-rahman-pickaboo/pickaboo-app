import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/config/api_config.dart';
import 'package:pickaboo/core/constants/app_constants.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/api_service/auth_api_service.dart';
import 'package:pickaboo/data/model/auth/check_user_response/check_user_response.dart';
import 'package:pickaboo/data/model/auth/login_request/login_request.dart';
import 'package:pickaboo/data/model/auth/otp_response/otp_response.dart';
import 'package:pickaboo/data/model/auth/register_request/register_request.dart';
import 'package:pickaboo/data/model/auth/social_login_request/social_login_request.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import 'package:pickaboo/data/model/customer_status_response/customer_status_response.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

@LazySingleton(as: AuthApiService)
class IAuthApiService extends AuthApiService {
  final Dio _client;

  IAuthApiService(this._client);

  ErrorResponse checkErrorResponse(DioException err) {
    return ApiErrorParser.parseDioError(err);
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
      final payload = {
        ...request.toJson(),
        'websiteId': request.websiteId,
      };
      final response = await _client.post(
        ApiEndpoints.loginUrl,
        data: payload,
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
        print('[RECAPTCHA] sendOtp | resend=$resend rtokenPresent=${recaptchaToken != null} '
            'rtokenLen=${recaptchaToken?.length ?? 0} platform=$platform');
      }

      final response = await _client.post(
        ApiEndpoints.sendOtpUrl,
        queryParameters: {
          'resend': resend ? 1 : 0,
          'storeId': 1,
          'store_id': 1,
          'mobile': encryptedMobile,
          'eventType': eventType,
          'event_type': eventType,
          'platform': platform,
          if (recaptchaToken != null && recaptchaToken.isNotEmpty)
            'rtoken': recaptchaToken,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("send_otp -> ${json.encode(response.data)}");
      }

      if (response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        if (data['status'] == 400 ||
            data['status'] == 'failure' ||
            data['success'] == false) {
          final msg = ApiErrorParser.extractErrorMessage(
            data,
            defaultMessage: 'Failed to send OTP',
          );
          return left(ErrorResponse(message: msg));
        }
        return right(OtpResponse(
          status: 200,
          message: data['message']?.toString() ??
              'OTP has been sent to your mobile number.',
        ));
      }

      return right(const OtpResponse(
        status: 200,
        message: 'OTP has been sent to your mobile number.',
      ));
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
        data: {
          'mobile': mobile,
          'otp': otp,
          'storeId': 1,
          'store_id': 1,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("verify_otp -> ${json.encode(response.data)}");
      }

      if (response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        if (data['status'] == 'failure' ||
            data['success'] == false ||
            data['status'] == 400) {
          final msg = ApiErrorParser.extractErrorMessage(
            data,
            defaultMessage: 'Invalid OTP',
          );
          return left(ErrorResponse(message: msg));
        }
        return right(
          data['message']?.toString() ?? 'OTP verified successfully.',
        );
      }

      if (response.data is String) {
        final str = response.data.toString().replaceAll('"', '').trim();
        if (str.toLowerCase().contains('invalid') ||
            str.toLowerCase().contains('not verified') ||
            str.toLowerCase().contains('not found')) {
          return left(ErrorResponse(
            message: ApiErrorParser.sanitize(str, fallback: 'Invalid OTP'),
          ));
        }
        return right(str.isNotEmpty ? str : 'OTP verified successfully.');
      }

      return right('OTP verified successfully.');
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
        final data = response.data as Map<String, dynamic>;
        if (data['status'] == 'failure' ||
            data['success'] == false ||
            data['status'] == 400) {
          final msg = ApiErrorParser.extractErrorMessage(
            data,
            defaultMessage: 'Registration failed',
          );
          return left(ErrorResponse(message: msg));
        }

        // Backend returns {"success": true, "message": "...", "customer": {...}}
        if (data['customer'] is Map<String, dynamic>) {
          return right(
            UserResponse.fromJson(data['customer'] as Map<String, dynamic>),
          );
        }

        return right(UserResponse.fromJson(data));
      } else if (response.data is String &&
          (response.data as String).isNotEmpty) {
        final str = response.data.toString().replaceAll('"', '').trim();
        if (str.toLowerCase().contains('fail') ||
            str.toLowerCase().contains('error') ||
            str.toLowerCase().contains('not found')) {
          return left(ErrorResponse(
            message: ApiErrorParser.sanitize(
              str,
              fallback: 'Registration failed',
            ),
          ));
        }
        return right(const UserResponse());
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
      final queryParams = <String, dynamic>{
        'platform': platform,
      };
      if (recaptchaToken != null && recaptchaToken.isNotEmpty) {
        queryParams['rtoken'] = recaptchaToken;
      }
      if (email != null && email.isNotEmpty) {
        queryParams['email'] = email;
      }
      if (mobile != null && mobile.isNotEmpty) {
        queryParams['mobile'] = mobile;
      }

      final response = await _client.post(
        ApiEndpoints.sendForgotPasswordOtpUrl,
        queryParameters: queryParams,
        data: queryParams,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print('[sendForgotPasswordOtp] response: ${response.data}');
      }

      if (response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        if (data['status'] == 400 ||
            data['status'] == 'failure' ||
            data['success'] == false) {
          final msg = ApiErrorParser.extractErrorMessage(
            data,
            defaultMessage: 'Failed to send OTP',
          );
          return left(ErrorResponse(message: msg));
        }
        return right(OtpResponse(
          status: 200,
          message: data['message']?.toString() ??
              'OTP has been sent successfully.',
        ));
      }

      return right(const OtpResponse(
        status: 200,
        message: 'OTP has been sent successfully.',
      ));
    } on DioException catch (e) {
      if (kDebugMode) {
        print('[sendForgotPasswordOtp] error: $e');
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> resetPassword({
    String? mobile,
    String? email,
    required String otp,
    required String newPassword,
    String? confirmPassword,
    String? recaptchaToken,
  }) async {
    try {
      final Map<String, dynamic> body = {
        'otp': otp,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword ?? newPassword,
        'new_password': newPassword,
        'confirm_password': confirmPassword ?? newPassword,
        if (recaptchaToken != null && recaptchaToken.isNotEmpty)
          'rtoken': recaptchaToken,
      };

      if (mobile != null && mobile.isNotEmpty) {
        body['mobile'] = mobile;
      }
      if (email != null && email.isNotEmpty) {
        body['email'] = email;
      }

      final response = await _client.post(
        ApiEndpoints.resetPasswordUrl,
        data: body,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print('[resetPassword] response: ${response.data}');
      }

      if (response.data is String) {
        final str = response.data.toString().replaceAll('"', '').trim();
        if (str.toLowerCase().contains('invalid') ||
            str.toLowerCase().contains('error') ||
            str.toLowerCase().contains('fail') ||
            str.toLowerCase().contains('not found')) {
          return left(ErrorResponse(
            message: ApiErrorParser.sanitize(
              str,
              fallback: 'Invalid OTP or password',
            ),
          ));
        }
        return right(
          str.isNotEmpty ? str : 'Your password has been reset successfully.',
        );
      }

      if (response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        if (data['success'] == false ||
            data['status'] == 'failure' ||
            data['status'] == 400 ||
            data['status'] == false) {
          final msg = ApiErrorParser.extractErrorMessage(
            data,
            defaultMessage: 'Password reset failed',
          );
          return left(ErrorResponse(message: msg));
        }
        return right(
          data['message']?.toString() ??
              'Your password has been reset successfully.',
        );
      }

      return right('Your password has been reset successfully.');
    } on DioException catch (e) {
      if (kDebugMode) {
        print('[resetPassword] error: $e');
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> socialLogin(
    SocialLoginRequest request,
  ) async {
    try {
      // Facebook login ALWAYS targets productionURL ('https://www.pickaboo.com')
      // regardless of whether the app is configured to use developmentURL or productionURL.
      final url = request.type.toLowerCase() == 'facebook'
          ? '${ApiConfig.productionURL}${ApiEndpoints.socialLoginUrl}'
          : ApiEndpoints.socialLoginUrl;

      final response = await _client.post(
        url,
        data: request.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("social_login -> ${response.data}");
      }

      if (response.data is String) {
        final token = response.data.toString().replaceAll('"', '').trim();
        final isValidToken = RegExp(r'^[a-zA-Z0-9_.-]{16,512}$').hasMatch(token) &&
            !token.contains(' ') &&
            !token.contains('failed!') &&
            !token.contains('Invalid');

        if (!isValidToken) {
          final isPhpDeprecated = token.contains('Deprecated') ||
              token.contains('FacebookUrlManipulator') ||
              token.contains('http_build_query');
          final errorMessage = isPhpDeprecated
              ? 'Facebook login is currently unavailable due to a server error. Please use Google or Phone login.'
              : (token.isNotEmpty ? token : 'Social login failed');
          return left(ErrorResponse(message: errorMessage));
        }
        return right(token);
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

      Response response;
      try {
        response = await _client.get(
          ApiEndpoints.getCurrentUserUrl,
          options: Options(headers: headers),
        );
      } on DioException catch (e) {
        // If current env (e.g. developmentURL) returned 401 and we are not already
        // on production, try productionURL so Facebook-authenticated users can load
        // their profile even while the developer is testing with developmentURL.
        if (e.response?.statusCode == 401 &&
            ApiConfig.baseUrl != ApiConfig.productionURL) {
          response = await _client.get(
            '${ApiConfig.productionURL}${ApiEndpoints.getCurrentUserUrl}',
            options: Options(headers: headers),
          );
        } else {
          rethrow;
        }
      }

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

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: Platform.isIOS ? AppConstants.googleIosClientId : null,
        serverClientId: AppConstants.googleAndroidWebClientId,
        scopes: const ['email', 'profile'],
      );

      try {
        await googleSignIn.signOut();
      } catch (_) {}

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
      final String? accessToken = googleAuth.accessToken ?? googleAuth.idToken;

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
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: const ['public_profile', 'email'],
      );

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
