part of 'privacy_policy_bloc.dart';

enum PrivacyPolicyStatus { initial, loading, success, empty, update, error }

@freezed
class PrivacyPolicyState with _$PrivacyPolicyState {
  const factory PrivacyPolicyState({
    @Default(PrivacyPolicyStatus.initial) PrivacyPolicyStatus status,
    AppErrorEntity? error,
    List<ContentPageEntity>? content,
  }) = _PrivacyPolicyState;
}
