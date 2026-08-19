// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialLoginRequestImpl _$$SocialLoginRequestImplFromJson(
  Map<String, dynamic> json,
) => _$SocialLoginRequestImpl(
  accessToken: json['access_token'] as String,
  type: json['type'] as String,
  source: json['source'] as String,
  referralCode: json['referral_code'] as String? ?? '',
);

Map<String, dynamic> _$$SocialLoginRequestImplToJson(
  _$SocialLoginRequestImpl instance,
) => <String, dynamic>{
  'access_token': instance.accessToken,
  'type': instance.type,
  'source': instance.source,
  'referral_code': instance.referralCode,
};
