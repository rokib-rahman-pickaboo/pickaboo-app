// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordRequestImpl _$$ResetPasswordRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ResetPasswordRequestImpl(
  mobile: json['mobile'] as String?,
  email: json['email'] as String?,
  otp: json['otp'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$$ResetPasswordRequestImplToJson(
  _$ResetPasswordRequestImpl instance,
) => <String, dynamic>{
  'mobile': instance.mobile,
  'email': instance.email,
  'otp': instance.otp,
  'password': instance.password,
};
