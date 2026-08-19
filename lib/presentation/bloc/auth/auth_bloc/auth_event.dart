part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appStarted() = _AppStarted;
  const factory AuthEvent.userLoggedIn() = _UserLoggedIn;
  const factory AuthEvent.userLoggedOut() = _UserLoggedOut;
  const factory AuthEvent.tokenRefreshed(String newToken) = _TokenRefreshed;
}
