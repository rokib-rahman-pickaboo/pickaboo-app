import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/core/config/api_config.dart';
import 'package:pickaboo/core/constants/app_recaptcha_actions.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/data/api_service/auth_api_service.dart';
import 'package:pickaboo/data/services/recaptcha_service.dart';
import 'package:pickaboo/data/mapper/auth_mapper/check_user_mapper.dart';
import 'package:pickaboo/data/mapper/auth_mapper/user_response_mapper.dart';
import 'package:pickaboo/data/mapper/customer_status_mapper.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/data/model/auth/login_request/login_request.dart';
import 'package:pickaboo/data/model/auth/register_request/register_request.dart';
import 'package:pickaboo/data/model/auth/social_login_request/social_login_request.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/auth/check_user_entity.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/domain/entity/customer_status/customer_status_entity.dart';
import 'package:pickaboo/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  final AuthApiService apiService;
  final AuthCacheManager _cacheManager;
  final RecaptchaService _recaptcha;

  AuthRepositoryImpl(this.apiService, this._cacheManager, this._recaptcha);

  Future<void> _saveUserId() async {
    try {
      final token = await getStoredToken();
      final result = await apiService.getCurrentUser(token: token);
      await result.fold(
        (l) async {
        },
        (r) async {
          final entity = r.toEntity();
          await _cacheManager.setUserId(userId: entity.id.toString());
        },
      );
    } catch (e) {
    }
  }

  @override
  Future<Either<AppErrorEntity, CustomerStatusEntity>> checkCustomer({
    required String phone,
  }) async {
    final result = await apiService.checkCustomer(phone: phone);

    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  @override
  Future<String?> getStoredToken() async {
    return await _cacheManager.getToken();
  }

  @override
  Future<void> saveToken(String token, {bool? isProd}) async {
    await _cacheManager.setToken(token: token);
    await _cacheManager.setProdToken(isProd ?? ApiConfig.isProduction);
  }

  @override
  Future<void> clearToken() async {
    await _cacheManager.signOut();
  }

  @override
  Future<Either<AppErrorEntity, String>> login({
    required String mobile,
    required String password,
  }) async {
    final request = LoginRequest(mobile: mobile, password: password);

    final result = await apiService.login(request);

    return result.fold((l) => left(l.toEntity()), (r) async {
      await saveToken(r);
      await _saveUserId();
      return right(r);
    });
  }

  @override
  Future<Either<AppErrorEntity, CheckUserEntity>> checkUserExists(
    String username,
  ) async {
    final result = await apiService.checkUserExists(username);
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  @override
  Future<Either<AppErrorEntity, String>> sendOtp({
    required String encryptedMobile,
    required String eventType,
    bool resend = false,
    required String recaptchaAction,
  }) async {
    final String token;
    try {
      debugPrint('[RECAPTCHA_FLOW] 1/3: sendOtp requesting token for action=$recaptchaAction');
      token = await _recaptcha.executeAction(recaptchaAction);
      debugPrint('[RECAPTCHA_FLOW] 2/3: sendOtp acquired token (len=${token.length}). Forwarding to apiService.sendOtp...');
    } catch (e) {
      debugPrint('[RECAPTCHA_FLOW] ❌ sendOtp reCAPTCHA failed: $e');
      return left(
        const AppErrorEntity(
          message:
              'Security verification failed. Please wait a moment and try again.',
        ),
      );
    }

    final result = await apiService.sendOtp(
      encryptedMobile: encryptedMobile,
      eventType: eventType,
      resend: resend,
      recaptchaToken: token,
    );

    return result.fold(
      (l) {
        debugPrint('[RECAPTCHA_FLOW] ❌ sendOtp API returned error: ${l.message}');
        return left(l.toEntity());
      },
      (r) {
        if (r.status != null && r.status != 200) {
          debugPrint('[RECAPTCHA_FLOW] ⚠️ sendOtp server returned non-200 status=${r.status} message="${r.message}"');
          return left(
            AppErrorEntity(
              message: ApiErrorParser.sanitize(
                r.message,
                fallback: 'Failed to send OTP',
              ),
            ),
          );
        }
        debugPrint('[RECAPTCHA_FLOW] 3/3: sendOtp SUCCESS | status=${r.status} message="${r.message}"');
        return right(r.message ?? 'OTP sent');
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, String>> verifyOtp({
    required String mobile,
    required String otp,
  }) async {
    final result = await apiService.verifyOtp(mobile: mobile, otp: otp);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  @override
  Future<Either<AppErrorEntity, UserEntity>> registerUser({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String mobile,
    required String otp,
    String? referralCode,
  }) async {
    final request = RegisterRequest(
      customer: CustomerData(
        email: email,
        firstname: firstName,
        lastname: lastName,
      ),
      password: password,
      mobile: mobile,
      otp: otp,
      referralCode: referralCode ?? '',
    );

    final result = await apiService.registerUser(request);

    return result.fold(
      (l) => left(l.toEntity()),
      (r) async {
        // Auto-login so token and userId are stored in cache
        try {
          final loginResult = await login(mobile: mobile, password: password);
          if (loginResult.isLeft() && email.isNotEmpty && email != mobile) {
            await login(mobile: email, password: password);
          }
        } catch (e) {
        }
        return right(r.toEntity());
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, String>> sendEmailOtp(
    String email, {
    required String recaptchaAction,
  }) async {
    final String token;
    try {
      debugPrint('[RECAPTCHA_FLOW] 1/3: sendEmailOtp requesting token for action=$recaptchaAction');
      token = await _recaptcha.executeAction(recaptchaAction);
      debugPrint('[RECAPTCHA_FLOW] 2/3: sendEmailOtp acquired token (len=${token.length}). Forwarding to apiService.sendEmailOtp...');
    } catch (e) {
      debugPrint('[RECAPTCHA_FLOW] ❌ sendEmailOtp reCAPTCHA failed: $e');
      return left(
        const AppErrorEntity(
          message:
              'Security verification failed. Please wait a moment and try again.',
        ),
      );
    }

    final result = await apiService.sendEmailOtp(email, recaptchaToken: token);
    return result.fold(
      (l) {
        debugPrint('[RECAPTCHA_FLOW] ❌ sendEmailOtp API error: ${l.message}');
        return left(l.toEntity());
      },
      (r) {
        if (r.status != null && r.status != 200) {
          debugPrint('[RECAPTCHA_FLOW] ⚠️ sendEmailOtp server non-200 status=${r.status} message="${r.message}"');
          return left(
            AppErrorEntity(
              message: ApiErrorParser.sanitize(
                r.message,
                fallback: 'Failed to send Email OTP',
              ),
            ),
          );
        }
        debugPrint('[RECAPTCHA_FLOW] 3/3: sendEmailOtp SUCCESS | status=${r.status} message="${r.message}"');
        return right(r.message ?? 'Email OTP sent');
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, String>> verifyEmailOtp({
    required String email,
    required String code,
  }) async {
    final result = await apiService.verifyEmailOtp(email: email, code: code);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  @override
  Future<Either<AppErrorEntity, String>> sendForgotPasswordOtp({
    String? email,
    String? mobile,
  }) async {
    final String token;
    try {
      debugPrint('[RECAPTCHA_FLOW] 1/3: sendForgotPasswordOtp requesting token for action=${AppRecaptchaActions.forgotPasswordSubmit}');
      token = await _recaptcha.executeAction(
        AppRecaptchaActions.forgotPasswordSubmit,
      );
      debugPrint('[RECAPTCHA_FLOW] 2/3: sendForgotPasswordOtp acquired token (len=${token.length}). Forwarding to apiService.sendForgotPasswordOtp...');
    } catch (e) {
      debugPrint('[RECAPTCHA_FLOW] ❌ sendForgotPasswordOtp reCAPTCHA failed: $e');
      return left(
        const AppErrorEntity(
          message:
              'Security verification failed. Please wait a moment and try again.',
        ),
      );
    }

    final result = await apiService.sendForgotPasswordOtp(
      email: email,
      mobile: mobile,
      recaptchaToken: token,
    );

    return result.fold(
      (l) {
        debugPrint('[RECAPTCHA_FLOW] ❌ sendForgotPasswordOtp API error: ${l.message}');
        return left(l.toEntity());
      },
      (r) {
        if (r.status != null && r.status != 200) {
          debugPrint('[RECAPTCHA_FLOW] ⚠️ sendForgotPasswordOtp server non-200 status=${r.status} message="${r.message}"');
          return left(
            AppErrorEntity(
              message: ApiErrorParser.sanitize(
                r.message,
                fallback: 'Failed to send OTP',
              ),
            ),
          );
        }
        debugPrint('[RECAPTCHA_FLOW] 3/3: sendForgotPasswordOtp SUCCESS | status=${r.status} message="${r.message}"');
        return right(r.message ?? 'OTP sent');
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, String>> resetPassword({
    String? mobile,
    String? email,
    required String otp,
    required String newPassword,
    String? confirmPassword,
  }) async {
    String? token;
    try {
      debugPrint('[RECAPTCHA_FLOW] 1/3: resetPassword requesting token for action=${AppRecaptchaActions.forgotPasswordSubmit}');
      token = await _recaptcha.executeAction(
        AppRecaptchaActions.forgotPasswordSubmit,
      );
      debugPrint('[RECAPTCHA_FLOW] 2/3: resetPassword acquired token (len=${token.length}). Forwarding to apiService.resetPassword...');
    } catch (e) {
      debugPrint('[RECAPTCHA_FLOW] ⚠️ resetPassword reCAPTCHA token skipped/failed: $e');
      // Allow proceeding even if token generation fails on some devices
    }

    final result = await apiService.resetPassword(
      mobile: mobile,
      email: email,
      otp: otp,
      newPassword: newPassword,
      confirmPassword: confirmPassword ?? newPassword,
      recaptchaToken: token,
    );

    return result.fold(
      (l) {
        debugPrint('[RECAPTCHA_FLOW] ❌ resetPassword API error: ${l.message}');
        return left(l.toEntity());
      },
      (r) {
        debugPrint('[RECAPTCHA_FLOW] 3/3: resetPassword SUCCESS | result="$r"');
        return right(r);
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, String>> socialLogin({
    required String accessToken,
    required String provider,
    required String source,
    String? referralCode,
  }) async {
    final request = SocialLoginRequest(
      accessToken: accessToken,
      type: provider,
      source: source,
      referralCode: referralCode ?? '',
    );

    final result = await apiService.socialLogin(request);

    return result.fold((l) => left(l.toEntity()), (r) async {
      await saveToken(r);
      await _saveUserId();
      return right(r);
    });
  }

  @override
  Future<Either<AppErrorEntity, UserEntity>> getCurrentUser() async {
    try {
      final token = await getStoredToken();
      final result = await apiService.getCurrentUser(token: token);
      return await result.fold(
        (l) async => left(l.toEntity()),
        (r) async {
          final entity = r.toEntity();
          await _cacheManager.setUserId(userId: entity.id.toString());
          return right(entity);
        },
      );
    } catch (e) {
      return left(AppErrorEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorEntity, String>> loginWithGoogle() async {

    final result = await apiService.loginWithGoogle();

    return result.fold(
      (error) {
        return left(error.toEntity());
      },
      (token) async {
        await saveToken(token);
        await _saveUserId();
        return right(token);
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, String>> loginWithFacebook() async {
    final result = await apiService.loginWithFacebook();
    return result.fold((l) => left(l.toEntity()), (r) async {
      await saveToken(r);
      await _saveUserId();
      return right(r);
    });
  }

  @override
  Future<Either<AppErrorEntity, String>> loginWithApple() async {
    final result = await apiService.loginWithApple();
    return result.fold((l) => left(l.toEntity()), (r) async {
      await saveToken(r);
      await _saveUserId();
      return right(r);
    });
  }
}
