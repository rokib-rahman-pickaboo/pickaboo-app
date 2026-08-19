part of 'return_policy_bloc.dart';

enum ReturnPolicyStatus { initial, loading, success, empty, update, error }

@freezed
class ReturnPolicyState with _$ReturnPolicyState {
  const factory ReturnPolicyState({
    @Default(ReturnPolicyStatus.initial) ReturnPolicyStatus status,
    AppErrorEntity? error,
    List<ContentPageEntity>? content,
  }) = _ReturnPolicyState;
}
