part of 'privacy_policy_bloc.dart';

@freezed
class PrivacyPolicyEvent with _$PrivacyPolicyEvent {
  const factory PrivacyPolicyEvent.getPrivacyPolicy() = _GetPrivacyPolicy;
  const factory PrivacyPolicyEvent.refresh() = _Refresh;
}
