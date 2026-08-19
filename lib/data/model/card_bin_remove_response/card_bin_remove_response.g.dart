// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_bin_remove_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardBinRemoveResponseImpl _$$CardBinRemoveResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CardBinRemoveResponseImpl(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  previousCoupon: json['previous_coupon'] as String?,
  statusCode: (json['status_code'] as num?)?.toInt(),
);

Map<String, dynamic> _$$CardBinRemoveResponseImplToJson(
  _$CardBinRemoveResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'previous_coupon': instance.previousCoupon,
  'status_code': instance.statusCode,
};
