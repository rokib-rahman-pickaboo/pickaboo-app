import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/auth/check_user_response/check_user_response.dart';
import 'package:pickaboo/data/model/auth/login_request/login_request.dart';
import 'package:pickaboo/data/model/auth/otp_response/otp_response.dart';
import 'package:pickaboo/data/model/auth/register_request/register_request.dart';
import 'package:pickaboo/data/model/auth/social_login_request/social_login_request.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import 'package:pickaboo/data/model/customer_status_response/customer_status_response.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';

abstract class AuthApiService {
  Future<Either<ErrorResponse, CustomerStatusResponse>> checkCustomer({
    required String phone,
  });

  Future<Either<ErrorResponse, String>> login(LoginRequest request);

  Future<Either<ErrorResponse, CheckUserResponse>> checkUserExists(
    String username,
  );

  Future<Either<ErrorResponse, OtpResponse>> sendOtp({
    required String encryptedMobile,
    required String eventType,
    bool resend = false,
    String? recaptchaToken,
  });

  Future<Either<ErrorResponse, String>> verifyOtp({
    required String mobile,
    required String otp,
  });

  Future<Either<ErrorResponse, UserResponse>> registerUser(
    RegisterRequest request,
  );

  Future<Either<ErrorResponse, OtpResponse>> sendEmailOtp(
    String email, {
    String? recaptchaToken,
  });

  Future<Either<ErrorResponse, String>> verifyEmailOtp({
    required String email,
    required String code,
  });

  Future<Either<ErrorResponse, OtpResponse>> sendForgotPasswordOtp({
    String? email,
    String? mobile,
    String? recaptchaToken,
  });

  Future<Either<ErrorResponse, String>> resetPassword({
    String? mobile,
    String? email,
    required String otp,
    required String newPassword,
    String? confirmPassword,
    String? recaptchaToken,
  });

  Future<Either<ErrorResponse, String>> socialLogin(SocialLoginRequest request);

  Future<Either<ErrorResponse, UserResponse>> getCurrentUser({String? token});

  Future<Either<ErrorResponse, String>> loginWithGoogle();
  Future<Either<ErrorResponse, String>> loginWithFacebook();
  Future<Either<ErrorResponse, String>> loginWithApple();
}
