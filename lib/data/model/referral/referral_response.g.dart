// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralResponseImpl _$$ReferralResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ReferralResponseImpl(
  referralCode: json['referral_code'] as String?,
  referralHistoryCount: (json['referral_history_count'] as num?)?.toInt(),
  referralPendingCount: (json['referral_pending_count'] as num?)?.toInt(),
  referralCompletedCount: (json['referral_completed_count'] as num?)?.toInt(),
  referralHistory:
      (json['referral_history'] as List<dynamic>?)
          ?.map((e) => ReferralHistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalCount: (json['total_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ReferralResponseImplToJson(
  _$ReferralResponseImpl instance,
) => <String, dynamic>{
  'referral_code': instance.referralCode,
  'referral_history_count': instance.referralHistoryCount,
  'referral_pending_count': instance.referralPendingCount,
  'referral_completed_count': instance.referralCompletedCount,
  'referral_history': instance.referralHistory,
  'total_count': instance.totalCount,
};

_$ReferralHistoryItemImpl _$$ReferralHistoryItemImplFromJson(
  Map<String, dynamic> json,
) => _$ReferralHistoryItemImpl(
  autoId: json['auto_id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  pointsAmount: json['points_amount'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$$ReferralHistoryItemImplToJson(
  _$ReferralHistoryItemImpl instance,
) => <String, dynamic>{
  'auto_id': instance.autoId,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'points_amount': instance.pointsAmount,
  'status': instance.status,
};
