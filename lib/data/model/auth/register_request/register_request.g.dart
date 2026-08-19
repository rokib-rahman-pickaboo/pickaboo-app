// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerDataImpl _$$CustomerDataImplFromJson(Map<String, dynamic> json) =>
    _$CustomerDataImpl(
      email: json['email'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      storeId: (json['store_id'] as num?)?.toInt() ?? 0,
      websiteId: (json['website_id'] as num?)?.toInt() ?? 0,
      disableAutoGroupChange:
          (json['disable_auto_group_change'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CustomerDataImplToJson(_$CustomerDataImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'store_id': instance.storeId,
      'website_id': instance.websiteId,
      'disable_auto_group_change': instance.disableAutoGroupChange,
    };

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterRequestImpl(
  customer: CustomerData.fromJson(json['customer'] as Map<String, dynamic>),
  password: json['password'] as String,
  mobile: json['mobile'] as String,
  otp: json['otp'] as String,
  referralCode: json['referral_code'] as String? ?? '',
);

Map<String, dynamic> _$$RegisterRequestImplToJson(
  _$RegisterRequestImpl instance,
) => <String, dynamic>{
  'customer': instance.customer,
  'password': instance.password,
  'mobile': instance.mobile,
  'otp': instance.otp,
  'referral_code': instance.referralCode,
};
