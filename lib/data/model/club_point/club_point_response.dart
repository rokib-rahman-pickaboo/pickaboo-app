import 'package:freezed_annotation/freezed_annotation.dart';

part 'club_point_response.freezed.dart';
part 'club_point_response.g.dart';

@freezed
class ClubPointResponse with _$ClubPointResponse {
  const factory ClubPointResponse({
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "my_points") int? myPoints,
    @JsonKey(name: "my_life_time_points") int? myLifeTimePoints,
    @JsonKey(name: "tiers") List<Tier>? tiers,
    @JsonKey(name: "point_history_count") String? pointHistoryCount,
    @JsonKey(name: "point_history") List<PointHistory>? pointHistory,
    @JsonKey(name: "member_level_info") MemberLevelInfo? memberLevelInfo,
    @JsonKey(name: "general_earning_rules")
    List<GeneralEarningRule>? generalEarningRules,
    @JsonKey(name: "refer_link") String? referLink,
    @JsonKey(name: "spending_rules") List<SpendingRule>? spendingRules,
  }) = _ClubPointResponse;

  factory ClubPointResponse.fromJson(Map<String, dynamic> json) =>
      _$ClubPointResponseFromJson(json);
}

@freezed
class GeneralEarningRule with _$GeneralEarningRule {
  const factory GeneralEarningRule({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "message") String? message,
  }) = _GeneralEarningRule;

  factory GeneralEarningRule.fromJson(Map<String, dynamic> json) =>
      _$GeneralEarningRuleFromJson(json);
}

@freezed
class MemberLevelInfo with _$MemberLevelInfo {
  const factory MemberLevelInfo({
    @JsonKey(name: "tier_name") String? tierName,
    @JsonKey(name: "tier_description") String? tierDescription,
    @JsonKey(name: "customer_earning_rules")
    List<CustomerEarningRule>? customerEarningRules,
    @JsonKey(name: "customer_spending_rule")
    List<SpendingRule>? customerSpendingRule,
  }) = _MemberLevelInfo;

  factory MemberLevelInfo.fromJson(Map<String, dynamic> json) =>
      _$MemberLevelInfoFromJson(json);
}

@freezed
class CustomerEarningRule with _$CustomerEarningRule {
  const factory CustomerEarningRule({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "earn_point") double? earnPoint,
    @JsonKey(name: "spend_amount") int? spendAmount,
    @JsonKey(name: "point_limit") int? pointLimit,
  }) = _CustomerEarningRule;

  factory CustomerEarningRule.fromJson(Map<String, dynamic> json) =>
      _$CustomerEarningRuleFromJson(json);
}

@freezed
class SpendingRule with _$SpendingRule {
  const factory SpendingRule({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "spent_point") int? spentPoint,
    @JsonKey(name: "discount_amount") int? discountAmount,
  }) = _SpendingRule;

  factory SpendingRule.fromJson(Map<String, dynamic> json) =>
      _$SpendingRuleFromJson(json);
}

@freezed
class PointHistory with _$PointHistory {
  const factory PointHistory({
    @JsonKey(name: "transaction_id") String? transactionId,
    @JsonKey(name: "amount") String? amount,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "expires_at") dynamic expiresAt,
    @JsonKey(name: "status_description") String? statusDescription,
    @JsonKey(name: "created_at_formatted") String? createdAtFormatted,
  }) = _PointHistory;

  factory PointHistory.fromJson(Map<String, dynamic> json) =>
      _$PointHistoryFromJson(json);
}

@freezed
class Tier with _$Tier {
  const factory Tier({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "min_points") String? minPoints,
  }) = _Tier;

  factory Tier.fromJson(Map<String, dynamic> json) => _$TierFromJson(json);
}
