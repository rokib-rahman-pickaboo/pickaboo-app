import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/constants/app_recaptcha_actions.dart';
import 'package:pickaboo/domain/repository/auth_repository.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

part 'registration_event.dart';
part 'registration_state.dart';
part 'registration_bloc.freezed.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AuthRepository repository;
  final AnalyticsService _analytics;

  RegistrationBloc(this.repository, this._analytics)
    : super(const RegistrationState.initial()) {
    on<_SendOtp>(_onSendOtp);
    on<_VerifyOtp>(_onVerifyOtp);
    on<_RegisterUser>(_onRegisterUser);
  }

  Future<void> _onSendOtp(
    _SendOtp event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(const RegistrationState.sendingOtp());

    final result = await repository.sendOtp(
      encryptedMobile: event.encryptedMobile,
      eventType: 'customer_signup_otp',
      resend: event.resend,
      recaptchaAction: event.resend
          ? AppRecaptchaActions.registerResendOtp
          : AppRecaptchaActions.registerSendOtp,
    );

    result.fold(
      (error) {
        emit(RegistrationState.otpSendFailed(error.message));
      },
      (message) {
        emit(RegistrationState.otpSent(message));
      },
    );
  }

  Future<void> _onVerifyOtp(
    _VerifyOtp event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(const RegistrationState.verifyingOtp());

    final result = await repository.verifyOtp(
      mobile: event.mobile,
      otp: event.otp,
    );

    result.fold(
      (error) {
        emit(RegistrationState.otpVerificationFailed(error.message));
      },
      (message) {
        emit(const RegistrationState.otpVerified());
      },
    );
  }

  Future<void> _onRegisterUser(
    _RegisterUser event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(const RegistrationState.registrationLoading());

    final result = await repository.registerUser(
      email: event.email,
      firstName: event.firstName,
      lastName: event.lastName,
      password: event.password,
      mobile: event.mobile,
      otp: event.otp,
      referralCode: event.referralCode,
    );

    result.fold(
      (error) {
        emit(RegistrationState.registrationFailure(error.message));
      },
      (user) {
        _analytics.logEvent(name: 'sign_up', parameters: {'method': 'email'});
        emit(
          const RegistrationState.registrationSuccess(
            'Registration successful! Welcome to Pickaboo.',
          ),
        );
      },
    );
  }
}
