part of 'saved_payment_bloc.dart';

@freezed
class SavedPaymentState with _$SavedPaymentState {
  const factory SavedPaymentState({
    @Default(false) bool isLoading,
    @Default([]) List<SavedPaymentEntity> savedPayments,
    String? successMessage,
    String? errorMessage,
  }) = _SavedPaymentState;

  factory SavedPaymentState.initial() => const SavedPaymentState();
}
