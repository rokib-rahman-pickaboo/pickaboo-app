// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmiResponseImpl _$$EmiResponseImplFromJson(Map<String, dynamic> json) =>
    _$EmiResponseImpl(
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      emiTenures:
          (json['emi_tenures'] as List<dynamic>?)
              ?.map((e) => EmiTenure.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$EmiResponseImplToJson(_$EmiResponseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'emi_tenures': instance.emiTenures,
    };

_$EmiTenureImpl _$$EmiTenureImplFromJson(Map<String, dynamic> json) =>
    _$EmiTenureImpl(
      tenure: (json['tenure'] as num?)?.toInt(),
      price: json['price'] as String?,
      convenienceFee: json['convenience_fee'] as String?,
      conveniencePrice: json['convenience_price'] as String?,
      monthlyPayable: json['monthly_payable'] as String?,
      total: json['total'] as String?,
    );

Map<String, dynamic> _$$EmiTenureImplToJson(_$EmiTenureImpl instance) =>
    <String, dynamic>{
      'tenure': instance.tenure,
      'price': instance.price,
      'convenience_fee': instance.convenienceFee,
      'convenience_price': instance.conveniencePrice,
      'monthly_payable': instance.monthlyPayable,
      'total': instance.total,
    };
