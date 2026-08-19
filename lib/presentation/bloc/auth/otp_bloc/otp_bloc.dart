import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/constants/app_recaptcha_actions.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/repository/auth_repository.dart';

part 'otp_event.dart';
part 'otp_state.dart';
part 'otp_bloc.freezed.dart';

@injectable
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository repository;

  OtpBloc(this.repository) : super(const OtpState.initial()) {
    on<_SendOtp>(_onSendOtp);
    on<_VerifyOtp>(_onVerifyOtp);
    on<_ResetState>(_onResetState);
  }

  Future<void> _onSendOtp(_SendOtp event, Emitter<OtpState> emit) async {
    if (kDebugMode) print('🔵 OtpBloc: Sending OTP - type: ${event.type}');
    emit(const OtpState.sendingOtp());

    late final Either<AppErrorEntity, String> result;

    if (event.type == 'registration') {
      result = await repository.sendOtp(
        encryptedMobile: event.identifier,
        eventType: 'customer_signup_otp',
        resend: event.resend,
        recaptchaAction: event.resend
            ? AppRecaptchaActions.registerResendOtp
            : AppRecaptchaActions.registerSendOtp,
      );
    } else if (event.type == 'email') {
      result = await repository.sendEmailOtp(
        event.identifier,
        recaptchaAction: AppRecaptchaActions.emailOtpSend,
      );
    } else if (event.type == 'forgot_password') {
      final isEmail = event.identifier.contains('@');
      result = await repository.sendForgotPasswordOtp(
        email: isEmail ? event.identifier : null,
        mobile: !isEmail ? event.identifier : null,
      );
    }

    result.fold(
      (error) {
        if (kDebugMode) print('❌ OtpBloc: OTP send failed - ${error.message}');
        emit(OtpState.otpSendFailed(error.message));
      },
      (message) {
        if (kDebugMode) print('✅ OtpBloc: OTP sent - $message');
        emit(OtpState.otpSent(message));
      },
    );
  }

  Future<void> _onVerifyOtp(_VerifyOtp event, Emitter<OtpState> emit) async {
    if (kDebugMode) print('🔵 OtpBloc: Verifying OTP - type: ${event.type}');
    emit(const OtpState.verifyingOtp());

    late final Either<AppErrorEntity, String> result;

    if (event.type == 'registration') {
      result = await repository.verifyOtp(
        mobile: event.identifier,
        otp: event.otp,
      );
    } else if (event.type == 'email') {
      result = await repository.verifyEmailOtp(
        email: event.identifier,
        code: event.otp,
      );
    }

    result.fold(
      (error) {
        if (kDebugMode) {
          print('❌ OtpBloc: OTP verification failed - ${error.message}');
        }
        emit(OtpState.otpVerificationFailed(error.message));
      },
      (message) {
        if (kDebugMode) print('✅ OtpBloc: OTP verified - $message');
        emit(OtpState.otpVerified(message));
      },
    );
  }

  void _onResetState(_ResetState event, Emitter<OtpState> emit) {
    if (kDebugMode) print('🔵 OtpBloc: Resetting state');
    emit(const OtpState.initial());
  }
}
