class ReferralEntity {
  final String? referralCode;
  final int? referralHistoryCount;
  final int? referralPendingCount;
  final int? referralCompletedCount;
  final List<ReferralHistoryItemEntity>? referralHistory;
  final int? totalCount;

  const ReferralEntity({
    this.referralCode,
    this.referralHistoryCount,
    this.referralPendingCount,
    this.referralCompletedCount,
    this.referralHistory,
    this.totalCount,
  });
}

class ReferralHistoryItemEntity {
  final String? autoId;
  final String? name;
  final String? email;
  final String? phone;
  final String? pointsAmount;
  final String? status;

  const ReferralHistoryItemEntity({
    this.autoId,
    this.name,
    this.email,
    this.phone,
    this.pointsAmount,
    this.status,
  });
}
