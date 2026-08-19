part of 'otp_bloc.dart';

@freezed
class OtpEvent with _$OtpEvent {
  const factory OtpEvent.sendOtp({
    required String identifier,
    required String type,
    @Default(false) bool resend,
    String? recaptchaToken,
  }) = _SendOtp;

  const factory OtpEvent.verifyOtp({
    required String identifier,
    required String otp,
    required String type,
  }) = _VerifyOtp;

  const factory OtpEvent.resetState() = _ResetState;
}
