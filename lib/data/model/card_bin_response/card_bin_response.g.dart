// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_bin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardBinResponseImpl _$$CardBinResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CardBinResponseImpl(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  couponCode: json['coupon_code'] as String?,
  discountAmount: (json['discount_amount'] as num?)?.toInt(),
  ruleName: json['rule_name'] as String?,
  statusCode: (json['status_code'] as num?)?.toInt(),
);

Map<String, dynamic> _$$CardBinResponseImplToJson(
  _$CardBinResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'coupon_code': instance.couponCode,
  'discount_amount': instance.discountAmount,
  'rule_name': instance.ruleName,
  'status_code': instance.statusCode,
};
