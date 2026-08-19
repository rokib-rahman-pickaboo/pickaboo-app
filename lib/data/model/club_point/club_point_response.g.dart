// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_point_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClubPointResponseImpl _$$ClubPointResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ClubPointResponseImpl(
  customerId: (json['customer_id'] as num?)?.toInt(),
  myPoints: (json['my_points'] as num?)?.toInt(),
  myLifeTimePoints: (json['my_life_time_points'] as num?)?.toInt(),
  tiers:
      (json['tiers'] as List<dynamic>?)
          ?.map((e) => Tier.fromJson(e as Map<String, dynamic>))
          .toList(),
  pointHistoryCount: json['point_history_count'] as String?,
  pointHistory:
      (json['point_history'] as List<dynamic>?)
          ?.map((e) => PointHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
  memberLevelInfo:
      json['member_level_info'] == null
          ? null
          : MemberLevelInfo.fromJson(
            json['member_level_info'] as Map<String, dynamic>,
          ),
  generalEarningRules:
      (json['general_earning_rules'] as List<dynamic>?)
          ?.map((e) => GeneralEarningRule.fromJson(e as Map<String, dynamic>))
          .toList(),
  referLink: json['refer_link'] as String?,
  spendingRules:
      (json['spending_rules'] as List<dynamic>?)
          ?.map((e) => SpendingRule.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$ClubPointResponseImplToJson(
  _$ClubPointResponseImpl instance,
) => <String, dynamic>{
  'customer_id': instance.customerId,
  'my_points': instance.myPoints,
  'my_life_time_points': instance.myLifeTimePoints,
  'tiers': instance.tiers,
  'point_history_count': instance.pointHistoryCount,
  'point_history': instance.pointHistory,
  'member_level_info': instance.memberLevelInfo,
  'general_earning_rules': instance.generalEarningRules,
  'refer_link': instance.referLink,
  'spending_rules': instance.spendingRules,
};

_$GeneralEarningRuleImpl _$$GeneralEarningRuleImplFromJson(
  Map<String, dynamic> json,
) => _$GeneralEarningRuleImpl(
  title: json['title'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$$GeneralEarningRuleImplToJson(
  _$GeneralEarningRuleImpl instance,
) => <String, dynamic>{'title': instance.title, 'message': instance.message};

_$MemberLevelInfoImpl _$$MemberLevelInfoImplFromJson(
  Map<String, dynamic> json,
) => _$MemberLevelInfoImpl(
  tierName: json['tier_name'] as String?,
  tierDescription: json['tier_description'] as String?,
  customerEarningRules:
      (json['customer_earning_rules'] as List<dynamic>?)
          ?.map((e) => CustomerEarningRule.fromJson(e as Map<String, dynamic>))
          .toList(),
  customerSpendingRule:
      (json['customer_spending_rule'] as List<dynamic>?)
          ?.map((e) => SpendingRule.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$MemberLevelInfoImplToJson(
  _$MemberLevelInfoImpl instance,
) => <String, dynamic>{
  'tier_name': instance.tierName,
  'tier_description': instance.tierDescription,
  'customer_earning_rules': instance.customerEarningRules,
  'customer_spending_rule': instance.customerSpendingRule,
};

_$CustomerEarningRuleImpl _$$CustomerEarningRuleImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerEarningRuleImpl(
  title: json['title'] as String?,
  earnPoint: (json['earn_point'] as num?)?.toDouble(),
  spendAmount: (json['spend_amount'] as num?)?.toInt(),
  pointLimit: (json['point_limit'] as num?)?.toInt(),
);

Map<String, dynamic> _$$CustomerEarningRuleImplToJson(
  _$CustomerEarningRuleImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'earn_point': instance.earnPoint,
  'spend_amount': instance.spendAmount,
  'point_limit': instance.pointLimit,
};

_$SpendingRuleImpl _$$SpendingRuleImplFromJson(Map<String, dynamic> json) =>
    _$SpendingRuleImpl(
      title: json['title'] as String?,
      spentPoint: (json['spent_point'] as num?)?.toInt(),
      discountAmount: (json['discount_amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SpendingRuleImplToJson(_$SpendingRuleImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'spent_point': instance.spentPoint,
      'discount_amount': instance.discountAmount,
    };

_$PointHistoryImpl _$$PointHistoryImplFromJson(Map<String, dynamic> json) =>
    _$PointHistoryImpl(
      transactionId: json['transaction_id'] as String?,
      amount: json['amount'] as String?,
      comment: json['comment'] as String?,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      expiresAt: json['expires_at'],
      statusDescription: json['status_description'] as String?,
      createdAtFormatted: json['created_at_formatted'] as String?,
    );

Map<String, dynamic> _$$PointHistoryImplToJson(_$PointHistoryImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'amount': instance.amount,
      'comment': instance.comment,
      'created_at': instance.createdAt?.toIso8601String(),
      'expires_at': instance.expiresAt,
      'status_description': instance.statusDescription,
      'created_at_formatted': instance.createdAtFormatted,
    };

_$TierImpl _$$TierImplFromJson(Map<String, dynamic> json) => _$TierImpl(
  name: json['name'] as String?,
  minPoints: json['min_points'] as String?,
);

Map<String, dynamic> _$$TierImplToJson(_$TierImpl instance) =>
    <String, dynamic>{'name': instance.name, 'min_points': instance.minPoints};
