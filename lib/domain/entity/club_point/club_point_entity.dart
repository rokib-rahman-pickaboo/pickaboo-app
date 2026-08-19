
class ClubPointEntity {
  final int customerId;
  final int myPoints;
  final int myLifeTimePoints;
  final List<TierEntity> tiers;
  final String pointHistoryCount;
  final List<PointHistoryEntity> pointHistory;
  final MemberLevelInfoEntity memberLevelInfo;
  final List<GeneralEarningRuleEntity> generalEarningRules;
  final String referLink;
  final List<SpendingRuleEntity> spendingRules;

  const ClubPointEntity({
    this.customerId = 0,
    this.myPoints = 0,
    this.myLifeTimePoints = 0,
    this.tiers = const [],
    this.pointHistoryCount = '',
    this.pointHistory = const [],
    this.memberLevelInfo = const MemberLevelInfoEntity(),
    this.generalEarningRules = const [],
    this.referLink = '',
    this.spendingRules = const [],
  });
}

class GeneralEarningRuleEntity {
  final String title;
  final String message;

  const GeneralEarningRuleEntity({this.title = '', this.message = ''});
}

class MemberLevelInfoEntity {
  final String tierName;
  final String tierDescription;
  final List<CustomerEarningRuleEntity> customerEarningRules;
  final List<SpendingRuleEntity> customerSpendingRule;

  const MemberLevelInfoEntity({
    this.tierName = '',
    this.tierDescription = '',
    this.customerEarningRules = const [],
    this.customerSpendingRule = const [],
  });
}

class CustomerEarningRuleEntity {
  final String title;
  final double earnPoint;
  final int spendAmount;
  final int pointLimit;

  const CustomerEarningRuleEntity({
    this.title = '',
    this.earnPoint = 0.0,
    this.spendAmount = 0,
    this.pointLimit = 0,
  });
}

class SpendingRuleEntity {
  final String title;
  final int spentPoint;
  final int discountAmount;

  const SpendingRuleEntity({
    this.title = '',
    this.spentPoint = 0,
    this.discountAmount = 0,
  });
}

class PointHistoryEntity {
  final String transactionId;
  final String amount;
  final String comment;
  final DateTime createdAt;
  final String expiresAt;
  final String statusDescription;
  final String createdAtFormatted;

  const PointHistoryEntity({
    this.transactionId = '',
    this.amount = '',
    this.comment = '',
    required this.createdAt,
    this.expiresAt = '',
    this.statusDescription = '',
    this.createdAtFormatted = '',
  });
}

class TierEntity {
  final String name;
  final String minPoints;

  const TierEntity({this.name = '', this.minPoints = ''});
}
