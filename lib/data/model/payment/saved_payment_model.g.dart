// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedPaymentModelImpl _$$SavedPaymentModelImplFromJson(
  Map<String, dynamic> json,
) => _$SavedPaymentModelImpl(
  network: json['network'] as String? ?? '',
  phoneNumber: json['phone_number'] as String? ?? '',
  iconUrl: json['icon_url'] as String? ?? '',
  agreementId: json['agreement_id'] as String? ?? '',
);

Map<String, dynamic> _$$SavedPaymentModelImplToJson(
  _$SavedPaymentModelImpl instance,
) => <String, dynamic>{
  'network': instance.network,
  'phone_number': instance.phoneNumber,
  'icon_url': instance.iconUrl,
  'agreement_id': instance.agreementId,
};
