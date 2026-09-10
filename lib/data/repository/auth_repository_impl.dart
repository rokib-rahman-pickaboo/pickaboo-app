import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
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
          if (kDebugMode) {
            print('[AuthRepository] ⚠️ Failed to fetch user ID after login');
          }
        },
        (r) async {
          final entity = r.toEntity();
          await _cacheManager.setUserId(userId: entity.id.toString());
          if (kDebugMode) {
            print(
              '[AuthRepository] ✅ User ID saved after login: userId=${entity.id}',
            );
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('[AuthRepository] ⚠️ Error saving user ID after login: $e');
      }
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
  Future<void> saveToken(String token, {bool isProd = false}) async {
    await _cacheManager.setToken(token: token);
    await _cacheManager.setProdToken(isProd);
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
      token = await _recaptcha.executeAction(recaptchaAction);
    } catch (e) {
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
      (l) => left(l.toEntity()),
      (r) {
        if (r.status != null && r.status != 200) {
          return left(
            AppErrorEntity(
              message: ApiErrorParser.sanitize(
                r.message,
                fallback: 'Failed to send OTP',
              ),
            ),
          );
        }
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
          if (kDebugMode) {
            print('[AuthRepository] ⚠️ Auto-login after registration error: $e');
          }
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
      token = await _recaptcha.executeAction(recaptchaAction);
    } catch (e) {
      return left(
        const AppErrorEntity(
          message:
              'Security verification failed. Please wait a moment and try again.',
        ),
      );
    }

    final result = await apiService.sendEmailOtp(email, recaptchaToken: token);
    return result.fold(
      (l) => left(l.toEntity()),
      (r) {
        if (r.status != null && r.status != 200) {
          return left(
            AppErrorEntity(
              message: ApiErrorParser.sanitize(
                r.message,
                fallback: 'Failed to send Email OTP',
              ),
            ),
          );
        }
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
      token = await _recaptcha.executeAction(
        AppRecaptchaActions.forgotPasswordSubmit,
      );
    } catch (e) {
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
      (l) => left(l.toEntity()),
      (r) {
        if (r.status != null && r.status != 200) {
          return left(
            AppErrorEntity(
              message: ApiErrorParser.sanitize(
                r.message,
                fallback: 'Failed to send OTP',
              ),
            ),
          );
        }
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
      token = await _recaptcha.executeAction(
        AppRecaptchaActions.forgotPasswordSubmit,
      );
    } catch (_) {
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

    return result.fold((l) => left(l.toEntity()), (r) => right(r));
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
      await saveToken(r, isProd: provider.toLowerCase() == 'facebook');
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
          if (kDebugMode) {
            print(
              '[AuthRepository] ✅ getCurrentUser: userId=${entity.id} cached',
            );
          }
          return right(entity);
        },
      );
    } catch (e) {
      if (kDebugMode) print('AuthRepository: Error getting user - $e');
      return left(AppErrorEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorEntity, String>> loginWithGoogle() async {
    if (kDebugMode) {
      print('🔵 [Repository] loginWithGoogle: Calling API service...');
    }

    final result = await apiService.loginWithGoogle();

    return result.fold(
      (error) {
        if (kDebugMode) {
          print('❌ [Repository] loginWithGoogle: Failed');
          print('   - Error: ${error.message}');
        }
        return left(error.toEntity());
      },
      (token) async {
        if (kDebugMode) {
          print('✅ [Repository] loginWithGoogle: Success');
          print('   - Token length: ${token.length}');
          print('   - Saving token to cache...');
        }
        await saveToken(token);
        await _saveUserId();
        if (kDebugMode) {
          print('✅ [Repository] loginWithGoogle: Token saved successfully');
        }
        return right(token);
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, String>> loginWithFacebook() async {
    final result = await apiService.loginWithFacebook();
    return result.fold((l) => left(l.toEntity()), (r) async {
      await saveToken(r, isProd: true);
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
