part of 'registration_bloc.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.sendOtp({
    required String encryptedMobile,
    @Default(false) bool resend,
  }) = _SendOtp;

  const factory RegistrationEvent.verifyOtp({
    required String mobile,
    required String otp,
  }) = _VerifyOtp;

  const factory RegistrationEvent.registerUser({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String mobile,
    required String otp,
    String? referralCode,
  }) = _RegisterUser;
}
