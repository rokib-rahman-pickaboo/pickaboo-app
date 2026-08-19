// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutEventCopyWith<$Res> {
  factory $CheckoutEventCopyWith(
    CheckoutEvent value,
    $Res Function(CheckoutEvent) then,
  ) = _$CheckoutEventCopyWithImpl<$Res, CheckoutEvent>;
}

/// @nodoc
class _$CheckoutEventCopyWithImpl<$Res, $Val extends CheckoutEvent>
    implements $CheckoutEventCopyWith<$Res> {
  _$CheckoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadCheckoutImplCopyWith<$Res> {
  factory _$$LoadCheckoutImplCopyWith(
    _$LoadCheckoutImpl value,
    $Res Function(_$LoadCheckoutImpl) then,
  ) = __$$LoadCheckoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCheckoutImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$LoadCheckoutImpl>
    implements _$$LoadCheckoutImplCopyWith<$Res> {
  __$$LoadCheckoutImplCopyWithImpl(
    _$LoadCheckoutImpl _value,
    $Res Function(_$LoadCheckoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadCheckoutImpl with DiagnosticableTreeMixin implements _LoadCheckout {
  const _$LoadCheckoutImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.loadCheckout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CheckoutEvent.loadCheckout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCheckoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return loadCheckout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return loadCheckout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (loadCheckout != null) {
      return loadCheckout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return loadCheckout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return loadCheckout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (loadCheckout != null) {
      return loadCheckout(this);
    }
    return orElse();
  }
}

abstract class _LoadCheckout implements CheckoutEvent {
  const factory _LoadCheckout() = _$LoadCheckoutImpl;
}

/// @nodoc
abstract class _$$UpdateShippingAddressImplCopyWith<$Res> {
  factory _$$UpdateShippingAddressImplCopyWith(
    _$UpdateShippingAddressImpl value,
    $Res Function(_$UpdateShippingAddressImpl) then,
  ) = __$$UpdateShippingAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressEntity address});
}

/// @nodoc
class __$$UpdateShippingAddressImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$UpdateShippingAddressImpl>
    implements _$$UpdateShippingAddressImplCopyWith<$Res> {
  __$$UpdateShippingAddressImplCopyWithImpl(
    _$UpdateShippingAddressImpl _value,
    $Res Function(_$UpdateShippingAddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? address = null}) {
    return _then(
      _$UpdateShippingAddressImpl(
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as AddressEntity,
      ),
    );
  }
}

/// @nodoc

class _$UpdateShippingAddressImpl
    with DiagnosticableTreeMixin
    implements _UpdateShippingAddress {
  const _$UpdateShippingAddressImpl({required this.address});

  @override
  final AddressEntity address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.updateShippingAddress(address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.updateShippingAddress'))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateShippingAddressImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateShippingAddressImplCopyWith<_$UpdateShippingAddressImpl>
  get copyWith =>
      __$$UpdateShippingAddressImplCopyWithImpl<_$UpdateShippingAddressImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return updateShippingAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return updateShippingAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (updateShippingAddress != null) {
      return updateShippingAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return updateShippingAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return updateShippingAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (updateShippingAddress != null) {
      return updateShippingAddress(this);
    }
    return orElse();
  }
}

abstract class _UpdateShippingAddress implements CheckoutEvent {
  const factory _UpdateShippingAddress({required final AddressEntity address}) =
      _$UpdateShippingAddressImpl;

  AddressEntity get address;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateShippingAddressImplCopyWith<_$UpdateShippingAddressImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateBillingAddressImplCopyWith<$Res> {
  factory _$$UpdateBillingAddressImplCopyWith(
    _$UpdateBillingAddressImpl value,
    $Res Function(_$UpdateBillingAddressImpl) then,
  ) = __$$UpdateBillingAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressEntity address});
}

/// @nodoc
class __$$UpdateBillingAddressImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$UpdateBillingAddressImpl>
    implements _$$UpdateBillingAddressImplCopyWith<$Res> {
  __$$UpdateBillingAddressImplCopyWithImpl(
    _$UpdateBillingAddressImpl _value,
    $Res Function(_$UpdateBillingAddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? address = null}) {
    return _then(
      _$UpdateBillingAddressImpl(
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as AddressEntity,
      ),
    );
  }
}

/// @nodoc

class _$UpdateBillingAddressImpl
    with DiagnosticableTreeMixin
    implements _UpdateBillingAddress {
  const _$UpdateBillingAddressImpl({required this.address});

  @override
  final AddressEntity address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.updateBillingAddress(address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.updateBillingAddress'))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBillingAddressImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBillingAddressImplCopyWith<_$UpdateBillingAddressImpl>
  get copyWith =>
      __$$UpdateBillingAddressImplCopyWithImpl<_$UpdateBillingAddressImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return updateBillingAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return updateBillingAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (updateBillingAddress != null) {
      return updateBillingAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return updateBillingAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return updateBillingAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (updateBillingAddress != null) {
      return updateBillingAddress(this);
    }
    return orElse();
  }
}

abstract class _UpdateBillingAddress implements CheckoutEvent {
  const factory _UpdateBillingAddress({required final AddressEntity address}) =
      _$UpdateBillingAddressImpl;

  AddressEntity get address;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateBillingAddressImplCopyWith<_$UpdateBillingAddressImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EstimateShippingImplCopyWith<$Res> {
  factory _$$EstimateShippingImplCopyWith(
    _$EstimateShippingImpl value,
    $Res Function(_$EstimateShippingImpl) then,
  ) = __$$EstimateShippingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressEntity address});
}

/// @nodoc
class __$$EstimateShippingImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$EstimateShippingImpl>
    implements _$$EstimateShippingImplCopyWith<$Res> {
  __$$EstimateShippingImplCopyWithImpl(
    _$EstimateShippingImpl _value,
    $Res Function(_$EstimateShippingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? address = null}) {
    return _then(
      _$EstimateShippingImpl(
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as AddressEntity,
      ),
    );
  }
}

/// @nodoc

class _$EstimateShippingImpl
    with DiagnosticableTreeMixin
    implements _EstimateShipping {
  const _$EstimateShippingImpl({required this.address});

  @override
  final AddressEntity address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.estimateShipping(address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.estimateShipping'))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstimateShippingImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstimateShippingImplCopyWith<_$EstimateShippingImpl> get copyWith =>
      __$$EstimateShippingImplCopyWithImpl<_$EstimateShippingImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return estimateShipping(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return estimateShipping?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (estimateShipping != null) {
      return estimateShipping(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return estimateShipping(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return estimateShipping?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (estimateShipping != null) {
      return estimateShipping(this);
    }
    return orElse();
  }
}

abstract class _EstimateShipping implements CheckoutEvent {
  const factory _EstimateShipping({required final AddressEntity address}) =
      _$EstimateShippingImpl;

  AddressEntity get address;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstimateShippingImplCopyWith<_$EstimateShippingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectShippingMethodImplCopyWith<$Res> {
  factory _$$SelectShippingMethodImplCopyWith(
    _$SelectShippingMethodImpl value,
    $Res Function(_$SelectShippingMethodImpl) then,
  ) = __$$SelectShippingMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String carrierCode, String methodCode});
}

/// @nodoc
class __$$SelectShippingMethodImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$SelectShippingMethodImpl>
    implements _$$SelectShippingMethodImplCopyWith<$Res> {
  __$$SelectShippingMethodImplCopyWithImpl(
    _$SelectShippingMethodImpl _value,
    $Res Function(_$SelectShippingMethodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? carrierCode = null, Object? methodCode = null}) {
    return _then(
      _$SelectShippingMethodImpl(
        carrierCode:
            null == carrierCode
                ? _value.carrierCode
                : carrierCode // ignore: cast_nullable_to_non_nullable
                    as String,
        methodCode:
            null == methodCode
                ? _value.methodCode
                : methodCode // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SelectShippingMethodImpl
    with DiagnosticableTreeMixin
    implements _SelectShippingMethod {
  const _$SelectShippingMethodImpl({
    required this.carrierCode,
    required this.methodCode,
  });

  @override
  final String carrierCode;
  @override
  final String methodCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.selectShippingMethod(carrierCode: $carrierCode, methodCode: $methodCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.selectShippingMethod'))
      ..add(DiagnosticsProperty('carrierCode', carrierCode))
      ..add(DiagnosticsProperty('methodCode', methodCode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectShippingMethodImpl &&
            (identical(other.carrierCode, carrierCode) ||
                other.carrierCode == carrierCode) &&
            (identical(other.methodCode, methodCode) ||
                other.methodCode == methodCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, carrierCode, methodCode);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectShippingMethodImplCopyWith<_$SelectShippingMethodImpl>
  get copyWith =>
      __$$SelectShippingMethodImplCopyWithImpl<_$SelectShippingMethodImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return selectShippingMethod(carrierCode, methodCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return selectShippingMethod?.call(carrierCode, methodCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (selectShippingMethod != null) {
      return selectShippingMethod(carrierCode, methodCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return selectShippingMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return selectShippingMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (selectShippingMethod != null) {
      return selectShippingMethod(this);
    }
    return orElse();
  }
}

abstract class _SelectShippingMethod implements CheckoutEvent {
  const factory _SelectShippingMethod({
    required final String carrierCode,
    required final String methodCode,
  }) = _$SelectShippingMethodImpl;

  String get carrierCode;
  String get methodCode;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectShippingMethodImplCopyWith<_$SelectShippingMethodImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectPaymentMethodImplCopyWith<$Res> {
  factory _$$SelectPaymentMethodImplCopyWith(
    _$SelectPaymentMethodImpl value,
    $Res Function(_$SelectPaymentMethodImpl) then,
  ) = __$$SelectPaymentMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String paymentMethod});
}

/// @nodoc
class __$$SelectPaymentMethodImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$SelectPaymentMethodImpl>
    implements _$$SelectPaymentMethodImplCopyWith<$Res> {
  __$$SelectPaymentMethodImplCopyWithImpl(
    _$SelectPaymentMethodImpl _value,
    $Res Function(_$SelectPaymentMethodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? paymentMethod = null}) {
    return _then(
      _$SelectPaymentMethodImpl(
        paymentMethod:
            null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SelectPaymentMethodImpl
    with DiagnosticableTreeMixin
    implements _SelectPaymentMethod {
  const _$SelectPaymentMethodImpl({required this.paymentMethod});

  @override
  final String paymentMethod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.selectPaymentMethod(paymentMethod: $paymentMethod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.selectPaymentMethod'))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPaymentMethodImpl &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentMethod);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPaymentMethodImplCopyWith<_$SelectPaymentMethodImpl> get copyWith =>
      __$$SelectPaymentMethodImplCopyWithImpl<_$SelectPaymentMethodImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return selectPaymentMethod(paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return selectPaymentMethod?.call(paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (selectPaymentMethod != null) {
      return selectPaymentMethod(paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return selectPaymentMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return selectPaymentMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (selectPaymentMethod != null) {
      return selectPaymentMethod(this);
    }
    return orElse();
  }
}

abstract class _SelectPaymentMethod implements CheckoutEvent {
  const factory _SelectPaymentMethod({required final String paymentMethod}) =
      _$SelectPaymentMethodImpl;

  String get paymentMethod;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectPaymentMethodImplCopyWith<_$SelectPaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlaceOrderImplCopyWith<$Res> {
  factory _$$PlaceOrderImplCopyWith(
    _$PlaceOrderImpl value,
    $Res Function(_$PlaceOrderImpl) then,
  ) = __$$PlaceOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlaceOrderImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$PlaceOrderImpl>
    implements _$$PlaceOrderImplCopyWith<$Res> {
  __$$PlaceOrderImplCopyWithImpl(
    _$PlaceOrderImpl _value,
    $Res Function(_$PlaceOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlaceOrderImpl with DiagnosticableTreeMixin implements _PlaceOrder {
  const _$PlaceOrderImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.placeOrder()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CheckoutEvent.placeOrder'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlaceOrderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return placeOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return placeOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (placeOrder != null) {
      return placeOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return placeOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return placeOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (placeOrder != null) {
      return placeOrder(this);
    }
    return orElse();
  }
}

abstract class _PlaceOrder implements CheckoutEvent {
  const factory _PlaceOrder() = _$PlaceOrderImpl;
}

/// @nodoc
abstract class _$$ProcessPaymentImplCopyWith<$Res> {
  factory _$$ProcessPaymentImplCopyWith(
    _$ProcessPaymentImpl value,
    $Res Function(_$ProcessPaymentImpl) then,
  ) = __$$ProcessPaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String orderId,
    String paymentMethod,
    String? paymentGateway,
    Map<String, dynamic>? paymentData,
  });
}

/// @nodoc
class __$$ProcessPaymentImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ProcessPaymentImpl>
    implements _$$ProcessPaymentImplCopyWith<$Res> {
  __$$ProcessPaymentImplCopyWithImpl(
    _$ProcessPaymentImpl _value,
    $Res Function(_$ProcessPaymentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? paymentMethod = null,
    Object? paymentGateway = freezed,
    Object? paymentData = freezed,
  }) {
    return _then(
      _$ProcessPaymentImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        paymentMethod:
            null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as String,
        paymentGateway:
            freezed == paymentGateway
                ? _value.paymentGateway
                : paymentGateway // ignore: cast_nullable_to_non_nullable
                    as String?,
        paymentData:
            freezed == paymentData
                ? _value._paymentData
                : paymentData // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$ProcessPaymentImpl
    with DiagnosticableTreeMixin
    implements _ProcessPayment {
  const _$ProcessPaymentImpl({
    required this.orderId,
    required this.paymentMethod,
    this.paymentGateway,
    final Map<String, dynamic>? paymentData,
  }) : _paymentData = paymentData;

  @override
  final String orderId;
  @override
  final String paymentMethod;
  @override
  final String? paymentGateway;
  final Map<String, dynamic>? _paymentData;
  @override
  Map<String, dynamic>? get paymentData {
    final value = _paymentData;
    if (value == null) return null;
    if (_paymentData is EqualUnmodifiableMapView) return _paymentData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.processPayment(orderId: $orderId, paymentMethod: $paymentMethod, paymentGateway: $paymentGateway, paymentData: $paymentData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.processPayment'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod))
      ..add(DiagnosticsProperty('paymentGateway', paymentGateway))
      ..add(DiagnosticsProperty('paymentData', paymentData));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessPaymentImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentGateway, paymentGateway) ||
                other.paymentGateway == paymentGateway) &&
            const DeepCollectionEquality().equals(
              other._paymentData,
              _paymentData,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    paymentMethod,
    paymentGateway,
    const DeepCollectionEquality().hash(_paymentData),
  );

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessPaymentImplCopyWith<_$ProcessPaymentImpl> get copyWith =>
      __$$ProcessPaymentImplCopyWithImpl<_$ProcessPaymentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return processPayment(orderId, paymentMethod, paymentGateway, paymentData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return processPayment?.call(
      orderId,
      paymentMethod,
      paymentGateway,
      paymentData,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (processPayment != null) {
      return processPayment(
        orderId,
        paymentMethod,
        paymentGateway,
        paymentData,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return processPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return processPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (processPayment != null) {
      return processPayment(this);
    }
    return orElse();
  }
}

abstract class _ProcessPayment implements CheckoutEvent {
  const factory _ProcessPayment({
    required final String orderId,
    required final String paymentMethod,
    final String? paymentGateway,
    final Map<String, dynamic>? paymentData,
  }) = _$ProcessPaymentImpl;

  String get orderId;
  String get paymentMethod;
  String? get paymentGateway;
  Map<String, dynamic>? get paymentData;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessPaymentImplCopyWith<_$ProcessPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmPaymentImplCopyWith<$Res> {
  factory _$$ConfirmPaymentImplCopyWith(
    _$ConfirmPaymentImpl value,
    $Res Function(_$ConfirmPaymentImpl) then,
  ) = __$$ConfirmPaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, String transactionId});
}

/// @nodoc
class __$$ConfirmPaymentImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ConfirmPaymentImpl>
    implements _$$ConfirmPaymentImplCopyWith<$Res> {
  __$$ConfirmPaymentImplCopyWithImpl(
    _$ConfirmPaymentImpl _value,
    $Res Function(_$ConfirmPaymentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? transactionId = null}) {
    return _then(
      _$ConfirmPaymentImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        transactionId:
            null == transactionId
                ? _value.transactionId
                : transactionId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ConfirmPaymentImpl
    with DiagnosticableTreeMixin
    implements _ConfirmPayment {
  const _$ConfirmPaymentImpl({
    required this.orderId,
    required this.transactionId,
  });

  @override
  final String orderId;
  @override
  final String transactionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.confirmPayment(orderId: $orderId, transactionId: $transactionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.confirmPayment'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('transactionId', transactionId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmPaymentImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, transactionId);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmPaymentImplCopyWith<_$ConfirmPaymentImpl> get copyWith =>
      __$$ConfirmPaymentImplCopyWithImpl<_$ConfirmPaymentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return confirmPayment(orderId, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return confirmPayment?.call(orderId, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (confirmPayment != null) {
      return confirmPayment(orderId, transactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return confirmPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return confirmPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (confirmPayment != null) {
      return confirmPayment(this);
    }
    return orElse();
  }
}

abstract class _ConfirmPayment implements CheckoutEvent {
  const factory _ConfirmPayment({
    required final String orderId,
    required final String transactionId,
  }) = _$ConfirmPaymentImpl;

  String get orderId;
  String get transactionId;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmPaymentImplCopyWith<_$ConfirmPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateOrderPaymentImplCopyWith<$Res> {
  factory _$$UpdateOrderPaymentImplCopyWith(
    _$UpdateOrderPaymentImpl value,
    $Res Function(_$UpdateOrderPaymentImpl) then,
  ) = __$$UpdateOrderPaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, String paymentMethod, String? paymentGateway});
}

/// @nodoc
class __$$UpdateOrderPaymentImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$UpdateOrderPaymentImpl>
    implements _$$UpdateOrderPaymentImplCopyWith<$Res> {
  __$$UpdateOrderPaymentImplCopyWithImpl(
    _$UpdateOrderPaymentImpl _value,
    $Res Function(_$UpdateOrderPaymentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? paymentMethod = null,
    Object? paymentGateway = freezed,
  }) {
    return _then(
      _$UpdateOrderPaymentImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        paymentMethod:
            null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as String,
        paymentGateway:
            freezed == paymentGateway
                ? _value.paymentGateway
                : paymentGateway // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$UpdateOrderPaymentImpl
    with DiagnosticableTreeMixin
    implements _UpdateOrderPayment {
  const _$UpdateOrderPaymentImpl({
    required this.orderId,
    required this.paymentMethod,
    this.paymentGateway,
  });

  @override
  final String orderId;
  @override
  final String paymentMethod;
  @override
  final String? paymentGateway;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.updateOrderPayment(orderId: $orderId, paymentMethod: $paymentMethod, paymentGateway: $paymentGateway)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.updateOrderPayment'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod))
      ..add(DiagnosticsProperty('paymentGateway', paymentGateway));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateOrderPaymentImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentGateway, paymentGateway) ||
                other.paymentGateway == paymentGateway));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, orderId, paymentMethod, paymentGateway);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateOrderPaymentImplCopyWith<_$UpdateOrderPaymentImpl> get copyWith =>
      __$$UpdateOrderPaymentImplCopyWithImpl<_$UpdateOrderPaymentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return updateOrderPayment(orderId, paymentMethod, paymentGateway);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return updateOrderPayment?.call(orderId, paymentMethod, paymentGateway);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (updateOrderPayment != null) {
      return updateOrderPayment(orderId, paymentMethod, paymentGateway);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return updateOrderPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return updateOrderPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (updateOrderPayment != null) {
      return updateOrderPayment(this);
    }
    return orElse();
  }
}

abstract class _UpdateOrderPayment implements CheckoutEvent {
  const factory _UpdateOrderPayment({
    required final String orderId,
    required final String paymentMethod,
    final String? paymentGateway,
  }) = _$UpdateOrderPaymentImpl;

  String get orderId;
  String get paymentMethod;
  String? get paymentGateway;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateOrderPaymentImplCopyWith<_$UpdateOrderPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncOrderPaymentMethodImplCopyWith<$Res> {
  factory _$$SyncOrderPaymentMethodImplCopyWith(
    _$SyncOrderPaymentMethodImpl value,
    $Res Function(_$SyncOrderPaymentMethodImpl) then,
  ) = __$$SyncOrderPaymentMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, String paymentMethod, String? paymentGateway});
}

/// @nodoc
class __$$SyncOrderPaymentMethodImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$SyncOrderPaymentMethodImpl>
    implements _$$SyncOrderPaymentMethodImplCopyWith<$Res> {
  __$$SyncOrderPaymentMethodImplCopyWithImpl(
    _$SyncOrderPaymentMethodImpl _value,
    $Res Function(_$SyncOrderPaymentMethodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? paymentMethod = null,
    Object? paymentGateway = freezed,
  }) {
    return _then(
      _$SyncOrderPaymentMethodImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        paymentMethod:
            null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as String,
        paymentGateway:
            freezed == paymentGateway
                ? _value.paymentGateway
                : paymentGateway // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$SyncOrderPaymentMethodImpl
    with DiagnosticableTreeMixin
    implements _SyncOrderPaymentMethod {
  const _$SyncOrderPaymentMethodImpl({
    required this.orderId,
    required this.paymentMethod,
    this.paymentGateway,
  });

  @override
  final String orderId;
  @override
  final String paymentMethod;
  @override
  final String? paymentGateway;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.syncOrderPaymentMethod(orderId: $orderId, paymentMethod: $paymentMethod, paymentGateway: $paymentGateway)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.syncOrderPaymentMethod'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod))
      ..add(DiagnosticsProperty('paymentGateway', paymentGateway));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncOrderPaymentMethodImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentGateway, paymentGateway) ||
                other.paymentGateway == paymentGateway));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, orderId, paymentMethod, paymentGateway);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncOrderPaymentMethodImplCopyWith<_$SyncOrderPaymentMethodImpl>
  get copyWith =>
      __$$SyncOrderPaymentMethodImplCopyWithImpl<_$SyncOrderPaymentMethodImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return syncOrderPaymentMethod(orderId, paymentMethod, paymentGateway);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return syncOrderPaymentMethod?.call(orderId, paymentMethod, paymentGateway);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (syncOrderPaymentMethod != null) {
      return syncOrderPaymentMethod(orderId, paymentMethod, paymentGateway);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return syncOrderPaymentMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return syncOrderPaymentMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (syncOrderPaymentMethod != null) {
      return syncOrderPaymentMethod(this);
    }
    return orElse();
  }
}

abstract class _SyncOrderPaymentMethod implements CheckoutEvent {
  const factory _SyncOrderPaymentMethod({
    required final String orderId,
    required final String paymentMethod,
    final String? paymentGateway,
  }) = _$SyncOrderPaymentMethodImpl;

  String get orderId;
  String get paymentMethod;
  String? get paymentGateway;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncOrderPaymentMethodImplCopyWith<_$SyncOrderPaymentMethodImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmOrderImplCopyWith<$Res> {
  factory _$$ConfirmOrderImplCopyWith(
    _$ConfirmOrderImpl value,
    $Res Function(_$ConfirmOrderImpl) then,
  ) = __$$ConfirmOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$ConfirmOrderImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ConfirmOrderImpl>
    implements _$$ConfirmOrderImplCopyWith<$Res> {
  __$$ConfirmOrderImplCopyWithImpl(
    _$ConfirmOrderImpl _value,
    $Res Function(_$ConfirmOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _$ConfirmOrderImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ConfirmOrderImpl with DiagnosticableTreeMixin implements _ConfirmOrder {
  const _$ConfirmOrderImpl({required this.orderId});

  @override
  final String orderId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.confirmOrder(orderId: $orderId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.confirmOrder'))
      ..add(DiagnosticsProperty('orderId', orderId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmOrderImplCopyWith<_$ConfirmOrderImpl> get copyWith =>
      __$$ConfirmOrderImplCopyWithImpl<_$ConfirmOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return confirmOrder(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return confirmOrder?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (confirmOrder != null) {
      return confirmOrder(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return confirmOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return confirmOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (confirmOrder != null) {
      return confirmOrder(this);
    }
    return orElse();
  }
}

abstract class _ConfirmOrder implements CheckoutEvent {
  const factory _ConfirmOrder({required final String orderId}) =
      _$ConfirmOrderImpl;

  String get orderId;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmOrderImplCopyWith<_$ConfirmOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnPaymentWebViewResultImplCopyWith<$Res> {
  factory _$$OnPaymentWebViewResultImplCopyWith(
    _$OnPaymentWebViewResultImpl value,
    $Res Function(_$OnPaymentWebViewResultImpl) then,
  ) = __$$OnPaymentWebViewResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, bool success, String? message});
}

/// @nodoc
class __$$OnPaymentWebViewResultImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$OnPaymentWebViewResultImpl>
    implements _$$OnPaymentWebViewResultImplCopyWith<$Res> {
  __$$OnPaymentWebViewResultImplCopyWithImpl(
    _$OnPaymentWebViewResultImpl _value,
    $Res Function(_$OnPaymentWebViewResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? success = null,
    Object? message = freezed,
  }) {
    return _then(
      _$OnPaymentWebViewResultImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$OnPaymentWebViewResultImpl
    with DiagnosticableTreeMixin
    implements _OnPaymentWebViewResult {
  const _$OnPaymentWebViewResultImpl({
    required this.orderId,
    required this.success,
    this.message,
  });

  @override
  final String orderId;
  @override
  final bool success;
  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.onPaymentWebViewResult(orderId: $orderId, success: $success, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.onPaymentWebViewResult'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPaymentWebViewResultImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, success, message);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPaymentWebViewResultImplCopyWith<_$OnPaymentWebViewResultImpl>
  get copyWith =>
      __$$OnPaymentWebViewResultImplCopyWithImpl<_$OnPaymentWebViewResultImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return onPaymentWebViewResult(orderId, success, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return onPaymentWebViewResult?.call(orderId, success, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (onPaymentWebViewResult != null) {
      return onPaymentWebViewResult(orderId, success, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return onPaymentWebViewResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return onPaymentWebViewResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (onPaymentWebViewResult != null) {
      return onPaymentWebViewResult(this);
    }
    return orElse();
  }
}

abstract class _OnPaymentWebViewResult implements CheckoutEvent {
  const factory _OnPaymentWebViewResult({
    required final String orderId,
    required final bool success,
    final String? message,
  }) = _$OnPaymentWebViewResultImpl;

  String get orderId;
  bool get success;
  String? get message;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnPaymentWebViewResultImplCopyWith<_$OnPaymentWebViewResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NagadCallbackImplCopyWith<$Res> {
  factory _$$NagadCallbackImplCopyWith(
    _$NagadCallbackImpl value,
    $Res Function(_$NagadCallbackImpl) then,
  ) = __$$NagadCallbackImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, String> callbackParams});
}

/// @nodoc
class __$$NagadCallbackImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$NagadCallbackImpl>
    implements _$$NagadCallbackImplCopyWith<$Res> {
  __$$NagadCallbackImplCopyWithImpl(
    _$NagadCallbackImpl _value,
    $Res Function(_$NagadCallbackImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? callbackParams = null}) {
    return _then(
      _$NagadCallbackImpl(
        callbackParams:
            null == callbackParams
                ? _value._callbackParams
                : callbackParams // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>,
      ),
    );
  }
}

/// @nodoc

class _$NagadCallbackImpl
    with DiagnosticableTreeMixin
    implements _NagadCallback {
  const _$NagadCallbackImpl({required final Map<String, String> callbackParams})
    : _callbackParams = callbackParams;

  final Map<String, String> _callbackParams;
  @override
  Map<String, String> get callbackParams {
    if (_callbackParams is EqualUnmodifiableMapView) return _callbackParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_callbackParams);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.nagadCallback(callbackParams: $callbackParams)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.nagadCallback'))
      ..add(DiagnosticsProperty('callbackParams', callbackParams));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NagadCallbackImpl &&
            const DeepCollectionEquality().equals(
              other._callbackParams,
              _callbackParams,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_callbackParams),
  );

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NagadCallbackImplCopyWith<_$NagadCallbackImpl> get copyWith =>
      __$$NagadCallbackImplCopyWithImpl<_$NagadCallbackImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return nagadCallback(callbackParams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return nagadCallback?.call(callbackParams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (nagadCallback != null) {
      return nagadCallback(callbackParams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return nagadCallback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return nagadCallback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (nagadCallback != null) {
      return nagadCallback(this);
    }
    return orElse();
  }
}

abstract class _NagadCallback implements CheckoutEvent {
  const factory _NagadCallback({
    required final Map<String, String> callbackParams,
  }) = _$NagadCallbackImpl;

  Map<String, String> get callbackParams;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NagadCallbackImplCopyWith<_$NagadCallbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BkashAgreementCallbackImplCopyWith<$Res> {
  factory _$$BkashAgreementCallbackImplCopyWith(
    _$BkashAgreementCallbackImpl value,
    $Res Function(_$BkashAgreementCallbackImpl) then,
  ) = __$$BkashAgreementCallbackImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String paymentId});
}

/// @nodoc
class __$$BkashAgreementCallbackImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$BkashAgreementCallbackImpl>
    implements _$$BkashAgreementCallbackImplCopyWith<$Res> {
  __$$BkashAgreementCallbackImplCopyWithImpl(
    _$BkashAgreementCallbackImpl _value,
    $Res Function(_$BkashAgreementCallbackImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? paymentId = null}) {
    return _then(
      _$BkashAgreementCallbackImpl(
        paymentId:
            null == paymentId
                ? _value.paymentId
                : paymentId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$BkashAgreementCallbackImpl
    with DiagnosticableTreeMixin
    implements _BkashAgreementCallback {
  const _$BkashAgreementCallbackImpl({required this.paymentId});

  @override
  final String paymentId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.bkashAgreementCallback(paymentId: $paymentId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.bkashAgreementCallback'))
      ..add(DiagnosticsProperty('paymentId', paymentId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BkashAgreementCallbackImpl &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentId);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BkashAgreementCallbackImplCopyWith<_$BkashAgreementCallbackImpl>
  get copyWith =>
      __$$BkashAgreementCallbackImplCopyWithImpl<_$BkashAgreementCallbackImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return bkashAgreementCallback(paymentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return bkashAgreementCallback?.call(paymentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (bkashAgreementCallback != null) {
      return bkashAgreementCallback(paymentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return bkashAgreementCallback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return bkashAgreementCallback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (bkashAgreementCallback != null) {
      return bkashAgreementCallback(this);
    }
    return orElse();
  }
}

abstract class _BkashAgreementCallback implements CheckoutEvent {
  const factory _BkashAgreementCallback({required final String paymentId}) =
      _$BkashAgreementCallbackImpl;

  String get paymentId;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BkashAgreementCallbackImplCopyWith<_$BkashAgreementCallbackImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BkashPaymentCallbackImplCopyWith<$Res> {
  factory _$$BkashPaymentCallbackImplCopyWith(
    _$BkashPaymentCallbackImpl value,
    $Res Function(_$BkashPaymentCallbackImpl) then,
  ) = __$$BkashPaymentCallbackImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String paymentId});
}

/// @nodoc
class __$$BkashPaymentCallbackImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$BkashPaymentCallbackImpl>
    implements _$$BkashPaymentCallbackImplCopyWith<$Res> {
  __$$BkashPaymentCallbackImplCopyWithImpl(
    _$BkashPaymentCallbackImpl _value,
    $Res Function(_$BkashPaymentCallbackImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? paymentId = null}) {
    return _then(
      _$BkashPaymentCallbackImpl(
        paymentId:
            null == paymentId
                ? _value.paymentId
                : paymentId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$BkashPaymentCallbackImpl
    with DiagnosticableTreeMixin
    implements _BkashPaymentCallback {
  const _$BkashPaymentCallbackImpl({required this.paymentId});

  @override
  final String paymentId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.bkashPaymentCallback(paymentId: $paymentId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.bkashPaymentCallback'))
      ..add(DiagnosticsProperty('paymentId', paymentId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BkashPaymentCallbackImpl &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentId);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BkashPaymentCallbackImplCopyWith<_$BkashPaymentCallbackImpl>
  get copyWith =>
      __$$BkashPaymentCallbackImplCopyWithImpl<_$BkashPaymentCallbackImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return bkashPaymentCallback(paymentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return bkashPaymentCallback?.call(paymentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (bkashPaymentCallback != null) {
      return bkashPaymentCallback(paymentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return bkashPaymentCallback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return bkashPaymentCallback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (bkashPaymentCallback != null) {
      return bkashPaymentCallback(this);
    }
    return orElse();
  }
}

abstract class _BkashPaymentCallback implements CheckoutEvent {
  const factory _BkashPaymentCallback({required final String paymentId}) =
      _$BkashPaymentCallbackImpl;

  String get paymentId;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BkashPaymentCallbackImplCopyWith<_$BkashPaymentCallbackImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectSavedBkashAgreementImplCopyWith<$Res> {
  factory _$$SelectSavedBkashAgreementImplCopyWith(
    _$SelectSavedBkashAgreementImpl value,
    $Res Function(_$SelectSavedBkashAgreementImpl) then,
  ) = __$$SelectSavedBkashAgreementImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String agreementId});
}

/// @nodoc
class __$$SelectSavedBkashAgreementImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$SelectSavedBkashAgreementImpl>
    implements _$$SelectSavedBkashAgreementImplCopyWith<$Res> {
  __$$SelectSavedBkashAgreementImplCopyWithImpl(
    _$SelectSavedBkashAgreementImpl _value,
    $Res Function(_$SelectSavedBkashAgreementImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? agreementId = null}) {
    return _then(
      _$SelectSavedBkashAgreementImpl(
        agreementId:
            null == agreementId
                ? _value.agreementId
                : agreementId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SelectSavedBkashAgreementImpl
    with DiagnosticableTreeMixin
    implements _SelectSavedBkashAgreement {
  const _$SelectSavedBkashAgreementImpl({required this.agreementId});

  @override
  final String agreementId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.selectSavedBkashAgreement(agreementId: $agreementId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty('type', 'CheckoutEvent.selectSavedBkashAgreement'),
      )
      ..add(DiagnosticsProperty('agreementId', agreementId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectSavedBkashAgreementImpl &&
            (identical(other.agreementId, agreementId) ||
                other.agreementId == agreementId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, agreementId);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectSavedBkashAgreementImplCopyWith<_$SelectSavedBkashAgreementImpl>
  get copyWith => __$$SelectSavedBkashAgreementImplCopyWithImpl<
    _$SelectSavedBkashAgreementImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return selectSavedBkashAgreement(agreementId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return selectSavedBkashAgreement?.call(agreementId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (selectSavedBkashAgreement != null) {
      return selectSavedBkashAgreement(agreementId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return selectSavedBkashAgreement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return selectSavedBkashAgreement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (selectSavedBkashAgreement != null) {
      return selectSavedBkashAgreement(this);
    }
    return orElse();
  }
}

abstract class _SelectSavedBkashAgreement implements CheckoutEvent {
  const factory _SelectSavedBkashAgreement({
    required final String agreementId,
  }) = _$SelectSavedBkashAgreementImpl;

  String get agreementId;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectSavedBkashAgreementImplCopyWith<_$SelectSavedBkashAgreementImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSavedBkashAgreementImplCopyWith<$Res> {
  factory _$$ClearSavedBkashAgreementImplCopyWith(
    _$ClearSavedBkashAgreementImpl value,
    $Res Function(_$ClearSavedBkashAgreementImpl) then,
  ) = __$$ClearSavedBkashAgreementImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSavedBkashAgreementImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ClearSavedBkashAgreementImpl>
    implements _$$ClearSavedBkashAgreementImplCopyWith<$Res> {
  __$$ClearSavedBkashAgreementImplCopyWithImpl(
    _$ClearSavedBkashAgreementImpl _value,
    $Res Function(_$ClearSavedBkashAgreementImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearSavedBkashAgreementImpl
    with DiagnosticableTreeMixin
    implements _ClearSavedBkashAgreement {
  const _$ClearSavedBkashAgreementImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.clearSavedBkashAgreement()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(
      DiagnosticsProperty('type', 'CheckoutEvent.clearSavedBkashAgreement'),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearSavedBkashAgreementImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return clearSavedBkashAgreement();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return clearSavedBkashAgreement?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (clearSavedBkashAgreement != null) {
      return clearSavedBkashAgreement();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return clearSavedBkashAgreement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return clearSavedBkashAgreement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (clearSavedBkashAgreement != null) {
      return clearSavedBkashAgreement(this);
    }
    return orElse();
  }
}

abstract class _ClearSavedBkashAgreement implements CheckoutEvent {
  const factory _ClearSavedBkashAgreement() = _$ClearSavedBkashAgreementImpl;
}

/// @nodoc
abstract class _$$LoadEmiDetailsImplCopyWith<$Res> {
  factory _$$LoadEmiDetailsImplCopyWith(
    _$LoadEmiDetailsImpl value,
    $Res Function(_$LoadEmiDetailsImpl) then,
  ) = __$$LoadEmiDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String quoteId, String orderId});
}

/// @nodoc
class __$$LoadEmiDetailsImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$LoadEmiDetailsImpl>
    implements _$$LoadEmiDetailsImplCopyWith<$Res> {
  __$$LoadEmiDetailsImplCopyWithImpl(
    _$LoadEmiDetailsImpl _value,
    $Res Function(_$LoadEmiDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? quoteId = null, Object? orderId = null}) {
    return _then(
      _$LoadEmiDetailsImpl(
        quoteId:
            null == quoteId
                ? _value.quoteId
                : quoteId // ignore: cast_nullable_to_non_nullable
                    as String,
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadEmiDetailsImpl
    with DiagnosticableTreeMixin
    implements _LoadEmiDetails {
  const _$LoadEmiDetailsImpl({required this.quoteId, this.orderId = ''});

  @override
  final String quoteId;
  @override
  @JsonKey()
  final String orderId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.loadEmiDetails(quoteId: $quoteId, orderId: $orderId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.loadEmiDetails'))
      ..add(DiagnosticsProperty('quoteId', quoteId))
      ..add(DiagnosticsProperty('orderId', orderId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEmiDetailsImpl &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quoteId, orderId);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadEmiDetailsImplCopyWith<_$LoadEmiDetailsImpl> get copyWith =>
      __$$LoadEmiDetailsImplCopyWithImpl<_$LoadEmiDetailsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return loadEmiDetails(quoteId, orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return loadEmiDetails?.call(quoteId, orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (loadEmiDetails != null) {
      return loadEmiDetails(quoteId, orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return loadEmiDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return loadEmiDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (loadEmiDetails != null) {
      return loadEmiDetails(this);
    }
    return orElse();
  }
}

abstract class _LoadEmiDetails implements CheckoutEvent {
  const factory _LoadEmiDetails({
    required final String quoteId,
    final String orderId,
  }) = _$LoadEmiDetailsImpl;

  String get quoteId;
  String get orderId;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadEmiDetailsImplCopyWith<_$LoadEmiDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoreEmiSelectionImplCopyWith<$Res> {
  factory _$$StoreEmiSelectionImplCopyWith(
    _$StoreEmiSelectionImpl value,
    $Res Function(_$StoreEmiSelectionImpl) then,
  ) = __$$StoreEmiSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String bankName,
    int tenure,
    String paymentGateway,
    String paymentMode,
    String quoteId,
  });
}

/// @nodoc
class __$$StoreEmiSelectionImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$StoreEmiSelectionImpl>
    implements _$$StoreEmiSelectionImplCopyWith<$Res> {
  __$$StoreEmiSelectionImplCopyWithImpl(
    _$StoreEmiSelectionImpl _value,
    $Res Function(_$StoreEmiSelectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankName = null,
    Object? tenure = null,
    Object? paymentGateway = null,
    Object? paymentMode = null,
    Object? quoteId = null,
  }) {
    return _then(
      _$StoreEmiSelectionImpl(
        bankName:
            null == bankName
                ? _value.bankName
                : bankName // ignore: cast_nullable_to_non_nullable
                    as String,
        tenure:
            null == tenure
                ? _value.tenure
                : tenure // ignore: cast_nullable_to_non_nullable
                    as int,
        paymentGateway:
            null == paymentGateway
                ? _value.paymentGateway
                : paymentGateway // ignore: cast_nullable_to_non_nullable
                    as String,
        paymentMode:
            null == paymentMode
                ? _value.paymentMode
                : paymentMode // ignore: cast_nullable_to_non_nullable
                    as String,
        quoteId:
            null == quoteId
                ? _value.quoteId
                : quoteId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$StoreEmiSelectionImpl
    with DiagnosticableTreeMixin
    implements _StoreEmiSelection {
  const _$StoreEmiSelectionImpl({
    required this.bankName,
    required this.tenure,
    required this.paymentGateway,
    required this.paymentMode,
    required this.quoteId,
  });

  @override
  final String bankName;
  @override
  final int tenure;
  @override
  final String paymentGateway;
  @override
  final String paymentMode;
  @override
  final String quoteId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.storeEmiSelection(bankName: $bankName, tenure: $tenure, paymentGateway: $paymentGateway, paymentMode: $paymentMode, quoteId: $quoteId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.storeEmiSelection'))
      ..add(DiagnosticsProperty('bankName', bankName))
      ..add(DiagnosticsProperty('tenure', tenure))
      ..add(DiagnosticsProperty('paymentGateway', paymentGateway))
      ..add(DiagnosticsProperty('paymentMode', paymentMode))
      ..add(DiagnosticsProperty('quoteId', quoteId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreEmiSelectionImpl &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.tenure, tenure) || other.tenure == tenure) &&
            (identical(other.paymentGateway, paymentGateway) ||
                other.paymentGateway == paymentGateway) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    bankName,
    tenure,
    paymentGateway,
    paymentMode,
    quoteId,
  );

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreEmiSelectionImplCopyWith<_$StoreEmiSelectionImpl> get copyWith =>
      __$$StoreEmiSelectionImplCopyWithImpl<_$StoreEmiSelectionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return storeEmiSelection(
      bankName,
      tenure,
      paymentGateway,
      paymentMode,
      quoteId,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return storeEmiSelection?.call(
      bankName,
      tenure,
      paymentGateway,
      paymentMode,
      quoteId,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (storeEmiSelection != null) {
      return storeEmiSelection(
        bankName,
        tenure,
        paymentGateway,
        paymentMode,
        quoteId,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return storeEmiSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return storeEmiSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (storeEmiSelection != null) {
      return storeEmiSelection(this);
    }
    return orElse();
  }
}

abstract class _StoreEmiSelection implements CheckoutEvent {
  const factory _StoreEmiSelection({
    required final String bankName,
    required final int tenure,
    required final String paymentGateway,
    required final String paymentMode,
    required final String quoteId,
  }) = _$StoreEmiSelectionImpl;

  String get bankName;
  int get tenure;
  String get paymentGateway;
  String get paymentMode;
  String get quoteId;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreEmiSelectionImplCopyWith<_$StoreEmiSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmEmiSelectionImplCopyWith<$Res> {
  factory _$$ConfirmEmiSelectionImplCopyWith(
    _$ConfirmEmiSelectionImpl value,
    $Res Function(_$ConfirmEmiSelectionImpl) then,
  ) = __$$ConfirmEmiSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String orderId,
    String quoteId,
    String bankName,
    int tenure,
    String paymentGateway,
    String paymentMode,
  });
}

/// @nodoc
class __$$ConfirmEmiSelectionImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ConfirmEmiSelectionImpl>
    implements _$$ConfirmEmiSelectionImplCopyWith<$Res> {
  __$$ConfirmEmiSelectionImplCopyWithImpl(
    _$ConfirmEmiSelectionImpl _value,
    $Res Function(_$ConfirmEmiSelectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? quoteId = null,
    Object? bankName = null,
    Object? tenure = null,
    Object? paymentGateway = null,
    Object? paymentMode = null,
  }) {
    return _then(
      _$ConfirmEmiSelectionImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        quoteId:
            null == quoteId
                ? _value.quoteId
                : quoteId // ignore: cast_nullable_to_non_nullable
                    as String,
        bankName:
            null == bankName
                ? _value.bankName
                : bankName // ignore: cast_nullable_to_non_nullable
                    as String,
        tenure:
            null == tenure
                ? _value.tenure
                : tenure // ignore: cast_nullable_to_non_nullable
                    as int,
        paymentGateway:
            null == paymentGateway
                ? _value.paymentGateway
                : paymentGateway // ignore: cast_nullable_to_non_nullable
                    as String,
        paymentMode:
            null == paymentMode
                ? _value.paymentMode
                : paymentMode // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ConfirmEmiSelectionImpl
    with DiagnosticableTreeMixin
    implements _ConfirmEmiSelection {
  const _$ConfirmEmiSelectionImpl({
    required this.orderId,
    required this.quoteId,
    required this.bankName,
    required this.tenure,
    required this.paymentGateway,
    required this.paymentMode,
  });

  @override
  final String orderId;
  @override
  final String quoteId;
  @override
  final String bankName;
  @override
  final int tenure;
  @override
  final String paymentGateway;
  @override
  final String paymentMode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.confirmEmiSelection(orderId: $orderId, quoteId: $quoteId, bankName: $bankName, tenure: $tenure, paymentGateway: $paymentGateway, paymentMode: $paymentMode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.confirmEmiSelection'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('quoteId', quoteId))
      ..add(DiagnosticsProperty('bankName', bankName))
      ..add(DiagnosticsProperty('tenure', tenure))
      ..add(DiagnosticsProperty('paymentGateway', paymentGateway))
      ..add(DiagnosticsProperty('paymentMode', paymentMode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmEmiSelectionImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.tenure, tenure) || other.tenure == tenure) &&
            (identical(other.paymentGateway, paymentGateway) ||
                other.paymentGateway == paymentGateway) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    quoteId,
    bankName,
    tenure,
    paymentGateway,
    paymentMode,
  );

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmEmiSelectionImplCopyWith<_$ConfirmEmiSelectionImpl> get copyWith =>
      __$$ConfirmEmiSelectionImplCopyWithImpl<_$ConfirmEmiSelectionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return confirmEmiSelection(
      orderId,
      quoteId,
      bankName,
      tenure,
      paymentGateway,
      paymentMode,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return confirmEmiSelection?.call(
      orderId,
      quoteId,
      bankName,
      tenure,
      paymentGateway,
      paymentMode,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (confirmEmiSelection != null) {
      return confirmEmiSelection(
        orderId,
        quoteId,
        bankName,
        tenure,
        paymentGateway,
        paymentMode,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return confirmEmiSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return confirmEmiSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (confirmEmiSelection != null) {
      return confirmEmiSelection(this);
    }
    return orElse();
  }
}

abstract class _ConfirmEmiSelection implements CheckoutEvent {
  const factory _ConfirmEmiSelection({
    required final String orderId,
    required final String quoteId,
    required final String bankName,
    required final int tenure,
    required final String paymentGateway,
    required final String paymentMode,
  }) = _$ConfirmEmiSelectionImpl;

  String get orderId;
  String get quoteId;
  String get bankName;
  int get tenure;
  String get paymentGateway;
  String get paymentMode;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmEmiSelectionImplCopyWith<_$ConfirmEmiSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadPaymentInfoImplCopyWith<$Res> {
  factory _$$LoadPaymentInfoImplCopyWith(
    _$LoadPaymentInfoImpl value,
    $Res Function(_$LoadPaymentInfoImpl) then,
  ) = __$$LoadPaymentInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cartId});
}

/// @nodoc
class __$$LoadPaymentInfoImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$LoadPaymentInfoImpl>
    implements _$$LoadPaymentInfoImplCopyWith<$Res> {
  __$$LoadPaymentInfoImplCopyWithImpl(
    _$LoadPaymentInfoImpl _value,
    $Res Function(_$LoadPaymentInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartId = null}) {
    return _then(
      _$LoadPaymentInfoImpl(
        cartId:
            null == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadPaymentInfoImpl
    with DiagnosticableTreeMixin
    implements _LoadPaymentInfo {
  const _$LoadPaymentInfoImpl({required this.cartId});

  @override
  final String cartId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.loadPaymentInfo(cartId: $cartId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutEvent.loadPaymentInfo'))
      ..add(DiagnosticsProperty('cartId', cartId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPaymentInfoImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartId);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadPaymentInfoImplCopyWith<_$LoadPaymentInfoImpl> get copyWith =>
      __$$LoadPaymentInfoImplCopyWithImpl<_$LoadPaymentInfoImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return loadPaymentInfo(cartId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return loadPaymentInfo?.call(cartId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (loadPaymentInfo != null) {
      return loadPaymentInfo(cartId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return loadPaymentInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return loadPaymentInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (loadPaymentInfo != null) {
      return loadPaymentInfo(this);
    }
    return orElse();
  }
}

abstract class _LoadPaymentInfo implements CheckoutEvent {
  const factory _LoadPaymentInfo({required final String cartId}) =
      _$LoadPaymentInfoImpl;

  String get cartId;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadPaymentInfoImplCopyWith<_$LoadPaymentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetCheckoutImplCopyWith<$Res> {
  factory _$$ResetCheckoutImplCopyWith(
    _$ResetCheckoutImpl value,
    $Res Function(_$ResetCheckoutImpl) then,
  ) = __$$ResetCheckoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCheckoutImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ResetCheckoutImpl>
    implements _$$ResetCheckoutImplCopyWith<$Res> {
  __$$ResetCheckoutImplCopyWithImpl(
    _$ResetCheckoutImpl _value,
    $Res Function(_$ResetCheckoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetCheckoutImpl
    with DiagnosticableTreeMixin
    implements _ResetCheckout {
  const _$ResetCheckoutImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutEvent.resetCheckout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CheckoutEvent.resetCheckout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetCheckoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCheckout,
    required TResult Function(AddressEntity address) updateShippingAddress,
    required TResult Function(AddressEntity address) updateBillingAddress,
    required TResult Function(AddressEntity address) estimateShipping,
    required TResult Function(String carrierCode, String methodCode)
    selectShippingMethod,
    required TResult Function(String paymentMethod) selectPaymentMethod,
    required TResult Function() placeOrder,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )
    processPayment,
    required TResult Function(String orderId, String transactionId)
    confirmPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    updateOrderPayment,
    required TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )
    syncOrderPaymentMethod,
    required TResult Function(String orderId) confirmOrder,
    required TResult Function(String orderId, bool success, String? message)
    onPaymentWebViewResult,
    required TResult Function(Map<String, String> callbackParams) nagadCallback,
    required TResult Function(String paymentId) bkashAgreementCallback,
    required TResult Function(String paymentId) bkashPaymentCallback,
    required TResult Function(String agreementId) selectSavedBkashAgreement,
    required TResult Function() clearSavedBkashAgreement,
    required TResult Function(String quoteId, String orderId) loadEmiDetails,
    required TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )
    storeEmiSelection,
    required TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )
    confirmEmiSelection,
    required TResult Function(String cartId) loadPaymentInfo,
    required TResult Function() resetCheckout,
  }) {
    return resetCheckout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCheckout,
    TResult? Function(AddressEntity address)? updateShippingAddress,
    TResult? Function(AddressEntity address)? updateBillingAddress,
    TResult? Function(AddressEntity address)? estimateShipping,
    TResult? Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult? Function(String paymentMethod)? selectPaymentMethod,
    TResult? Function()? placeOrder,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult? Function(String orderId, String transactionId)? confirmPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult? Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult? Function(String orderId)? confirmOrder,
    TResult? Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult? Function(Map<String, String> callbackParams)? nagadCallback,
    TResult? Function(String paymentId)? bkashAgreementCallback,
    TResult? Function(String paymentId)? bkashPaymentCallback,
    TResult? Function(String agreementId)? selectSavedBkashAgreement,
    TResult? Function()? clearSavedBkashAgreement,
    TResult? Function(String quoteId, String orderId)? loadEmiDetails,
    TResult? Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult? Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult? Function(String cartId)? loadPaymentInfo,
    TResult? Function()? resetCheckout,
  }) {
    return resetCheckout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCheckout,
    TResult Function(AddressEntity address)? updateShippingAddress,
    TResult Function(AddressEntity address)? updateBillingAddress,
    TResult Function(AddressEntity address)? estimateShipping,
    TResult Function(String carrierCode, String methodCode)?
    selectShippingMethod,
    TResult Function(String paymentMethod)? selectPaymentMethod,
    TResult Function()? placeOrder,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
      Map<String, dynamic>? paymentData,
    )?
    processPayment,
    TResult Function(String orderId, String transactionId)? confirmPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    updateOrderPayment,
    TResult Function(
      String orderId,
      String paymentMethod,
      String? paymentGateway,
    )?
    syncOrderPaymentMethod,
    TResult Function(String orderId)? confirmOrder,
    TResult Function(String orderId, bool success, String? message)?
    onPaymentWebViewResult,
    TResult Function(Map<String, String> callbackParams)? nagadCallback,
    TResult Function(String paymentId)? bkashAgreementCallback,
    TResult Function(String paymentId)? bkashPaymentCallback,
    TResult Function(String agreementId)? selectSavedBkashAgreement,
    TResult Function()? clearSavedBkashAgreement,
    TResult Function(String quoteId, String orderId)? loadEmiDetails,
    TResult Function(
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
      String quoteId,
    )?
    storeEmiSelection,
    TResult Function(
      String orderId,
      String quoteId,
      String bankName,
      int tenure,
      String paymentGateway,
      String paymentMode,
    )?
    confirmEmiSelection,
    TResult Function(String cartId)? loadPaymentInfo,
    TResult Function()? resetCheckout,
    required TResult orElse(),
  }) {
    if (resetCheckout != null) {
      return resetCheckout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCheckout value) loadCheckout,
    required TResult Function(_UpdateShippingAddress value)
    updateShippingAddress,
    required TResult Function(_UpdateBillingAddress value) updateBillingAddress,
    required TResult Function(_EstimateShipping value) estimateShipping,
    required TResult Function(_SelectShippingMethod value) selectShippingMethod,
    required TResult Function(_SelectPaymentMethod value) selectPaymentMethod,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_ConfirmPayment value) confirmPayment,
    required TResult Function(_UpdateOrderPayment value) updateOrderPayment,
    required TResult Function(_SyncOrderPaymentMethod value)
    syncOrderPaymentMethod,
    required TResult Function(_ConfirmOrder value) confirmOrder,
    required TResult Function(_OnPaymentWebViewResult value)
    onPaymentWebViewResult,
    required TResult Function(_NagadCallback value) nagadCallback,
    required TResult Function(_BkashAgreementCallback value)
    bkashAgreementCallback,
    required TResult Function(_BkashPaymentCallback value) bkashPaymentCallback,
    required TResult Function(_SelectSavedBkashAgreement value)
    selectSavedBkashAgreement,
    required TResult Function(_ClearSavedBkashAgreement value)
    clearSavedBkashAgreement,
    required TResult Function(_LoadEmiDetails value) loadEmiDetails,
    required TResult Function(_StoreEmiSelection value) storeEmiSelection,
    required TResult Function(_ConfirmEmiSelection value) confirmEmiSelection,
    required TResult Function(_LoadPaymentInfo value) loadPaymentInfo,
    required TResult Function(_ResetCheckout value) resetCheckout,
  }) {
    return resetCheckout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCheckout value)? loadCheckout,
    TResult? Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult? Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult? Function(_EstimateShipping value)? estimateShipping,
    TResult? Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult? Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_ConfirmPayment value)? confirmPayment,
    TResult? Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult? Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult? Function(_ConfirmOrder value)? confirmOrder,
    TResult? Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult? Function(_NagadCallback value)? nagadCallback,
    TResult? Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult? Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult? Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult? Function(_ClearSavedBkashAgreement value)?
    clearSavedBkashAgreement,
    TResult? Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult? Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult? Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult? Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult? Function(_ResetCheckout value)? resetCheckout,
  }) {
    return resetCheckout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCheckout value)? loadCheckout,
    TResult Function(_UpdateShippingAddress value)? updateShippingAddress,
    TResult Function(_UpdateBillingAddress value)? updateBillingAddress,
    TResult Function(_EstimateShipping value)? estimateShipping,
    TResult Function(_SelectShippingMethod value)? selectShippingMethod,
    TResult Function(_SelectPaymentMethod value)? selectPaymentMethod,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_ConfirmPayment value)? confirmPayment,
    TResult Function(_UpdateOrderPayment value)? updateOrderPayment,
    TResult Function(_SyncOrderPaymentMethod value)? syncOrderPaymentMethod,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    TResult Function(_OnPaymentWebViewResult value)? onPaymentWebViewResult,
    TResult Function(_NagadCallback value)? nagadCallback,
    TResult Function(_BkashAgreementCallback value)? bkashAgreementCallback,
    TResult Function(_BkashPaymentCallback value)? bkashPaymentCallback,
    TResult Function(_SelectSavedBkashAgreement value)?
    selectSavedBkashAgreement,
    TResult Function(_ClearSavedBkashAgreement value)? clearSavedBkashAgreement,
    TResult Function(_LoadEmiDetails value)? loadEmiDetails,
    TResult Function(_StoreEmiSelection value)? storeEmiSelection,
    TResult Function(_ConfirmEmiSelection value)? confirmEmiSelection,
    TResult Function(_LoadPaymentInfo value)? loadPaymentInfo,
    TResult Function(_ResetCheckout value)? resetCheckout,
    required TResult orElse(),
  }) {
    if (resetCheckout != null) {
      return resetCheckout(this);
    }
    return orElse();
  }
}

abstract class _ResetCheckout implements CheckoutEvent {
  const factory _ResetCheckout() = _$ResetCheckoutImpl;
}

/// @nodoc
mixin _$CheckoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
    CheckoutState value,
    $Res Function(CheckoutState) then,
  ) = _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CheckoutState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CheckoutState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckoutEntity? lastCheckout});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lastCheckout = freezed}) {
    return _then(
      _$LoadingImpl(
        lastCheckout:
            freezed == lastCheckout
                ? _value.lastCheckout
                : lastCheckout // ignore: cast_nullable_to_non_nullable
                    as CheckoutEntity?,
      ),
    );
  }
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl({this.lastCheckout});

  @override
  final CheckoutEntity? lastCheckout;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.loading(lastCheckout: $lastCheckout)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.loading'))
      ..add(DiagnosticsProperty('lastCheckout', lastCheckout));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.lastCheckout, lastCheckout) ||
                other.lastCheckout == lastCheckout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastCheckout);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return loading(lastCheckout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return loading?.call(lastCheckout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(lastCheckout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CheckoutState {
  const factory _Loading({final CheckoutEntity? lastCheckout}) = _$LoadingImpl;

  CheckoutEntity? get lastCheckout;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutLoadedImplCopyWith<$Res> {
  factory _$$CheckoutLoadedImplCopyWith(
    _$CheckoutLoadedImpl value,
    $Res Function(_$CheckoutLoadedImpl) then,
  ) = __$$CheckoutLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    CheckoutEntity checkout,
    AddressEntity? selectedShippingAddress,
    AddressEntity? selectedBillingAddress,
    String? selectedPaymentMethod,
    String? selectedShippingMethodCode,
    List<ShippingMethodEntity> availableShippingMethods,
    List<PaymentMethodEntity> availablePaymentMethods,
  });
}

/// @nodoc
class __$$CheckoutLoadedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutLoadedImpl>
    implements _$$CheckoutLoadedImplCopyWith<$Res> {
  __$$CheckoutLoadedImplCopyWithImpl(
    _$CheckoutLoadedImpl _value,
    $Res Function(_$CheckoutLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkout = null,
    Object? selectedShippingAddress = freezed,
    Object? selectedBillingAddress = freezed,
    Object? selectedPaymentMethod = freezed,
    Object? selectedShippingMethodCode = freezed,
    Object? availableShippingMethods = null,
    Object? availablePaymentMethods = null,
  }) {
    return _then(
      _$CheckoutLoadedImpl(
        checkout:
            null == checkout
                ? _value.checkout
                : checkout // ignore: cast_nullable_to_non_nullable
                    as CheckoutEntity,
        selectedShippingAddress:
            freezed == selectedShippingAddress
                ? _value.selectedShippingAddress
                : selectedShippingAddress // ignore: cast_nullable_to_non_nullable
                    as AddressEntity?,
        selectedBillingAddress:
            freezed == selectedBillingAddress
                ? _value.selectedBillingAddress
                : selectedBillingAddress // ignore: cast_nullable_to_non_nullable
                    as AddressEntity?,
        selectedPaymentMethod:
            freezed == selectedPaymentMethod
                ? _value.selectedPaymentMethod
                : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
                    as String?,
        selectedShippingMethodCode:
            freezed == selectedShippingMethodCode
                ? _value.selectedShippingMethodCode
                : selectedShippingMethodCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        availableShippingMethods:
            null == availableShippingMethods
                ? _value._availableShippingMethods
                : availableShippingMethods // ignore: cast_nullable_to_non_nullable
                    as List<ShippingMethodEntity>,
        availablePaymentMethods:
            null == availablePaymentMethods
                ? _value._availablePaymentMethods
                : availablePaymentMethods // ignore: cast_nullable_to_non_nullable
                    as List<PaymentMethodEntity>,
      ),
    );
  }
}

/// @nodoc

class _$CheckoutLoadedImpl
    with DiagnosticableTreeMixin
    implements _CheckoutLoaded {
  const _$CheckoutLoadedImpl({
    required this.checkout,
    this.selectedShippingAddress,
    this.selectedBillingAddress,
    this.selectedPaymentMethod,
    this.selectedShippingMethodCode,
    final List<ShippingMethodEntity> availableShippingMethods = const [],
    final List<PaymentMethodEntity> availablePaymentMethods = const [],
  }) : _availableShippingMethods = availableShippingMethods,
       _availablePaymentMethods = availablePaymentMethods;

  @override
  final CheckoutEntity checkout;
  @override
  final AddressEntity? selectedShippingAddress;
  @override
  final AddressEntity? selectedBillingAddress;
  @override
  final String? selectedPaymentMethod;
  @override
  final String? selectedShippingMethodCode;
  final List<ShippingMethodEntity> _availableShippingMethods;
  @override
  @JsonKey()
  List<ShippingMethodEntity> get availableShippingMethods {
    if (_availableShippingMethods is EqualUnmodifiableListView)
      return _availableShippingMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableShippingMethods);
  }

  final List<PaymentMethodEntity> _availablePaymentMethods;
  @override
  @JsonKey()
  List<PaymentMethodEntity> get availablePaymentMethods {
    if (_availablePaymentMethods is EqualUnmodifiableListView)
      return _availablePaymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availablePaymentMethods);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.checkoutLoaded(checkout: $checkout, selectedShippingAddress: $selectedShippingAddress, selectedBillingAddress: $selectedBillingAddress, selectedPaymentMethod: $selectedPaymentMethod, selectedShippingMethodCode: $selectedShippingMethodCode, availableShippingMethods: $availableShippingMethods, availablePaymentMethods: $availablePaymentMethods)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.checkoutLoaded'))
      ..add(DiagnosticsProperty('checkout', checkout))
      ..add(
        DiagnosticsProperty('selectedShippingAddress', selectedShippingAddress),
      )
      ..add(
        DiagnosticsProperty('selectedBillingAddress', selectedBillingAddress),
      )
      ..add(DiagnosticsProperty('selectedPaymentMethod', selectedPaymentMethod))
      ..add(
        DiagnosticsProperty(
          'selectedShippingMethodCode',
          selectedShippingMethodCode,
        ),
      )
      ..add(
        DiagnosticsProperty(
          'availableShippingMethods',
          availableShippingMethods,
        ),
      )
      ..add(
        DiagnosticsProperty('availablePaymentMethods', availablePaymentMethods),
      );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutLoadedImpl &&
            (identical(other.checkout, checkout) ||
                other.checkout == checkout) &&
            (identical(
                  other.selectedShippingAddress,
                  selectedShippingAddress,
                ) ||
                other.selectedShippingAddress == selectedShippingAddress) &&
            (identical(other.selectedBillingAddress, selectedBillingAddress) ||
                other.selectedBillingAddress == selectedBillingAddress) &&
            (identical(other.selectedPaymentMethod, selectedPaymentMethod) ||
                other.selectedPaymentMethod == selectedPaymentMethod) &&
            (identical(
                  other.selectedShippingMethodCode,
                  selectedShippingMethodCode,
                ) ||
                other.selectedShippingMethodCode ==
                    selectedShippingMethodCode) &&
            const DeepCollectionEquality().equals(
              other._availableShippingMethods,
              _availableShippingMethods,
            ) &&
            const DeepCollectionEquality().equals(
              other._availablePaymentMethods,
              _availablePaymentMethods,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    checkout,
    selectedShippingAddress,
    selectedBillingAddress,
    selectedPaymentMethod,
    selectedShippingMethodCode,
    const DeepCollectionEquality().hash(_availableShippingMethods),
    const DeepCollectionEquality().hash(_availablePaymentMethods),
  );

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutLoadedImplCopyWith<_$CheckoutLoadedImpl> get copyWith =>
      __$$CheckoutLoadedImplCopyWithImpl<_$CheckoutLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return checkoutLoaded(
      checkout,
      selectedShippingAddress,
      selectedBillingAddress,
      selectedPaymentMethod,
      selectedShippingMethodCode,
      availableShippingMethods,
      availablePaymentMethods,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return checkoutLoaded?.call(
      checkout,
      selectedShippingAddress,
      selectedBillingAddress,
      selectedPaymentMethod,
      selectedShippingMethodCode,
      availableShippingMethods,
      availablePaymentMethods,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (checkoutLoaded != null) {
      return checkoutLoaded(
        checkout,
        selectedShippingAddress,
        selectedBillingAddress,
        selectedPaymentMethod,
        selectedShippingMethodCode,
        availableShippingMethods,
        availablePaymentMethods,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return checkoutLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return checkoutLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (checkoutLoaded != null) {
      return checkoutLoaded(this);
    }
    return orElse();
  }
}

abstract class _CheckoutLoaded implements CheckoutState {
  const factory _CheckoutLoaded({
    required final CheckoutEntity checkout,
    final AddressEntity? selectedShippingAddress,
    final AddressEntity? selectedBillingAddress,
    final String? selectedPaymentMethod,
    final String? selectedShippingMethodCode,
    final List<ShippingMethodEntity> availableShippingMethods,
    final List<PaymentMethodEntity> availablePaymentMethods,
  }) = _$CheckoutLoadedImpl;

  CheckoutEntity get checkout;
  AddressEntity? get selectedShippingAddress;
  AddressEntity? get selectedBillingAddress;
  String? get selectedPaymentMethod;
  String? get selectedShippingMethodCode;
  List<ShippingMethodEntity> get availableShippingMethods;
  List<PaymentMethodEntity> get availablePaymentMethods;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutLoadedImplCopyWith<_$CheckoutLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlacingOrderImplCopyWith<$Res> {
  factory _$$PlacingOrderImplCopyWith(
    _$PlacingOrderImpl value,
    $Res Function(_$PlacingOrderImpl) then,
  ) = __$$PlacingOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckoutEntity checkout});
}

/// @nodoc
class __$$PlacingOrderImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$PlacingOrderImpl>
    implements _$$PlacingOrderImplCopyWith<$Res> {
  __$$PlacingOrderImplCopyWithImpl(
    _$PlacingOrderImpl _value,
    $Res Function(_$PlacingOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? checkout = null}) {
    return _then(
      _$PlacingOrderImpl(
        checkout:
            null == checkout
                ? _value.checkout
                : checkout // ignore: cast_nullable_to_non_nullable
                    as CheckoutEntity,
      ),
    );
  }
}

/// @nodoc

class _$PlacingOrderImpl with DiagnosticableTreeMixin implements _PlacingOrder {
  const _$PlacingOrderImpl({required this.checkout});

  @override
  final CheckoutEntity checkout;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.placingOrder(checkout: $checkout)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.placingOrder'))
      ..add(DiagnosticsProperty('checkout', checkout));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacingOrderImpl &&
            (identical(other.checkout, checkout) ||
                other.checkout == checkout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checkout);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacingOrderImplCopyWith<_$PlacingOrderImpl> get copyWith =>
      __$$PlacingOrderImplCopyWithImpl<_$PlacingOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return placingOrder(checkout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return placingOrder?.call(checkout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (placingOrder != null) {
      return placingOrder(checkout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return placingOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return placingOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (placingOrder != null) {
      return placingOrder(this);
    }
    return orElse();
  }
}

abstract class _PlacingOrder implements CheckoutState {
  const factory _PlacingOrder({required final CheckoutEntity checkout}) =
      _$PlacingOrderImpl;

  CheckoutEntity get checkout;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlacingOrderImplCopyWith<_$PlacingOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderPlacedImplCopyWith<$Res> {
  factory _$$OrderPlacedImplCopyWith(
    _$OrderPlacedImpl value,
    $Res Function(_$OrderPlacedImpl) then,
  ) = __$$OrderPlacedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String orderId,
    double totalAmount,
    String paymentMethod,
    CheckoutEntity checkout,
    List<PaymentMethodEntity> availablePaymentMethods,
  });
}

/// @nodoc
class __$$OrderPlacedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$OrderPlacedImpl>
    implements _$$OrderPlacedImplCopyWith<$Res> {
  __$$OrderPlacedImplCopyWithImpl(
    _$OrderPlacedImpl _value,
    $Res Function(_$OrderPlacedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? totalAmount = null,
    Object? paymentMethod = null,
    Object? checkout = null,
    Object? availablePaymentMethods = null,
  }) {
    return _then(
      _$OrderPlacedImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        totalAmount:
            null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                    as double,
        paymentMethod:
            null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as String,
        checkout:
            null == checkout
                ? _value.checkout
                : checkout // ignore: cast_nullable_to_non_nullable
                    as CheckoutEntity,
        availablePaymentMethods:
            null == availablePaymentMethods
                ? _value._availablePaymentMethods
                : availablePaymentMethods // ignore: cast_nullable_to_non_nullable
                    as List<PaymentMethodEntity>,
      ),
    );
  }
}

/// @nodoc

class _$OrderPlacedImpl with DiagnosticableTreeMixin implements _OrderPlaced {
  const _$OrderPlacedImpl({
    required this.orderId,
    required this.totalAmount,
    required this.paymentMethod,
    required this.checkout,
    final List<PaymentMethodEntity> availablePaymentMethods = const [],
  }) : _availablePaymentMethods = availablePaymentMethods;

  @override
  final String orderId;
  @override
  final double totalAmount;
  @override
  final String paymentMethod;
  @override
  final CheckoutEntity checkout;
  final List<PaymentMethodEntity> _availablePaymentMethods;
  @override
  @JsonKey()
  List<PaymentMethodEntity> get availablePaymentMethods {
    if (_availablePaymentMethods is EqualUnmodifiableListView)
      return _availablePaymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availablePaymentMethods);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.orderPlaced(orderId: $orderId, totalAmount: $totalAmount, paymentMethod: $paymentMethod, checkout: $checkout, availablePaymentMethods: $availablePaymentMethods)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.orderPlaced'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('totalAmount', totalAmount))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod))
      ..add(DiagnosticsProperty('checkout', checkout))
      ..add(
        DiagnosticsProperty('availablePaymentMethods', availablePaymentMethods),
      );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPlacedImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.checkout, checkout) ||
                other.checkout == checkout) &&
            const DeepCollectionEquality().equals(
              other._availablePaymentMethods,
              _availablePaymentMethods,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    totalAmount,
    paymentMethod,
    checkout,
    const DeepCollectionEquality().hash(_availablePaymentMethods),
  );

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPlacedImplCopyWith<_$OrderPlacedImpl> get copyWith =>
      __$$OrderPlacedImplCopyWithImpl<_$OrderPlacedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return orderPlaced(
      orderId,
      totalAmount,
      paymentMethod,
      checkout,
      availablePaymentMethods,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return orderPlaced?.call(
      orderId,
      totalAmount,
      paymentMethod,
      checkout,
      availablePaymentMethods,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (orderPlaced != null) {
      return orderPlaced(
        orderId,
        totalAmount,
        paymentMethod,
        checkout,
        availablePaymentMethods,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return orderPlaced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return orderPlaced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (orderPlaced != null) {
      return orderPlaced(this);
    }
    return orElse();
  }
}

abstract class _OrderPlaced implements CheckoutState {
  const factory _OrderPlaced({
    required final String orderId,
    required final double totalAmount,
    required final String paymentMethod,
    required final CheckoutEntity checkout,
    final List<PaymentMethodEntity> availablePaymentMethods,
  }) = _$OrderPlacedImpl;

  String get orderId;
  double get totalAmount;
  String get paymentMethod;
  CheckoutEntity get checkout;
  List<PaymentMethodEntity> get availablePaymentMethods;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderPlacedImplCopyWith<_$OrderPlacedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentProcessingImplCopyWith<$Res> {
  factory _$$PaymentProcessingImplCopyWith(
    _$PaymentProcessingImpl value,
    $Res Function(_$PaymentProcessingImpl) then,
  ) = __$$PaymentProcessingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, String paymentMethod});
}

/// @nodoc
class __$$PaymentProcessingImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$PaymentProcessingImpl>
    implements _$$PaymentProcessingImplCopyWith<$Res> {
  __$$PaymentProcessingImplCopyWithImpl(
    _$PaymentProcessingImpl _value,
    $Res Function(_$PaymentProcessingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? paymentMethod = null}) {
    return _then(
      _$PaymentProcessingImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        paymentMethod:
            null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$PaymentProcessingImpl
    with DiagnosticableTreeMixin
    implements _PaymentProcessing {
  const _$PaymentProcessingImpl({
    required this.orderId,
    required this.paymentMethod,
  });

  @override
  final String orderId;
  @override
  final String paymentMethod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.paymentProcessing(orderId: $orderId, paymentMethod: $paymentMethod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.paymentProcessing'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentProcessingImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, paymentMethod);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentProcessingImplCopyWith<_$PaymentProcessingImpl> get copyWith =>
      __$$PaymentProcessingImplCopyWithImpl<_$PaymentProcessingImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return paymentProcessing(orderId, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return paymentProcessing?.call(orderId, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (paymentProcessing != null) {
      return paymentProcessing(orderId, paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return paymentProcessing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return paymentProcessing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (paymentProcessing != null) {
      return paymentProcessing(this);
    }
    return orElse();
  }
}

abstract class _PaymentProcessing implements CheckoutState {
  const factory _PaymentProcessing({
    required final String orderId,
    required final String paymentMethod,
  }) = _$PaymentProcessingImpl;

  String get orderId;
  String get paymentMethod;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentProcessingImplCopyWith<_$PaymentProcessingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentSuccessImplCopyWith<$Res> {
  factory _$$PaymentSuccessImplCopyWith(
    _$PaymentSuccessImpl value,
    $Res Function(_$PaymentSuccessImpl) then,
  ) = __$$PaymentSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, String transactionId, double totalAmount});
}

/// @nodoc
class __$$PaymentSuccessImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$PaymentSuccessImpl>
    implements _$$PaymentSuccessImplCopyWith<$Res> {
  __$$PaymentSuccessImplCopyWithImpl(
    _$PaymentSuccessImpl _value,
    $Res Function(_$PaymentSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? transactionId = null,
    Object? totalAmount = null,
  }) {
    return _then(
      _$PaymentSuccessImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        transactionId:
            null == transactionId
                ? _value.transactionId
                : transactionId // ignore: cast_nullable_to_non_nullable
                    as String,
        totalAmount:
            null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc

class _$PaymentSuccessImpl
    with DiagnosticableTreeMixin
    implements _PaymentSuccess {
  const _$PaymentSuccessImpl({
    required this.orderId,
    required this.transactionId,
    required this.totalAmount,
  });

  @override
  final String orderId;
  @override
  final String transactionId;
  @override
  final double totalAmount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.paymentSuccess(orderId: $orderId, transactionId: $transactionId, totalAmount: $totalAmount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.paymentSuccess'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('transactionId', transactionId))
      ..add(DiagnosticsProperty('totalAmount', totalAmount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSuccessImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, orderId, transactionId, totalAmount);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSuccessImplCopyWith<_$PaymentSuccessImpl> get copyWith =>
      __$$PaymentSuccessImplCopyWithImpl<_$PaymentSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return paymentSuccess(orderId, transactionId, totalAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return paymentSuccess?.call(orderId, transactionId, totalAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (paymentSuccess != null) {
      return paymentSuccess(orderId, transactionId, totalAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return paymentSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return paymentSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (paymentSuccess != null) {
      return paymentSuccess(this);
    }
    return orElse();
  }
}

abstract class _PaymentSuccess implements CheckoutState {
  const factory _PaymentSuccess({
    required final String orderId,
    required final String transactionId,
    required final double totalAmount,
  }) = _$PaymentSuccessImpl;

  String get orderId;
  String get transactionId;
  double get totalAmount;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentSuccessImplCopyWith<_$PaymentSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentFailedImplCopyWith<$Res> {
  factory _$$PaymentFailedImplCopyWith(
    _$PaymentFailedImpl value,
    $Res Function(_$PaymentFailedImpl) then,
  ) = __$$PaymentFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, String errorMessage});
}

/// @nodoc
class __$$PaymentFailedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$PaymentFailedImpl>
    implements _$$PaymentFailedImplCopyWith<$Res> {
  __$$PaymentFailedImplCopyWithImpl(
    _$PaymentFailedImpl _value,
    $Res Function(_$PaymentFailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? errorMessage = null}) {
    return _then(
      _$PaymentFailedImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        errorMessage:
            null == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$PaymentFailedImpl
    with DiagnosticableTreeMixin
    implements _PaymentFailed {
  const _$PaymentFailedImpl({
    required this.orderId,
    required this.errorMessage,
  });

  @override
  final String orderId;
  @override
  final String errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.paymentFailed(orderId: $orderId, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.paymentFailed'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentFailedImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, errorMessage);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentFailedImplCopyWith<_$PaymentFailedImpl> get copyWith =>
      __$$PaymentFailedImplCopyWithImpl<_$PaymentFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return paymentFailed(orderId, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return paymentFailed?.call(orderId, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (paymentFailed != null) {
      return paymentFailed(orderId, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return paymentFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return paymentFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (paymentFailed != null) {
      return paymentFailed(this);
    }
    return orElse();
  }
}

abstract class _PaymentFailed implements CheckoutState {
  const factory _PaymentFailed({
    required final String orderId,
    required final String errorMessage,
  }) = _$PaymentFailedImpl;

  String get orderId;
  String get errorMessage;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentFailedImplCopyWith<_$PaymentFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentMethodUpdatedImplCopyWith<$Res> {
  factory _$$PaymentMethodUpdatedImplCopyWith(
    _$PaymentMethodUpdatedImpl value,
    $Res Function(_$PaymentMethodUpdatedImpl) then,
  ) = __$$PaymentMethodUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool success, CheckoutEntity? checkout});
}

/// @nodoc
class __$$PaymentMethodUpdatedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$PaymentMethodUpdatedImpl>
    implements _$$PaymentMethodUpdatedImplCopyWith<$Res> {
  __$$PaymentMethodUpdatedImplCopyWithImpl(
    _$PaymentMethodUpdatedImpl _value,
    $Res Function(_$PaymentMethodUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? success = null, Object? checkout = freezed}) {
    return _then(
      _$PaymentMethodUpdatedImpl(
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        checkout:
            freezed == checkout
                ? _value.checkout
                : checkout // ignore: cast_nullable_to_non_nullable
                    as CheckoutEntity?,
      ),
    );
  }
}

/// @nodoc

class _$PaymentMethodUpdatedImpl
    with DiagnosticableTreeMixin
    implements _PaymentMethodUpdated {
  const _$PaymentMethodUpdatedImpl({required this.success, this.checkout});

  @override
  final bool success;
  @override
  final CheckoutEntity? checkout;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.paymentMethodUpdated(success: $success, checkout: $checkout)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.paymentMethodUpdated'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('checkout', checkout));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodUpdatedImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.checkout, checkout) ||
                other.checkout == checkout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, checkout);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodUpdatedImplCopyWith<_$PaymentMethodUpdatedImpl>
  get copyWith =>
      __$$PaymentMethodUpdatedImplCopyWithImpl<_$PaymentMethodUpdatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return paymentMethodUpdated(success, checkout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return paymentMethodUpdated?.call(success, checkout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (paymentMethodUpdated != null) {
      return paymentMethodUpdated(success, checkout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return paymentMethodUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return paymentMethodUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (paymentMethodUpdated != null) {
      return paymentMethodUpdated(this);
    }
    return orElse();
  }
}

abstract class _PaymentMethodUpdated implements CheckoutState {
  const factory _PaymentMethodUpdated({
    required final bool success,
    final CheckoutEntity? checkout,
  }) = _$PaymentMethodUpdatedImpl;

  bool get success;
  CheckoutEntity? get checkout;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodUpdatedImplCopyWith<_$PaymentMethodUpdatedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderPaymentMethodSyncedImplCopyWith<$Res> {
  factory _$$OrderPaymentMethodSyncedImplCopyWith(
    _$OrderPaymentMethodSyncedImpl value,
    $Res Function(_$OrderPaymentMethodSyncedImpl) then,
  ) = __$$OrderPaymentMethodSyncedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool success, String paymentMethod});
}

/// @nodoc
class __$$OrderPaymentMethodSyncedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$OrderPaymentMethodSyncedImpl>
    implements _$$OrderPaymentMethodSyncedImplCopyWith<$Res> {
  __$$OrderPaymentMethodSyncedImplCopyWithImpl(
    _$OrderPaymentMethodSyncedImpl _value,
    $Res Function(_$OrderPaymentMethodSyncedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? success = null, Object? paymentMethod = null}) {
    return _then(
      _$OrderPaymentMethodSyncedImpl(
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        paymentMethod:
            null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$OrderPaymentMethodSyncedImpl
    with DiagnosticableTreeMixin
    implements _OrderPaymentMethodSynced {
  const _$OrderPaymentMethodSyncedImpl({
    required this.success,
    required this.paymentMethod,
  });

  @override
  final bool success;
  @override
  final String paymentMethod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.orderPaymentMethodSynced(success: $success, paymentMethod: $paymentMethod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty('type', 'CheckoutState.orderPaymentMethodSynced'),
      )
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPaymentMethodSyncedImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, paymentMethod);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPaymentMethodSyncedImplCopyWith<_$OrderPaymentMethodSyncedImpl>
  get copyWith => __$$OrderPaymentMethodSyncedImplCopyWithImpl<
    _$OrderPaymentMethodSyncedImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return orderPaymentMethodSynced(success, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return orderPaymentMethodSynced?.call(success, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (orderPaymentMethodSynced != null) {
      return orderPaymentMethodSynced(success, paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return orderPaymentMethodSynced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return orderPaymentMethodSynced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (orderPaymentMethodSynced != null) {
      return orderPaymentMethodSynced(this);
    }
    return orElse();
  }
}

abstract class _OrderPaymentMethodSynced implements CheckoutState {
  const factory _OrderPaymentMethodSynced({
    required final bool success,
    required final String paymentMethod,
  }) = _$OrderPaymentMethodSyncedImpl;

  bool get success;
  String get paymentMethod;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderPaymentMethodSyncedImplCopyWith<_$OrderPaymentMethodSyncedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderConfirmedImplCopyWith<$Res> {
  factory _$$OrderConfirmedImplCopyWith(
    _$OrderConfirmedImpl value,
    $Res Function(_$OrderConfirmedImpl) then,
  ) = __$$OrderConfirmedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool success, CheckoutEntity? checkout});
}

/// @nodoc
class __$$OrderConfirmedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$OrderConfirmedImpl>
    implements _$$OrderConfirmedImplCopyWith<$Res> {
  __$$OrderConfirmedImplCopyWithImpl(
    _$OrderConfirmedImpl _value,
    $Res Function(_$OrderConfirmedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? success = null, Object? checkout = freezed}) {
    return _then(
      _$OrderConfirmedImpl(
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        checkout:
            freezed == checkout
                ? _value.checkout
                : checkout // ignore: cast_nullable_to_non_nullable
                    as CheckoutEntity?,
      ),
    );
  }
}

/// @nodoc

class _$OrderConfirmedImpl
    with DiagnosticableTreeMixin
    implements _OrderConfirmed {
  const _$OrderConfirmedImpl({required this.success, this.checkout});

  @override
  final bool success;
  @override
  final CheckoutEntity? checkout;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.orderConfirmed(success: $success, checkout: $checkout)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.orderConfirmed'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('checkout', checkout));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderConfirmedImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.checkout, checkout) ||
                other.checkout == checkout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, checkout);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderConfirmedImplCopyWith<_$OrderConfirmedImpl> get copyWith =>
      __$$OrderConfirmedImplCopyWithImpl<_$OrderConfirmedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return orderConfirmed(success, checkout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return orderConfirmed?.call(success, checkout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (orderConfirmed != null) {
      return orderConfirmed(success, checkout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return orderConfirmed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return orderConfirmed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (orderConfirmed != null) {
      return orderConfirmed(this);
    }
    return orElse();
  }
}

abstract class _OrderConfirmed implements CheckoutState {
  const factory _OrderConfirmed({
    required final bool success,
    final CheckoutEntity? checkout,
  }) = _$OrderConfirmedImpl;

  bool get success;
  CheckoutEntity? get checkout;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderConfirmedImplCopyWith<_$OrderConfirmedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NavigateToPaymentGatewayImplCopyWith<$Res> {
  factory _$$NavigateToPaymentGatewayImplCopyWith(
    _$NavigateToPaymentGatewayImpl value,
    $Res Function(_$NavigateToPaymentGatewayImpl) then,
  ) = __$$NavigateToPaymentGatewayImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url, String title, Map<String, String>? formFields});
}

/// @nodoc
class __$$NavigateToPaymentGatewayImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$NavigateToPaymentGatewayImpl>
    implements _$$NavigateToPaymentGatewayImplCopyWith<$Res> {
  __$$NavigateToPaymentGatewayImplCopyWithImpl(
    _$NavigateToPaymentGatewayImpl _value,
    $Res Function(_$NavigateToPaymentGatewayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? title = null,
    Object? formFields = freezed,
  }) {
    return _then(
      _$NavigateToPaymentGatewayImpl(
        url:
            null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        formFields:
            freezed == formFields
                ? _value._formFields
                : formFields // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>?,
      ),
    );
  }
}

/// @nodoc

class _$NavigateToPaymentGatewayImpl
    with DiagnosticableTreeMixin
    implements _NavigateToPaymentGateway {
  const _$NavigateToPaymentGatewayImpl({
    required this.url,
    required this.title,
    final Map<String, String>? formFields,
  }) : _formFields = formFields;

  @override
  final String url;
  @override
  final String title;
  final Map<String, String>? _formFields;
  @override
  Map<String, String>? get formFields {
    final value = _formFields;
    if (value == null) return null;
    if (_formFields is EqualUnmodifiableMapView) return _formFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.navigateToPaymentGateway(url: $url, title: $title, formFields: $formFields)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty('type', 'CheckoutState.navigateToPaymentGateway'),
      )
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('formFields', formFields));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigateToPaymentGatewayImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(
              other._formFields,
              _formFields,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    url,
    title,
    const DeepCollectionEquality().hash(_formFields),
  );

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigateToPaymentGatewayImplCopyWith<_$NavigateToPaymentGatewayImpl>
  get copyWith => __$$NavigateToPaymentGatewayImplCopyWithImpl<
    _$NavigateToPaymentGatewayImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return navigateToPaymentGateway(url, title, formFields);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return navigateToPaymentGateway?.call(url, title, formFields);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (navigateToPaymentGateway != null) {
      return navigateToPaymentGateway(url, title, formFields);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return navigateToPaymentGateway(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return navigateToPaymentGateway?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (navigateToPaymentGateway != null) {
      return navigateToPaymentGateway(this);
    }
    return orElse();
  }
}

abstract class _NavigateToPaymentGateway implements CheckoutState {
  const factory _NavigateToPaymentGateway({
    required final String url,
    required final String title,
    final Map<String, String>? formFields,
  }) = _$NavigateToPaymentGatewayImpl;

  String get url;
  String get title;
  Map<String, String>? get formFields;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NavigateToPaymentGatewayImplCopyWith<_$NavigateToPaymentGatewayImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmiDetailsLoadedImplCopyWith<$Res> {
  factory _$$EmiDetailsLoadedImplCopyWith(
    _$EmiDetailsLoadedImpl value,
    $Res Function(_$EmiDetailsLoadedImpl) then,
  ) = __$$EmiDetailsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckoutEmiEntity emiData});
}

/// @nodoc
class __$$EmiDetailsLoadedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$EmiDetailsLoadedImpl>
    implements _$$EmiDetailsLoadedImplCopyWith<$Res> {
  __$$EmiDetailsLoadedImplCopyWithImpl(
    _$EmiDetailsLoadedImpl _value,
    $Res Function(_$EmiDetailsLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? emiData = null}) {
    return _then(
      _$EmiDetailsLoadedImpl(
        emiData:
            null == emiData
                ? _value.emiData
                : emiData // ignore: cast_nullable_to_non_nullable
                    as CheckoutEmiEntity,
      ),
    );
  }
}

/// @nodoc

class _$EmiDetailsLoadedImpl
    with DiagnosticableTreeMixin
    implements _EmiDetailsLoaded {
  const _$EmiDetailsLoadedImpl({required this.emiData});

  @override
  final CheckoutEmiEntity emiData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.emiDetailsLoaded(emiData: $emiData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.emiDetailsLoaded'))
      ..add(DiagnosticsProperty('emiData', emiData));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmiDetailsLoadedImpl &&
            (identical(other.emiData, emiData) || other.emiData == emiData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emiData);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmiDetailsLoadedImplCopyWith<_$EmiDetailsLoadedImpl> get copyWith =>
      __$$EmiDetailsLoadedImplCopyWithImpl<_$EmiDetailsLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return emiDetailsLoaded(emiData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return emiDetailsLoaded?.call(emiData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (emiDetailsLoaded != null) {
      return emiDetailsLoaded(emiData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return emiDetailsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return emiDetailsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (emiDetailsLoaded != null) {
      return emiDetailsLoaded(this);
    }
    return orElse();
  }
}

abstract class _EmiDetailsLoaded implements CheckoutState {
  const factory _EmiDetailsLoaded({required final CheckoutEmiEntity emiData}) =
      _$EmiDetailsLoadedImpl;

  CheckoutEmiEntity get emiData;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmiDetailsLoadedImplCopyWith<_$EmiDetailsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentMethodsLoadedImplCopyWith<$Res> {
  factory _$$PaymentMethodsLoadedImplCopyWith(
    _$PaymentMethodsLoadedImpl value,
    $Res Function(_$PaymentMethodsLoadedImpl) then,
  ) = __$$PaymentMethodsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PaymentMethodEntity> availablePaymentMethods});
}

/// @nodoc
class __$$PaymentMethodsLoadedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$PaymentMethodsLoadedImpl>
    implements _$$PaymentMethodsLoadedImplCopyWith<$Res> {
  __$$PaymentMethodsLoadedImplCopyWithImpl(
    _$PaymentMethodsLoadedImpl _value,
    $Res Function(_$PaymentMethodsLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? availablePaymentMethods = null}) {
    return _then(
      _$PaymentMethodsLoadedImpl(
        availablePaymentMethods:
            null == availablePaymentMethods
                ? _value._availablePaymentMethods
                : availablePaymentMethods // ignore: cast_nullable_to_non_nullable
                    as List<PaymentMethodEntity>,
      ),
    );
  }
}

/// @nodoc

class _$PaymentMethodsLoadedImpl
    with DiagnosticableTreeMixin
    implements _PaymentMethodsLoaded {
  const _$PaymentMethodsLoadedImpl({
    final List<PaymentMethodEntity> availablePaymentMethods = const [],
  }) : _availablePaymentMethods = availablePaymentMethods;

  final List<PaymentMethodEntity> _availablePaymentMethods;
  @override
  @JsonKey()
  List<PaymentMethodEntity> get availablePaymentMethods {
    if (_availablePaymentMethods is EqualUnmodifiableListView)
      return _availablePaymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availablePaymentMethods);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.paymentMethodsLoaded(availablePaymentMethods: $availablePaymentMethods)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.paymentMethodsLoaded'))
      ..add(
        DiagnosticsProperty('availablePaymentMethods', availablePaymentMethods),
      );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodsLoadedImpl &&
            const DeepCollectionEquality().equals(
              other._availablePaymentMethods,
              _availablePaymentMethods,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_availablePaymentMethods),
  );

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodsLoadedImplCopyWith<_$PaymentMethodsLoadedImpl>
  get copyWith =>
      __$$PaymentMethodsLoadedImplCopyWithImpl<_$PaymentMethodsLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return paymentMethodsLoaded(availablePaymentMethods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return paymentMethodsLoaded?.call(availablePaymentMethods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (paymentMethodsLoaded != null) {
      return paymentMethodsLoaded(availablePaymentMethods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return paymentMethodsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return paymentMethodsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (paymentMethodsLoaded != null) {
      return paymentMethodsLoaded(this);
    }
    return orElse();
  }
}

abstract class _PaymentMethodsLoaded implements CheckoutState {
  const factory _PaymentMethodsLoaded({
    final List<PaymentMethodEntity> availablePaymentMethods,
  }) = _$PaymentMethodsLoadedImpl;

  List<PaymentMethodEntity> get availablePaymentMethods;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodsLoadedImplCopyWith<_$PaymentMethodsLoadedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppErrorEntity error, CheckoutEntity? lastCheckout});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null, Object? lastCheckout = freezed}) {
    return _then(
      _$ErrorImpl(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity,
        lastCheckout:
            freezed == lastCheckout
                ? _value.lastCheckout
                : lastCheckout // ignore: cast_nullable_to_non_nullable
                    as CheckoutEntity?,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl({required this.error, this.lastCheckout});

  @override
  final AppErrorEntity error;
  @override
  final CheckoutEntity? lastCheckout;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckoutState.error(error: $error, lastCheckout: $lastCheckout)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckoutState.error'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('lastCheckout', lastCheckout));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.lastCheckout, lastCheckout) ||
                other.lastCheckout == lastCheckout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, lastCheckout);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CheckoutEntity? lastCheckout) loading,
    required TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    checkoutLoaded,
    required TResult Function(CheckoutEntity checkout) placingOrder,
    required TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )
    orderPlaced,
    required TResult Function(String orderId, String paymentMethod)
    paymentProcessing,
    required TResult Function(
      String orderId,
      String transactionId,
      double totalAmount,
    )
    paymentSuccess,
    required TResult Function(String orderId, String errorMessage)
    paymentFailed,
    required TResult Function(bool success, CheckoutEntity? checkout)
    paymentMethodUpdated,
    required TResult Function(bool success, String paymentMethod)
    orderPaymentMethodSynced,
    required TResult Function(bool success, CheckoutEntity? checkout)
    orderConfirmed,
    required TResult Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )
    navigateToPaymentGateway,
    required TResult Function(CheckoutEmiEntity emiData) emiDetailsLoaded,
    required TResult Function(List<PaymentMethodEntity> availablePaymentMethods)
    paymentMethodsLoaded,
    required TResult Function(
      AppErrorEntity error,
      CheckoutEntity? lastCheckout,
    )
    error,
  }) {
    return error(this.error, lastCheckout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CheckoutEntity? lastCheckout)? loading,
    TResult? Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult? Function(CheckoutEntity checkout)? placingOrder,
    TResult? Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult? Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult? Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult? Function(String orderId, String errorMessage)? paymentFailed,
    TResult? Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult? Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult? Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult? Function(
      String url,
      String title,
      Map<String, String>? formFields,
    )?
    navigateToPaymentGateway,
    TResult? Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult? Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult? Function(AppErrorEntity error, CheckoutEntity? lastCheckout)?
    error,
  }) {
    return error?.call(this.error, lastCheckout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CheckoutEntity? lastCheckout)? loading,
    TResult Function(
      CheckoutEntity checkout,
      AddressEntity? selectedShippingAddress,
      AddressEntity? selectedBillingAddress,
      String? selectedPaymentMethod,
      String? selectedShippingMethodCode,
      List<ShippingMethodEntity> availableShippingMethods,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    checkoutLoaded,
    TResult Function(CheckoutEntity checkout)? placingOrder,
    TResult Function(
      String orderId,
      double totalAmount,
      String paymentMethod,
      CheckoutEntity checkout,
      List<PaymentMethodEntity> availablePaymentMethods,
    )?
    orderPlaced,
    TResult Function(String orderId, String paymentMethod)? paymentProcessing,
    TResult Function(String orderId, String transactionId, double totalAmount)?
    paymentSuccess,
    TResult Function(String orderId, String errorMessage)? paymentFailed,
    TResult Function(bool success, CheckoutEntity? checkout)?
    paymentMethodUpdated,
    TResult Function(bool success, String paymentMethod)?
    orderPaymentMethodSynced,
    TResult Function(bool success, CheckoutEntity? checkout)? orderConfirmed,
    TResult Function(String url, String title, Map<String, String>? formFields)?
    navigateToPaymentGateway,
    TResult Function(CheckoutEmiEntity emiData)? emiDetailsLoaded,
    TResult Function(List<PaymentMethodEntity> availablePaymentMethods)?
    paymentMethodsLoaded,
    TResult Function(AppErrorEntity error, CheckoutEntity? lastCheckout)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, lastCheckout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CheckoutLoaded value) checkoutLoaded,
    required TResult Function(_PlacingOrder value) placingOrder,
    required TResult Function(_OrderPlaced value) orderPlaced,
    required TResult Function(_PaymentProcessing value) paymentProcessing,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailed value) paymentFailed,
    required TResult Function(_PaymentMethodUpdated value) paymentMethodUpdated,
    required TResult Function(_OrderPaymentMethodSynced value)
    orderPaymentMethodSynced,
    required TResult Function(_OrderConfirmed value) orderConfirmed,
    required TResult Function(_NavigateToPaymentGateway value)
    navigateToPaymentGateway,
    required TResult Function(_EmiDetailsLoaded value) emiDetailsLoaded,
    required TResult Function(_PaymentMethodsLoaded value) paymentMethodsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult? Function(_PlacingOrder value)? placingOrder,
    TResult? Function(_OrderPlaced value)? orderPlaced,
    TResult? Function(_PaymentProcessing value)? paymentProcessing,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailed value)? paymentFailed,
    TResult? Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult? Function(_OrderPaymentMethodSynced value)?
    orderPaymentMethodSynced,
    TResult? Function(_OrderConfirmed value)? orderConfirmed,
    TResult? Function(_NavigateToPaymentGateway value)?
    navigateToPaymentGateway,
    TResult? Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult? Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CheckoutLoaded value)? checkoutLoaded,
    TResult Function(_PlacingOrder value)? placingOrder,
    TResult Function(_OrderPlaced value)? orderPlaced,
    TResult Function(_PaymentProcessing value)? paymentProcessing,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailed value)? paymentFailed,
    TResult Function(_PaymentMethodUpdated value)? paymentMethodUpdated,
    TResult Function(_OrderPaymentMethodSynced value)? orderPaymentMethodSynced,
    TResult Function(_OrderConfirmed value)? orderConfirmed,
    TResult Function(_NavigateToPaymentGateway value)? navigateToPaymentGateway,
    TResult Function(_EmiDetailsLoaded value)? emiDetailsLoaded,
    TResult Function(_PaymentMethodsLoaded value)? paymentMethodsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CheckoutState {
  const factory _Error({
    required final AppErrorEntity error,
    final CheckoutEntity? lastCheckout,
  }) = _$ErrorImpl;

  AppErrorEntity get error;
  CheckoutEntity? get lastCheckout;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
