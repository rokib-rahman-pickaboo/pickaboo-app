import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_event.freezed.dart';

@freezed
class ReferralEvent with _$ReferralEvent {
  const factory ReferralEvent.started() = _Started;
  const factory ReferralEvent.getReferralHistory({
    @Default(1) int page,
    @Default(10) int limit,
  }) = _GetReferralHistory;
  const factory ReferralEvent.inviteFriend({
    required Map<String, dynamic> formData,
  }) = _InviteFriend;
}
