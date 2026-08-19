part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.checkingUser() = _CheckingUser;
  const factory LoginState.userExists({
    required String status,
    required String message,
    required int httpCode,
  }) = _UserExists;
  const factory LoginState.userNotFound({
    required String status,
    required String message,
    required int httpCode,
  }) = _UserNotFound;

  const factory LoginState.loginLoading() = _LoginLoading;
  const factory LoginState.loginSuccess({
    required String status,
    required bool isLogin,
  }) = _LoginSuccess;
  const factory LoginState.loginFailure(String error) = _LoginFailure;
}
