// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromoResponseImpl _$$PromoResponseImplFromJson(Map<String, dynamic> json) =>
    _$PromoResponseImpl(
      isEligible: json['is_eligible'] as bool?,
      message: json['message'] as String?,
      couponCode: json['coupon_code'] as String?,
    );

Map<String, dynamic> _$$PromoResponseImplToJson(_$PromoResponseImpl instance) =>
    <String, dynamic>{
      'is_eligible': instance.isEligible,
      'message': instance.message,
      'coupon_code': instance.couponCode,
    };
