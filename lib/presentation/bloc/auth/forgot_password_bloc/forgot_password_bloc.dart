import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/repository/auth_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

@injectable
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository repository;

  ForgotPasswordBloc(this.repository)
    : super(const ForgotPasswordState.initial()) {
    on<_SendOtp>(_onSendOtp);
    on<_ResetPassword>(_onResetPassword);
  }

  Future<void> _onSendOtp(
    _SendOtp event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    if (kDebugMode) {
      print('🔵 ForgotPasswordBloc: Sending OTP to ${event.identifier}');
    }
    emit(const ForgotPasswordState.sendingOtp());

    final result = await repository.sendForgotPasswordOtp(
      email: event.isEmail ? event.identifier : null,
      mobile: !event.isEmail ? event.identifier : null,
    );

    result.fold(
      (error) {
        if (kDebugMode) {
          print('❌ ForgotPasswordBloc: OTP send failed - ${error.message}');
        }
        emit(ForgotPasswordState.otpSendFailed(error.message));
      },
      (message) {
        if (kDebugMode) print('✅ ForgotPasswordBloc: OTP sent - $message');
        emit(ForgotPasswordState.otpSent(message));
      },
    );
  }

  Future<void> _onResetPassword(
    _ResetPassword event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    if (kDebugMode) print('🔵 ForgotPasswordBloc: Resetting password');
    emit(const ForgotPasswordState.resettingPassword());

    final result = await repository.resetPassword(
      mobile: !event.isEmail ? event.identifier : null,
      email: event.isEmail ? event.identifier : null,
      otp: event.otp,
      newPassword: event.newPassword,
    );

    result.fold(
      (error) {
        if (kDebugMode) {
          print(
            '❌ ForgotPasswordBloc: Password reset failed - ${error.message}',
          );
        }
        emit(ForgotPasswordState.passwordResetFailure(error.message));
      },
      (message) {
        if (kDebugMode) {
          print('✅ ForgotPasswordBloc: Password reset successful - $message');
        }
        emit(ForgotPasswordState.passwordResetSuccess(message));
      },
    );
  }
}
