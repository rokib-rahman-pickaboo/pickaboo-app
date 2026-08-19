// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      mobile: json['mobile'] as String,
      password: json['password'] as String,
      websiteId: (json['website_id'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'password': instance.password,
      'website_id': instance.websiteId,
    };
