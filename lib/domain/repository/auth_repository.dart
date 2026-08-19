import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/api_service/auth_api_service.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/auth/check_user_entity.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/domain/entity/customer_status/customer_status_entity.dart';

abstract class AuthRepository {
  final AuthApiService apiService;

  AuthRepository(this.apiService);

  Future<Either<AppErrorEntity, CustomerStatusEntity>> checkCustomer({
    required String phone,
  });

  Future<String?> getStoredToken();
  Future<void> saveToken(String token);
  Future<void> clearToken();

  Future<Either<AppErrorEntity, String>> login({
    required String mobile,
    required String password,
  });

  Future<Either<AppErrorEntity, CheckUserEntity>> checkUserExists(
    String username,
  );

  Future<Either<AppErrorEntity, String>> sendOtp({
    required String encryptedMobile,
    required String eventType,
    bool resend = false,
    required String recaptchaAction,
  });

  Future<Either<AppErrorEntity, String>> verifyOtp({
    required String mobile,
    required String otp,
  });

  Future<Either<AppErrorEntity, UserEntity>> registerUser({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String mobile,
    required String otp,
    String? referralCode,
  });

  Future<Either<AppErrorEntity, String>> sendEmailOtp(
    String email, {
    required String recaptchaAction,
  });

  Future<Either<AppErrorEntity, String>> verifyEmailOtp({
    required String email,
    required String code,
  });

  Future<Either<AppErrorEntity, String>> sendForgotPasswordOtp({
    String? email,
    String? mobile,
  });

  Future<Either<AppErrorEntity, String>> resetPassword({
    String? mobile,
    String? email,
    required String otp,
    required String newPassword,
  });

  Future<Either<AppErrorEntity, String>> socialLogin({
    required String accessToken,
    required String provider,
    required String source,
    String? referralCode,
  });

  Future<Either<AppErrorEntity, String>> loginWithGoogle();
  Future<Either<AppErrorEntity, String>> loginWithFacebook();
  Future<Either<AppErrorEntity, String>> loginWithApple();

  Future<Either<AppErrorEntity, UserEntity>> getCurrentUser();
}
