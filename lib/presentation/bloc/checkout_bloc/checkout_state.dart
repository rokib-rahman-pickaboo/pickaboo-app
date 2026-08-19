part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.loading({CheckoutEntity? lastCheckout}) =
      _Loading;

  const factory CheckoutState.checkoutLoaded({
    required CheckoutEntity checkout,
    AddressEntity? selectedShippingAddress,
    AddressEntity? selectedBillingAddress,
    String? selectedPaymentMethod,
    String? selectedShippingMethodCode,
    @Default([]) List<ShippingMethodEntity> availableShippingMethods,
    @Default([]) List<PaymentMethodEntity> availablePaymentMethods,
  }) = _CheckoutLoaded;

  const factory CheckoutState.placingOrder({required CheckoutEntity checkout}) =
      _PlacingOrder;

  const factory CheckoutState.orderPlaced({
    required String orderId,
    required double totalAmount,
    required String paymentMethod,
    required CheckoutEntity checkout,
    @Default([]) List<PaymentMethodEntity> availablePaymentMethods,
  }) = _OrderPlaced;

  const factory CheckoutState.paymentProcessing({
    required String orderId,
    required String paymentMethod,
  }) = _PaymentProcessing;

  const factory CheckoutState.paymentSuccess({
    required String orderId,
    required String transactionId,
    required double totalAmount,
  }) = _PaymentSuccess;

  const factory CheckoutState.paymentFailed({
    required String orderId,
    required String errorMessage,
  }) = _PaymentFailed;

  const factory CheckoutState.paymentMethodUpdated({
    required bool success,
    CheckoutEntity? checkout,
  }) = _PaymentMethodUpdated;

  const factory CheckoutState.orderPaymentMethodSynced({
    required bool success,
    required String paymentMethod,
  }) = _OrderPaymentMethodSynced;

  const factory CheckoutState.orderConfirmed({
    required bool success,
    CheckoutEntity? checkout,
  }) = _OrderConfirmed;

  const factory CheckoutState.navigateToPaymentGateway({
    required String url,
    required String title,
    Map<String, String>? formFields,
  }) = _NavigateToPaymentGateway;

  const factory CheckoutState.emiDetailsLoaded({
    required CheckoutEmiEntity emiData,
  }) = _EmiDetailsLoaded;

  const factory CheckoutState.paymentMethodsLoaded({
    @Default([]) List<PaymentMethodEntity> availablePaymentMethods,
  }) = _PaymentMethodsLoaded;

  const factory CheckoutState.error({
    required AppErrorEntity error,
    CheckoutEntity? lastCheckout,
  }) = _Error;
}
