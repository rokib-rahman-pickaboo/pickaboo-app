part of 'saved_payment_bloc.dart';

@freezed
class SavedPaymentEvent with _$SavedPaymentEvent {
  const factory SavedPaymentEvent.getSavedPayments(String customerId) =
      _GetSavedPayments;
  const factory SavedPaymentEvent.deleteSavedPayment({
    required String customerId,
    required String phoneNumber,
  }) = _DeleteSavedPayment;
}
