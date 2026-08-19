part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.sendOtp({
    required String identifier,
    required bool isEmail,
  }) = _SendOtp;

  const factory ForgotPasswordEvent.resetPassword({
    required String identifier,
    required bool isEmail,
    required String otp,
    required String newPassword,
  }) = _ResetPassword;
}
