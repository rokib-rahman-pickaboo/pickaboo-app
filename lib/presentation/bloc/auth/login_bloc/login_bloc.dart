import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/repository/auth_repository.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;
  final AnalyticsService _analytics;

  LoginBloc(this.repository, this._analytics)
    : super(const LoginState.initial()) {
    on<_CheckUserExists>(_onCheckUserExists);
    on<_LoginWithPassword>(_onLoginWithPassword);
    on<_LoginWithSocial>(_onLoginWithSocial);
  }

  Future<void> _onCheckUserExists(
    _CheckUserExists event,
    Emitter<LoginState> emit,
  ) async {
    if (kDebugMode) {
      print('🔵 LoginBloc: Checking if user exists - ${event.username}');
    }
    emit(const LoginState.checkingUser());

    final result = await repository.checkUserExists(event.username);

    result.fold(
      (error) {
        if (kDebugMode) {
          print('❌ LoginBloc: Check user error - ${error.message}');
        }
        emit(
          LoginState.userNotFound(
            status: 'failure',
            message: error.message,
            httpCode: 0,
          ),
        );
      },
      (response) {
        if (kDebugMode) {
          print('✅ LoginBloc: User check result - ${response.message}');
          print(
            '   Status: ${response.status}, HTTP Code: ${response.httpCode}',
          );
        }

        if (response.status == 'success') {
          emit(
            LoginState.userExists(
              status: response.status,
              message: response.message,
              httpCode: response.httpCode,
            ),
          );
        } else {
          emit(
            LoginState.userNotFound(
              status: response.status,
              message: response.message,
              httpCode: response.httpCode,
            ),
          );
        }
      },
    );
  }

  Future<void> _onLoginWithPassword(
    _LoginWithPassword event,
    Emitter<LoginState> emit,
  ) async {
    if (kDebugMode) {
      print('🔵 LoginBloc: Logging in with password - ${event.username}');
    }
    emit(const LoginState.loginLoading());

    final loginResult = await repository.login(
      mobile: event.username,
      password: event.password,
    );

    loginResult.fold(
      (error) {
        if (kDebugMode) print('❌ LoginBloc: Login failed - ${error.message}');
        emit(LoginState.loginFailure(error.message));
      },
      (token) {
        if (kDebugMode) print('✅ LoginBloc: Login successful - token saved');
        _analytics.logEvent(name: 'login', parameters: {'method': 'password'});
        emit(const LoginState.loginSuccess(status: 'success', isLogin: true));
      },
    );
  }

  Future<void> _onLoginWithSocial(
    _LoginWithSocial event,
    Emitter<LoginState> emit,
  ) async {
    if (kDebugMode) print('🔵 LoginBloc: Logging in with ${event.provider}');
    emit(const LoginState.loginLoading());

    final loginResult = await repository.socialLogin(
      accessToken: event.accessToken,
      provider: event.provider,
      source: event.source,
      referralCode: event.referralCode,
    );

    loginResult.fold(
      (error) {
        if (kDebugMode) {
          print('❌ LoginBloc: Social login failed - ${error.message}');
        }
        emit(LoginState.loginFailure(error.message));
      },
      (token) {
        if (kDebugMode) {
          print('✅ LoginBloc: Social login successful - token saved');
        }
        _analytics.logEvent(
          name: 'login',
          parameters: {'method': event.provider},
        );
        emit(const LoginState.loginSuccess(status: 'success', isLogin: true));
      },
    );
  }
}
