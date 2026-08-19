part of 'otp_bloc.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState.initial() = _Initial;

  const factory OtpState.sendingOtp() = _SendingOtp;
  const factory OtpState.otpSent(String message) = _OtpSent;
  const factory OtpState.otpSendFailed(String error) = _OtpSendFailed;

  const factory OtpState.verifyingOtp() = _VerifyingOtp;
  const factory OtpState.otpVerified(String message) = _OtpVerified;
  const factory OtpState.otpVerificationFailed(String error) =
      _OtpVerificationFailed;
}
