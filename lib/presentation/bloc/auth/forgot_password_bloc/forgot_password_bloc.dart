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
    emit(const ForgotPasswordState.sendingOtp());

    final result = await repository.sendForgotPasswordOtp(
      email: event.isEmail ? event.identifier : null,
      mobile: !event.isEmail ? event.identifier : null,
    );

    result.fold(
      (error) {
        emit(ForgotPasswordState.otpSendFailed(error.message));
      },
      (message) {
        emit(ForgotPasswordState.otpSent(message));
      },
    );
  }

  Future<void> _onResetPassword(
    _ResetPassword event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(const ForgotPasswordState.resettingPassword());

    final result = await repository.resetPassword(
      mobile: !event.isEmail ? event.identifier : null,
      email: event.isEmail ? event.identifier : null,
      otp: event.otp,
      newPassword: event.newPassword,
    );

    result.fold(
      (error) {
        emit(ForgotPasswordState.passwordResetFailure(error.message));
      },
      (message) {
        emit(ForgotPasswordState.passwordResetSuccess(message));
      },
    );
  }
}
