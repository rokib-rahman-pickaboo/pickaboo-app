part of 'terms_and_condition_bloc.dart';

enum TermsAndConditionStatus { initial, loading, success, empty, update, error }

@freezed
class TermsAndConditionState with _$TermsAndConditionState {
  const factory TermsAndConditionState({
    @Default(TermsAndConditionStatus.initial) TermsAndConditionStatus status,
    AppErrorEntity? error,
    List<ContentPageEntity>? content,
  }) = _TermsAndConditionState;
}
