part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;

  const factory ForgotPasswordState.sendingOtp() = _SendingOtp;
  const factory ForgotPasswordState.otpSent(String message) = _OtpSent;
  const factory ForgotPasswordState.otpSendFailed(String error) =
      _OtpSendFailed;

  const factory ForgotPasswordState.resettingPassword() = _ResettingPassword;
  const factory ForgotPasswordState.passwordResetSuccess(String message) =
      _PasswordResetSuccess;
  const factory ForgotPasswordState.passwordResetFailure(String error) =
      _PasswordResetFailure;
}
