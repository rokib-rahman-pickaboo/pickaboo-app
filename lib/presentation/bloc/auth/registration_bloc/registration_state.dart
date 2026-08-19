part of 'registration_bloc.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = _Initial;

  const factory RegistrationState.sendingOtp() = _SendingOtp;
  const factory RegistrationState.otpSent(String message) = _OtpSent;
  const factory RegistrationState.otpSendFailed(String error) = _OtpSendFailed;

  const factory RegistrationState.verifyingOtp() = _VerifyingOtp;
  const factory RegistrationState.otpVerified() = _OtpVerified;
  const factory RegistrationState.otpVerificationFailed(String error) =
      _OtpVerificationFailed;

  const factory RegistrationState.registrationLoading() = _RegistrationLoading;
  const factory RegistrationState.registrationSuccess(String message) =
      _RegistrationSuccess;
  const factory RegistrationState.registrationFailure(String error) =
      _RegistrationFailure;
}
