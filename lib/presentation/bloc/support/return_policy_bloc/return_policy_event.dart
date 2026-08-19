part of 'return_policy_bloc.dart';

@freezed
class ReturnPolicyEvent with _$ReturnPolicyEvent {
  const factory ReturnPolicyEvent.getReturnPolicy() = _GetReturnPolicy;
  const factory ReturnPolicyEvent.refresh() = _Refresh;
}
