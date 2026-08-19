import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/domain/entity/referral/referral_entity.dart';

part 'referral_state.freezed.dart';

@freezed
class ReferralState with _$ReferralState {
  const factory ReferralState.initial() = _Initial;
  const factory ReferralState.loading() = _Loading;
  const factory ReferralState.referralHistoryLoaded({
    required ReferralEntity referralData,
    @Default(false) bool hasReachedMax,
  }) = _ReferralHistoryLoaded;
  const factory ReferralState.inviteSuccess() = _InviteSuccess;
  const factory ReferralState.error(String message) = _Error;
}
