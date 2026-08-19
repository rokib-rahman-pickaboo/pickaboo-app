// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_bin_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardBinStatusResponseImpl _$$CardBinStatusResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CardBinStatusResponseImpl(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  isActive: json['is_active'] as bool?,
  statusCode: (json['status_code'] as num?)?.toInt(),
);

Map<String, dynamic> _$$CardBinStatusResponseImplToJson(
  _$CardBinStatusResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'is_active': instance.isActive,
  'status_code': instance.statusCode,
};
