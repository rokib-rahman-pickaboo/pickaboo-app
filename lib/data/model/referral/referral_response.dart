import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_response.freezed.dart';
part 'referral_response.g.dart';

@freezed
class ReferralResponse with _$ReferralResponse {
  const factory ReferralResponse({
    @JsonKey(name: 'referral_code') String? referralCode,
    @JsonKey(name: 'referral_history_count') int? referralHistoryCount,
    @JsonKey(name: 'referral_pending_count') int? referralPendingCount,
    @JsonKey(name: 'referral_completed_count') int? referralCompletedCount,
    @JsonKey(name: 'referral_history')
    List<ReferralHistoryItem>? referralHistory,
    @JsonKey(name: 'total_count') int? totalCount,
  }) = _ReferralResponse;

  factory ReferralResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralResponseFromJson(json);
}

@freezed
class ReferralHistoryItem with _$ReferralHistoryItem {
  const factory ReferralHistoryItem({
    @JsonKey(name: 'auto_id') String? autoId,
    String? name,
    String? email,
    String? phone,
    @JsonKey(name: 'points_amount') String? pointsAmount,
    String? status,
  }) = _ReferralHistoryItem;

  factory ReferralHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$ReferralHistoryItemFromJson(json);
}
