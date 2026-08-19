// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckUserResponseImpl _$$CheckUserResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CheckUserResponseImpl(
  status: json['status'] as String,
  message: json['message'] as String,
  httpCode: (json['http_code'] as num).toInt(),
);

Map<String, dynamic> _$$CheckUserResponseImplToJson(
  _$CheckUserResponseImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'http_code': instance.httpCode,
};
