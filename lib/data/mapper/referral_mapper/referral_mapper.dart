import 'package:pickaboo/data/model/referral/referral_response.dart';
import 'package:pickaboo/domain/entity/referral/referral_entity.dart';

extension ReferralHistoryItemMapper on ReferralHistoryItem {
  ReferralHistoryItemEntity toEntity() {
    return ReferralHistoryItemEntity(
      autoId: autoId,
      name: name,
      email: email,
      phone: phone,
      pointsAmount: pointsAmount,
      status: status,
    );
  }
}

extension ReferralResponseMapper on ReferralResponse {
  ReferralEntity toEntity() {
    return ReferralEntity(
      referralCode: referralCode,
      referralHistoryCount: referralHistoryCount,
      referralPendingCount: referralPendingCount,
      referralCompletedCount: referralCompletedCount,
      referralHistory: referralHistory
          ?.map((item) => item.toEntity())
          .toList(),
      totalCount: totalCount,
    );
  }
}
