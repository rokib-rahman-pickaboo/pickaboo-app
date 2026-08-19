part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.loadCheckout() = _LoadCheckout;

  const factory CheckoutEvent.updateShippingAddress({
    required AddressEntity address,
  }) = _UpdateShippingAddress;

  const factory CheckoutEvent.updateBillingAddress({
    required AddressEntity address,
  }) = _UpdateBillingAddress;

  const factory CheckoutEvent.estimateShipping({
    required AddressEntity address,
  }) = _EstimateShipping;

  const factory CheckoutEvent.selectShippingMethod({
    required String carrierCode,
    required String methodCode,
  }) = _SelectShippingMethod;

  const factory CheckoutEvent.selectPaymentMethod({
    required String paymentMethod,
  }) = _SelectPaymentMethod;

  const factory CheckoutEvent.placeOrder() = _PlaceOrder;

  const factory CheckoutEvent.processPayment({
    required String orderId,
    required String paymentMethod,
    String? paymentGateway,
    Map<String, dynamic>? paymentData,
  }) = _ProcessPayment;

  const factory CheckoutEvent.confirmPayment({
    required String orderId,
    required String transactionId,
  }) = _ConfirmPayment;

  const factory CheckoutEvent.updateOrderPayment({
    required String orderId,
    required String paymentMethod,
    String? paymentGateway,
  }) = _UpdateOrderPayment;

  const factory CheckoutEvent.syncOrderPaymentMethod({
    required String orderId,
    required String paymentMethod,
    String? paymentGateway,
  }) = _SyncOrderPaymentMethod;

  const factory CheckoutEvent.confirmOrder({required String orderId}) =
      _ConfirmOrder;

  const factory CheckoutEvent.onPaymentWebViewResult({
    required String orderId,
    required bool success,
    String? message,
  }) = _OnPaymentWebViewResult;

  const factory CheckoutEvent.nagadCallback({
    required Map<String, String> callbackParams,
  }) = _NagadCallback;

  const factory CheckoutEvent.bkashAgreementCallback({
    required String paymentId,
  }) = _BkashAgreementCallback;

  const factory CheckoutEvent.bkashPaymentCallback({
    required String paymentId,
  }) = _BkashPaymentCallback;

  const factory CheckoutEvent.selectSavedBkashAgreement({
    required String agreementId,
  }) = _SelectSavedBkashAgreement;

  const factory CheckoutEvent.clearSavedBkashAgreement() =
      _ClearSavedBkashAgreement;

  const factory CheckoutEvent.loadEmiDetails({
    required String quoteId,
    @Default('') String orderId,
  }) = _LoadEmiDetails;

  const factory CheckoutEvent.storeEmiSelection({
    required String bankName,
    required int tenure,
    required String paymentGateway,
    required String paymentMode,
    required String quoteId,
  }) = _StoreEmiSelection;

  const factory CheckoutEvent.confirmEmiSelection({
    required String orderId,
    required String quoteId,
    required String bankName,
    required int tenure,
    required String paymentGateway,
    required String paymentMode,
  }) = _ConfirmEmiSelection;

  const factory CheckoutEvent.loadPaymentInfo({
    required String cartId,
  }) = _LoadPaymentInfo;

  const factory CheckoutEvent.resetCheckout() = _ResetCheckout;
}
