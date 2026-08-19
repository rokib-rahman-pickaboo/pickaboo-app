import 'package:pickaboo/data/model/club_point/club_point_response.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';

extension ClubPointMapper on ClubPointResponse {
  ClubPointEntity toEntity() {
    return ClubPointEntity(
      customerId: customerId ?? 0,
      myPoints: myPoints ?? 0,
      myLifeTimePoints: myLifeTimePoints ?? 0,
      tiers: tiers?.map((e) => e.toEntity()).toList() ?? [],
      pointHistoryCount: pointHistoryCount ?? '',
      pointHistory: pointHistory?.map((e) => e.toEntity()).toList() ?? [],
      memberLevelInfo:
          memberLevelInfo?.toEntity() ?? const MemberLevelInfoEntity(),
      generalEarningRules:
          generalEarningRules?.map((e) => e.toEntity()).toList() ?? [],
      referLink: referLink ?? '',
      spendingRules: spendingRules?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension GeneralEarningRuleMapper on GeneralEarningRule {
  GeneralEarningRuleEntity toEntity() {
    return GeneralEarningRuleEntity(title: title ?? '', message: message ?? '');
  }
}

extension MemberLevelInfoMapper on MemberLevelInfo {
  MemberLevelInfoEntity toEntity() {
    return MemberLevelInfoEntity(
      tierName: tierName ?? '',
      tierDescription: tierDescription ?? '',
      customerEarningRules:
          customerEarningRules?.map((e) => e.toEntity()).toList() ?? [],
      customerSpendingRule:
          customerSpendingRule?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension CustomerEarningRuleMapper on CustomerEarningRule {
  CustomerEarningRuleEntity toEntity() {
    return CustomerEarningRuleEntity(
      title: title ?? '',
      earnPoint: earnPoint ?? 0.0,
      spendAmount: spendAmount ?? 0,
      pointLimit: pointLimit ?? 0,
    );
  }
}

extension SpendingRuleMapper on SpendingRule {
  SpendingRuleEntity toEntity() {
    return SpendingRuleEntity(
      title: title ?? '',
      spentPoint: spentPoint ?? 0,
      discountAmount: discountAmount ?? 0,
    );
  }
}

extension PointHistoryMapper on PointHistory {
  PointHistoryEntity toEntity() {
    return PointHistoryEntity(
      transactionId: transactionId ?? '',
      amount: amount ?? '',
      comment: comment ?? '',
      createdAt: createdAt ?? DateTime.now(),
      expiresAt: expiresAt?.toString() ?? '',
      statusDescription: statusDescription ?? '',
      createdAtFormatted: createdAtFormatted ?? '',
    );
  }
}

extension TierMapper on Tier {
  TierEntity toEntity() {
    return TierEntity(name: name ?? '', minPoints: minPoints ?? '');
  }
}
