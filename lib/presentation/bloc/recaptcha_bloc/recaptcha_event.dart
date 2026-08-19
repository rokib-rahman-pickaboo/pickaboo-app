import 'package:freezed_annotation/freezed_annotation.dart';

part 'recaptcha_event.freezed.dart';

@freezed
class RecaptchaEvent with _$RecaptchaEvent {
  const factory RecaptchaEvent.generateToken(String action) = GenerateToken;
}
