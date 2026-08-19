part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.checkUserExists(String username) = _CheckUserExists;

  const factory LoginEvent.loginWithPassword({
    required String username,
    required String password,
  }) = _LoginWithPassword;

  const factory LoginEvent.loginWithSocial({
    required String accessToken,
    required String provider,
    required String source,
    String? referralCode,
  }) = _LoginWithSocial;
}
