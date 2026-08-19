import 'package:freezed_annotation/freezed_annotation.dart';

part 'recaptcha_state.freezed.dart';

@freezed
class RecaptchaState with _$RecaptchaState {
  const factory RecaptchaState.initial() = _Initial;
  const factory RecaptchaState.loading() = _Loading;
  const factory RecaptchaState.success(String token) = _Success;
  const factory RecaptchaState.error(String message) = _Error;
}
