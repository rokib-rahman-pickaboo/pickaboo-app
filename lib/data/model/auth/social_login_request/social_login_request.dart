import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_login_request.freezed.dart';
part 'social_login_request.g.dart';

@freezed
class SocialLoginRequest with _$SocialLoginRequest {
  const factory SocialLoginRequest({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'source') required String source,
    @JsonKey(name: 'referral_code') @Default('') String referralCode,
  }) = _SocialLoginRequest;

  factory SocialLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginRequestFromJson(json);
}
