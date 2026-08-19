part of 'terms_and_condition_bloc.dart';

@freezed
class TermsAndConditionEvent with _$TermsAndConditionEvent {
  const factory TermsAndConditionEvent.getTermsAndConditions() =
      _GetTermsAndConditions;
  const factory TermsAndConditionEvent.refresh() = _Refresh;
}
