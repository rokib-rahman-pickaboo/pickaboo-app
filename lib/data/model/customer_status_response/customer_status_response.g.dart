// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerStatusResponseImpl _$$CustomerStatusResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerStatusResponseImpl(
  status: json['status'] as String?,
  message: json['message'] as String?,
  httpCode: (json['http_code'] as num?)?.toInt(),
);

Map<String, dynamic> _$$CustomerStatusResponseImplToJson(
  _$CustomerStatusResponseImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'http_code': instance.httpCode,
};
