// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cancel_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderCancelResponse _$OrderCancelResponseFromJson(Map<String, dynamic> json) {
  return _OrderCancelResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderCancelResponse {
  @JsonKey(name: "base_currency_code")
  String? get baseCurrencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: "base_discount_amount")
  int? get baseDiscountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "base_discount_canceled")
  int? get baseDiscountCanceled => throw _privateConstructorUsedError;
  @JsonKey(name: "base_grand_total")
  int? get baseGrandTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "base_discount_tax_compensation_amount")
  int? get baseDiscountTaxCompensationAmount =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "base_shipping_amount")
  int? get baseShippingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "base_shipping_canceled")
  int? get baseShippingCanceled => throw _privateConstructorUsedError;
  @JsonKey(name: "base_shipping_discount_amount")
  int? get baseShippingDiscountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
  int? get baseShippingDiscountTaxCompensationAmnt =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "base_shipping_incl_tax")
  int? get baseShippingInclTax => throw _privateConstructorUsedError;
  @JsonKey(name: "base_shipping_tax_amount")
  int? get baseShippingTaxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "base_subtotal")
  int? get baseSubtotal => throw _privateConstructorUsedError;
  @JsonKey(name: "base_subtotal_canceled")
  int? get baseSubtotalCanceled => throw _privateConstructorUsedError;
  @JsonKey(name: "base_subtotal_incl_tax")
  int? get baseSubtotalInclTax => throw _privateConstructorUsedError;
  @JsonKey(name: "base_tax_amount")
  int? get baseTaxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "base_tax_canceled")
  int? get baseTaxCanceled => throw _privateConstructorUsedError;
  @JsonKey(name: "base_total_canceled")
  int? get baseTotalCanceled => throw _privateConstructorUsedError;
  @JsonKey(name: "base_total_due")
  int? get baseTotalDue => throw _privateConstructorUsedError;
  @JsonKey(name: "base_to_global_rate")
  int? get baseToGlobalRate => throw _privateConstructorUsedError;
  @JsonKey(name: "base_to_order_rate")
  int? get baseToOrderRate => throw _privateConstructorUsedError;
  @JsonKey(name: "billing_address_id")
  int? get billingAddressId => throw _privateConstructorUsedError;
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(
    name: "customer_dob",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get customerDob => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_email")
  String? get customerEmail => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_firstname")
  String? get customerFirstname => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_gender")
  int? get customerGender => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_group_id")
  int? get customerGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_id")
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_is_guest")
  int? get customerIsGuest => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_lastname")
  String? get customerLastname => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_note_notify")
  int? get customerNoteNotify => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_amount")
  int? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_canceled")
  int? get discountCanceled => throw _privateConstructorUsedError;
  @JsonKey(name: "email_sent")
  int? get emailSent => throw _privateConstructorUsedError;
  @JsonKey(name: "entity_id")
  int? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "global_currency_code")
  String? get globalCurrencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: "grand_total")
  int? get grandTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_tax_compensation_amount")
  int? get discountTaxCompensationAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "increment_id")
  String? get incrementId => throw _privateConstructorUsedError;
  @JsonKey(name: "is_virtual")
  int? get isVirtual => throw _privateConstructorUsedError;
  @JsonKey(name: "order_currency_code")
  String? get orderCurrencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: "protect_code")
  String? get protectCode => throw _privateConstructorUsedError;
  @JsonKey(name: "quote_id")
  int? get quoteId => throw _privateConstructorUsedError;
  @JsonKey(name: "remote_ip")
  String? get remoteIp => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_amount")
  int? get shippingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_canceled")
  int? get shippingCanceled => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_description")
  String? get shippingDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_discount_amount")
  int? get shippingDiscountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_discount_tax_compensation_amount")
  int? get shippingDiscountTaxCompensationAmount =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_incl_tax")
  int? get shippingInclTax => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_tax_amount")
  int? get shippingTaxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "store_currency_code")
  String? get storeCurrencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  int? get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: "store_name")
  String? get storeName => throw _privateConstructorUsedError;
  @JsonKey(name: "store_to_base_rate")
  int? get storeToBaseRate => throw _privateConstructorUsedError;
  @JsonKey(name: "store_to_order_rate")
  int? get storeToOrderRate => throw _privateConstructorUsedError;
  @JsonKey(name: "subtotal")
  int? get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: "subtotal_canceled")
  int? get subtotalCanceled => throw _privateConstructorUsedError;
  @JsonKey(name: "subtotal_incl_tax")
  int? get subtotalInclTax => throw _privateConstructorUsedError;
  @JsonKey(name: "tax_amount")
  int? get taxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "tax_canceled")
  int? get taxCanceled => throw _privateConstructorUsedError;
  @JsonKey(name: "total_canceled")
  int? get totalCanceled => throw _privateConstructorUsedError;
  @JsonKey(name: "total_due")
  int? get totalDue => throw _privateConstructorUsedError;
  @JsonKey(name: "total_item_count")
  int? get totalItemCount => throw _privateConstructorUsedError;
  @JsonKey(name: "total_qty_ordered")
  int? get totalQtyOrdered => throw _privateConstructorUsedError;
  @JsonKey(
    name: "updated_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "weight")
  double? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: "x_forwarded_for")
  String? get xForwardedFor => throw _privateConstructorUsedError;
  @JsonKey(name: "items")
  List<Item>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: "billing_address")
  Address? get billingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "payment")
  Payment? get payment => throw _privateConstructorUsedError;
  @JsonKey(name: "status_histories")
  List<StatusHistory>? get statusHistories =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "extension_attributes")
  ExtensionAttributes? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this OrderCancelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCancelResponseCopyWith<OrderCancelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCancelResponseCopyWith<$Res> {
  factory $OrderCancelResponseCopyWith(
    OrderCancelResponse value,
    $Res Function(OrderCancelResponse) then,
  ) = _$OrderCancelResponseCopyWithImpl<$Res, OrderCancelResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "base_currency_code") String? baseCurrencyCode,
    @JsonKey(name: "base_discount_amount") int? baseDiscountAmount,
    @JsonKey(name: "base_discount_canceled") int? baseDiscountCanceled,
    @JsonKey(name: "base_grand_total") int? baseGrandTotal,
    @JsonKey(name: "base_discount_tax_compensation_amount")
    int? baseDiscountTaxCompensationAmount,
    @JsonKey(name: "base_shipping_amount") int? baseShippingAmount,
    @JsonKey(name: "base_shipping_canceled") int? baseShippingCanceled,
    @JsonKey(name: "base_shipping_discount_amount")
    int? baseShippingDiscountAmount,
    @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
    int? baseShippingDiscountTaxCompensationAmnt,
    @JsonKey(name: "base_shipping_incl_tax") int? baseShippingInclTax,
    @JsonKey(name: "base_shipping_tax_amount") int? baseShippingTaxAmount,
    @JsonKey(name: "base_subtotal") int? baseSubtotal,
    @JsonKey(name: "base_subtotal_canceled") int? baseSubtotalCanceled,
    @JsonKey(name: "base_subtotal_incl_tax") int? baseSubtotalInclTax,
    @JsonKey(name: "base_tax_amount") int? baseTaxAmount,
    @JsonKey(name: "base_tax_canceled") int? baseTaxCanceled,
    @JsonKey(name: "base_total_canceled") int? baseTotalCanceled,
    @JsonKey(name: "base_total_due") int? baseTotalDue,
    @JsonKey(name: "base_to_global_rate") int? baseToGlobalRate,
    @JsonKey(name: "base_to_order_rate") int? baseToOrderRate,
    @JsonKey(name: "billing_address_id") int? billingAddressId,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? createdAt,
    @JsonKey(
      name: "customer_dob",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? customerDob,
    @JsonKey(name: "customer_email") String? customerEmail,
    @JsonKey(name: "customer_firstname") String? customerFirstname,
    @JsonKey(name: "customer_gender") int? customerGender,
    @JsonKey(name: "customer_group_id") int? customerGroupId,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "customer_is_guest") int? customerIsGuest,
    @JsonKey(name: "customer_lastname") String? customerLastname,
    @JsonKey(name: "customer_note_notify") int? customerNoteNotify,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "discount_canceled") int? discountCanceled,
    @JsonKey(name: "email_sent") int? emailSent,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "global_currency_code") String? globalCurrencyCode,
    @JsonKey(name: "grand_total") int? grandTotal,
    @JsonKey(name: "discount_tax_compensation_amount")
    int? discountTaxCompensationAmount,
    @JsonKey(name: "increment_id") String? incrementId,
    @JsonKey(name: "is_virtual") int? isVirtual,
    @JsonKey(name: "order_currency_code") String? orderCurrencyCode,
    @JsonKey(name: "protect_code") String? protectCode,
    @JsonKey(name: "quote_id") int? quoteId,
    @JsonKey(name: "remote_ip") String? remoteIp,
    @JsonKey(name: "shipping_amount") int? shippingAmount,
    @JsonKey(name: "shipping_canceled") int? shippingCanceled,
    @JsonKey(name: "shipping_description") String? shippingDescription,
    @JsonKey(name: "shipping_discount_amount") int? shippingDiscountAmount,
    @JsonKey(name: "shipping_discount_tax_compensation_amount")
    int? shippingDiscountTaxCompensationAmount,
    @JsonKey(name: "shipping_incl_tax") int? shippingInclTax,
    @JsonKey(name: "shipping_tax_amount") int? shippingTaxAmount,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "store_currency_code") String? storeCurrencyCode,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "store_name") String? storeName,
    @JsonKey(name: "store_to_base_rate") int? storeToBaseRate,
    @JsonKey(name: "store_to_order_rate") int? storeToOrderRate,
    @JsonKey(name: "subtotal") int? subtotal,
    @JsonKey(name: "subtotal_canceled") int? subtotalCanceled,
    @JsonKey(name: "subtotal_incl_tax") int? subtotalInclTax,
    @JsonKey(name: "tax_amount") int? taxAmount,
    @JsonKey(name: "tax_canceled") int? taxCanceled,
    @JsonKey(name: "total_canceled") int? totalCanceled,
    @JsonKey(name: "total_due") int? totalDue,
    @JsonKey(name: "total_item_count") int? totalItemCount,
    @JsonKey(name: "total_qty_ordered") int? totalQtyOrdered,
    @JsonKey(
      name: "updated_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? updatedAt,
    @JsonKey(name: "weight") double? weight,
    @JsonKey(name: "x_forwarded_for") String? xForwardedFor,
    @JsonKey(name: "items") List<Item>? items,
    @JsonKey(name: "billing_address") Address? billingAddress,
    @JsonKey(name: "payment") Payment? payment,
    @JsonKey(name: "status_histories") List<StatusHistory>? statusHistories,
    @JsonKey(name: "extension_attributes")
    ExtensionAttributes? extensionAttributes,
  });

  $AddressCopyWith<$Res>? get billingAddress;
  $PaymentCopyWith<$Res>? get payment;
  $ExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class _$OrderCancelResponseCopyWithImpl<$Res, $Val extends OrderCancelResponse>
    implements $OrderCancelResponseCopyWith<$Res> {
  _$OrderCancelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseCurrencyCode = freezed,
    Object? baseDiscountAmount = freezed,
    Object? baseDiscountCanceled = freezed,
    Object? baseGrandTotal = freezed,
    Object? baseDiscountTaxCompensationAmount = freezed,
    Object? baseShippingAmount = freezed,
    Object? baseShippingCanceled = freezed,
    Object? baseShippingDiscountAmount = freezed,
    Object? baseShippingDiscountTaxCompensationAmnt = freezed,
    Object? baseShippingInclTax = freezed,
    Object? baseShippingTaxAmount = freezed,
    Object? baseSubtotal = freezed,
    Object? baseSubtotalCanceled = freezed,
    Object? baseSubtotalInclTax = freezed,
    Object? baseTaxAmount = freezed,
    Object? baseTaxCanceled = freezed,
    Object? baseTotalCanceled = freezed,
    Object? baseTotalDue = freezed,
    Object? baseToGlobalRate = freezed,
    Object? baseToOrderRate = freezed,
    Object? billingAddressId = freezed,
    Object? createdAt = freezed,
    Object? customerDob = freezed,
    Object? customerEmail = freezed,
    Object? customerFirstname = freezed,
    Object? customerGender = freezed,
    Object? customerGroupId = freezed,
    Object? customerId = freezed,
    Object? customerIsGuest = freezed,
    Object? customerLastname = freezed,
    Object? customerNoteNotify = freezed,
    Object? discountAmount = freezed,
    Object? discountCanceled = freezed,
    Object? emailSent = freezed,
    Object? entityId = freezed,
    Object? globalCurrencyCode = freezed,
    Object? grandTotal = freezed,
    Object? discountTaxCompensationAmount = freezed,
    Object? incrementId = freezed,
    Object? isVirtual = freezed,
    Object? orderCurrencyCode = freezed,
    Object? protectCode = freezed,
    Object? quoteId = freezed,
    Object? remoteIp = freezed,
    Object? shippingAmount = freezed,
    Object? shippingCanceled = freezed,
    Object? shippingDescription = freezed,
    Object? shippingDiscountAmount = freezed,
    Object? shippingDiscountTaxCompensationAmount = freezed,
    Object? shippingInclTax = freezed,
    Object? shippingTaxAmount = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? storeCurrencyCode = freezed,
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? storeToBaseRate = freezed,
    Object? storeToOrderRate = freezed,
    Object? subtotal = freezed,
    Object? subtotalCanceled = freezed,
    Object? subtotalInclTax = freezed,
    Object? taxAmount = freezed,
    Object? taxCanceled = freezed,
    Object? totalCanceled = freezed,
    Object? totalDue = freezed,
    Object? totalItemCount = freezed,
    Object? totalQtyOrdered = freezed,
    Object? updatedAt = freezed,
    Object? weight = freezed,
    Object? xForwardedFor = freezed,
    Object? items = freezed,
    Object? billingAddress = freezed,
    Object? payment = freezed,
    Object? statusHistories = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            baseCurrencyCode:
                freezed == baseCurrencyCode
                    ? _value.baseCurrencyCode
                    : baseCurrencyCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            baseDiscountAmount:
                freezed == baseDiscountAmount
                    ? _value.baseDiscountAmount
                    : baseDiscountAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseDiscountCanceled:
                freezed == baseDiscountCanceled
                    ? _value.baseDiscountCanceled
                    : baseDiscountCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseGrandTotal:
                freezed == baseGrandTotal
                    ? _value.baseGrandTotal
                    : baseGrandTotal // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseDiscountTaxCompensationAmount:
                freezed == baseDiscountTaxCompensationAmount
                    ? _value.baseDiscountTaxCompensationAmount
                    : baseDiscountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseShippingAmount:
                freezed == baseShippingAmount
                    ? _value.baseShippingAmount
                    : baseShippingAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseShippingCanceled:
                freezed == baseShippingCanceled
                    ? _value.baseShippingCanceled
                    : baseShippingCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseShippingDiscountAmount:
                freezed == baseShippingDiscountAmount
                    ? _value.baseShippingDiscountAmount
                    : baseShippingDiscountAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseShippingDiscountTaxCompensationAmnt:
                freezed == baseShippingDiscountTaxCompensationAmnt
                    ? _value.baseShippingDiscountTaxCompensationAmnt
                    : baseShippingDiscountTaxCompensationAmnt // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseShippingInclTax:
                freezed == baseShippingInclTax
                    ? _value.baseShippingInclTax
                    : baseShippingInclTax // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseShippingTaxAmount:
                freezed == baseShippingTaxAmount
                    ? _value.baseShippingTaxAmount
                    : baseShippingTaxAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseSubtotal:
                freezed == baseSubtotal
                    ? _value.baseSubtotal
                    : baseSubtotal // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseSubtotalCanceled:
                freezed == baseSubtotalCanceled
                    ? _value.baseSubtotalCanceled
                    : baseSubtotalCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseSubtotalInclTax:
                freezed == baseSubtotalInclTax
                    ? _value.baseSubtotalInclTax
                    : baseSubtotalInclTax // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseTaxAmount:
                freezed == baseTaxAmount
                    ? _value.baseTaxAmount
                    : baseTaxAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseTaxCanceled:
                freezed == baseTaxCanceled
                    ? _value.baseTaxCanceled
                    : baseTaxCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseTotalCanceled:
                freezed == baseTotalCanceled
                    ? _value.baseTotalCanceled
                    : baseTotalCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseTotalDue:
                freezed == baseTotalDue
                    ? _value.baseTotalDue
                    : baseTotalDue // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseToGlobalRate:
                freezed == baseToGlobalRate
                    ? _value.baseToGlobalRate
                    : baseToGlobalRate // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseToOrderRate:
                freezed == baseToOrderRate
                    ? _value.baseToOrderRate
                    : baseToOrderRate // ignore: cast_nullable_to_non_nullable
                        as int?,
            billingAddressId:
                freezed == billingAddressId
                    ? _value.billingAddressId
                    : billingAddressId // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            customerDob:
                freezed == customerDob
                    ? _value.customerDob
                    : customerDob // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            customerEmail:
                freezed == customerEmail
                    ? _value.customerEmail
                    : customerEmail // ignore: cast_nullable_to_non_nullable
                        as String?,
            customerFirstname:
                freezed == customerFirstname
                    ? _value.customerFirstname
                    : customerFirstname // ignore: cast_nullable_to_non_nullable
                        as String?,
            customerGender:
                freezed == customerGender
                    ? _value.customerGender
                    : customerGender // ignore: cast_nullable_to_non_nullable
                        as int?,
            customerGroupId:
                freezed == customerGroupId
                    ? _value.customerGroupId
                    : customerGroupId // ignore: cast_nullable_to_non_nullable
                        as int?,
            customerId:
                freezed == customerId
                    ? _value.customerId
                    : customerId // ignore: cast_nullable_to_non_nullable
                        as int?,
            customerIsGuest:
                freezed == customerIsGuest
                    ? _value.customerIsGuest
                    : customerIsGuest // ignore: cast_nullable_to_non_nullable
                        as int?,
            customerLastname:
                freezed == customerLastname
                    ? _value.customerLastname
                    : customerLastname // ignore: cast_nullable_to_non_nullable
                        as String?,
            customerNoteNotify:
                freezed == customerNoteNotify
                    ? _value.customerNoteNotify
                    : customerNoteNotify // ignore: cast_nullable_to_non_nullable
                        as int?,
            discountAmount:
                freezed == discountAmount
                    ? _value.discountAmount
                    : discountAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            discountCanceled:
                freezed == discountCanceled
                    ? _value.discountCanceled
                    : discountCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            emailSent:
                freezed == emailSent
                    ? _value.emailSent
                    : emailSent // ignore: cast_nullable_to_non_nullable
                        as int?,
            entityId:
                freezed == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as int?,
            globalCurrencyCode:
                freezed == globalCurrencyCode
                    ? _value.globalCurrencyCode
                    : globalCurrencyCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            grandTotal:
                freezed == grandTotal
                    ? _value.grandTotal
                    : grandTotal // ignore: cast_nullable_to_non_nullable
                        as int?,
            discountTaxCompensationAmount:
                freezed == discountTaxCompensationAmount
                    ? _value.discountTaxCompensationAmount
                    : discountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            incrementId:
                freezed == incrementId
                    ? _value.incrementId
                    : incrementId // ignore: cast_nullable_to_non_nullable
                        as String?,
            isVirtual:
                freezed == isVirtual
                    ? _value.isVirtual
                    : isVirtual // ignore: cast_nullable_to_non_nullable
                        as int?,
            orderCurrencyCode:
                freezed == orderCurrencyCode
                    ? _value.orderCurrencyCode
                    : orderCurrencyCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            protectCode:
                freezed == protectCode
                    ? _value.protectCode
                    : protectCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            quoteId:
                freezed == quoteId
                    ? _value.quoteId
                    : quoteId // ignore: cast_nullable_to_non_nullable
                        as int?,
            remoteIp:
                freezed == remoteIp
                    ? _value.remoteIp
                    : remoteIp // ignore: cast_nullable_to_non_nullable
                        as String?,
            shippingAmount:
                freezed == shippingAmount
                    ? _value.shippingAmount
                    : shippingAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            shippingCanceled:
                freezed == shippingCanceled
                    ? _value.shippingCanceled
                    : shippingCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            shippingDescription:
                freezed == shippingDescription
                    ? _value.shippingDescription
                    : shippingDescription // ignore: cast_nullable_to_non_nullable
                        as String?,
            shippingDiscountAmount:
                freezed == shippingDiscountAmount
                    ? _value.shippingDiscountAmount
                    : shippingDiscountAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            shippingDiscountTaxCompensationAmount:
                freezed == shippingDiscountTaxCompensationAmount
                    ? _value.shippingDiscountTaxCompensationAmount
                    : shippingDiscountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            shippingInclTax:
                freezed == shippingInclTax
                    ? _value.shippingInclTax
                    : shippingInclTax // ignore: cast_nullable_to_non_nullable
                        as int?,
            shippingTaxAmount:
                freezed == shippingTaxAmount
                    ? _value.shippingTaxAmount
                    : shippingTaxAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            state:
                freezed == state
                    ? _value.state
                    : state // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            storeCurrencyCode:
                freezed == storeCurrencyCode
                    ? _value.storeCurrencyCode
                    : storeCurrencyCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            storeId:
                freezed == storeId
                    ? _value.storeId
                    : storeId // ignore: cast_nullable_to_non_nullable
                        as int?,
            storeName:
                freezed == storeName
                    ? _value.storeName
                    : storeName // ignore: cast_nullable_to_non_nullable
                        as String?,
            storeToBaseRate:
                freezed == storeToBaseRate
                    ? _value.storeToBaseRate
                    : storeToBaseRate // ignore: cast_nullable_to_non_nullable
                        as int?,
            storeToOrderRate:
                freezed == storeToOrderRate
                    ? _value.storeToOrderRate
                    : storeToOrderRate // ignore: cast_nullable_to_non_nullable
                        as int?,
            subtotal:
                freezed == subtotal
                    ? _value.subtotal
                    : subtotal // ignore: cast_nullable_to_non_nullable
                        as int?,
            subtotalCanceled:
                freezed == subtotalCanceled
                    ? _value.subtotalCanceled
                    : subtotalCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            subtotalInclTax:
                freezed == subtotalInclTax
                    ? _value.subtotalInclTax
                    : subtotalInclTax // ignore: cast_nullable_to_non_nullable
                        as int?,
            taxAmount:
                freezed == taxAmount
                    ? _value.taxAmount
                    : taxAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            taxCanceled:
                freezed == taxCanceled
                    ? _value.taxCanceled
                    : taxCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            totalCanceled:
                freezed == totalCanceled
                    ? _value.totalCanceled
                    : totalCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            totalDue:
                freezed == totalDue
                    ? _value.totalDue
                    : totalDue // ignore: cast_nullable_to_non_nullable
                        as int?,
            totalItemCount:
                freezed == totalItemCount
                    ? _value.totalItemCount
                    : totalItemCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            totalQtyOrdered:
                freezed == totalQtyOrdered
                    ? _value.totalQtyOrdered
                    : totalQtyOrdered // ignore: cast_nullable_to_non_nullable
                        as int?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            weight:
                freezed == weight
                    ? _value.weight
                    : weight // ignore: cast_nullable_to_non_nullable
                        as double?,
            xForwardedFor:
                freezed == xForwardedFor
                    ? _value.xForwardedFor
                    : xForwardedFor // ignore: cast_nullable_to_non_nullable
                        as String?,
            items:
                freezed == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<Item>?,
            billingAddress:
                freezed == billingAddress
                    ? _value.billingAddress
                    : billingAddress // ignore: cast_nullable_to_non_nullable
                        as Address?,
            payment:
                freezed == payment
                    ? _value.payment
                    : payment // ignore: cast_nullable_to_non_nullable
                        as Payment?,
            statusHistories:
                freezed == statusHistories
                    ? _value.statusHistories
                    : statusHistories // ignore: cast_nullable_to_non_nullable
                        as List<StatusHistory>?,
            extensionAttributes:
                freezed == extensionAttributes
                    ? _value.extensionAttributes
                    : extensionAttributes // ignore: cast_nullable_to_non_nullable
                        as ExtensionAttributes?,
          )
          as $Val,
    );
  }

  /// Create a copy of OrderCancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get billingAddress {
    if (_value.billingAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.billingAddress!, (value) {
      return _then(_value.copyWith(billingAddress: value) as $Val);
    });
  }

  /// Create a copy of OrderCancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentCopyWith<$Res>? get payment {
    if (_value.payment == null) {
      return null;
    }

    return $PaymentCopyWith<$Res>(_value.payment!, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }

  /// Create a copy of OrderCancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExtensionAttributesCopyWith<$Res>? get extensionAttributes {
    if (_value.extensionAttributes == null) {
      return null;
    }

    return $ExtensionAttributesCopyWith<$Res>(_value.extensionAttributes!, (
      value,
    ) {
      return _then(_value.copyWith(extensionAttributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderCancelResponseImplCopyWith<$Res>
    implements $OrderCancelResponseCopyWith<$Res> {
  factory _$$OrderCancelResponseImplCopyWith(
    _$OrderCancelResponseImpl value,
    $Res Function(_$OrderCancelResponseImpl) then,
  ) = __$$OrderCancelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "base_currency_code") String? baseCurrencyCode,
    @JsonKey(name: "base_discount_amount") int? baseDiscountAmount,
    @JsonKey(name: "base_discount_canceled") int? baseDiscountCanceled,
    @JsonKey(name: "base_grand_total") int? baseGrandTotal,
    @JsonKey(name: "base_discount_tax_compensation_amount")
    int? baseDiscountTaxCompensationAmount,
    @JsonKey(name: "base_shipping_amount") int? baseShippingAmount,
    @JsonKey(name: "base_shipping_canceled") int? baseShippingCanceled,
    @JsonKey(name: "base_shipping_discount_amount")
    int? baseShippingDiscountAmount,
    @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
    int? baseShippingDiscountTaxCompensationAmnt,
    @JsonKey(name: "base_shipping_incl_tax") int? baseShippingInclTax,
    @JsonKey(name: "base_shipping_tax_amount") int? baseShippingTaxAmount,
    @JsonKey(name: "base_subtotal") int? baseSubtotal,
    @JsonKey(name: "base_subtotal_canceled") int? baseSubtotalCanceled,
    @JsonKey(name: "base_subtotal_incl_tax") int? baseSubtotalInclTax,
    @JsonKey(name: "base_tax_amount") int? baseTaxAmount,
    @JsonKey(name: "base_tax_canceled") int? baseTaxCanceled,
    @JsonKey(name: "base_total_canceled") int? baseTotalCanceled,
    @JsonKey(name: "base_total_due") int? baseTotalDue,
    @JsonKey(name: "base_to_global_rate") int? baseToGlobalRate,
    @JsonKey(name: "base_to_order_rate") int? baseToOrderRate,
    @JsonKey(name: "billing_address_id") int? billingAddressId,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? createdAt,
    @JsonKey(
      name: "customer_dob",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? customerDob,
    @JsonKey(name: "customer_email") String? customerEmail,
    @JsonKey(name: "customer_firstname") String? customerFirstname,
    @JsonKey(name: "customer_gender") int? customerGender,
    @JsonKey(name: "customer_group_id") int? customerGroupId,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "customer_is_guest") int? customerIsGuest,
    @JsonKey(name: "customer_lastname") String? customerLastname,
    @JsonKey(name: "customer_note_notify") int? customerNoteNotify,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "discount_canceled") int? discountCanceled,
    @JsonKey(name: "email_sent") int? emailSent,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "global_currency_code") String? globalCurrencyCode,
    @JsonKey(name: "grand_total") int? grandTotal,
    @JsonKey(name: "discount_tax_compensation_amount")
    int? discountTaxCompensationAmount,
    @JsonKey(name: "increment_id") String? incrementId,
    @JsonKey(name: "is_virtual") int? isVirtual,
    @JsonKey(name: "order_currency_code") String? orderCurrencyCode,
    @JsonKey(name: "protect_code") String? protectCode,
    @JsonKey(name: "quote_id") int? quoteId,
    @JsonKey(name: "remote_ip") String? remoteIp,
    @JsonKey(name: "shipping_amount") int? shippingAmount,
    @JsonKey(name: "shipping_canceled") int? shippingCanceled,
    @JsonKey(name: "shipping_description") String? shippingDescription,
    @JsonKey(name: "shipping_discount_amount") int? shippingDiscountAmount,
    @JsonKey(name: "shipping_discount_tax_compensation_amount")
    int? shippingDiscountTaxCompensationAmount,
    @JsonKey(name: "shipping_incl_tax") int? shippingInclTax,
    @JsonKey(name: "shipping_tax_amount") int? shippingTaxAmount,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "store_currency_code") String? storeCurrencyCode,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "store_name") String? storeName,
    @JsonKey(name: "store_to_base_rate") int? storeToBaseRate,
    @JsonKey(name: "store_to_order_rate") int? storeToOrderRate,
    @JsonKey(name: "subtotal") int? subtotal,
    @JsonKey(name: "subtotal_canceled") int? subtotalCanceled,
    @JsonKey(name: "subtotal_incl_tax") int? subtotalInclTax,
    @JsonKey(name: "tax_amount") int? taxAmount,
    @JsonKey(name: "tax_canceled") int? taxCanceled,
    @JsonKey(name: "total_canceled") int? totalCanceled,
    @JsonKey(name: "total_due") int? totalDue,
    @JsonKey(name: "total_item_count") int? totalItemCount,
    @JsonKey(name: "total_qty_ordered") int? totalQtyOrdered,
    @JsonKey(
      name: "updated_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? updatedAt,
    @JsonKey(name: "weight") double? weight,
    @JsonKey(name: "x_forwarded_for") String? xForwardedFor,
    @JsonKey(name: "items") List<Item>? items,
    @JsonKey(name: "billing_address") Address? billingAddress,
    @JsonKey(name: "payment") Payment? payment,
    @JsonKey(name: "status_histories") List<StatusHistory>? statusHistories,
    @JsonKey(name: "extension_attributes")
    ExtensionAttributes? extensionAttributes,
  });

  @override
  $AddressCopyWith<$Res>? get billingAddress;
  @override
  $PaymentCopyWith<$Res>? get payment;
  @override
  $ExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class __$$OrderCancelResponseImplCopyWithImpl<$Res>
    extends _$OrderCancelResponseCopyWithImpl<$Res, _$OrderCancelResponseImpl>
    implements _$$OrderCancelResponseImplCopyWith<$Res> {
  __$$OrderCancelResponseImplCopyWithImpl(
    _$OrderCancelResponseImpl _value,
    $Res Function(_$OrderCancelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderCancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseCurrencyCode = freezed,
    Object? baseDiscountAmount = freezed,
    Object? baseDiscountCanceled = freezed,
    Object? baseGrandTotal = freezed,
    Object? baseDiscountTaxCompensationAmount = freezed,
    Object? baseShippingAmount = freezed,
    Object? baseShippingCanceled = freezed,
    Object? baseShippingDiscountAmount = freezed,
    Object? baseShippingDiscountTaxCompensationAmnt = freezed,
    Object? baseShippingInclTax = freezed,
    Object? baseShippingTaxAmount = freezed,
    Object? baseSubtotal = freezed,
    Object? baseSubtotalCanceled = freezed,
    Object? baseSubtotalInclTax = freezed,
    Object? baseTaxAmount = freezed,
    Object? baseTaxCanceled = freezed,
    Object? baseTotalCanceled = freezed,
    Object? baseTotalDue = freezed,
    Object? baseToGlobalRate = freezed,
    Object? baseToOrderRate = freezed,
    Object? billingAddressId = freezed,
    Object? createdAt = freezed,
    Object? customerDob = freezed,
    Object? customerEmail = freezed,
    Object? customerFirstname = freezed,
    Object? customerGender = freezed,
    Object? customerGroupId = freezed,
    Object? customerId = freezed,
    Object? customerIsGuest = freezed,
    Object? customerLastname = freezed,
    Object? customerNoteNotify = freezed,
    Object? discountAmount = freezed,
    Object? discountCanceled = freezed,
    Object? emailSent = freezed,
    Object? entityId = freezed,
    Object? globalCurrencyCode = freezed,
    Object? grandTotal = freezed,
    Object? discountTaxCompensationAmount = freezed,
    Object? incrementId = freezed,
    Object? isVirtual = freezed,
    Object? orderCurrencyCode = freezed,
    Object? protectCode = freezed,
    Object? quoteId = freezed,
    Object? remoteIp = freezed,
    Object? shippingAmount = freezed,
    Object? shippingCanceled = freezed,
    Object? shippingDescription = freezed,
    Object? shippingDiscountAmount = freezed,
    Object? shippingDiscountTaxCompensationAmount = freezed,
    Object? shippingInclTax = freezed,
    Object? shippingTaxAmount = freezed,
    Object? state = freezed,
    Object? status = freezed,
    Object? storeCurrencyCode = freezed,
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? storeToBaseRate = freezed,
    Object? storeToOrderRate = freezed,
    Object? subtotal = freezed,
    Object? subtotalCanceled = freezed,
    Object? subtotalInclTax = freezed,
    Object? taxAmount = freezed,
    Object? taxCanceled = freezed,
    Object? totalCanceled = freezed,
    Object? totalDue = freezed,
    Object? totalItemCount = freezed,
    Object? totalQtyOrdered = freezed,
    Object? updatedAt = freezed,
    Object? weight = freezed,
    Object? xForwardedFor = freezed,
    Object? items = freezed,
    Object? billingAddress = freezed,
    Object? payment = freezed,
    Object? statusHistories = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$OrderCancelResponseImpl(
        baseCurrencyCode:
            freezed == baseCurrencyCode
                ? _value.baseCurrencyCode
                : baseCurrencyCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        baseDiscountAmount:
            freezed == baseDiscountAmount
                ? _value.baseDiscountAmount
                : baseDiscountAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseDiscountCanceled:
            freezed == baseDiscountCanceled
                ? _value.baseDiscountCanceled
                : baseDiscountCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseGrandTotal:
            freezed == baseGrandTotal
                ? _value.baseGrandTotal
                : baseGrandTotal // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseDiscountTaxCompensationAmount:
            freezed == baseDiscountTaxCompensationAmount
                ? _value.baseDiscountTaxCompensationAmount
                : baseDiscountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseShippingAmount:
            freezed == baseShippingAmount
                ? _value.baseShippingAmount
                : baseShippingAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseShippingCanceled:
            freezed == baseShippingCanceled
                ? _value.baseShippingCanceled
                : baseShippingCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseShippingDiscountAmount:
            freezed == baseShippingDiscountAmount
                ? _value.baseShippingDiscountAmount
                : baseShippingDiscountAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseShippingDiscountTaxCompensationAmnt:
            freezed == baseShippingDiscountTaxCompensationAmnt
                ? _value.baseShippingDiscountTaxCompensationAmnt
                : baseShippingDiscountTaxCompensationAmnt // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseShippingInclTax:
            freezed == baseShippingInclTax
                ? _value.baseShippingInclTax
                : baseShippingInclTax // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseShippingTaxAmount:
            freezed == baseShippingTaxAmount
                ? _value.baseShippingTaxAmount
                : baseShippingTaxAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseSubtotal:
            freezed == baseSubtotal
                ? _value.baseSubtotal
                : baseSubtotal // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseSubtotalCanceled:
            freezed == baseSubtotalCanceled
                ? _value.baseSubtotalCanceled
                : baseSubtotalCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseSubtotalInclTax:
            freezed == baseSubtotalInclTax
                ? _value.baseSubtotalInclTax
                : baseSubtotalInclTax // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseTaxAmount:
            freezed == baseTaxAmount
                ? _value.baseTaxAmount
                : baseTaxAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseTaxCanceled:
            freezed == baseTaxCanceled
                ? _value.baseTaxCanceled
                : baseTaxCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseTotalCanceled:
            freezed == baseTotalCanceled
                ? _value.baseTotalCanceled
                : baseTotalCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseTotalDue:
            freezed == baseTotalDue
                ? _value.baseTotalDue
                : baseTotalDue // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseToGlobalRate:
            freezed == baseToGlobalRate
                ? _value.baseToGlobalRate
                : baseToGlobalRate // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseToOrderRate:
            freezed == baseToOrderRate
                ? _value.baseToOrderRate
                : baseToOrderRate // ignore: cast_nullable_to_non_nullable
                    as int?,
        billingAddressId:
            freezed == billingAddressId
                ? _value.billingAddressId
                : billingAddressId // ignore: cast_nullable_to_non_nullable
                    as int?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        customerDob:
            freezed == customerDob
                ? _value.customerDob
                : customerDob // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        customerEmail:
            freezed == customerEmail
                ? _value.customerEmail
                : customerEmail // ignore: cast_nullable_to_non_nullable
                    as String?,
        customerFirstname:
            freezed == customerFirstname
                ? _value.customerFirstname
                : customerFirstname // ignore: cast_nullable_to_non_nullable
                    as String?,
        customerGender:
            freezed == customerGender
                ? _value.customerGender
                : customerGender // ignore: cast_nullable_to_non_nullable
                    as int?,
        customerGroupId:
            freezed == customerGroupId
                ? _value.customerGroupId
                : customerGroupId // ignore: cast_nullable_to_non_nullable
                    as int?,
        customerId:
            freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                    as int?,
        customerIsGuest:
            freezed == customerIsGuest
                ? _value.customerIsGuest
                : customerIsGuest // ignore: cast_nullable_to_non_nullable
                    as int?,
        customerLastname:
            freezed == customerLastname
                ? _value.customerLastname
                : customerLastname // ignore: cast_nullable_to_non_nullable
                    as String?,
        customerNoteNotify:
            freezed == customerNoteNotify
                ? _value.customerNoteNotify
                : customerNoteNotify // ignore: cast_nullable_to_non_nullable
                    as int?,
        discountAmount:
            freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        discountCanceled:
            freezed == discountCanceled
                ? _value.discountCanceled
                : discountCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        emailSent:
            freezed == emailSent
                ? _value.emailSent
                : emailSent // ignore: cast_nullable_to_non_nullable
                    as int?,
        entityId:
            freezed == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as int?,
        globalCurrencyCode:
            freezed == globalCurrencyCode
                ? _value.globalCurrencyCode
                : globalCurrencyCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        grandTotal:
            freezed == grandTotal
                ? _value.grandTotal
                : grandTotal // ignore: cast_nullable_to_non_nullable
                    as int?,
        discountTaxCompensationAmount:
            freezed == discountTaxCompensationAmount
                ? _value.discountTaxCompensationAmount
                : discountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        incrementId:
            freezed == incrementId
                ? _value.incrementId
                : incrementId // ignore: cast_nullable_to_non_nullable
                    as String?,
        isVirtual:
            freezed == isVirtual
                ? _value.isVirtual
                : isVirtual // ignore: cast_nullable_to_non_nullable
                    as int?,
        orderCurrencyCode:
            freezed == orderCurrencyCode
                ? _value.orderCurrencyCode
                : orderCurrencyCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        protectCode:
            freezed == protectCode
                ? _value.protectCode
                : protectCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        quoteId:
            freezed == quoteId
                ? _value.quoteId
                : quoteId // ignore: cast_nullable_to_non_nullable
                    as int?,
        remoteIp:
            freezed == remoteIp
                ? _value.remoteIp
                : remoteIp // ignore: cast_nullable_to_non_nullable
                    as String?,
        shippingAmount:
            freezed == shippingAmount
                ? _value.shippingAmount
                : shippingAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        shippingCanceled:
            freezed == shippingCanceled
                ? _value.shippingCanceled
                : shippingCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        shippingDescription:
            freezed == shippingDescription
                ? _value.shippingDescription
                : shippingDescription // ignore: cast_nullable_to_non_nullable
                    as String?,
        shippingDiscountAmount:
            freezed == shippingDiscountAmount
                ? _value.shippingDiscountAmount
                : shippingDiscountAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        shippingDiscountTaxCompensationAmount:
            freezed == shippingDiscountTaxCompensationAmount
                ? _value.shippingDiscountTaxCompensationAmount
                : shippingDiscountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        shippingInclTax:
            freezed == shippingInclTax
                ? _value.shippingInclTax
                : shippingInclTax // ignore: cast_nullable_to_non_nullable
                    as int?,
        shippingTaxAmount:
            freezed == shippingTaxAmount
                ? _value.shippingTaxAmount
                : shippingTaxAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        state:
            freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        storeCurrencyCode:
            freezed == storeCurrencyCode
                ? _value.storeCurrencyCode
                : storeCurrencyCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        storeId:
            freezed == storeId
                ? _value.storeId
                : storeId // ignore: cast_nullable_to_non_nullable
                    as int?,
        storeName:
            freezed == storeName
                ? _value.storeName
                : storeName // ignore: cast_nullable_to_non_nullable
                    as String?,
        storeToBaseRate:
            freezed == storeToBaseRate
                ? _value.storeToBaseRate
                : storeToBaseRate // ignore: cast_nullable_to_non_nullable
                    as int?,
        storeToOrderRate:
            freezed == storeToOrderRate
                ? _value.storeToOrderRate
                : storeToOrderRate // ignore: cast_nullable_to_non_nullable
                    as int?,
        subtotal:
            freezed == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                    as int?,
        subtotalCanceled:
            freezed == subtotalCanceled
                ? _value.subtotalCanceled
                : subtotalCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        subtotalInclTax:
            freezed == subtotalInclTax
                ? _value.subtotalInclTax
                : subtotalInclTax // ignore: cast_nullable_to_non_nullable
                    as int?,
        taxAmount:
            freezed == taxAmount
                ? _value.taxAmount
                : taxAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        taxCanceled:
            freezed == taxCanceled
                ? _value.taxCanceled
                : taxCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        totalCanceled:
            freezed == totalCanceled
                ? _value.totalCanceled
                : totalCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        totalDue:
            freezed == totalDue
                ? _value.totalDue
                : totalDue // ignore: cast_nullable_to_non_nullable
                    as int?,
        totalItemCount:
            freezed == totalItemCount
                ? _value.totalItemCount
                : totalItemCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        totalQtyOrdered:
            freezed == totalQtyOrdered
                ? _value.totalQtyOrdered
                : totalQtyOrdered // ignore: cast_nullable_to_non_nullable
                    as int?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        weight:
            freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                    as double?,
        xForwardedFor:
            freezed == xForwardedFor
                ? _value.xForwardedFor
                : xForwardedFor // ignore: cast_nullable_to_non_nullable
                    as String?,
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<Item>?,
        billingAddress:
            freezed == billingAddress
                ? _value.billingAddress
                : billingAddress // ignore: cast_nullable_to_non_nullable
                    as Address?,
        payment:
            freezed == payment
                ? _value.payment
                : payment // ignore: cast_nullable_to_non_nullable
                    as Payment?,
        statusHistories:
            freezed == statusHistories
                ? _value._statusHistories
                : statusHistories // ignore: cast_nullable_to_non_nullable
                    as List<StatusHistory>?,
        extensionAttributes:
            freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                    as ExtensionAttributes?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCancelResponseImpl implements _OrderCancelResponse {
  const _$OrderCancelResponseImpl({
    @JsonKey(name: "base_currency_code") this.baseCurrencyCode,
    @JsonKey(name: "base_discount_amount") this.baseDiscountAmount,
    @JsonKey(name: "base_discount_canceled") this.baseDiscountCanceled,
    @JsonKey(name: "base_grand_total") this.baseGrandTotal,
    @JsonKey(name: "base_discount_tax_compensation_amount")
    this.baseDiscountTaxCompensationAmount,
    @JsonKey(name: "base_shipping_amount") this.baseShippingAmount,
    @JsonKey(name: "base_shipping_canceled") this.baseShippingCanceled,
    @JsonKey(name: "base_shipping_discount_amount")
    this.baseShippingDiscountAmount,
    @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
    this.baseShippingDiscountTaxCompensationAmnt,
    @JsonKey(name: "base_shipping_incl_tax") this.baseShippingInclTax,
    @JsonKey(name: "base_shipping_tax_amount") this.baseShippingTaxAmount,
    @JsonKey(name: "base_subtotal") this.baseSubtotal,
    @JsonKey(name: "base_subtotal_canceled") this.baseSubtotalCanceled,
    @JsonKey(name: "base_subtotal_incl_tax") this.baseSubtotalInclTax,
    @JsonKey(name: "base_tax_amount") this.baseTaxAmount,
    @JsonKey(name: "base_tax_canceled") this.baseTaxCanceled,
    @JsonKey(name: "base_total_canceled") this.baseTotalCanceled,
    @JsonKey(name: "base_total_due") this.baseTotalDue,
    @JsonKey(name: "base_to_global_rate") this.baseToGlobalRate,
    @JsonKey(name: "base_to_order_rate") this.baseToOrderRate,
    @JsonKey(name: "billing_address_id") this.billingAddressId,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    this.createdAt,
    @JsonKey(
      name: "customer_dob",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    this.customerDob,
    @JsonKey(name: "customer_email") this.customerEmail,
    @JsonKey(name: "customer_firstname") this.customerFirstname,
    @JsonKey(name: "customer_gender") this.customerGender,
    @JsonKey(name: "customer_group_id") this.customerGroupId,
    @JsonKey(name: "customer_id") this.customerId,
    @JsonKey(name: "customer_is_guest") this.customerIsGuest,
    @JsonKey(name: "customer_lastname") this.customerLastname,
    @JsonKey(name: "customer_note_notify") this.customerNoteNotify,
    @JsonKey(name: "discount_amount") this.discountAmount,
    @JsonKey(name: "discount_canceled") this.discountCanceled,
    @JsonKey(name: "email_sent") this.emailSent,
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "global_currency_code") this.globalCurrencyCode,
    @JsonKey(name: "grand_total") this.grandTotal,
    @JsonKey(name: "discount_tax_compensation_amount")
    this.discountTaxCompensationAmount,
    @JsonKey(name: "increment_id") this.incrementId,
    @JsonKey(name: "is_virtual") this.isVirtual,
    @JsonKey(name: "order_currency_code") this.orderCurrencyCode,
    @JsonKey(name: "protect_code") this.protectCode,
    @JsonKey(name: "quote_id") this.quoteId,
    @JsonKey(name: "remote_ip") this.remoteIp,
    @JsonKey(name: "shipping_amount") this.shippingAmount,
    @JsonKey(name: "shipping_canceled") this.shippingCanceled,
    @JsonKey(name: "shipping_description") this.shippingDescription,
    @JsonKey(name: "shipping_discount_amount") this.shippingDiscountAmount,
    @JsonKey(name: "shipping_discount_tax_compensation_amount")
    this.shippingDiscountTaxCompensationAmount,
    @JsonKey(name: "shipping_incl_tax") this.shippingInclTax,
    @JsonKey(name: "shipping_tax_amount") this.shippingTaxAmount,
    @JsonKey(name: "state") this.state,
    @JsonKey(name: "status") this.status,
    @JsonKey(name: "store_currency_code") this.storeCurrencyCode,
    @JsonKey(name: "store_id") this.storeId,
    @JsonKey(name: "store_name") this.storeName,
    @JsonKey(name: "store_to_base_rate") this.storeToBaseRate,
    @JsonKey(name: "store_to_order_rate") this.storeToOrderRate,
    @JsonKey(name: "subtotal") this.subtotal,
    @JsonKey(name: "subtotal_canceled") this.subtotalCanceled,
    @JsonKey(name: "subtotal_incl_tax") this.subtotalInclTax,
    @JsonKey(name: "tax_amount") this.taxAmount,
    @JsonKey(name: "tax_canceled") this.taxCanceled,
    @JsonKey(name: "total_canceled") this.totalCanceled,
    @JsonKey(name: "total_due") this.totalDue,
    @JsonKey(name: "total_item_count") this.totalItemCount,
    @JsonKey(name: "total_qty_ordered") this.totalQtyOrdered,
    @JsonKey(
      name: "updated_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    this.updatedAt,
    @JsonKey(name: "weight") this.weight,
    @JsonKey(name: "x_forwarded_for") this.xForwardedFor,
    @JsonKey(name: "items") final List<Item>? items,
    @JsonKey(name: "billing_address") this.billingAddress,
    @JsonKey(name: "payment") this.payment,
    @JsonKey(name: "status_histories")
    final List<StatusHistory>? statusHistories,
    @JsonKey(name: "extension_attributes") this.extensionAttributes,
  }) : _items = items,
       _statusHistories = statusHistories;

  factory _$OrderCancelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCancelResponseImplFromJson(json);

  @override
  @JsonKey(name: "base_currency_code")
  final String? baseCurrencyCode;
  @override
  @JsonKey(name: "base_discount_amount")
  final int? baseDiscountAmount;
  @override
  @JsonKey(name: "base_discount_canceled")
  final int? baseDiscountCanceled;
  @override
  @JsonKey(name: "base_grand_total")
  final int? baseGrandTotal;
  @override
  @JsonKey(name: "base_discount_tax_compensation_amount")
  final int? baseDiscountTaxCompensationAmount;
  @override
  @JsonKey(name: "base_shipping_amount")
  final int? baseShippingAmount;
  @override
  @JsonKey(name: "base_shipping_canceled")
  final int? baseShippingCanceled;
  @override
  @JsonKey(name: "base_shipping_discount_amount")
  final int? baseShippingDiscountAmount;
  @override
  @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
  final int? baseShippingDiscountTaxCompensationAmnt;
  @override
  @JsonKey(name: "base_shipping_incl_tax")
  final int? baseShippingInclTax;
  @override
  @JsonKey(name: "base_shipping_tax_amount")
  final int? baseShippingTaxAmount;
  @override
  @JsonKey(name: "base_subtotal")
  final int? baseSubtotal;
  @override
  @JsonKey(name: "base_subtotal_canceled")
  final int? baseSubtotalCanceled;
  @override
  @JsonKey(name: "base_subtotal_incl_tax")
  final int? baseSubtotalInclTax;
  @override
  @JsonKey(name: "base_tax_amount")
  final int? baseTaxAmount;
  @override
  @JsonKey(name: "base_tax_canceled")
  final int? baseTaxCanceled;
  @override
  @JsonKey(name: "base_total_canceled")
  final int? baseTotalCanceled;
  @override
  @JsonKey(name: "base_total_due")
  final int? baseTotalDue;
  @override
  @JsonKey(name: "base_to_global_rate")
  final int? baseToGlobalRate;
  @override
  @JsonKey(name: "base_to_order_rate")
  final int? baseToOrderRate;
  @override
  @JsonKey(name: "billing_address_id")
  final int? billingAddressId;
  @override
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  final DateTime? createdAt;
  @override
  @JsonKey(
    name: "customer_dob",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  final DateTime? customerDob;
  @override
  @JsonKey(name: "customer_email")
  final String? customerEmail;
  @override
  @JsonKey(name: "customer_firstname")
  final String? customerFirstname;
  @override
  @JsonKey(name: "customer_gender")
  final int? customerGender;
  @override
  @JsonKey(name: "customer_group_id")
  final int? customerGroupId;
  @override
  @JsonKey(name: "customer_id")
  final int? customerId;
  @override
  @JsonKey(name: "customer_is_guest")
  final int? customerIsGuest;
  @override
  @JsonKey(name: "customer_lastname")
  final String? customerLastname;
  @override
  @JsonKey(name: "customer_note_notify")
  final int? customerNoteNotify;
  @override
  @JsonKey(name: "discount_amount")
  final int? discountAmount;
  @override
  @JsonKey(name: "discount_canceled")
  final int? discountCanceled;
  @override
  @JsonKey(name: "email_sent")
  final int? emailSent;
  @override
  @JsonKey(name: "entity_id")
  final int? entityId;
  @override
  @JsonKey(name: "global_currency_code")
  final String? globalCurrencyCode;
  @override
  @JsonKey(name: "grand_total")
  final int? grandTotal;
  @override
  @JsonKey(name: "discount_tax_compensation_amount")
  final int? discountTaxCompensationAmount;
  @override
  @JsonKey(name: "increment_id")
  final String? incrementId;
  @override
  @JsonKey(name: "is_virtual")
  final int? isVirtual;
  @override
  @JsonKey(name: "order_currency_code")
  final String? orderCurrencyCode;
  @override
  @JsonKey(name: "protect_code")
  final String? protectCode;
  @override
  @JsonKey(name: "quote_id")
  final int? quoteId;
  @override
  @JsonKey(name: "remote_ip")
  final String? remoteIp;
  @override
  @JsonKey(name: "shipping_amount")
  final int? shippingAmount;
  @override
  @JsonKey(name: "shipping_canceled")
  final int? shippingCanceled;
  @override
  @JsonKey(name: "shipping_description")
  final String? shippingDescription;
  @override
  @JsonKey(name: "shipping_discount_amount")
  final int? shippingDiscountAmount;
  @override
  @JsonKey(name: "shipping_discount_tax_compensation_amount")
  final int? shippingDiscountTaxCompensationAmount;
  @override
  @JsonKey(name: "shipping_incl_tax")
  final int? shippingInclTax;
  @override
  @JsonKey(name: "shipping_tax_amount")
  final int? shippingTaxAmount;
  @override
  @JsonKey(name: "state")
  final String? state;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "store_currency_code")
  final String? storeCurrencyCode;
  @override
  @JsonKey(name: "store_id")
  final int? storeId;
  @override
  @JsonKey(name: "store_name")
  final String? storeName;
  @override
  @JsonKey(name: "store_to_base_rate")
  final int? storeToBaseRate;
  @override
  @JsonKey(name: "store_to_order_rate")
  final int? storeToOrderRate;
  @override
  @JsonKey(name: "subtotal")
  final int? subtotal;
  @override
  @JsonKey(name: "subtotal_canceled")
  final int? subtotalCanceled;
  @override
  @JsonKey(name: "subtotal_incl_tax")
  final int? subtotalInclTax;
  @override
  @JsonKey(name: "tax_amount")
  final int? taxAmount;
  @override
  @JsonKey(name: "tax_canceled")
  final int? taxCanceled;
  @override
  @JsonKey(name: "total_canceled")
  final int? totalCanceled;
  @override
  @JsonKey(name: "total_due")
  final int? totalDue;
  @override
  @JsonKey(name: "total_item_count")
  final int? totalItemCount;
  @override
  @JsonKey(name: "total_qty_ordered")
  final int? totalQtyOrdered;
  @override
  @JsonKey(
    name: "updated_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "weight")
  final double? weight;
  @override
  @JsonKey(name: "x_forwarded_for")
  final String? xForwardedFor;
  final List<Item>? _items;
  @override
  @JsonKey(name: "items")
  List<Item>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "billing_address")
  final Address? billingAddress;
  @override
  @JsonKey(name: "payment")
  final Payment? payment;
  final List<StatusHistory>? _statusHistories;
  @override
  @JsonKey(name: "status_histories")
  List<StatusHistory>? get statusHistories {
    final value = _statusHistories;
    if (value == null) return null;
    if (_statusHistories is EqualUnmodifiableListView) return _statusHistories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "extension_attributes")
  final ExtensionAttributes? extensionAttributes;

  @override
  String toString() {
    return 'OrderCancelResponse(baseCurrencyCode: $baseCurrencyCode, baseDiscountAmount: $baseDiscountAmount, baseDiscountCanceled: $baseDiscountCanceled, baseGrandTotal: $baseGrandTotal, baseDiscountTaxCompensationAmount: $baseDiscountTaxCompensationAmount, baseShippingAmount: $baseShippingAmount, baseShippingCanceled: $baseShippingCanceled, baseShippingDiscountAmount: $baseShippingDiscountAmount, baseShippingDiscountTaxCompensationAmnt: $baseShippingDiscountTaxCompensationAmnt, baseShippingInclTax: $baseShippingInclTax, baseShippingTaxAmount: $baseShippingTaxAmount, baseSubtotal: $baseSubtotal, baseSubtotalCanceled: $baseSubtotalCanceled, baseSubtotalInclTax: $baseSubtotalInclTax, baseTaxAmount: $baseTaxAmount, baseTaxCanceled: $baseTaxCanceled, baseTotalCanceled: $baseTotalCanceled, baseTotalDue: $baseTotalDue, baseToGlobalRate: $baseToGlobalRate, baseToOrderRate: $baseToOrderRate, billingAddressId: $billingAddressId, createdAt: $createdAt, customerDob: $customerDob, customerEmail: $customerEmail, customerFirstname: $customerFirstname, customerGender: $customerGender, customerGroupId: $customerGroupId, customerId: $customerId, customerIsGuest: $customerIsGuest, customerLastname: $customerLastname, customerNoteNotify: $customerNoteNotify, discountAmount: $discountAmount, discountCanceled: $discountCanceled, emailSent: $emailSent, entityId: $entityId, globalCurrencyCode: $globalCurrencyCode, grandTotal: $grandTotal, discountTaxCompensationAmount: $discountTaxCompensationAmount, incrementId: $incrementId, isVirtual: $isVirtual, orderCurrencyCode: $orderCurrencyCode, protectCode: $protectCode, quoteId: $quoteId, remoteIp: $remoteIp, shippingAmount: $shippingAmount, shippingCanceled: $shippingCanceled, shippingDescription: $shippingDescription, shippingDiscountAmount: $shippingDiscountAmount, shippingDiscountTaxCompensationAmount: $shippingDiscountTaxCompensationAmount, shippingInclTax: $shippingInclTax, shippingTaxAmount: $shippingTaxAmount, state: $state, status: $status, storeCurrencyCode: $storeCurrencyCode, storeId: $storeId, storeName: $storeName, storeToBaseRate: $storeToBaseRate, storeToOrderRate: $storeToOrderRate, subtotal: $subtotal, subtotalCanceled: $subtotalCanceled, subtotalInclTax: $subtotalInclTax, taxAmount: $taxAmount, taxCanceled: $taxCanceled, totalCanceled: $totalCanceled, totalDue: $totalDue, totalItemCount: $totalItemCount, totalQtyOrdered: $totalQtyOrdered, updatedAt: $updatedAt, weight: $weight, xForwardedFor: $xForwardedFor, items: $items, billingAddress: $billingAddress, payment: $payment, statusHistories: $statusHistories, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCancelResponseImpl &&
            (identical(other.baseCurrencyCode, baseCurrencyCode) ||
                other.baseCurrencyCode == baseCurrencyCode) &&
            (identical(other.baseDiscountAmount, baseDiscountAmount) ||
                other.baseDiscountAmount == baseDiscountAmount) &&
            (identical(other.baseDiscountCanceled, baseDiscountCanceled) ||
                other.baseDiscountCanceled == baseDiscountCanceled) &&
            (identical(other.baseGrandTotal, baseGrandTotal) ||
                other.baseGrandTotal == baseGrandTotal) &&
            (identical(
                  other.baseDiscountTaxCompensationAmount,
                  baseDiscountTaxCompensationAmount,
                ) ||
                other.baseDiscountTaxCompensationAmount ==
                    baseDiscountTaxCompensationAmount) &&
            (identical(other.baseShippingAmount, baseShippingAmount) ||
                other.baseShippingAmount == baseShippingAmount) &&
            (identical(other.baseShippingCanceled, baseShippingCanceled) ||
                other.baseShippingCanceled == baseShippingCanceled) &&
            (identical(
                  other.baseShippingDiscountAmount,
                  baseShippingDiscountAmount,
                ) ||
                other.baseShippingDiscountAmount ==
                    baseShippingDiscountAmount) &&
            (identical(
                  other.baseShippingDiscountTaxCompensationAmnt,
                  baseShippingDiscountTaxCompensationAmnt,
                ) ||
                other.baseShippingDiscountTaxCompensationAmnt ==
                    baseShippingDiscountTaxCompensationAmnt) &&
            (identical(other.baseShippingInclTax, baseShippingInclTax) ||
                other.baseShippingInclTax == baseShippingInclTax) &&
            (identical(other.baseShippingTaxAmount, baseShippingTaxAmount) ||
                other.baseShippingTaxAmount == baseShippingTaxAmount) &&
            (identical(other.baseSubtotal, baseSubtotal) ||
                other.baseSubtotal == baseSubtotal) &&
            (identical(other.baseSubtotalCanceled, baseSubtotalCanceled) ||
                other.baseSubtotalCanceled == baseSubtotalCanceled) &&
            (identical(other.baseSubtotalInclTax, baseSubtotalInclTax) ||
                other.baseSubtotalInclTax == baseSubtotalInclTax) &&
            (identical(other.baseTaxAmount, baseTaxAmount) ||
                other.baseTaxAmount == baseTaxAmount) &&
            (identical(other.baseTaxCanceled, baseTaxCanceled) ||
                other.baseTaxCanceled == baseTaxCanceled) &&
            (identical(other.baseTotalCanceled, baseTotalCanceled) ||
                other.baseTotalCanceled == baseTotalCanceled) &&
            (identical(other.baseTotalDue, baseTotalDue) ||
                other.baseTotalDue == baseTotalDue) &&
            (identical(other.baseToGlobalRate, baseToGlobalRate) ||
                other.baseToGlobalRate == baseToGlobalRate) &&
            (identical(other.baseToOrderRate, baseToOrderRate) ||
                other.baseToOrderRate == baseToOrderRate) &&
            (identical(other.billingAddressId, billingAddressId) ||
                other.billingAddressId == billingAddressId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.customerDob, customerDob) ||
                other.customerDob == customerDob) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.customerFirstname, customerFirstname) ||
                other.customerFirstname == customerFirstname) &&
            (identical(other.customerGender, customerGender) ||
                other.customerGender == customerGender) &&
            (identical(other.customerGroupId, customerGroupId) ||
                other.customerGroupId == customerGroupId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerIsGuest, customerIsGuest) ||
                other.customerIsGuest == customerIsGuest) &&
            (identical(other.customerLastname, customerLastname) ||
                other.customerLastname == customerLastname) &&
            (identical(other.customerNoteNotify, customerNoteNotify) ||
                other.customerNoteNotify == customerNoteNotify) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.discountCanceled, discountCanceled) ||
                other.discountCanceled == discountCanceled) &&
            (identical(other.emailSent, emailSent) ||
                other.emailSent == emailSent) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.globalCurrencyCode, globalCurrencyCode) ||
                other.globalCurrencyCode == globalCurrencyCode) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(
                  other.discountTaxCompensationAmount,
                  discountTaxCompensationAmount,
                ) ||
                other.discountTaxCompensationAmount ==
                    discountTaxCompensationAmount) &&
            (identical(other.incrementId, incrementId) ||
                other.incrementId == incrementId) &&
            (identical(other.isVirtual, isVirtual) ||
                other.isVirtual == isVirtual) &&
            (identical(other.orderCurrencyCode, orderCurrencyCode) ||
                other.orderCurrencyCode == orderCurrencyCode) &&
            (identical(other.protectCode, protectCode) ||
                other.protectCode == protectCode) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.remoteIp, remoteIp) ||
                other.remoteIp == remoteIp) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount) &&
            (identical(other.shippingCanceled, shippingCanceled) ||
                other.shippingCanceled == shippingCanceled) &&
            (identical(other.shippingDescription, shippingDescription) ||
                other.shippingDescription == shippingDescription) &&
            (identical(other.shippingDiscountAmount, shippingDiscountAmount) ||
                other.shippingDiscountAmount == shippingDiscountAmount) &&
            (identical(
                  other.shippingDiscountTaxCompensationAmount,
                  shippingDiscountTaxCompensationAmount,
                ) ||
                other.shippingDiscountTaxCompensationAmount ==
                    shippingDiscountTaxCompensationAmount) &&
            (identical(other.shippingInclTax, shippingInclTax) ||
                other.shippingInclTax == shippingInclTax) &&
            (identical(other.shippingTaxAmount, shippingTaxAmount) ||
                other.shippingTaxAmount == shippingTaxAmount) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.storeCurrencyCode, storeCurrencyCode) ||
                other.storeCurrencyCode == storeCurrencyCode) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.storeToBaseRate, storeToBaseRate) ||
                other.storeToBaseRate == storeToBaseRate) &&
            (identical(other.storeToOrderRate, storeToOrderRate) ||
                other.storeToOrderRate == storeToOrderRate) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.subtotalCanceled, subtotalCanceled) ||
                other.subtotalCanceled == subtotalCanceled) &&
            (identical(other.subtotalInclTax, subtotalInclTax) ||
                other.subtotalInclTax == subtotalInclTax) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.taxCanceled, taxCanceled) ||
                other.taxCanceled == taxCanceled) &&
            (identical(other.totalCanceled, totalCanceled) ||
                other.totalCanceled == totalCanceled) &&
            (identical(other.totalDue, totalDue) ||
                other.totalDue == totalDue) &&
            (identical(other.totalItemCount, totalItemCount) ||
                other.totalItemCount == totalItemCount) &&
            (identical(other.totalQtyOrdered, totalQtyOrdered) ||
                other.totalQtyOrdered == totalQtyOrdered) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.xForwardedFor, xForwardedFor) ||
                other.xForwardedFor == xForwardedFor) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            const DeepCollectionEquality().equals(
              other._statusHistories,
              _statusHistories,
            ) &&
            (identical(other.extensionAttributes, extensionAttributes) ||
                other.extensionAttributes == extensionAttributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    baseCurrencyCode,
    baseDiscountAmount,
    baseDiscountCanceled,
    baseGrandTotal,
    baseDiscountTaxCompensationAmount,
    baseShippingAmount,
    baseShippingCanceled,
    baseShippingDiscountAmount,
    baseShippingDiscountTaxCompensationAmnt,
    baseShippingInclTax,
    baseShippingTaxAmount,
    baseSubtotal,
    baseSubtotalCanceled,
    baseSubtotalInclTax,
    baseTaxAmount,
    baseTaxCanceled,
    baseTotalCanceled,
    baseTotalDue,
    baseToGlobalRate,
    baseToOrderRate,
    billingAddressId,
    createdAt,
    customerDob,
    customerEmail,
    customerFirstname,
    customerGender,
    customerGroupId,
    customerId,
    customerIsGuest,
    customerLastname,
    customerNoteNotify,
    discountAmount,
    discountCanceled,
    emailSent,
    entityId,
    globalCurrencyCode,
    grandTotal,
    discountTaxCompensationAmount,
    incrementId,
    isVirtual,
    orderCurrencyCode,
    protectCode,
    quoteId,
    remoteIp,
    shippingAmount,
    shippingCanceled,
    shippingDescription,
    shippingDiscountAmount,
    shippingDiscountTaxCompensationAmount,
    shippingInclTax,
    shippingTaxAmount,
    state,
    status,
    storeCurrencyCode,
    storeId,
    storeName,
    storeToBaseRate,
    storeToOrderRate,
    subtotal,
    subtotalCanceled,
    subtotalInclTax,
    taxAmount,
    taxCanceled,
    totalCanceled,
    totalDue,
    totalItemCount,
    totalQtyOrdered,
    updatedAt,
    weight,
    xForwardedFor,
    const DeepCollectionEquality().hash(_items),
    billingAddress,
    payment,
    const DeepCollectionEquality().hash(_statusHistories),
    extensionAttributes,
  ]);

  /// Create a copy of OrderCancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCancelResponseImplCopyWith<_$OrderCancelResponseImpl> get copyWith =>
      __$$OrderCancelResponseImplCopyWithImpl<_$OrderCancelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCancelResponseImplToJson(this);
  }
}

abstract class _OrderCancelResponse implements OrderCancelResponse {
  const factory _OrderCancelResponse({
    @JsonKey(name: "base_currency_code") final String? baseCurrencyCode,
    @JsonKey(name: "base_discount_amount") final int? baseDiscountAmount,
    @JsonKey(name: "base_discount_canceled") final int? baseDiscountCanceled,
    @JsonKey(name: "base_grand_total") final int? baseGrandTotal,
    @JsonKey(name: "base_discount_tax_compensation_amount")
    final int? baseDiscountTaxCompensationAmount,
    @JsonKey(name: "base_shipping_amount") final int? baseShippingAmount,
    @JsonKey(name: "base_shipping_canceled") final int? baseShippingCanceled,
    @JsonKey(name: "base_shipping_discount_amount")
    final int? baseShippingDiscountAmount,
    @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
    final int? baseShippingDiscountTaxCompensationAmnt,
    @JsonKey(name: "base_shipping_incl_tax") final int? baseShippingInclTax,
    @JsonKey(name: "base_shipping_tax_amount") final int? baseShippingTaxAmount,
    @JsonKey(name: "base_subtotal") final int? baseSubtotal,
    @JsonKey(name: "base_subtotal_canceled") final int? baseSubtotalCanceled,
    @JsonKey(name: "base_subtotal_incl_tax") final int? baseSubtotalInclTax,
    @JsonKey(name: "base_tax_amount") final int? baseTaxAmount,
    @JsonKey(name: "base_tax_canceled") final int? baseTaxCanceled,
    @JsonKey(name: "base_total_canceled") final int? baseTotalCanceled,
    @JsonKey(name: "base_total_due") final int? baseTotalDue,
    @JsonKey(name: "base_to_global_rate") final int? baseToGlobalRate,
    @JsonKey(name: "base_to_order_rate") final int? baseToOrderRate,
    @JsonKey(name: "billing_address_id") final int? billingAddressId,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    final DateTime? createdAt,
    @JsonKey(
      name: "customer_dob",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    final DateTime? customerDob,
    @JsonKey(name: "customer_email") final String? customerEmail,
    @JsonKey(name: "customer_firstname") final String? customerFirstname,
    @JsonKey(name: "customer_gender") final int? customerGender,
    @JsonKey(name: "customer_group_id") final int? customerGroupId,
    @JsonKey(name: "customer_id") final int? customerId,
    @JsonKey(name: "customer_is_guest") final int? customerIsGuest,
    @JsonKey(name: "customer_lastname") final String? customerLastname,
    @JsonKey(name: "customer_note_notify") final int? customerNoteNotify,
    @JsonKey(name: "discount_amount") final int? discountAmount,
    @JsonKey(name: "discount_canceled") final int? discountCanceled,
    @JsonKey(name: "email_sent") final int? emailSent,
    @JsonKey(name: "entity_id") final int? entityId,
    @JsonKey(name: "global_currency_code") final String? globalCurrencyCode,
    @JsonKey(name: "grand_total") final int? grandTotal,
    @JsonKey(name: "discount_tax_compensation_amount")
    final int? discountTaxCompensationAmount,
    @JsonKey(name: "increment_id") final String? incrementId,
    @JsonKey(name: "is_virtual") final int? isVirtual,
    @JsonKey(name: "order_currency_code") final String? orderCurrencyCode,
    @JsonKey(name: "protect_code") final String? protectCode,
    @JsonKey(name: "quote_id") final int? quoteId,
    @JsonKey(name: "remote_ip") final String? remoteIp,
    @JsonKey(name: "shipping_amount") final int? shippingAmount,
    @JsonKey(name: "shipping_canceled") final int? shippingCanceled,
    @JsonKey(name: "shipping_description") final String? shippingDescription,
    @JsonKey(name: "shipping_discount_amount")
    final int? shippingDiscountAmount,
    @JsonKey(name: "shipping_discount_tax_compensation_amount")
    final int? shippingDiscountTaxCompensationAmount,
    @JsonKey(name: "shipping_incl_tax") final int? shippingInclTax,
    @JsonKey(name: "shipping_tax_amount") final int? shippingTaxAmount,
    @JsonKey(name: "state") final String? state,
    @JsonKey(name: "status") final String? status,
    @JsonKey(name: "store_currency_code") final String? storeCurrencyCode,
    @JsonKey(name: "store_id") final int? storeId,
    @JsonKey(name: "store_name") final String? storeName,
    @JsonKey(name: "store_to_base_rate") final int? storeToBaseRate,
    @JsonKey(name: "store_to_order_rate") final int? storeToOrderRate,
    @JsonKey(name: "subtotal") final int? subtotal,
    @JsonKey(name: "subtotal_canceled") final int? subtotalCanceled,
    @JsonKey(name: "subtotal_incl_tax") final int? subtotalInclTax,
    @JsonKey(name: "tax_amount") final int? taxAmount,
    @JsonKey(name: "tax_canceled") final int? taxCanceled,
    @JsonKey(name: "total_canceled") final int? totalCanceled,
    @JsonKey(name: "total_due") final int? totalDue,
    @JsonKey(name: "total_item_count") final int? totalItemCount,
    @JsonKey(name: "total_qty_ordered") final int? totalQtyOrdered,
    @JsonKey(
      name: "updated_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    final DateTime? updatedAt,
    @JsonKey(name: "weight") final double? weight,
    @JsonKey(name: "x_forwarded_for") final String? xForwardedFor,
    @JsonKey(name: "items") final List<Item>? items,
    @JsonKey(name: "billing_address") final Address? billingAddress,
    @JsonKey(name: "payment") final Payment? payment,
    @JsonKey(name: "status_histories")
    final List<StatusHistory>? statusHistories,
    @JsonKey(name: "extension_attributes")
    final ExtensionAttributes? extensionAttributes,
  }) = _$OrderCancelResponseImpl;

  factory _OrderCancelResponse.fromJson(Map<String, dynamic> json) =
      _$OrderCancelResponseImpl.fromJson;

  @override
  @JsonKey(name: "base_currency_code")
  String? get baseCurrencyCode;
  @override
  @JsonKey(name: "base_discount_amount")
  int? get baseDiscountAmount;
  @override
  @JsonKey(name: "base_discount_canceled")
  int? get baseDiscountCanceled;
  @override
  @JsonKey(name: "base_grand_total")
  int? get baseGrandTotal;
  @override
  @JsonKey(name: "base_discount_tax_compensation_amount")
  int? get baseDiscountTaxCompensationAmount;
  @override
  @JsonKey(name: "base_shipping_amount")
  int? get baseShippingAmount;
  @override
  @JsonKey(name: "base_shipping_canceled")
  int? get baseShippingCanceled;
  @override
  @JsonKey(name: "base_shipping_discount_amount")
  int? get baseShippingDiscountAmount;
  @override
  @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
  int? get baseShippingDiscountTaxCompensationAmnt;
  @override
  @JsonKey(name: "base_shipping_incl_tax")
  int? get baseShippingInclTax;
  @override
  @JsonKey(name: "base_shipping_tax_amount")
  int? get baseShippingTaxAmount;
  @override
  @JsonKey(name: "base_subtotal")
  int? get baseSubtotal;
  @override
  @JsonKey(name: "base_subtotal_canceled")
  int? get baseSubtotalCanceled;
  @override
  @JsonKey(name: "base_subtotal_incl_tax")
  int? get baseSubtotalInclTax;
  @override
  @JsonKey(name: "base_tax_amount")
  int? get baseTaxAmount;
  @override
  @JsonKey(name: "base_tax_canceled")
  int? get baseTaxCanceled;
  @override
  @JsonKey(name: "base_total_canceled")
  int? get baseTotalCanceled;
  @override
  @JsonKey(name: "base_total_due")
  int? get baseTotalDue;
  @override
  @JsonKey(name: "base_to_global_rate")
  int? get baseToGlobalRate;
  @override
  @JsonKey(name: "base_to_order_rate")
  int? get baseToOrderRate;
  @override
  @JsonKey(name: "billing_address_id")
  int? get billingAddressId;
  @override
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get createdAt;
  @override
  @JsonKey(
    name: "customer_dob",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get customerDob;
  @override
  @JsonKey(name: "customer_email")
  String? get customerEmail;
  @override
  @JsonKey(name: "customer_firstname")
  String? get customerFirstname;
  @override
  @JsonKey(name: "customer_gender")
  int? get customerGender;
  @override
  @JsonKey(name: "customer_group_id")
  int? get customerGroupId;
  @override
  @JsonKey(name: "customer_id")
  int? get customerId;
  @override
  @JsonKey(name: "customer_is_guest")
  int? get customerIsGuest;
  @override
  @JsonKey(name: "customer_lastname")
  String? get customerLastname;
  @override
  @JsonKey(name: "customer_note_notify")
  int? get customerNoteNotify;
  @override
  @JsonKey(name: "discount_amount")
  int? get discountAmount;
  @override
  @JsonKey(name: "discount_canceled")
  int? get discountCanceled;
  @override
  @JsonKey(name: "email_sent")
  int? get emailSent;
  @override
  @JsonKey(name: "entity_id")
  int? get entityId;
  @override
  @JsonKey(name: "global_currency_code")
  String? get globalCurrencyCode;
  @override
  @JsonKey(name: "grand_total")
  int? get grandTotal;
  @override
  @JsonKey(name: "discount_tax_compensation_amount")
  int? get discountTaxCompensationAmount;
  @override
  @JsonKey(name: "increment_id")
  String? get incrementId;
  @override
  @JsonKey(name: "is_virtual")
  int? get isVirtual;
  @override
  @JsonKey(name: "order_currency_code")
  String? get orderCurrencyCode;
  @override
  @JsonKey(name: "protect_code")
  String? get protectCode;
  @override
  @JsonKey(name: "quote_id")
  int? get quoteId;
  @override
  @JsonKey(name: "remote_ip")
  String? get remoteIp;
  @override
  @JsonKey(name: "shipping_amount")
  int? get shippingAmount;
  @override
  @JsonKey(name: "shipping_canceled")
  int? get shippingCanceled;
  @override
  @JsonKey(name: "shipping_description")
  String? get shippingDescription;
  @override
  @JsonKey(name: "shipping_discount_amount")
  int? get shippingDiscountAmount;
  @override
  @JsonKey(name: "shipping_discount_tax_compensation_amount")
  int? get shippingDiscountTaxCompensationAmount;
  @override
  @JsonKey(name: "shipping_incl_tax")
  int? get shippingInclTax;
  @override
  @JsonKey(name: "shipping_tax_amount")
  int? get shippingTaxAmount;
  @override
  @JsonKey(name: "state")
  String? get state;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "store_currency_code")
  String? get storeCurrencyCode;
  @override
  @JsonKey(name: "store_id")
  int? get storeId;
  @override
  @JsonKey(name: "store_name")
  String? get storeName;
  @override
  @JsonKey(name: "store_to_base_rate")
  int? get storeToBaseRate;
  @override
  @JsonKey(name: "store_to_order_rate")
  int? get storeToOrderRate;
  @override
  @JsonKey(name: "subtotal")
  int? get subtotal;
  @override
  @JsonKey(name: "subtotal_canceled")
  int? get subtotalCanceled;
  @override
  @JsonKey(name: "subtotal_incl_tax")
  int? get subtotalInclTax;
  @override
  @JsonKey(name: "tax_amount")
  int? get taxAmount;
  @override
  @JsonKey(name: "tax_canceled")
  int? get taxCanceled;
  @override
  @JsonKey(name: "total_canceled")
  int? get totalCanceled;
  @override
  @JsonKey(name: "total_due")
  int? get totalDue;
  @override
  @JsonKey(name: "total_item_count")
  int? get totalItemCount;
  @override
  @JsonKey(name: "total_qty_ordered")
  int? get totalQtyOrdered;
  @override
  @JsonKey(
    name: "updated_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "weight")
  double? get weight;
  @override
  @JsonKey(name: "x_forwarded_for")
  String? get xForwardedFor;
  @override
  @JsonKey(name: "items")
  List<Item>? get items;
  @override
  @JsonKey(name: "billing_address")
  Address? get billingAddress;
  @override
  @JsonKey(name: "payment")
  Payment? get payment;
  @override
  @JsonKey(name: "status_histories")
  List<StatusHistory>? get statusHistories;
  @override
  @JsonKey(name: "extension_attributes")
  ExtensionAttributes? get extensionAttributes;

  /// Create a copy of OrderCancelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCancelResponseImplCopyWith<_$OrderCancelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  @JsonKey(name: "address_type")
  String? get addressType => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "country_id")
  String? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "entity_id")
  int? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "firstname")
  String? get firstname => throw _privateConstructorUsedError;
  @JsonKey(name: "lastname")
  String? get lastname => throw _privateConstructorUsedError;
  @JsonKey(name: "parent_id")
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "postcode")
  String? get postcode => throw _privateConstructorUsedError;
  @JsonKey(name: "region")
  String? get region => throw _privateConstructorUsedError;
  @JsonKey(name: "region_code")
  String? get regionCode => throw _privateConstructorUsedError;
  @JsonKey(name: "region_id")
  int? get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: "street")
  List<String>? get street => throw _privateConstructorUsedError;
  @JsonKey(name: "telephone")
  String? get telephone => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call({
    @JsonKey(name: "address_type") String? addressType,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "region_code") String? regionCode,
    @JsonKey(name: "region_id") int? regionId,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "telephone") String? telephone,
  });
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressType = freezed,
    Object? city = freezed,
    Object? countryId = freezed,
    Object? email = freezed,
    Object? entityId = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? parentId = freezed,
    Object? postcode = freezed,
    Object? region = freezed,
    Object? regionCode = freezed,
    Object? regionId = freezed,
    Object? street = freezed,
    Object? telephone = freezed,
  }) {
    return _then(
      _value.copyWith(
            addressType:
                freezed == addressType
                    ? _value.addressType
                    : addressType // ignore: cast_nullable_to_non_nullable
                        as String?,
            city:
                freezed == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as String?,
            countryId:
                freezed == countryId
                    ? _value.countryId
                    : countryId // ignore: cast_nullable_to_non_nullable
                        as String?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            entityId:
                freezed == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as int?,
            firstname:
                freezed == firstname
                    ? _value.firstname
                    : firstname // ignore: cast_nullable_to_non_nullable
                        as String?,
            lastname:
                freezed == lastname
                    ? _value.lastname
                    : lastname // ignore: cast_nullable_to_non_nullable
                        as String?,
            parentId:
                freezed == parentId
                    ? _value.parentId
                    : parentId // ignore: cast_nullable_to_non_nullable
                        as int?,
            postcode:
                freezed == postcode
                    ? _value.postcode
                    : postcode // ignore: cast_nullable_to_non_nullable
                        as String?,
            region:
                freezed == region
                    ? _value.region
                    : region // ignore: cast_nullable_to_non_nullable
                        as String?,
            regionCode:
                freezed == regionCode
                    ? _value.regionCode
                    : regionCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            regionId:
                freezed == regionId
                    ? _value.regionId
                    : regionId // ignore: cast_nullable_to_non_nullable
                        as int?,
            street:
                freezed == street
                    ? _value.street
                    : street // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            telephone:
                freezed == telephone
                    ? _value.telephone
                    : telephone // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
    _$AddressImpl value,
    $Res Function(_$AddressImpl) then,
  ) = __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "address_type") String? addressType,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "region_code") String? regionCode,
    @JsonKey(name: "region_id") int? regionId,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "telephone") String? telephone,
  });
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
    _$AddressImpl _value,
    $Res Function(_$AddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressType = freezed,
    Object? city = freezed,
    Object? countryId = freezed,
    Object? email = freezed,
    Object? entityId = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? parentId = freezed,
    Object? postcode = freezed,
    Object? region = freezed,
    Object? regionCode = freezed,
    Object? regionId = freezed,
    Object? street = freezed,
    Object? telephone = freezed,
  }) {
    return _then(
      _$AddressImpl(
        addressType:
            freezed == addressType
                ? _value.addressType
                : addressType // ignore: cast_nullable_to_non_nullable
                    as String?,
        city:
            freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String?,
        countryId:
            freezed == countryId
                ? _value.countryId
                : countryId // ignore: cast_nullable_to_non_nullable
                    as String?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        entityId:
            freezed == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as int?,
        firstname:
            freezed == firstname
                ? _value.firstname
                : firstname // ignore: cast_nullable_to_non_nullable
                    as String?,
        lastname:
            freezed == lastname
                ? _value.lastname
                : lastname // ignore: cast_nullable_to_non_nullable
                    as String?,
        parentId:
            freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                    as int?,
        postcode:
            freezed == postcode
                ? _value.postcode
                : postcode // ignore: cast_nullable_to_non_nullable
                    as String?,
        region:
            freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                    as String?,
        regionCode:
            freezed == regionCode
                ? _value.regionCode
                : regionCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        regionId:
            freezed == regionId
                ? _value.regionId
                : regionId // ignore: cast_nullable_to_non_nullable
                    as int?,
        street:
            freezed == street
                ? _value._street
                : street // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        telephone:
            freezed == telephone
                ? _value.telephone
                : telephone // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl({
    @JsonKey(name: "address_type") this.addressType,
    @JsonKey(name: "city") this.city,
    @JsonKey(name: "country_id") this.countryId,
    @JsonKey(name: "email") this.email,
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "firstname") this.firstname,
    @JsonKey(name: "lastname") this.lastname,
    @JsonKey(name: "parent_id") this.parentId,
    @JsonKey(name: "postcode") this.postcode,
    @JsonKey(name: "region") this.region,
    @JsonKey(name: "region_code") this.regionCode,
    @JsonKey(name: "region_id") this.regionId,
    @JsonKey(name: "street") final List<String>? street,
    @JsonKey(name: "telephone") this.telephone,
  }) : _street = street;

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  @JsonKey(name: "address_type")
  final String? addressType;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "country_id")
  final String? countryId;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "entity_id")
  final int? entityId;
  @override
  @JsonKey(name: "firstname")
  final String? firstname;
  @override
  @JsonKey(name: "lastname")
  final String? lastname;
  @override
  @JsonKey(name: "parent_id")
  final int? parentId;
  @override
  @JsonKey(name: "postcode")
  final String? postcode;
  @override
  @JsonKey(name: "region")
  final String? region;
  @override
  @JsonKey(name: "region_code")
  final String? regionCode;
  @override
  @JsonKey(name: "region_id")
  final int? regionId;
  final List<String>? _street;
  @override
  @JsonKey(name: "street")
  List<String>? get street {
    final value = _street;
    if (value == null) return null;
    if (_street is EqualUnmodifiableListView) return _street;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "telephone")
  final String? telephone;

  @override
  String toString() {
    return 'Address(addressType: $addressType, city: $city, countryId: $countryId, email: $email, entityId: $entityId, firstname: $firstname, lastname: $lastname, parentId: $parentId, postcode: $postcode, region: $region, regionCode: $regionCode, regionId: $regionId, street: $street, telephone: $telephone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.addressType, addressType) ||
                other.addressType == addressType) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            const DeepCollectionEquality().equals(other._street, _street) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    addressType,
    city,
    countryId,
    email,
    entityId,
    firstname,
    lastname,
    parentId,
    postcode,
    region,
    regionCode,
    regionId,
    const DeepCollectionEquality().hash(_street),
    telephone,
  );

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(this);
  }
}

abstract class _Address implements Address {
  const factory _Address({
    @JsonKey(name: "address_type") final String? addressType,
    @JsonKey(name: "city") final String? city,
    @JsonKey(name: "country_id") final String? countryId,
    @JsonKey(name: "email") final String? email,
    @JsonKey(name: "entity_id") final int? entityId,
    @JsonKey(name: "firstname") final String? firstname,
    @JsonKey(name: "lastname") final String? lastname,
    @JsonKey(name: "parent_id") final int? parentId,
    @JsonKey(name: "postcode") final String? postcode,
    @JsonKey(name: "region") final String? region,
    @JsonKey(name: "region_code") final String? regionCode,
    @JsonKey(name: "region_id") final int? regionId,
    @JsonKey(name: "street") final List<String>? street,
    @JsonKey(name: "telephone") final String? telephone,
  }) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  @JsonKey(name: "address_type")
  String? get addressType;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "country_id")
  String? get countryId;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "entity_id")
  int? get entityId;
  @override
  @JsonKey(name: "firstname")
  String? get firstname;
  @override
  @JsonKey(name: "lastname")
  String? get lastname;
  @override
  @JsonKey(name: "parent_id")
  int? get parentId;
  @override
  @JsonKey(name: "postcode")
  String? get postcode;
  @override
  @JsonKey(name: "region")
  String? get region;
  @override
  @JsonKey(name: "region_code")
  String? get regionCode;
  @override
  @JsonKey(name: "region_id")
  int? get regionId;
  @override
  @JsonKey(name: "street")
  List<String>? get street;
  @override
  @JsonKey(name: "telephone")
  String? get telephone;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtensionAttributes _$ExtensionAttributesFromJson(Map<String, dynamic> json) {
  return _ExtensionAttributes.fromJson(json);
}

/// @nodoc
mixin _$ExtensionAttributes {
  @JsonKey(name: "shipping_assignments")
  List<ShippingAssignment>? get shippingAssignments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "payment_additional_info")
  List<PaymentAdditionalInfo>? get paymentAdditionalInfo =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "applied_taxes")
  List<dynamic>? get appliedTaxes => throw _privateConstructorUsedError;
  @JsonKey(name: "item_applied_taxes")
  List<dynamic>? get itemAppliedTaxes => throw _privateConstructorUsedError;
  @JsonKey(name: "rewards_discount")
  int? get rewardsDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "rewards_spend")
  int? get rewardsSpend => throw _privateConstructorUsedError;
  @JsonKey(name: "rewards_earn")
  int? get rewardsEarn => throw _privateConstructorUsedError;

  /// Serializes this ExtensionAttributes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionAttributesCopyWith<ExtensionAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionAttributesCopyWith<$Res> {
  factory $ExtensionAttributesCopyWith(
    ExtensionAttributes value,
    $Res Function(ExtensionAttributes) then,
  ) = _$ExtensionAttributesCopyWithImpl<$Res, ExtensionAttributes>;
  @useResult
  $Res call({
    @JsonKey(name: "shipping_assignments")
    List<ShippingAssignment>? shippingAssignments,
    @JsonKey(name: "payment_additional_info")
    List<PaymentAdditionalInfo>? paymentAdditionalInfo,
    @JsonKey(name: "applied_taxes") List<dynamic>? appliedTaxes,
    @JsonKey(name: "item_applied_taxes") List<dynamic>? itemAppliedTaxes,
    @JsonKey(name: "rewards_discount") int? rewardsDiscount,
    @JsonKey(name: "rewards_spend") int? rewardsSpend,
    @JsonKey(name: "rewards_earn") int? rewardsEarn,
  });
}

/// @nodoc
class _$ExtensionAttributesCopyWithImpl<$Res, $Val extends ExtensionAttributes>
    implements $ExtensionAttributesCopyWith<$Res> {
  _$ExtensionAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shippingAssignments = freezed,
    Object? paymentAdditionalInfo = freezed,
    Object? appliedTaxes = freezed,
    Object? itemAppliedTaxes = freezed,
    Object? rewardsDiscount = freezed,
    Object? rewardsSpend = freezed,
    Object? rewardsEarn = freezed,
  }) {
    return _then(
      _value.copyWith(
            shippingAssignments:
                freezed == shippingAssignments
                    ? _value.shippingAssignments
                    : shippingAssignments // ignore: cast_nullable_to_non_nullable
                        as List<ShippingAssignment>?,
            paymentAdditionalInfo:
                freezed == paymentAdditionalInfo
                    ? _value.paymentAdditionalInfo
                    : paymentAdditionalInfo // ignore: cast_nullable_to_non_nullable
                        as List<PaymentAdditionalInfo>?,
            appliedTaxes:
                freezed == appliedTaxes
                    ? _value.appliedTaxes
                    : appliedTaxes // ignore: cast_nullable_to_non_nullable
                        as List<dynamic>?,
            itemAppliedTaxes:
                freezed == itemAppliedTaxes
                    ? _value.itemAppliedTaxes
                    : itemAppliedTaxes // ignore: cast_nullable_to_non_nullable
                        as List<dynamic>?,
            rewardsDiscount:
                freezed == rewardsDiscount
                    ? _value.rewardsDiscount
                    : rewardsDiscount // ignore: cast_nullable_to_non_nullable
                        as int?,
            rewardsSpend:
                freezed == rewardsSpend
                    ? _value.rewardsSpend
                    : rewardsSpend // ignore: cast_nullable_to_non_nullable
                        as int?,
            rewardsEarn:
                freezed == rewardsEarn
                    ? _value.rewardsEarn
                    : rewardsEarn // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExtensionAttributesImplCopyWith<$Res>
    implements $ExtensionAttributesCopyWith<$Res> {
  factory _$$ExtensionAttributesImplCopyWith(
    _$ExtensionAttributesImpl value,
    $Res Function(_$ExtensionAttributesImpl) then,
  ) = __$$ExtensionAttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "shipping_assignments")
    List<ShippingAssignment>? shippingAssignments,
    @JsonKey(name: "payment_additional_info")
    List<PaymentAdditionalInfo>? paymentAdditionalInfo,
    @JsonKey(name: "applied_taxes") List<dynamic>? appliedTaxes,
    @JsonKey(name: "item_applied_taxes") List<dynamic>? itemAppliedTaxes,
    @JsonKey(name: "rewards_discount") int? rewardsDiscount,
    @JsonKey(name: "rewards_spend") int? rewardsSpend,
    @JsonKey(name: "rewards_earn") int? rewardsEarn,
  });
}

/// @nodoc
class __$$ExtensionAttributesImplCopyWithImpl<$Res>
    extends _$ExtensionAttributesCopyWithImpl<$Res, _$ExtensionAttributesImpl>
    implements _$$ExtensionAttributesImplCopyWith<$Res> {
  __$$ExtensionAttributesImplCopyWithImpl(
    _$ExtensionAttributesImpl _value,
    $Res Function(_$ExtensionAttributesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shippingAssignments = freezed,
    Object? paymentAdditionalInfo = freezed,
    Object? appliedTaxes = freezed,
    Object? itemAppliedTaxes = freezed,
    Object? rewardsDiscount = freezed,
    Object? rewardsSpend = freezed,
    Object? rewardsEarn = freezed,
  }) {
    return _then(
      _$ExtensionAttributesImpl(
        shippingAssignments:
            freezed == shippingAssignments
                ? _value._shippingAssignments
                : shippingAssignments // ignore: cast_nullable_to_non_nullable
                    as List<ShippingAssignment>?,
        paymentAdditionalInfo:
            freezed == paymentAdditionalInfo
                ? _value._paymentAdditionalInfo
                : paymentAdditionalInfo // ignore: cast_nullable_to_non_nullable
                    as List<PaymentAdditionalInfo>?,
        appliedTaxes:
            freezed == appliedTaxes
                ? _value._appliedTaxes
                : appliedTaxes // ignore: cast_nullable_to_non_nullable
                    as List<dynamic>?,
        itemAppliedTaxes:
            freezed == itemAppliedTaxes
                ? _value._itemAppliedTaxes
                : itemAppliedTaxes // ignore: cast_nullable_to_non_nullable
                    as List<dynamic>?,
        rewardsDiscount:
            freezed == rewardsDiscount
                ? _value.rewardsDiscount
                : rewardsDiscount // ignore: cast_nullable_to_non_nullable
                    as int?,
        rewardsSpend:
            freezed == rewardsSpend
                ? _value.rewardsSpend
                : rewardsSpend // ignore: cast_nullable_to_non_nullable
                    as int?,
        rewardsEarn:
            freezed == rewardsEarn
                ? _value.rewardsEarn
                : rewardsEarn // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtensionAttributesImpl implements _ExtensionAttributes {
  const _$ExtensionAttributesImpl({
    @JsonKey(name: "shipping_assignments")
    final List<ShippingAssignment>? shippingAssignments,
    @JsonKey(name: "payment_additional_info")
    final List<PaymentAdditionalInfo>? paymentAdditionalInfo,
    @JsonKey(name: "applied_taxes") final List<dynamic>? appliedTaxes,
    @JsonKey(name: "item_applied_taxes") final List<dynamic>? itemAppliedTaxes,
    @JsonKey(name: "rewards_discount") this.rewardsDiscount,
    @JsonKey(name: "rewards_spend") this.rewardsSpend,
    @JsonKey(name: "rewards_earn") this.rewardsEarn,
  }) : _shippingAssignments = shippingAssignments,
       _paymentAdditionalInfo = paymentAdditionalInfo,
       _appliedTaxes = appliedTaxes,
       _itemAppliedTaxes = itemAppliedTaxes;

  factory _$ExtensionAttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtensionAttributesImplFromJson(json);

  final List<ShippingAssignment>? _shippingAssignments;
  @override
  @JsonKey(name: "shipping_assignments")
  List<ShippingAssignment>? get shippingAssignments {
    final value = _shippingAssignments;
    if (value == null) return null;
    if (_shippingAssignments is EqualUnmodifiableListView)
      return _shippingAssignments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PaymentAdditionalInfo>? _paymentAdditionalInfo;
  @override
  @JsonKey(name: "payment_additional_info")
  List<PaymentAdditionalInfo>? get paymentAdditionalInfo {
    final value = _paymentAdditionalInfo;
    if (value == null) return null;
    if (_paymentAdditionalInfo is EqualUnmodifiableListView)
      return _paymentAdditionalInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _appliedTaxes;
  @override
  @JsonKey(name: "applied_taxes")
  List<dynamic>? get appliedTaxes {
    final value = _appliedTaxes;
    if (value == null) return null;
    if (_appliedTaxes is EqualUnmodifiableListView) return _appliedTaxes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _itemAppliedTaxes;
  @override
  @JsonKey(name: "item_applied_taxes")
  List<dynamic>? get itemAppliedTaxes {
    final value = _itemAppliedTaxes;
    if (value == null) return null;
    if (_itemAppliedTaxes is EqualUnmodifiableListView)
      return _itemAppliedTaxes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "rewards_discount")
  final int? rewardsDiscount;
  @override
  @JsonKey(name: "rewards_spend")
  final int? rewardsSpend;
  @override
  @JsonKey(name: "rewards_earn")
  final int? rewardsEarn;

  @override
  String toString() {
    return 'ExtensionAttributes(shippingAssignments: $shippingAssignments, paymentAdditionalInfo: $paymentAdditionalInfo, appliedTaxes: $appliedTaxes, itemAppliedTaxes: $itemAppliedTaxes, rewardsDiscount: $rewardsDiscount, rewardsSpend: $rewardsSpend, rewardsEarn: $rewardsEarn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionAttributesImpl &&
            const DeepCollectionEquality().equals(
              other._shippingAssignments,
              _shippingAssignments,
            ) &&
            const DeepCollectionEquality().equals(
              other._paymentAdditionalInfo,
              _paymentAdditionalInfo,
            ) &&
            const DeepCollectionEquality().equals(
              other._appliedTaxes,
              _appliedTaxes,
            ) &&
            const DeepCollectionEquality().equals(
              other._itemAppliedTaxes,
              _itemAppliedTaxes,
            ) &&
            (identical(other.rewardsDiscount, rewardsDiscount) ||
                other.rewardsDiscount == rewardsDiscount) &&
            (identical(other.rewardsSpend, rewardsSpend) ||
                other.rewardsSpend == rewardsSpend) &&
            (identical(other.rewardsEarn, rewardsEarn) ||
                other.rewardsEarn == rewardsEarn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_shippingAssignments),
    const DeepCollectionEquality().hash(_paymentAdditionalInfo),
    const DeepCollectionEquality().hash(_appliedTaxes),
    const DeepCollectionEquality().hash(_itemAppliedTaxes),
    rewardsDiscount,
    rewardsSpend,
    rewardsEarn,
  );

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionAttributesImplCopyWith<_$ExtensionAttributesImpl> get copyWith =>
      __$$ExtensionAttributesImplCopyWithImpl<_$ExtensionAttributesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtensionAttributesImplToJson(this);
  }
}

abstract class _ExtensionAttributes implements ExtensionAttributes {
  const factory _ExtensionAttributes({
    @JsonKey(name: "shipping_assignments")
    final List<ShippingAssignment>? shippingAssignments,
    @JsonKey(name: "payment_additional_info")
    final List<PaymentAdditionalInfo>? paymentAdditionalInfo,
    @JsonKey(name: "applied_taxes") final List<dynamic>? appliedTaxes,
    @JsonKey(name: "item_applied_taxes") final List<dynamic>? itemAppliedTaxes,
    @JsonKey(name: "rewards_discount") final int? rewardsDiscount,
    @JsonKey(name: "rewards_spend") final int? rewardsSpend,
    @JsonKey(name: "rewards_earn") final int? rewardsEarn,
  }) = _$ExtensionAttributesImpl;

  factory _ExtensionAttributes.fromJson(Map<String, dynamic> json) =
      _$ExtensionAttributesImpl.fromJson;

  @override
  @JsonKey(name: "shipping_assignments")
  List<ShippingAssignment>? get shippingAssignments;
  @override
  @JsonKey(name: "payment_additional_info")
  List<PaymentAdditionalInfo>? get paymentAdditionalInfo;
  @override
  @JsonKey(name: "applied_taxes")
  List<dynamic>? get appliedTaxes;
  @override
  @JsonKey(name: "item_applied_taxes")
  List<dynamic>? get itemAppliedTaxes;
  @override
  @JsonKey(name: "rewards_discount")
  int? get rewardsDiscount;
  @override
  @JsonKey(name: "rewards_spend")
  int? get rewardsSpend;
  @override
  @JsonKey(name: "rewards_earn")
  int? get rewardsEarn;

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionAttributesImplCopyWith<_$ExtensionAttributesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentAdditionalInfo _$PaymentAdditionalInfoFromJson(
  Map<String, dynamic> json,
) {
  return _PaymentAdditionalInfo.fromJson(json);
}

/// @nodoc
mixin _$PaymentAdditionalInfo {
  @JsonKey(name: "key")
  String? get key => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  String? get value => throw _privateConstructorUsedError;

  /// Serializes this PaymentAdditionalInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentAdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentAdditionalInfoCopyWith<PaymentAdditionalInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentAdditionalInfoCopyWith<$Res> {
  factory $PaymentAdditionalInfoCopyWith(
    PaymentAdditionalInfo value,
    $Res Function(PaymentAdditionalInfo) then,
  ) = _$PaymentAdditionalInfoCopyWithImpl<$Res, PaymentAdditionalInfo>;
  @useResult
  $Res call({
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class _$PaymentAdditionalInfoCopyWithImpl<
  $Res,
  $Val extends PaymentAdditionalInfo
>
    implements $PaymentAdditionalInfoCopyWith<$Res> {
  _$PaymentAdditionalInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentAdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? key = freezed, Object? value = freezed}) {
    return _then(
      _value.copyWith(
            key:
                freezed == key
                    ? _value.key
                    : key // ignore: cast_nullable_to_non_nullable
                        as String?,
            value:
                freezed == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentAdditionalInfoImplCopyWith<$Res>
    implements $PaymentAdditionalInfoCopyWith<$Res> {
  factory _$$PaymentAdditionalInfoImplCopyWith(
    _$PaymentAdditionalInfoImpl value,
    $Res Function(_$PaymentAdditionalInfoImpl) then,
  ) = __$$PaymentAdditionalInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class __$$PaymentAdditionalInfoImplCopyWithImpl<$Res>
    extends
        _$PaymentAdditionalInfoCopyWithImpl<$Res, _$PaymentAdditionalInfoImpl>
    implements _$$PaymentAdditionalInfoImplCopyWith<$Res> {
  __$$PaymentAdditionalInfoImplCopyWithImpl(
    _$PaymentAdditionalInfoImpl _value,
    $Res Function(_$PaymentAdditionalInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentAdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? key = freezed, Object? value = freezed}) {
    return _then(
      _$PaymentAdditionalInfoImpl(
        key:
            freezed == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                    as String?,
        value:
            freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentAdditionalInfoImpl implements _PaymentAdditionalInfo {
  const _$PaymentAdditionalInfoImpl({
    @JsonKey(name: "key") this.key,
    @JsonKey(name: "value") this.value,
  });

  factory _$PaymentAdditionalInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentAdditionalInfoImplFromJson(json);

  @override
  @JsonKey(name: "key")
  final String? key;
  @override
  @JsonKey(name: "value")
  final String? value;

  @override
  String toString() {
    return 'PaymentAdditionalInfo(key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentAdditionalInfoImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, value);

  /// Create a copy of PaymentAdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentAdditionalInfoImplCopyWith<_$PaymentAdditionalInfoImpl>
  get copyWith =>
      __$$PaymentAdditionalInfoImplCopyWithImpl<_$PaymentAdditionalInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentAdditionalInfoImplToJson(this);
  }
}

abstract class _PaymentAdditionalInfo implements PaymentAdditionalInfo {
  const factory _PaymentAdditionalInfo({
    @JsonKey(name: "key") final String? key,
    @JsonKey(name: "value") final String? value,
  }) = _$PaymentAdditionalInfoImpl;

  factory _PaymentAdditionalInfo.fromJson(Map<String, dynamic> json) =
      _$PaymentAdditionalInfoImpl.fromJson;

  @override
  @JsonKey(name: "key")
  String? get key;
  @override
  @JsonKey(name: "value")
  String? get value;

  /// Create a copy of PaymentAdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentAdditionalInfoImplCopyWith<_$PaymentAdditionalInfoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ShippingAssignment _$ShippingAssignmentFromJson(Map<String, dynamic> json) {
  return _ShippingAssignment.fromJson(json);
}

/// @nodoc
mixin _$ShippingAssignment {
  @JsonKey(name: "shipping")
  Shipping? get shipping => throw _privateConstructorUsedError;
  @JsonKey(name: "items")
  List<Item>? get items => throw _privateConstructorUsedError;

  /// Serializes this ShippingAssignment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShippingAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShippingAssignmentCopyWith<ShippingAssignment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingAssignmentCopyWith<$Res> {
  factory $ShippingAssignmentCopyWith(
    ShippingAssignment value,
    $Res Function(ShippingAssignment) then,
  ) = _$ShippingAssignmentCopyWithImpl<$Res, ShippingAssignment>;
  @useResult
  $Res call({
    @JsonKey(name: "shipping") Shipping? shipping,
    @JsonKey(name: "items") List<Item>? items,
  });

  $ShippingCopyWith<$Res>? get shipping;
}

/// @nodoc
class _$ShippingAssignmentCopyWithImpl<$Res, $Val extends ShippingAssignment>
    implements $ShippingAssignmentCopyWith<$Res> {
  _$ShippingAssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShippingAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shipping = freezed, Object? items = freezed}) {
    return _then(
      _value.copyWith(
            shipping:
                freezed == shipping
                    ? _value.shipping
                    : shipping // ignore: cast_nullable_to_non_nullable
                        as Shipping?,
            items:
                freezed == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<Item>?,
          )
          as $Val,
    );
  }

  /// Create a copy of ShippingAssignment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShippingCopyWith<$Res>? get shipping {
    if (_value.shipping == null) {
      return null;
    }

    return $ShippingCopyWith<$Res>(_value.shipping!, (value) {
      return _then(_value.copyWith(shipping: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShippingAssignmentImplCopyWith<$Res>
    implements $ShippingAssignmentCopyWith<$Res> {
  factory _$$ShippingAssignmentImplCopyWith(
    _$ShippingAssignmentImpl value,
    $Res Function(_$ShippingAssignmentImpl) then,
  ) = __$$ShippingAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "shipping") Shipping? shipping,
    @JsonKey(name: "items") List<Item>? items,
  });

  @override
  $ShippingCopyWith<$Res>? get shipping;
}

/// @nodoc
class __$$ShippingAssignmentImplCopyWithImpl<$Res>
    extends _$ShippingAssignmentCopyWithImpl<$Res, _$ShippingAssignmentImpl>
    implements _$$ShippingAssignmentImplCopyWith<$Res> {
  __$$ShippingAssignmentImplCopyWithImpl(
    _$ShippingAssignmentImpl _value,
    $Res Function(_$ShippingAssignmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShippingAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shipping = freezed, Object? items = freezed}) {
    return _then(
      _$ShippingAssignmentImpl(
        shipping:
            freezed == shipping
                ? _value.shipping
                : shipping // ignore: cast_nullable_to_non_nullable
                    as Shipping?,
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<Item>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShippingAssignmentImpl implements _ShippingAssignment {
  const _$ShippingAssignmentImpl({
    @JsonKey(name: "shipping") this.shipping,
    @JsonKey(name: "items") final List<Item>? items,
  }) : _items = items;

  factory _$ShippingAssignmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingAssignmentImplFromJson(json);

  @override
  @JsonKey(name: "shipping")
  final Shipping? shipping;
  final List<Item>? _items;
  @override
  @JsonKey(name: "items")
  List<Item>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ShippingAssignment(shipping: $shipping, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingAssignmentImpl &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    shipping,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of ShippingAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShippingAssignmentImplCopyWith<_$ShippingAssignmentImpl> get copyWith =>
      __$$ShippingAssignmentImplCopyWithImpl<_$ShippingAssignmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShippingAssignmentImplToJson(this);
  }
}

abstract class _ShippingAssignment implements ShippingAssignment {
  const factory _ShippingAssignment({
    @JsonKey(name: "shipping") final Shipping? shipping,
    @JsonKey(name: "items") final List<Item>? items,
  }) = _$ShippingAssignmentImpl;

  factory _ShippingAssignment.fromJson(Map<String, dynamic> json) =
      _$ShippingAssignmentImpl.fromJson;

  @override
  @JsonKey(name: "shipping")
  Shipping? get shipping;
  @override
  @JsonKey(name: "items")
  List<Item>? get items;

  /// Create a copy of ShippingAssignment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShippingAssignmentImplCopyWith<_$ShippingAssignmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  @JsonKey(name: "amount_refunded")
  int? get amountRefunded => throw _privateConstructorUsedError;
  @JsonKey(name: "base_amount_refunded")
  int? get baseAmountRefunded => throw _privateConstructorUsedError;
  @JsonKey(name: "base_discount_amount")
  int? get baseDiscountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "base_discount_invoiced")
  int? get baseDiscountInvoiced => throw _privateConstructorUsedError;
  @JsonKey(name: "base_discount_tax_compensation_amount")
  int? get baseDiscountTaxCompensationAmount =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "base_original_price")
  int? get baseOriginalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "base_price")
  int? get basePrice => throw _privateConstructorUsedError;
  @JsonKey(name: "base_price_incl_tax")
  int? get basePriceInclTax => throw _privateConstructorUsedError;
  @JsonKey(name: "base_row_invoiced")
  int? get baseRowInvoiced => throw _privateConstructorUsedError;
  @JsonKey(name: "base_row_total")
  int? get baseRowTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "base_row_total_incl_tax")
  int? get baseRowTotalInclTax => throw _privateConstructorUsedError;
  @JsonKey(name: "base_tax_amount")
  int? get baseTaxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "base_tax_invoiced")
  int? get baseTaxInvoiced => throw _privateConstructorUsedError;
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_amount")
  int? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_invoiced")
  int? get discountInvoiced => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_percent")
  int? get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: "free_shipping")
  int? get freeShipping => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_tax_compensation_amount")
  int? get discountTaxCompensationAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "is_qty_decimal")
  int? get isQtyDecimal => throw _privateConstructorUsedError;
  @JsonKey(name: "is_virtual")
  int? get isVirtual => throw _privateConstructorUsedError;
  @JsonKey(name: "item_id")
  int? get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "no_discount")
  int? get noDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "order_id")
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: "original_price")
  int? get originalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "price_incl_tax")
  int? get priceInclTax => throw _privateConstructorUsedError;
  @JsonKey(name: "product_id")
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: "product_type")
  String? get productType => throw _privateConstructorUsedError;
  @JsonKey(name: "qty_canceled")
  int? get qtyCanceled => throw _privateConstructorUsedError;
  @JsonKey(name: "qty_invoiced")
  int? get qtyInvoiced => throw _privateConstructorUsedError;
  @JsonKey(name: "qty_ordered")
  int? get qtyOrdered => throw _privateConstructorUsedError;
  @JsonKey(name: "qty_refunded")
  int? get qtyRefunded => throw _privateConstructorUsedError;
  @JsonKey(name: "qty_shipped")
  int? get qtyShipped => throw _privateConstructorUsedError;
  @JsonKey(name: "quote_item_id")
  int? get quoteItemId => throw _privateConstructorUsedError;
  @JsonKey(name: "row_invoiced")
  int? get rowInvoiced => throw _privateConstructorUsedError;
  @JsonKey(name: "row_total")
  int? get rowTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "row_total_incl_tax")
  int? get rowTotalInclTax => throw _privateConstructorUsedError;
  @JsonKey(name: "row_weight")
  double? get rowWeight => throw _privateConstructorUsedError;
  @JsonKey(name: "sku")
  String? get sku => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  int? get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: "tax_amount")
  int? get taxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "tax_invoiced")
  int? get taxInvoiced => throw _privateConstructorUsedError;
  @JsonKey(name: "tax_percent")
  int? get taxPercent => throw _privateConstructorUsedError;
  @JsonKey(
    name: "updated_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "weight")
  double? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_tax_compensation_canceled")
  int? get discountTaxCompensationCanceled =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "tax_canceled")
  int? get taxCanceled => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call({
    @JsonKey(name: "amount_refunded") int? amountRefunded,
    @JsonKey(name: "base_amount_refunded") int? baseAmountRefunded,
    @JsonKey(name: "base_discount_amount") int? baseDiscountAmount,
    @JsonKey(name: "base_discount_invoiced") int? baseDiscountInvoiced,
    @JsonKey(name: "base_discount_tax_compensation_amount")
    int? baseDiscountTaxCompensationAmount,
    @JsonKey(name: "base_original_price") int? baseOriginalPrice,
    @JsonKey(name: "base_price") int? basePrice,
    @JsonKey(name: "base_price_incl_tax") int? basePriceInclTax,
    @JsonKey(name: "base_row_invoiced") int? baseRowInvoiced,
    @JsonKey(name: "base_row_total") int? baseRowTotal,
    @JsonKey(name: "base_row_total_incl_tax") int? baseRowTotalInclTax,
    @JsonKey(name: "base_tax_amount") int? baseTaxAmount,
    @JsonKey(name: "base_tax_invoiced") int? baseTaxInvoiced,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? createdAt,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "discount_invoiced") int? discountInvoiced,
    @JsonKey(name: "discount_percent") int? discountPercent,
    @JsonKey(name: "free_shipping") int? freeShipping,
    @JsonKey(name: "discount_tax_compensation_amount")
    int? discountTaxCompensationAmount,
    @JsonKey(name: "is_qty_decimal") int? isQtyDecimal,
    @JsonKey(name: "is_virtual") int? isVirtual,
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "no_discount") int? noDiscount,
    @JsonKey(name: "order_id") int? orderId,
    @JsonKey(name: "original_price") int? originalPrice,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "price_incl_tax") int? priceInclTax,
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "qty_canceled") int? qtyCanceled,
    @JsonKey(name: "qty_invoiced") int? qtyInvoiced,
    @JsonKey(name: "qty_ordered") int? qtyOrdered,
    @JsonKey(name: "qty_refunded") int? qtyRefunded,
    @JsonKey(name: "qty_shipped") int? qtyShipped,
    @JsonKey(name: "quote_item_id") int? quoteItemId,
    @JsonKey(name: "row_invoiced") int? rowInvoiced,
    @JsonKey(name: "row_total") int? rowTotal,
    @JsonKey(name: "row_total_incl_tax") int? rowTotalInclTax,
    @JsonKey(name: "row_weight") double? rowWeight,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "tax_amount") int? taxAmount,
    @JsonKey(name: "tax_invoiced") int? taxInvoiced,
    @JsonKey(name: "tax_percent") int? taxPercent,
    @JsonKey(
      name: "updated_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? updatedAt,
    @JsonKey(name: "weight") double? weight,
    @JsonKey(name: "discount_tax_compensation_canceled")
    int? discountTaxCompensationCanceled,
    @JsonKey(name: "tax_canceled") int? taxCanceled,
  });
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountRefunded = freezed,
    Object? baseAmountRefunded = freezed,
    Object? baseDiscountAmount = freezed,
    Object? baseDiscountInvoiced = freezed,
    Object? baseDiscountTaxCompensationAmount = freezed,
    Object? baseOriginalPrice = freezed,
    Object? basePrice = freezed,
    Object? basePriceInclTax = freezed,
    Object? baseRowInvoiced = freezed,
    Object? baseRowTotal = freezed,
    Object? baseRowTotalInclTax = freezed,
    Object? baseTaxAmount = freezed,
    Object? baseTaxInvoiced = freezed,
    Object? createdAt = freezed,
    Object? discountAmount = freezed,
    Object? discountInvoiced = freezed,
    Object? discountPercent = freezed,
    Object? freeShipping = freezed,
    Object? discountTaxCompensationAmount = freezed,
    Object? isQtyDecimal = freezed,
    Object? isVirtual = freezed,
    Object? itemId = freezed,
    Object? name = freezed,
    Object? noDiscount = freezed,
    Object? orderId = freezed,
    Object? originalPrice = freezed,
    Object? price = freezed,
    Object? priceInclTax = freezed,
    Object? productId = freezed,
    Object? productType = freezed,
    Object? qtyCanceled = freezed,
    Object? qtyInvoiced = freezed,
    Object? qtyOrdered = freezed,
    Object? qtyRefunded = freezed,
    Object? qtyShipped = freezed,
    Object? quoteItemId = freezed,
    Object? rowInvoiced = freezed,
    Object? rowTotal = freezed,
    Object? rowTotalInclTax = freezed,
    Object? rowWeight = freezed,
    Object? sku = freezed,
    Object? storeId = freezed,
    Object? taxAmount = freezed,
    Object? taxInvoiced = freezed,
    Object? taxPercent = freezed,
    Object? updatedAt = freezed,
    Object? weight = freezed,
    Object? discountTaxCompensationCanceled = freezed,
    Object? taxCanceled = freezed,
  }) {
    return _then(
      _value.copyWith(
            amountRefunded:
                freezed == amountRefunded
                    ? _value.amountRefunded
                    : amountRefunded // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseAmountRefunded:
                freezed == baseAmountRefunded
                    ? _value.baseAmountRefunded
                    : baseAmountRefunded // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseDiscountAmount:
                freezed == baseDiscountAmount
                    ? _value.baseDiscountAmount
                    : baseDiscountAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseDiscountInvoiced:
                freezed == baseDiscountInvoiced
                    ? _value.baseDiscountInvoiced
                    : baseDiscountInvoiced // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseDiscountTaxCompensationAmount:
                freezed == baseDiscountTaxCompensationAmount
                    ? _value.baseDiscountTaxCompensationAmount
                    : baseDiscountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseOriginalPrice:
                freezed == baseOriginalPrice
                    ? _value.baseOriginalPrice
                    : baseOriginalPrice // ignore: cast_nullable_to_non_nullable
                        as int?,
            basePrice:
                freezed == basePrice
                    ? _value.basePrice
                    : basePrice // ignore: cast_nullable_to_non_nullable
                        as int?,
            basePriceInclTax:
                freezed == basePriceInclTax
                    ? _value.basePriceInclTax
                    : basePriceInclTax // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseRowInvoiced:
                freezed == baseRowInvoiced
                    ? _value.baseRowInvoiced
                    : baseRowInvoiced // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseRowTotal:
                freezed == baseRowTotal
                    ? _value.baseRowTotal
                    : baseRowTotal // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseRowTotalInclTax:
                freezed == baseRowTotalInclTax
                    ? _value.baseRowTotalInclTax
                    : baseRowTotalInclTax // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseTaxAmount:
                freezed == baseTaxAmount
                    ? _value.baseTaxAmount
                    : baseTaxAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseTaxInvoiced:
                freezed == baseTaxInvoiced
                    ? _value.baseTaxInvoiced
                    : baseTaxInvoiced // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            discountAmount:
                freezed == discountAmount
                    ? _value.discountAmount
                    : discountAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            discountInvoiced:
                freezed == discountInvoiced
                    ? _value.discountInvoiced
                    : discountInvoiced // ignore: cast_nullable_to_non_nullable
                        as int?,
            discountPercent:
                freezed == discountPercent
                    ? _value.discountPercent
                    : discountPercent // ignore: cast_nullable_to_non_nullable
                        as int?,
            freeShipping:
                freezed == freeShipping
                    ? _value.freeShipping
                    : freeShipping // ignore: cast_nullable_to_non_nullable
                        as int?,
            discountTaxCompensationAmount:
                freezed == discountTaxCompensationAmount
                    ? _value.discountTaxCompensationAmount
                    : discountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            isQtyDecimal:
                freezed == isQtyDecimal
                    ? _value.isQtyDecimal
                    : isQtyDecimal // ignore: cast_nullable_to_non_nullable
                        as int?,
            isVirtual:
                freezed == isVirtual
                    ? _value.isVirtual
                    : isVirtual // ignore: cast_nullable_to_non_nullable
                        as int?,
            itemId:
                freezed == itemId
                    ? _value.itemId
                    : itemId // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            noDiscount:
                freezed == noDiscount
                    ? _value.noDiscount
                    : noDiscount // ignore: cast_nullable_to_non_nullable
                        as int?,
            orderId:
                freezed == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as int?,
            originalPrice:
                freezed == originalPrice
                    ? _value.originalPrice
                    : originalPrice // ignore: cast_nullable_to_non_nullable
                        as int?,
            price:
                freezed == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as int?,
            priceInclTax:
                freezed == priceInclTax
                    ? _value.priceInclTax
                    : priceInclTax // ignore: cast_nullable_to_non_nullable
                        as int?,
            productId:
                freezed == productId
                    ? _value.productId
                    : productId // ignore: cast_nullable_to_non_nullable
                        as int?,
            productType:
                freezed == productType
                    ? _value.productType
                    : productType // ignore: cast_nullable_to_non_nullable
                        as String?,
            qtyCanceled:
                freezed == qtyCanceled
                    ? _value.qtyCanceled
                    : qtyCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            qtyInvoiced:
                freezed == qtyInvoiced
                    ? _value.qtyInvoiced
                    : qtyInvoiced // ignore: cast_nullable_to_non_nullable
                        as int?,
            qtyOrdered:
                freezed == qtyOrdered
                    ? _value.qtyOrdered
                    : qtyOrdered // ignore: cast_nullable_to_non_nullable
                        as int?,
            qtyRefunded:
                freezed == qtyRefunded
                    ? _value.qtyRefunded
                    : qtyRefunded // ignore: cast_nullable_to_non_nullable
                        as int?,
            qtyShipped:
                freezed == qtyShipped
                    ? _value.qtyShipped
                    : qtyShipped // ignore: cast_nullable_to_non_nullable
                        as int?,
            quoteItemId:
                freezed == quoteItemId
                    ? _value.quoteItemId
                    : quoteItemId // ignore: cast_nullable_to_non_nullable
                        as int?,
            rowInvoiced:
                freezed == rowInvoiced
                    ? _value.rowInvoiced
                    : rowInvoiced // ignore: cast_nullable_to_non_nullable
                        as int?,
            rowTotal:
                freezed == rowTotal
                    ? _value.rowTotal
                    : rowTotal // ignore: cast_nullable_to_non_nullable
                        as int?,
            rowTotalInclTax:
                freezed == rowTotalInclTax
                    ? _value.rowTotalInclTax
                    : rowTotalInclTax // ignore: cast_nullable_to_non_nullable
                        as int?,
            rowWeight:
                freezed == rowWeight
                    ? _value.rowWeight
                    : rowWeight // ignore: cast_nullable_to_non_nullable
                        as double?,
            sku:
                freezed == sku
                    ? _value.sku
                    : sku // ignore: cast_nullable_to_non_nullable
                        as String?,
            storeId:
                freezed == storeId
                    ? _value.storeId
                    : storeId // ignore: cast_nullable_to_non_nullable
                        as int?,
            taxAmount:
                freezed == taxAmount
                    ? _value.taxAmount
                    : taxAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            taxInvoiced:
                freezed == taxInvoiced
                    ? _value.taxInvoiced
                    : taxInvoiced // ignore: cast_nullable_to_non_nullable
                        as int?,
            taxPercent:
                freezed == taxPercent
                    ? _value.taxPercent
                    : taxPercent // ignore: cast_nullable_to_non_nullable
                        as int?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            weight:
                freezed == weight
                    ? _value.weight
                    : weight // ignore: cast_nullable_to_non_nullable
                        as double?,
            discountTaxCompensationCanceled:
                freezed == discountTaxCompensationCanceled
                    ? _value.discountTaxCompensationCanceled
                    : discountTaxCompensationCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
            taxCanceled:
                freezed == taxCanceled
                    ? _value.taxCanceled
                    : taxCanceled // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
    _$ItemImpl value,
    $Res Function(_$ItemImpl) then,
  ) = __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "amount_refunded") int? amountRefunded,
    @JsonKey(name: "base_amount_refunded") int? baseAmountRefunded,
    @JsonKey(name: "base_discount_amount") int? baseDiscountAmount,
    @JsonKey(name: "base_discount_invoiced") int? baseDiscountInvoiced,
    @JsonKey(name: "base_discount_tax_compensation_amount")
    int? baseDiscountTaxCompensationAmount,
    @JsonKey(name: "base_original_price") int? baseOriginalPrice,
    @JsonKey(name: "base_price") int? basePrice,
    @JsonKey(name: "base_price_incl_tax") int? basePriceInclTax,
    @JsonKey(name: "base_row_invoiced") int? baseRowInvoiced,
    @JsonKey(name: "base_row_total") int? baseRowTotal,
    @JsonKey(name: "base_row_total_incl_tax") int? baseRowTotalInclTax,
    @JsonKey(name: "base_tax_amount") int? baseTaxAmount,
    @JsonKey(name: "base_tax_invoiced") int? baseTaxInvoiced,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? createdAt,
    @JsonKey(name: "discount_amount") int? discountAmount,
    @JsonKey(name: "discount_invoiced") int? discountInvoiced,
    @JsonKey(name: "discount_percent") int? discountPercent,
    @JsonKey(name: "free_shipping") int? freeShipping,
    @JsonKey(name: "discount_tax_compensation_amount")
    int? discountTaxCompensationAmount,
    @JsonKey(name: "is_qty_decimal") int? isQtyDecimal,
    @JsonKey(name: "is_virtual") int? isVirtual,
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "no_discount") int? noDiscount,
    @JsonKey(name: "order_id") int? orderId,
    @JsonKey(name: "original_price") int? originalPrice,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "price_incl_tax") int? priceInclTax,
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "qty_canceled") int? qtyCanceled,
    @JsonKey(name: "qty_invoiced") int? qtyInvoiced,
    @JsonKey(name: "qty_ordered") int? qtyOrdered,
    @JsonKey(name: "qty_refunded") int? qtyRefunded,
    @JsonKey(name: "qty_shipped") int? qtyShipped,
    @JsonKey(name: "quote_item_id") int? quoteItemId,
    @JsonKey(name: "row_invoiced") int? rowInvoiced,
    @JsonKey(name: "row_total") int? rowTotal,
    @JsonKey(name: "row_total_incl_tax") int? rowTotalInclTax,
    @JsonKey(name: "row_weight") double? rowWeight,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "tax_amount") int? taxAmount,
    @JsonKey(name: "tax_invoiced") int? taxInvoiced,
    @JsonKey(name: "tax_percent") int? taxPercent,
    @JsonKey(
      name: "updated_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? updatedAt,
    @JsonKey(name: "weight") double? weight,
    @JsonKey(name: "discount_tax_compensation_canceled")
    int? discountTaxCompensationCanceled,
    @JsonKey(name: "tax_canceled") int? taxCanceled,
  });
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
    : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountRefunded = freezed,
    Object? baseAmountRefunded = freezed,
    Object? baseDiscountAmount = freezed,
    Object? baseDiscountInvoiced = freezed,
    Object? baseDiscountTaxCompensationAmount = freezed,
    Object? baseOriginalPrice = freezed,
    Object? basePrice = freezed,
    Object? basePriceInclTax = freezed,
    Object? baseRowInvoiced = freezed,
    Object? baseRowTotal = freezed,
    Object? baseRowTotalInclTax = freezed,
    Object? baseTaxAmount = freezed,
    Object? baseTaxInvoiced = freezed,
    Object? createdAt = freezed,
    Object? discountAmount = freezed,
    Object? discountInvoiced = freezed,
    Object? discountPercent = freezed,
    Object? freeShipping = freezed,
    Object? discountTaxCompensationAmount = freezed,
    Object? isQtyDecimal = freezed,
    Object? isVirtual = freezed,
    Object? itemId = freezed,
    Object? name = freezed,
    Object? noDiscount = freezed,
    Object? orderId = freezed,
    Object? originalPrice = freezed,
    Object? price = freezed,
    Object? priceInclTax = freezed,
    Object? productId = freezed,
    Object? productType = freezed,
    Object? qtyCanceled = freezed,
    Object? qtyInvoiced = freezed,
    Object? qtyOrdered = freezed,
    Object? qtyRefunded = freezed,
    Object? qtyShipped = freezed,
    Object? quoteItemId = freezed,
    Object? rowInvoiced = freezed,
    Object? rowTotal = freezed,
    Object? rowTotalInclTax = freezed,
    Object? rowWeight = freezed,
    Object? sku = freezed,
    Object? storeId = freezed,
    Object? taxAmount = freezed,
    Object? taxInvoiced = freezed,
    Object? taxPercent = freezed,
    Object? updatedAt = freezed,
    Object? weight = freezed,
    Object? discountTaxCompensationCanceled = freezed,
    Object? taxCanceled = freezed,
  }) {
    return _then(
      _$ItemImpl(
        amountRefunded:
            freezed == amountRefunded
                ? _value.amountRefunded
                : amountRefunded // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseAmountRefunded:
            freezed == baseAmountRefunded
                ? _value.baseAmountRefunded
                : baseAmountRefunded // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseDiscountAmount:
            freezed == baseDiscountAmount
                ? _value.baseDiscountAmount
                : baseDiscountAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseDiscountInvoiced:
            freezed == baseDiscountInvoiced
                ? _value.baseDiscountInvoiced
                : baseDiscountInvoiced // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseDiscountTaxCompensationAmount:
            freezed == baseDiscountTaxCompensationAmount
                ? _value.baseDiscountTaxCompensationAmount
                : baseDiscountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseOriginalPrice:
            freezed == baseOriginalPrice
                ? _value.baseOriginalPrice
                : baseOriginalPrice // ignore: cast_nullable_to_non_nullable
                    as int?,
        basePrice:
            freezed == basePrice
                ? _value.basePrice
                : basePrice // ignore: cast_nullable_to_non_nullable
                    as int?,
        basePriceInclTax:
            freezed == basePriceInclTax
                ? _value.basePriceInclTax
                : basePriceInclTax // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseRowInvoiced:
            freezed == baseRowInvoiced
                ? _value.baseRowInvoiced
                : baseRowInvoiced // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseRowTotal:
            freezed == baseRowTotal
                ? _value.baseRowTotal
                : baseRowTotal // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseRowTotalInclTax:
            freezed == baseRowTotalInclTax
                ? _value.baseRowTotalInclTax
                : baseRowTotalInclTax // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseTaxAmount:
            freezed == baseTaxAmount
                ? _value.baseTaxAmount
                : baseTaxAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseTaxInvoiced:
            freezed == baseTaxInvoiced
                ? _value.baseTaxInvoiced
                : baseTaxInvoiced // ignore: cast_nullable_to_non_nullable
                    as int?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        discountAmount:
            freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        discountInvoiced:
            freezed == discountInvoiced
                ? _value.discountInvoiced
                : discountInvoiced // ignore: cast_nullable_to_non_nullable
                    as int?,
        discountPercent:
            freezed == discountPercent
                ? _value.discountPercent
                : discountPercent // ignore: cast_nullable_to_non_nullable
                    as int?,
        freeShipping:
            freezed == freeShipping
                ? _value.freeShipping
                : freeShipping // ignore: cast_nullable_to_non_nullable
                    as int?,
        discountTaxCompensationAmount:
            freezed == discountTaxCompensationAmount
                ? _value.discountTaxCompensationAmount
                : discountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        isQtyDecimal:
            freezed == isQtyDecimal
                ? _value.isQtyDecimal
                : isQtyDecimal // ignore: cast_nullable_to_non_nullable
                    as int?,
        isVirtual:
            freezed == isVirtual
                ? _value.isVirtual
                : isVirtual // ignore: cast_nullable_to_non_nullable
                    as int?,
        itemId:
            freezed == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        noDiscount:
            freezed == noDiscount
                ? _value.noDiscount
                : noDiscount // ignore: cast_nullable_to_non_nullable
                    as int?,
        orderId:
            freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as int?,
        originalPrice:
            freezed == originalPrice
                ? _value.originalPrice
                : originalPrice // ignore: cast_nullable_to_non_nullable
                    as int?,
        price:
            freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as int?,
        priceInclTax:
            freezed == priceInclTax
                ? _value.priceInclTax
                : priceInclTax // ignore: cast_nullable_to_non_nullable
                    as int?,
        productId:
            freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as int?,
        productType:
            freezed == productType
                ? _value.productType
                : productType // ignore: cast_nullable_to_non_nullable
                    as String?,
        qtyCanceled:
            freezed == qtyCanceled
                ? _value.qtyCanceled
                : qtyCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        qtyInvoiced:
            freezed == qtyInvoiced
                ? _value.qtyInvoiced
                : qtyInvoiced // ignore: cast_nullable_to_non_nullable
                    as int?,
        qtyOrdered:
            freezed == qtyOrdered
                ? _value.qtyOrdered
                : qtyOrdered // ignore: cast_nullable_to_non_nullable
                    as int?,
        qtyRefunded:
            freezed == qtyRefunded
                ? _value.qtyRefunded
                : qtyRefunded // ignore: cast_nullable_to_non_nullable
                    as int?,
        qtyShipped:
            freezed == qtyShipped
                ? _value.qtyShipped
                : qtyShipped // ignore: cast_nullable_to_non_nullable
                    as int?,
        quoteItemId:
            freezed == quoteItemId
                ? _value.quoteItemId
                : quoteItemId // ignore: cast_nullable_to_non_nullable
                    as int?,
        rowInvoiced:
            freezed == rowInvoiced
                ? _value.rowInvoiced
                : rowInvoiced // ignore: cast_nullable_to_non_nullable
                    as int?,
        rowTotal:
            freezed == rowTotal
                ? _value.rowTotal
                : rowTotal // ignore: cast_nullable_to_non_nullable
                    as int?,
        rowTotalInclTax:
            freezed == rowTotalInclTax
                ? _value.rowTotalInclTax
                : rowTotalInclTax // ignore: cast_nullable_to_non_nullable
                    as int?,
        rowWeight:
            freezed == rowWeight
                ? _value.rowWeight
                : rowWeight // ignore: cast_nullable_to_non_nullable
                    as double?,
        sku:
            freezed == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                    as String?,
        storeId:
            freezed == storeId
                ? _value.storeId
                : storeId // ignore: cast_nullable_to_non_nullable
                    as int?,
        taxAmount:
            freezed == taxAmount
                ? _value.taxAmount
                : taxAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        taxInvoiced:
            freezed == taxInvoiced
                ? _value.taxInvoiced
                : taxInvoiced // ignore: cast_nullable_to_non_nullable
                    as int?,
        taxPercent:
            freezed == taxPercent
                ? _value.taxPercent
                : taxPercent // ignore: cast_nullable_to_non_nullable
                    as int?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        weight:
            freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                    as double?,
        discountTaxCompensationCanceled:
            freezed == discountTaxCompensationCanceled
                ? _value.discountTaxCompensationCanceled
                : discountTaxCompensationCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
        taxCanceled:
            freezed == taxCanceled
                ? _value.taxCanceled
                : taxCanceled // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  const _$ItemImpl({
    @JsonKey(name: "amount_refunded") this.amountRefunded,
    @JsonKey(name: "base_amount_refunded") this.baseAmountRefunded,
    @JsonKey(name: "base_discount_amount") this.baseDiscountAmount,
    @JsonKey(name: "base_discount_invoiced") this.baseDiscountInvoiced,
    @JsonKey(name: "base_discount_tax_compensation_amount")
    this.baseDiscountTaxCompensationAmount,
    @JsonKey(name: "base_original_price") this.baseOriginalPrice,
    @JsonKey(name: "base_price") this.basePrice,
    @JsonKey(name: "base_price_incl_tax") this.basePriceInclTax,
    @JsonKey(name: "base_row_invoiced") this.baseRowInvoiced,
    @JsonKey(name: "base_row_total") this.baseRowTotal,
    @JsonKey(name: "base_row_total_incl_tax") this.baseRowTotalInclTax,
    @JsonKey(name: "base_tax_amount") this.baseTaxAmount,
    @JsonKey(name: "base_tax_invoiced") this.baseTaxInvoiced,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    this.createdAt,
    @JsonKey(name: "discount_amount") this.discountAmount,
    @JsonKey(name: "discount_invoiced") this.discountInvoiced,
    @JsonKey(name: "discount_percent") this.discountPercent,
    @JsonKey(name: "free_shipping") this.freeShipping,
    @JsonKey(name: "discount_tax_compensation_amount")
    this.discountTaxCompensationAmount,
    @JsonKey(name: "is_qty_decimal") this.isQtyDecimal,
    @JsonKey(name: "is_virtual") this.isVirtual,
    @JsonKey(name: "item_id") this.itemId,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "no_discount") this.noDiscount,
    @JsonKey(name: "order_id") this.orderId,
    @JsonKey(name: "original_price") this.originalPrice,
    @JsonKey(name: "price") this.price,
    @JsonKey(name: "price_incl_tax") this.priceInclTax,
    @JsonKey(name: "product_id") this.productId,
    @JsonKey(name: "product_type") this.productType,
    @JsonKey(name: "qty_canceled") this.qtyCanceled,
    @JsonKey(name: "qty_invoiced") this.qtyInvoiced,
    @JsonKey(name: "qty_ordered") this.qtyOrdered,
    @JsonKey(name: "qty_refunded") this.qtyRefunded,
    @JsonKey(name: "qty_shipped") this.qtyShipped,
    @JsonKey(name: "quote_item_id") this.quoteItemId,
    @JsonKey(name: "row_invoiced") this.rowInvoiced,
    @JsonKey(name: "row_total") this.rowTotal,
    @JsonKey(name: "row_total_incl_tax") this.rowTotalInclTax,
    @JsonKey(name: "row_weight") this.rowWeight,
    @JsonKey(name: "sku") this.sku,
    @JsonKey(name: "store_id") this.storeId,
    @JsonKey(name: "tax_amount") this.taxAmount,
    @JsonKey(name: "tax_invoiced") this.taxInvoiced,
    @JsonKey(name: "tax_percent") this.taxPercent,
    @JsonKey(
      name: "updated_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    this.updatedAt,
    @JsonKey(name: "weight") this.weight,
    @JsonKey(name: "discount_tax_compensation_canceled")
    this.discountTaxCompensationCanceled,
    @JsonKey(name: "tax_canceled") this.taxCanceled,
  });

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  @JsonKey(name: "amount_refunded")
  final int? amountRefunded;
  @override
  @JsonKey(name: "base_amount_refunded")
  final int? baseAmountRefunded;
  @override
  @JsonKey(name: "base_discount_amount")
  final int? baseDiscountAmount;
  @override
  @JsonKey(name: "base_discount_invoiced")
  final int? baseDiscountInvoiced;
  @override
  @JsonKey(name: "base_discount_tax_compensation_amount")
  final int? baseDiscountTaxCompensationAmount;
  @override
  @JsonKey(name: "base_original_price")
  final int? baseOriginalPrice;
  @override
  @JsonKey(name: "base_price")
  final int? basePrice;
  @override
  @JsonKey(name: "base_price_incl_tax")
  final int? basePriceInclTax;
  @override
  @JsonKey(name: "base_row_invoiced")
  final int? baseRowInvoiced;
  @override
  @JsonKey(name: "base_row_total")
  final int? baseRowTotal;
  @override
  @JsonKey(name: "base_row_total_incl_tax")
  final int? baseRowTotalInclTax;
  @override
  @JsonKey(name: "base_tax_amount")
  final int? baseTaxAmount;
  @override
  @JsonKey(name: "base_tax_invoiced")
  final int? baseTaxInvoiced;
  @override
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  final DateTime? createdAt;
  @override
  @JsonKey(name: "discount_amount")
  final int? discountAmount;
  @override
  @JsonKey(name: "discount_invoiced")
  final int? discountInvoiced;
  @override
  @JsonKey(name: "discount_percent")
  final int? discountPercent;
  @override
  @JsonKey(name: "free_shipping")
  final int? freeShipping;
  @override
  @JsonKey(name: "discount_tax_compensation_amount")
  final int? discountTaxCompensationAmount;
  @override
  @JsonKey(name: "is_qty_decimal")
  final int? isQtyDecimal;
  @override
  @JsonKey(name: "is_virtual")
  final int? isVirtual;
  @override
  @JsonKey(name: "item_id")
  final int? itemId;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "no_discount")
  final int? noDiscount;
  @override
  @JsonKey(name: "order_id")
  final int? orderId;
  @override
  @JsonKey(name: "original_price")
  final int? originalPrice;
  @override
  @JsonKey(name: "price")
  final int? price;
  @override
  @JsonKey(name: "price_incl_tax")
  final int? priceInclTax;
  @override
  @JsonKey(name: "product_id")
  final int? productId;
  @override
  @JsonKey(name: "product_type")
  final String? productType;
  @override
  @JsonKey(name: "qty_canceled")
  final int? qtyCanceled;
  @override
  @JsonKey(name: "qty_invoiced")
  final int? qtyInvoiced;
  @override
  @JsonKey(name: "qty_ordered")
  final int? qtyOrdered;
  @override
  @JsonKey(name: "qty_refunded")
  final int? qtyRefunded;
  @override
  @JsonKey(name: "qty_shipped")
  final int? qtyShipped;
  @override
  @JsonKey(name: "quote_item_id")
  final int? quoteItemId;
  @override
  @JsonKey(name: "row_invoiced")
  final int? rowInvoiced;
  @override
  @JsonKey(name: "row_total")
  final int? rowTotal;
  @override
  @JsonKey(name: "row_total_incl_tax")
  final int? rowTotalInclTax;
  @override
  @JsonKey(name: "row_weight")
  final double? rowWeight;
  @override
  @JsonKey(name: "sku")
  final String? sku;
  @override
  @JsonKey(name: "store_id")
  final int? storeId;
  @override
  @JsonKey(name: "tax_amount")
  final int? taxAmount;
  @override
  @JsonKey(name: "tax_invoiced")
  final int? taxInvoiced;
  @override
  @JsonKey(name: "tax_percent")
  final int? taxPercent;
  @override
  @JsonKey(
    name: "updated_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "weight")
  final double? weight;
  @override
  @JsonKey(name: "discount_tax_compensation_canceled")
  final int? discountTaxCompensationCanceled;
  @override
  @JsonKey(name: "tax_canceled")
  final int? taxCanceled;

  @override
  String toString() {
    return 'Item(amountRefunded: $amountRefunded, baseAmountRefunded: $baseAmountRefunded, baseDiscountAmount: $baseDiscountAmount, baseDiscountInvoiced: $baseDiscountInvoiced, baseDiscountTaxCompensationAmount: $baseDiscountTaxCompensationAmount, baseOriginalPrice: $baseOriginalPrice, basePrice: $basePrice, basePriceInclTax: $basePriceInclTax, baseRowInvoiced: $baseRowInvoiced, baseRowTotal: $baseRowTotal, baseRowTotalInclTax: $baseRowTotalInclTax, baseTaxAmount: $baseTaxAmount, baseTaxInvoiced: $baseTaxInvoiced, createdAt: $createdAt, discountAmount: $discountAmount, discountInvoiced: $discountInvoiced, discountPercent: $discountPercent, freeShipping: $freeShipping, discountTaxCompensationAmount: $discountTaxCompensationAmount, isQtyDecimal: $isQtyDecimal, isVirtual: $isVirtual, itemId: $itemId, name: $name, noDiscount: $noDiscount, orderId: $orderId, originalPrice: $originalPrice, price: $price, priceInclTax: $priceInclTax, productId: $productId, productType: $productType, qtyCanceled: $qtyCanceled, qtyInvoiced: $qtyInvoiced, qtyOrdered: $qtyOrdered, qtyRefunded: $qtyRefunded, qtyShipped: $qtyShipped, quoteItemId: $quoteItemId, rowInvoiced: $rowInvoiced, rowTotal: $rowTotal, rowTotalInclTax: $rowTotalInclTax, rowWeight: $rowWeight, sku: $sku, storeId: $storeId, taxAmount: $taxAmount, taxInvoiced: $taxInvoiced, taxPercent: $taxPercent, updatedAt: $updatedAt, weight: $weight, discountTaxCompensationCanceled: $discountTaxCompensationCanceled, taxCanceled: $taxCanceled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.amountRefunded, amountRefunded) ||
                other.amountRefunded == amountRefunded) &&
            (identical(other.baseAmountRefunded, baseAmountRefunded) ||
                other.baseAmountRefunded == baseAmountRefunded) &&
            (identical(other.baseDiscountAmount, baseDiscountAmount) ||
                other.baseDiscountAmount == baseDiscountAmount) &&
            (identical(other.baseDiscountInvoiced, baseDiscountInvoiced) ||
                other.baseDiscountInvoiced == baseDiscountInvoiced) &&
            (identical(
                  other.baseDiscountTaxCompensationAmount,
                  baseDiscountTaxCompensationAmount,
                ) ||
                other.baseDiscountTaxCompensationAmount ==
                    baseDiscountTaxCompensationAmount) &&
            (identical(other.baseOriginalPrice, baseOriginalPrice) ||
                other.baseOriginalPrice == baseOriginalPrice) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.basePriceInclTax, basePriceInclTax) ||
                other.basePriceInclTax == basePriceInclTax) &&
            (identical(other.baseRowInvoiced, baseRowInvoiced) ||
                other.baseRowInvoiced == baseRowInvoiced) &&
            (identical(other.baseRowTotal, baseRowTotal) ||
                other.baseRowTotal == baseRowTotal) &&
            (identical(other.baseRowTotalInclTax, baseRowTotalInclTax) ||
                other.baseRowTotalInclTax == baseRowTotalInclTax) &&
            (identical(other.baseTaxAmount, baseTaxAmount) ||
                other.baseTaxAmount == baseTaxAmount) &&
            (identical(other.baseTaxInvoiced, baseTaxInvoiced) ||
                other.baseTaxInvoiced == baseTaxInvoiced) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.discountInvoiced, discountInvoiced) ||
                other.discountInvoiced == discountInvoiced) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.freeShipping, freeShipping) ||
                other.freeShipping == freeShipping) &&
            (identical(
                  other.discountTaxCompensationAmount,
                  discountTaxCompensationAmount,
                ) ||
                other.discountTaxCompensationAmount ==
                    discountTaxCompensationAmount) &&
            (identical(other.isQtyDecimal, isQtyDecimal) ||
                other.isQtyDecimal == isQtyDecimal) &&
            (identical(other.isVirtual, isVirtual) ||
                other.isVirtual == isVirtual) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.noDiscount, noDiscount) ||
                other.noDiscount == noDiscount) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceInclTax, priceInclTax) ||
                other.priceInclTax == priceInclTax) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.qtyCanceled, qtyCanceled) ||
                other.qtyCanceled == qtyCanceled) &&
            (identical(other.qtyInvoiced, qtyInvoiced) ||
                other.qtyInvoiced == qtyInvoiced) &&
            (identical(other.qtyOrdered, qtyOrdered) ||
                other.qtyOrdered == qtyOrdered) &&
            (identical(other.qtyRefunded, qtyRefunded) ||
                other.qtyRefunded == qtyRefunded) &&
            (identical(other.qtyShipped, qtyShipped) ||
                other.qtyShipped == qtyShipped) &&
            (identical(other.quoteItemId, quoteItemId) ||
                other.quoteItemId == quoteItemId) &&
            (identical(other.rowInvoiced, rowInvoiced) ||
                other.rowInvoiced == rowInvoiced) &&
            (identical(other.rowTotal, rowTotal) ||
                other.rowTotal == rowTotal) &&
            (identical(other.rowTotalInclTax, rowTotalInclTax) ||
                other.rowTotalInclTax == rowTotalInclTax) &&
            (identical(other.rowWeight, rowWeight) ||
                other.rowWeight == rowWeight) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.taxInvoiced, taxInvoiced) ||
                other.taxInvoiced == taxInvoiced) &&
            (identical(other.taxPercent, taxPercent) ||
                other.taxPercent == taxPercent) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(
                  other.discountTaxCompensationCanceled,
                  discountTaxCompensationCanceled,
                ) ||
                other.discountTaxCompensationCanceled ==
                    discountTaxCompensationCanceled) &&
            (identical(other.taxCanceled, taxCanceled) ||
                other.taxCanceled == taxCanceled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    amountRefunded,
    baseAmountRefunded,
    baseDiscountAmount,
    baseDiscountInvoiced,
    baseDiscountTaxCompensationAmount,
    baseOriginalPrice,
    basePrice,
    basePriceInclTax,
    baseRowInvoiced,
    baseRowTotal,
    baseRowTotalInclTax,
    baseTaxAmount,
    baseTaxInvoiced,
    createdAt,
    discountAmount,
    discountInvoiced,
    discountPercent,
    freeShipping,
    discountTaxCompensationAmount,
    isQtyDecimal,
    isVirtual,
    itemId,
    name,
    noDiscount,
    orderId,
    originalPrice,
    price,
    priceInclTax,
    productId,
    productType,
    qtyCanceled,
    qtyInvoiced,
    qtyOrdered,
    qtyRefunded,
    qtyShipped,
    quoteItemId,
    rowInvoiced,
    rowTotal,
    rowTotalInclTax,
    rowWeight,
    sku,
    storeId,
    taxAmount,
    taxInvoiced,
    taxPercent,
    updatedAt,
    weight,
    discountTaxCompensationCanceled,
    taxCanceled,
  ]);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(this);
  }
}

abstract class _Item implements Item {
  const factory _Item({
    @JsonKey(name: "amount_refunded") final int? amountRefunded,
    @JsonKey(name: "base_amount_refunded") final int? baseAmountRefunded,
    @JsonKey(name: "base_discount_amount") final int? baseDiscountAmount,
    @JsonKey(name: "base_discount_invoiced") final int? baseDiscountInvoiced,
    @JsonKey(name: "base_discount_tax_compensation_amount")
    final int? baseDiscountTaxCompensationAmount,
    @JsonKey(name: "base_original_price") final int? baseOriginalPrice,
    @JsonKey(name: "base_price") final int? basePrice,
    @JsonKey(name: "base_price_incl_tax") final int? basePriceInclTax,
    @JsonKey(name: "base_row_invoiced") final int? baseRowInvoiced,
    @JsonKey(name: "base_row_total") final int? baseRowTotal,
    @JsonKey(name: "base_row_total_incl_tax") final int? baseRowTotalInclTax,
    @JsonKey(name: "base_tax_amount") final int? baseTaxAmount,
    @JsonKey(name: "base_tax_invoiced") final int? baseTaxInvoiced,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    final DateTime? createdAt,
    @JsonKey(name: "discount_amount") final int? discountAmount,
    @JsonKey(name: "discount_invoiced") final int? discountInvoiced,
    @JsonKey(name: "discount_percent") final int? discountPercent,
    @JsonKey(name: "free_shipping") final int? freeShipping,
    @JsonKey(name: "discount_tax_compensation_amount")
    final int? discountTaxCompensationAmount,
    @JsonKey(name: "is_qty_decimal") final int? isQtyDecimal,
    @JsonKey(name: "is_virtual") final int? isVirtual,
    @JsonKey(name: "item_id") final int? itemId,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "no_discount") final int? noDiscount,
    @JsonKey(name: "order_id") final int? orderId,
    @JsonKey(name: "original_price") final int? originalPrice,
    @JsonKey(name: "price") final int? price,
    @JsonKey(name: "price_incl_tax") final int? priceInclTax,
    @JsonKey(name: "product_id") final int? productId,
    @JsonKey(name: "product_type") final String? productType,
    @JsonKey(name: "qty_canceled") final int? qtyCanceled,
    @JsonKey(name: "qty_invoiced") final int? qtyInvoiced,
    @JsonKey(name: "qty_ordered") final int? qtyOrdered,
    @JsonKey(name: "qty_refunded") final int? qtyRefunded,
    @JsonKey(name: "qty_shipped") final int? qtyShipped,
    @JsonKey(name: "quote_item_id") final int? quoteItemId,
    @JsonKey(name: "row_invoiced") final int? rowInvoiced,
    @JsonKey(name: "row_total") final int? rowTotal,
    @JsonKey(name: "row_total_incl_tax") final int? rowTotalInclTax,
    @JsonKey(name: "row_weight") final double? rowWeight,
    @JsonKey(name: "sku") final String? sku,
    @JsonKey(name: "store_id") final int? storeId,
    @JsonKey(name: "tax_amount") final int? taxAmount,
    @JsonKey(name: "tax_invoiced") final int? taxInvoiced,
    @JsonKey(name: "tax_percent") final int? taxPercent,
    @JsonKey(
      name: "updated_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    final DateTime? updatedAt,
    @JsonKey(name: "weight") final double? weight,
    @JsonKey(name: "discount_tax_compensation_canceled")
    final int? discountTaxCompensationCanceled,
    @JsonKey(name: "tax_canceled") final int? taxCanceled,
  }) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  @JsonKey(name: "amount_refunded")
  int? get amountRefunded;
  @override
  @JsonKey(name: "base_amount_refunded")
  int? get baseAmountRefunded;
  @override
  @JsonKey(name: "base_discount_amount")
  int? get baseDiscountAmount;
  @override
  @JsonKey(name: "base_discount_invoiced")
  int? get baseDiscountInvoiced;
  @override
  @JsonKey(name: "base_discount_tax_compensation_amount")
  int? get baseDiscountTaxCompensationAmount;
  @override
  @JsonKey(name: "base_original_price")
  int? get baseOriginalPrice;
  @override
  @JsonKey(name: "base_price")
  int? get basePrice;
  @override
  @JsonKey(name: "base_price_incl_tax")
  int? get basePriceInclTax;
  @override
  @JsonKey(name: "base_row_invoiced")
  int? get baseRowInvoiced;
  @override
  @JsonKey(name: "base_row_total")
  int? get baseRowTotal;
  @override
  @JsonKey(name: "base_row_total_incl_tax")
  int? get baseRowTotalInclTax;
  @override
  @JsonKey(name: "base_tax_amount")
  int? get baseTaxAmount;
  @override
  @JsonKey(name: "base_tax_invoiced")
  int? get baseTaxInvoiced;
  @override
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get createdAt;
  @override
  @JsonKey(name: "discount_amount")
  int? get discountAmount;
  @override
  @JsonKey(name: "discount_invoiced")
  int? get discountInvoiced;
  @override
  @JsonKey(name: "discount_percent")
  int? get discountPercent;
  @override
  @JsonKey(name: "free_shipping")
  int? get freeShipping;
  @override
  @JsonKey(name: "discount_tax_compensation_amount")
  int? get discountTaxCompensationAmount;
  @override
  @JsonKey(name: "is_qty_decimal")
  int? get isQtyDecimal;
  @override
  @JsonKey(name: "is_virtual")
  int? get isVirtual;
  @override
  @JsonKey(name: "item_id")
  int? get itemId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "no_discount")
  int? get noDiscount;
  @override
  @JsonKey(name: "order_id")
  int? get orderId;
  @override
  @JsonKey(name: "original_price")
  int? get originalPrice;
  @override
  @JsonKey(name: "price")
  int? get price;
  @override
  @JsonKey(name: "price_incl_tax")
  int? get priceInclTax;
  @override
  @JsonKey(name: "product_id")
  int? get productId;
  @override
  @JsonKey(name: "product_type")
  String? get productType;
  @override
  @JsonKey(name: "qty_canceled")
  int? get qtyCanceled;
  @override
  @JsonKey(name: "qty_invoiced")
  int? get qtyInvoiced;
  @override
  @JsonKey(name: "qty_ordered")
  int? get qtyOrdered;
  @override
  @JsonKey(name: "qty_refunded")
  int? get qtyRefunded;
  @override
  @JsonKey(name: "qty_shipped")
  int? get qtyShipped;
  @override
  @JsonKey(name: "quote_item_id")
  int? get quoteItemId;
  @override
  @JsonKey(name: "row_invoiced")
  int? get rowInvoiced;
  @override
  @JsonKey(name: "row_total")
  int? get rowTotal;
  @override
  @JsonKey(name: "row_total_incl_tax")
  int? get rowTotalInclTax;
  @override
  @JsonKey(name: "row_weight")
  double? get rowWeight;
  @override
  @JsonKey(name: "sku")
  String? get sku;
  @override
  @JsonKey(name: "store_id")
  int? get storeId;
  @override
  @JsonKey(name: "tax_amount")
  int? get taxAmount;
  @override
  @JsonKey(name: "tax_invoiced")
  int? get taxInvoiced;
  @override
  @JsonKey(name: "tax_percent")
  int? get taxPercent;
  @override
  @JsonKey(
    name: "updated_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "weight")
  double? get weight;
  @override
  @JsonKey(name: "discount_tax_compensation_canceled")
  int? get discountTaxCompensationCanceled;
  @override
  @JsonKey(name: "tax_canceled")
  int? get taxCanceled;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Shipping _$ShippingFromJson(Map<String, dynamic> json) {
  return _Shipping.fromJson(json);
}

/// @nodoc
mixin _$Shipping {
  @JsonKey(name: "address")
  Address? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "method")
  String? get method => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  Total? get total => throw _privateConstructorUsedError;

  /// Serializes this Shipping to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Shipping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShippingCopyWith<Shipping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingCopyWith<$Res> {
  factory $ShippingCopyWith(Shipping value, $Res Function(Shipping) then) =
      _$ShippingCopyWithImpl<$Res, Shipping>;
  @useResult
  $Res call({
    @JsonKey(name: "address") Address? address,
    @JsonKey(name: "method") String? method,
    @JsonKey(name: "total") Total? total,
  });

  $AddressCopyWith<$Res>? get address;
  $TotalCopyWith<$Res>? get total;
}

/// @nodoc
class _$ShippingCopyWithImpl<$Res, $Val extends Shipping>
    implements $ShippingCopyWith<$Res> {
  _$ShippingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Shipping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? method = freezed,
    Object? total = freezed,
  }) {
    return _then(
      _value.copyWith(
            address:
                freezed == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as Address?,
            method:
                freezed == method
                    ? _value.method
                    : method // ignore: cast_nullable_to_non_nullable
                        as String?,
            total:
                freezed == total
                    ? _value.total
                    : total // ignore: cast_nullable_to_non_nullable
                        as Total?,
          )
          as $Val,
    );
  }

  /// Create a copy of Shipping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of Shipping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TotalCopyWith<$Res>? get total {
    if (_value.total == null) {
      return null;
    }

    return $TotalCopyWith<$Res>(_value.total!, (value) {
      return _then(_value.copyWith(total: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShippingImplCopyWith<$Res>
    implements $ShippingCopyWith<$Res> {
  factory _$$ShippingImplCopyWith(
    _$ShippingImpl value,
    $Res Function(_$ShippingImpl) then,
  ) = __$$ShippingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "address") Address? address,
    @JsonKey(name: "method") String? method,
    @JsonKey(name: "total") Total? total,
  });

  @override
  $AddressCopyWith<$Res>? get address;
  @override
  $TotalCopyWith<$Res>? get total;
}

/// @nodoc
class __$$ShippingImplCopyWithImpl<$Res>
    extends _$ShippingCopyWithImpl<$Res, _$ShippingImpl>
    implements _$$ShippingImplCopyWith<$Res> {
  __$$ShippingImplCopyWithImpl(
    _$ShippingImpl _value,
    $Res Function(_$ShippingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Shipping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? method = freezed,
    Object? total = freezed,
  }) {
    return _then(
      _$ShippingImpl(
        address:
            freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as Address?,
        method:
            freezed == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                    as String?,
        total:
            freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                    as Total?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShippingImpl implements _Shipping {
  const _$ShippingImpl({
    @JsonKey(name: "address") this.address,
    @JsonKey(name: "method") this.method,
    @JsonKey(name: "total") this.total,
  });

  factory _$ShippingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingImplFromJson(json);

  @override
  @JsonKey(name: "address")
  final Address? address;
  @override
  @JsonKey(name: "method")
  final String? method;
  @override
  @JsonKey(name: "total")
  final Total? total;

  @override
  String toString() {
    return 'Shipping(address: $address, method: $method, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, method, total);

  /// Create a copy of Shipping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShippingImplCopyWith<_$ShippingImpl> get copyWith =>
      __$$ShippingImplCopyWithImpl<_$ShippingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShippingImplToJson(this);
  }
}

abstract class _Shipping implements Shipping {
  const factory _Shipping({
    @JsonKey(name: "address") final Address? address,
    @JsonKey(name: "method") final String? method,
    @JsonKey(name: "total") final Total? total,
  }) = _$ShippingImpl;

  factory _Shipping.fromJson(Map<String, dynamic> json) =
      _$ShippingImpl.fromJson;

  @override
  @JsonKey(name: "address")
  Address? get address;
  @override
  @JsonKey(name: "method")
  String? get method;
  @override
  @JsonKey(name: "total")
  Total? get total;

  /// Create a copy of Shipping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShippingImplCopyWith<_$ShippingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Total _$TotalFromJson(Map<String, dynamic> json) {
  return _Total.fromJson(json);
}

/// @nodoc
mixin _$Total {
  @JsonKey(name: "base_shipping_amount")
  int? get baseShippingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "base_shipping_discount_amount")
  int? get baseShippingDiscountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
  int? get baseShippingDiscountTaxCompensationAmnt =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "base_shipping_incl_tax")
  int? get baseShippingInclTax => throw _privateConstructorUsedError;
  @JsonKey(name: "base_shipping_tax_amount")
  int? get baseShippingTaxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_amount")
  int? get shippingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_discount_amount")
  int? get shippingDiscountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_discount_tax_compensation_amount")
  int? get shippingDiscountTaxCompensationAmount =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_incl_tax")
  int? get shippingInclTax => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_tax_amount")
  int? get shippingTaxAmount => throw _privateConstructorUsedError;

  /// Serializes this Total to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Total
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TotalCopyWith<Total> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalCopyWith<$Res> {
  factory $TotalCopyWith(Total value, $Res Function(Total) then) =
      _$TotalCopyWithImpl<$Res, Total>;
  @useResult
  $Res call({
    @JsonKey(name: "base_shipping_amount") int? baseShippingAmount,
    @JsonKey(name: "base_shipping_discount_amount")
    int? baseShippingDiscountAmount,
    @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
    int? baseShippingDiscountTaxCompensationAmnt,
    @JsonKey(name: "base_shipping_incl_tax") int? baseShippingInclTax,
    @JsonKey(name: "base_shipping_tax_amount") int? baseShippingTaxAmount,
    @JsonKey(name: "shipping_amount") int? shippingAmount,
    @JsonKey(name: "shipping_discount_amount") int? shippingDiscountAmount,
    @JsonKey(name: "shipping_discount_tax_compensation_amount")
    int? shippingDiscountTaxCompensationAmount,
    @JsonKey(name: "shipping_incl_tax") int? shippingInclTax,
    @JsonKey(name: "shipping_tax_amount") int? shippingTaxAmount,
  });
}

/// @nodoc
class _$TotalCopyWithImpl<$Res, $Val extends Total>
    implements $TotalCopyWith<$Res> {
  _$TotalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Total
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseShippingAmount = freezed,
    Object? baseShippingDiscountAmount = freezed,
    Object? baseShippingDiscountTaxCompensationAmnt = freezed,
    Object? baseShippingInclTax = freezed,
    Object? baseShippingTaxAmount = freezed,
    Object? shippingAmount = freezed,
    Object? shippingDiscountAmount = freezed,
    Object? shippingDiscountTaxCompensationAmount = freezed,
    Object? shippingInclTax = freezed,
    Object? shippingTaxAmount = freezed,
  }) {
    return _then(
      _value.copyWith(
            baseShippingAmount:
                freezed == baseShippingAmount
                    ? _value.baseShippingAmount
                    : baseShippingAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseShippingDiscountAmount:
                freezed == baseShippingDiscountAmount
                    ? _value.baseShippingDiscountAmount
                    : baseShippingDiscountAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseShippingDiscountTaxCompensationAmnt:
                freezed == baseShippingDiscountTaxCompensationAmnt
                    ? _value.baseShippingDiscountTaxCompensationAmnt
                    : baseShippingDiscountTaxCompensationAmnt // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseShippingInclTax:
                freezed == baseShippingInclTax
                    ? _value.baseShippingInclTax
                    : baseShippingInclTax // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseShippingTaxAmount:
                freezed == baseShippingTaxAmount
                    ? _value.baseShippingTaxAmount
                    : baseShippingTaxAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            shippingAmount:
                freezed == shippingAmount
                    ? _value.shippingAmount
                    : shippingAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            shippingDiscountAmount:
                freezed == shippingDiscountAmount
                    ? _value.shippingDiscountAmount
                    : shippingDiscountAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            shippingDiscountTaxCompensationAmount:
                freezed == shippingDiscountTaxCompensationAmount
                    ? _value.shippingDiscountTaxCompensationAmount
                    : shippingDiscountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            shippingInclTax:
                freezed == shippingInclTax
                    ? _value.shippingInclTax
                    : shippingInclTax // ignore: cast_nullable_to_non_nullable
                        as int?,
            shippingTaxAmount:
                freezed == shippingTaxAmount
                    ? _value.shippingTaxAmount
                    : shippingTaxAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TotalImplCopyWith<$Res> implements $TotalCopyWith<$Res> {
  factory _$$TotalImplCopyWith(
    _$TotalImpl value,
    $Res Function(_$TotalImpl) then,
  ) = __$$TotalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "base_shipping_amount") int? baseShippingAmount,
    @JsonKey(name: "base_shipping_discount_amount")
    int? baseShippingDiscountAmount,
    @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
    int? baseShippingDiscountTaxCompensationAmnt,
    @JsonKey(name: "base_shipping_incl_tax") int? baseShippingInclTax,
    @JsonKey(name: "base_shipping_tax_amount") int? baseShippingTaxAmount,
    @JsonKey(name: "shipping_amount") int? shippingAmount,
    @JsonKey(name: "shipping_discount_amount") int? shippingDiscountAmount,
    @JsonKey(name: "shipping_discount_tax_compensation_amount")
    int? shippingDiscountTaxCompensationAmount,
    @JsonKey(name: "shipping_incl_tax") int? shippingInclTax,
    @JsonKey(name: "shipping_tax_amount") int? shippingTaxAmount,
  });
}

/// @nodoc
class __$$TotalImplCopyWithImpl<$Res>
    extends _$TotalCopyWithImpl<$Res, _$TotalImpl>
    implements _$$TotalImplCopyWith<$Res> {
  __$$TotalImplCopyWithImpl(
    _$TotalImpl _value,
    $Res Function(_$TotalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Total
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseShippingAmount = freezed,
    Object? baseShippingDiscountAmount = freezed,
    Object? baseShippingDiscountTaxCompensationAmnt = freezed,
    Object? baseShippingInclTax = freezed,
    Object? baseShippingTaxAmount = freezed,
    Object? shippingAmount = freezed,
    Object? shippingDiscountAmount = freezed,
    Object? shippingDiscountTaxCompensationAmount = freezed,
    Object? shippingInclTax = freezed,
    Object? shippingTaxAmount = freezed,
  }) {
    return _then(
      _$TotalImpl(
        baseShippingAmount:
            freezed == baseShippingAmount
                ? _value.baseShippingAmount
                : baseShippingAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseShippingDiscountAmount:
            freezed == baseShippingDiscountAmount
                ? _value.baseShippingDiscountAmount
                : baseShippingDiscountAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseShippingDiscountTaxCompensationAmnt:
            freezed == baseShippingDiscountTaxCompensationAmnt
                ? _value.baseShippingDiscountTaxCompensationAmnt
                : baseShippingDiscountTaxCompensationAmnt // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseShippingInclTax:
            freezed == baseShippingInclTax
                ? _value.baseShippingInclTax
                : baseShippingInclTax // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseShippingTaxAmount:
            freezed == baseShippingTaxAmount
                ? _value.baseShippingTaxAmount
                : baseShippingTaxAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        shippingAmount:
            freezed == shippingAmount
                ? _value.shippingAmount
                : shippingAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        shippingDiscountAmount:
            freezed == shippingDiscountAmount
                ? _value.shippingDiscountAmount
                : shippingDiscountAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        shippingDiscountTaxCompensationAmount:
            freezed == shippingDiscountTaxCompensationAmount
                ? _value.shippingDiscountTaxCompensationAmount
                : shippingDiscountTaxCompensationAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        shippingInclTax:
            freezed == shippingInclTax
                ? _value.shippingInclTax
                : shippingInclTax // ignore: cast_nullable_to_non_nullable
                    as int?,
        shippingTaxAmount:
            freezed == shippingTaxAmount
                ? _value.shippingTaxAmount
                : shippingTaxAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TotalImpl implements _Total {
  const _$TotalImpl({
    @JsonKey(name: "base_shipping_amount") this.baseShippingAmount,
    @JsonKey(name: "base_shipping_discount_amount")
    this.baseShippingDiscountAmount,
    @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
    this.baseShippingDiscountTaxCompensationAmnt,
    @JsonKey(name: "base_shipping_incl_tax") this.baseShippingInclTax,
    @JsonKey(name: "base_shipping_tax_amount") this.baseShippingTaxAmount,
    @JsonKey(name: "shipping_amount") this.shippingAmount,
    @JsonKey(name: "shipping_discount_amount") this.shippingDiscountAmount,
    @JsonKey(name: "shipping_discount_tax_compensation_amount")
    this.shippingDiscountTaxCompensationAmount,
    @JsonKey(name: "shipping_incl_tax") this.shippingInclTax,
    @JsonKey(name: "shipping_tax_amount") this.shippingTaxAmount,
  });

  factory _$TotalImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotalImplFromJson(json);

  @override
  @JsonKey(name: "base_shipping_amount")
  final int? baseShippingAmount;
  @override
  @JsonKey(name: "base_shipping_discount_amount")
  final int? baseShippingDiscountAmount;
  @override
  @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
  final int? baseShippingDiscountTaxCompensationAmnt;
  @override
  @JsonKey(name: "base_shipping_incl_tax")
  final int? baseShippingInclTax;
  @override
  @JsonKey(name: "base_shipping_tax_amount")
  final int? baseShippingTaxAmount;
  @override
  @JsonKey(name: "shipping_amount")
  final int? shippingAmount;
  @override
  @JsonKey(name: "shipping_discount_amount")
  final int? shippingDiscountAmount;
  @override
  @JsonKey(name: "shipping_discount_tax_compensation_amount")
  final int? shippingDiscountTaxCompensationAmount;
  @override
  @JsonKey(name: "shipping_incl_tax")
  final int? shippingInclTax;
  @override
  @JsonKey(name: "shipping_tax_amount")
  final int? shippingTaxAmount;

  @override
  String toString() {
    return 'Total(baseShippingAmount: $baseShippingAmount, baseShippingDiscountAmount: $baseShippingDiscountAmount, baseShippingDiscountTaxCompensationAmnt: $baseShippingDiscountTaxCompensationAmnt, baseShippingInclTax: $baseShippingInclTax, baseShippingTaxAmount: $baseShippingTaxAmount, shippingAmount: $shippingAmount, shippingDiscountAmount: $shippingDiscountAmount, shippingDiscountTaxCompensationAmount: $shippingDiscountTaxCompensationAmount, shippingInclTax: $shippingInclTax, shippingTaxAmount: $shippingTaxAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalImpl &&
            (identical(other.baseShippingAmount, baseShippingAmount) ||
                other.baseShippingAmount == baseShippingAmount) &&
            (identical(
                  other.baseShippingDiscountAmount,
                  baseShippingDiscountAmount,
                ) ||
                other.baseShippingDiscountAmount ==
                    baseShippingDiscountAmount) &&
            (identical(
                  other.baseShippingDiscountTaxCompensationAmnt,
                  baseShippingDiscountTaxCompensationAmnt,
                ) ||
                other.baseShippingDiscountTaxCompensationAmnt ==
                    baseShippingDiscountTaxCompensationAmnt) &&
            (identical(other.baseShippingInclTax, baseShippingInclTax) ||
                other.baseShippingInclTax == baseShippingInclTax) &&
            (identical(other.baseShippingTaxAmount, baseShippingTaxAmount) ||
                other.baseShippingTaxAmount == baseShippingTaxAmount) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount) &&
            (identical(other.shippingDiscountAmount, shippingDiscountAmount) ||
                other.shippingDiscountAmount == shippingDiscountAmount) &&
            (identical(
                  other.shippingDiscountTaxCompensationAmount,
                  shippingDiscountTaxCompensationAmount,
                ) ||
                other.shippingDiscountTaxCompensationAmount ==
                    shippingDiscountTaxCompensationAmount) &&
            (identical(other.shippingInclTax, shippingInclTax) ||
                other.shippingInclTax == shippingInclTax) &&
            (identical(other.shippingTaxAmount, shippingTaxAmount) ||
                other.shippingTaxAmount == shippingTaxAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    baseShippingAmount,
    baseShippingDiscountAmount,
    baseShippingDiscountTaxCompensationAmnt,
    baseShippingInclTax,
    baseShippingTaxAmount,
    shippingAmount,
    shippingDiscountAmount,
    shippingDiscountTaxCompensationAmount,
    shippingInclTax,
    shippingTaxAmount,
  );

  /// Create a copy of Total
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalImplCopyWith<_$TotalImpl> get copyWith =>
      __$$TotalImplCopyWithImpl<_$TotalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotalImplToJson(this);
  }
}

abstract class _Total implements Total {
  const factory _Total({
    @JsonKey(name: "base_shipping_amount") final int? baseShippingAmount,
    @JsonKey(name: "base_shipping_discount_amount")
    final int? baseShippingDiscountAmount,
    @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
    final int? baseShippingDiscountTaxCompensationAmnt,
    @JsonKey(name: "base_shipping_incl_tax") final int? baseShippingInclTax,
    @JsonKey(name: "base_shipping_tax_amount") final int? baseShippingTaxAmount,
    @JsonKey(name: "shipping_amount") final int? shippingAmount,
    @JsonKey(name: "shipping_discount_amount")
    final int? shippingDiscountAmount,
    @JsonKey(name: "shipping_discount_tax_compensation_amount")
    final int? shippingDiscountTaxCompensationAmount,
    @JsonKey(name: "shipping_incl_tax") final int? shippingInclTax,
    @JsonKey(name: "shipping_tax_amount") final int? shippingTaxAmount,
  }) = _$TotalImpl;

  factory _Total.fromJson(Map<String, dynamic> json) = _$TotalImpl.fromJson;

  @override
  @JsonKey(name: "base_shipping_amount")
  int? get baseShippingAmount;
  @override
  @JsonKey(name: "base_shipping_discount_amount")
  int? get baseShippingDiscountAmount;
  @override
  @JsonKey(name: "base_shipping_discount_tax_compensation_amnt")
  int? get baseShippingDiscountTaxCompensationAmnt;
  @override
  @JsonKey(name: "base_shipping_incl_tax")
  int? get baseShippingInclTax;
  @override
  @JsonKey(name: "base_shipping_tax_amount")
  int? get baseShippingTaxAmount;
  @override
  @JsonKey(name: "shipping_amount")
  int? get shippingAmount;
  @override
  @JsonKey(name: "shipping_discount_amount")
  int? get shippingDiscountAmount;
  @override
  @JsonKey(name: "shipping_discount_tax_compensation_amount")
  int? get shippingDiscountTaxCompensationAmount;
  @override
  @JsonKey(name: "shipping_incl_tax")
  int? get shippingInclTax;
  @override
  @JsonKey(name: "shipping_tax_amount")
  int? get shippingTaxAmount;

  /// Create a copy of Total
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TotalImplCopyWith<_$TotalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  @JsonKey(name: "account_status")
  dynamic get accountStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "additional_information")
  List<String>? get additionalInformation => throw _privateConstructorUsedError;
  @JsonKey(name: "amount_ordered")
  int? get amountOrdered => throw _privateConstructorUsedError;
  @JsonKey(name: "base_amount_ordered")
  int? get baseAmountOrdered => throw _privateConstructorUsedError;
  @JsonKey(name: "base_shipping_amount")
  int? get baseShippingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "cc_exp_year")
  String? get ccExpYear => throw _privateConstructorUsedError;
  @JsonKey(name: "cc_last4")
  dynamic get ccLast4 => throw _privateConstructorUsedError;
  @JsonKey(name: "cc_ss_start_month")
  String? get ccSsStartMonth => throw _privateConstructorUsedError;
  @JsonKey(name: "cc_ss_start_year")
  String? get ccSsStartYear => throw _privateConstructorUsedError;
  @JsonKey(name: "entity_id")
  int? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "method")
  String? get method => throw _privateConstructorUsedError;
  @JsonKey(name: "parent_id")
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_amount")
  int? get shippingAmount => throw _privateConstructorUsedError;

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call({
    @JsonKey(name: "account_status") dynamic accountStatus,
    @JsonKey(name: "additional_information")
    List<String>? additionalInformation,
    @JsonKey(name: "amount_ordered") int? amountOrdered,
    @JsonKey(name: "base_amount_ordered") int? baseAmountOrdered,
    @JsonKey(name: "base_shipping_amount") int? baseShippingAmount,
    @JsonKey(name: "cc_exp_year") String? ccExpYear,
    @JsonKey(name: "cc_last4") dynamic ccLast4,
    @JsonKey(name: "cc_ss_start_month") String? ccSsStartMonth,
    @JsonKey(name: "cc_ss_start_year") String? ccSsStartYear,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "method") String? method,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "shipping_amount") int? shippingAmount,
  });
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountStatus = freezed,
    Object? additionalInformation = freezed,
    Object? amountOrdered = freezed,
    Object? baseAmountOrdered = freezed,
    Object? baseShippingAmount = freezed,
    Object? ccExpYear = freezed,
    Object? ccLast4 = freezed,
    Object? ccSsStartMonth = freezed,
    Object? ccSsStartYear = freezed,
    Object? entityId = freezed,
    Object? method = freezed,
    Object? parentId = freezed,
    Object? shippingAmount = freezed,
  }) {
    return _then(
      _value.copyWith(
            accountStatus:
                freezed == accountStatus
                    ? _value.accountStatus
                    : accountStatus // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            additionalInformation:
                freezed == additionalInformation
                    ? _value.additionalInformation
                    : additionalInformation // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            amountOrdered:
                freezed == amountOrdered
                    ? _value.amountOrdered
                    : amountOrdered // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseAmountOrdered:
                freezed == baseAmountOrdered
                    ? _value.baseAmountOrdered
                    : baseAmountOrdered // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseShippingAmount:
                freezed == baseShippingAmount
                    ? _value.baseShippingAmount
                    : baseShippingAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            ccExpYear:
                freezed == ccExpYear
                    ? _value.ccExpYear
                    : ccExpYear // ignore: cast_nullable_to_non_nullable
                        as String?,
            ccLast4:
                freezed == ccLast4
                    ? _value.ccLast4
                    : ccLast4 // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            ccSsStartMonth:
                freezed == ccSsStartMonth
                    ? _value.ccSsStartMonth
                    : ccSsStartMonth // ignore: cast_nullable_to_non_nullable
                        as String?,
            ccSsStartYear:
                freezed == ccSsStartYear
                    ? _value.ccSsStartYear
                    : ccSsStartYear // ignore: cast_nullable_to_non_nullable
                        as String?,
            entityId:
                freezed == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as int?,
            method:
                freezed == method
                    ? _value.method
                    : method // ignore: cast_nullable_to_non_nullable
                        as String?,
            parentId:
                freezed == parentId
                    ? _value.parentId
                    : parentId // ignore: cast_nullable_to_non_nullable
                        as int?,
            shippingAmount:
                freezed == shippingAmount
                    ? _value.shippingAmount
                    : shippingAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentImplCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
    _$PaymentImpl value,
    $Res Function(_$PaymentImpl) then,
  ) = __$$PaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "account_status") dynamic accountStatus,
    @JsonKey(name: "additional_information")
    List<String>? additionalInformation,
    @JsonKey(name: "amount_ordered") int? amountOrdered,
    @JsonKey(name: "base_amount_ordered") int? baseAmountOrdered,
    @JsonKey(name: "base_shipping_amount") int? baseShippingAmount,
    @JsonKey(name: "cc_exp_year") String? ccExpYear,
    @JsonKey(name: "cc_last4") dynamic ccLast4,
    @JsonKey(name: "cc_ss_start_month") String? ccSsStartMonth,
    @JsonKey(name: "cc_ss_start_year") String? ccSsStartYear,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "method") String? method,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "shipping_amount") int? shippingAmount,
  });
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
    _$PaymentImpl _value,
    $Res Function(_$PaymentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountStatus = freezed,
    Object? additionalInformation = freezed,
    Object? amountOrdered = freezed,
    Object? baseAmountOrdered = freezed,
    Object? baseShippingAmount = freezed,
    Object? ccExpYear = freezed,
    Object? ccLast4 = freezed,
    Object? ccSsStartMonth = freezed,
    Object? ccSsStartYear = freezed,
    Object? entityId = freezed,
    Object? method = freezed,
    Object? parentId = freezed,
    Object? shippingAmount = freezed,
  }) {
    return _then(
      _$PaymentImpl(
        accountStatus:
            freezed == accountStatus
                ? _value.accountStatus
                : accountStatus // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        additionalInformation:
            freezed == additionalInformation
                ? _value._additionalInformation
                : additionalInformation // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        amountOrdered:
            freezed == amountOrdered
                ? _value.amountOrdered
                : amountOrdered // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseAmountOrdered:
            freezed == baseAmountOrdered
                ? _value.baseAmountOrdered
                : baseAmountOrdered // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseShippingAmount:
            freezed == baseShippingAmount
                ? _value.baseShippingAmount
                : baseShippingAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        ccExpYear:
            freezed == ccExpYear
                ? _value.ccExpYear
                : ccExpYear // ignore: cast_nullable_to_non_nullable
                    as String?,
        ccLast4:
            freezed == ccLast4
                ? _value.ccLast4
                : ccLast4 // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        ccSsStartMonth:
            freezed == ccSsStartMonth
                ? _value.ccSsStartMonth
                : ccSsStartMonth // ignore: cast_nullable_to_non_nullable
                    as String?,
        ccSsStartYear:
            freezed == ccSsStartYear
                ? _value.ccSsStartYear
                : ccSsStartYear // ignore: cast_nullable_to_non_nullable
                    as String?,
        entityId:
            freezed == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as int?,
        method:
            freezed == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                    as String?,
        parentId:
            freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                    as int?,
        shippingAmount:
            freezed == shippingAmount
                ? _value.shippingAmount
                : shippingAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentImpl implements _Payment {
  const _$PaymentImpl({
    @JsonKey(name: "account_status") this.accountStatus,
    @JsonKey(name: "additional_information")
    final List<String>? additionalInformation,
    @JsonKey(name: "amount_ordered") this.amountOrdered,
    @JsonKey(name: "base_amount_ordered") this.baseAmountOrdered,
    @JsonKey(name: "base_shipping_amount") this.baseShippingAmount,
    @JsonKey(name: "cc_exp_year") this.ccExpYear,
    @JsonKey(name: "cc_last4") this.ccLast4,
    @JsonKey(name: "cc_ss_start_month") this.ccSsStartMonth,
    @JsonKey(name: "cc_ss_start_year") this.ccSsStartYear,
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "method") this.method,
    @JsonKey(name: "parent_id") this.parentId,
    @JsonKey(name: "shipping_amount") this.shippingAmount,
  }) : _additionalInformation = additionalInformation;

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

  @override
  @JsonKey(name: "account_status")
  final dynamic accountStatus;
  final List<String>? _additionalInformation;
  @override
  @JsonKey(name: "additional_information")
  List<String>? get additionalInformation {
    final value = _additionalInformation;
    if (value == null) return null;
    if (_additionalInformation is EqualUnmodifiableListView)
      return _additionalInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "amount_ordered")
  final int? amountOrdered;
  @override
  @JsonKey(name: "base_amount_ordered")
  final int? baseAmountOrdered;
  @override
  @JsonKey(name: "base_shipping_amount")
  final int? baseShippingAmount;
  @override
  @JsonKey(name: "cc_exp_year")
  final String? ccExpYear;
  @override
  @JsonKey(name: "cc_last4")
  final dynamic ccLast4;
  @override
  @JsonKey(name: "cc_ss_start_month")
  final String? ccSsStartMonth;
  @override
  @JsonKey(name: "cc_ss_start_year")
  final String? ccSsStartYear;
  @override
  @JsonKey(name: "entity_id")
  final int? entityId;
  @override
  @JsonKey(name: "method")
  final String? method;
  @override
  @JsonKey(name: "parent_id")
  final int? parentId;
  @override
  @JsonKey(name: "shipping_amount")
  final int? shippingAmount;

  @override
  String toString() {
    return 'Payment(accountStatus: $accountStatus, additionalInformation: $additionalInformation, amountOrdered: $amountOrdered, baseAmountOrdered: $baseAmountOrdered, baseShippingAmount: $baseShippingAmount, ccExpYear: $ccExpYear, ccLast4: $ccLast4, ccSsStartMonth: $ccSsStartMonth, ccSsStartYear: $ccSsStartYear, entityId: $entityId, method: $method, parentId: $parentId, shippingAmount: $shippingAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            const DeepCollectionEquality().equals(
              other.accountStatus,
              accountStatus,
            ) &&
            const DeepCollectionEquality().equals(
              other._additionalInformation,
              _additionalInformation,
            ) &&
            (identical(other.amountOrdered, amountOrdered) ||
                other.amountOrdered == amountOrdered) &&
            (identical(other.baseAmountOrdered, baseAmountOrdered) ||
                other.baseAmountOrdered == baseAmountOrdered) &&
            (identical(other.baseShippingAmount, baseShippingAmount) ||
                other.baseShippingAmount == baseShippingAmount) &&
            (identical(other.ccExpYear, ccExpYear) ||
                other.ccExpYear == ccExpYear) &&
            const DeepCollectionEquality().equals(other.ccLast4, ccLast4) &&
            (identical(other.ccSsStartMonth, ccSsStartMonth) ||
                other.ccSsStartMonth == ccSsStartMonth) &&
            (identical(other.ccSsStartYear, ccSsStartYear) ||
                other.ccSsStartYear == ccSsStartYear) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(accountStatus),
    const DeepCollectionEquality().hash(_additionalInformation),
    amountOrdered,
    baseAmountOrdered,
    baseShippingAmount,
    ccExpYear,
    const DeepCollectionEquality().hash(ccLast4),
    ccSsStartMonth,
    ccSsStartYear,
    entityId,
    method,
    parentId,
    shippingAmount,
  );

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      __$$PaymentImplCopyWithImpl<_$PaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentImplToJson(this);
  }
}

abstract class _Payment implements Payment {
  const factory _Payment({
    @JsonKey(name: "account_status") final dynamic accountStatus,
    @JsonKey(name: "additional_information")
    final List<String>? additionalInformation,
    @JsonKey(name: "amount_ordered") final int? amountOrdered,
    @JsonKey(name: "base_amount_ordered") final int? baseAmountOrdered,
    @JsonKey(name: "base_shipping_amount") final int? baseShippingAmount,
    @JsonKey(name: "cc_exp_year") final String? ccExpYear,
    @JsonKey(name: "cc_last4") final dynamic ccLast4,
    @JsonKey(name: "cc_ss_start_month") final String? ccSsStartMonth,
    @JsonKey(name: "cc_ss_start_year") final String? ccSsStartYear,
    @JsonKey(name: "entity_id") final int? entityId,
    @JsonKey(name: "method") final String? method,
    @JsonKey(name: "parent_id") final int? parentId,
    @JsonKey(name: "shipping_amount") final int? shippingAmount,
  }) = _$PaymentImpl;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

  @override
  @JsonKey(name: "account_status")
  dynamic get accountStatus;
  @override
  @JsonKey(name: "additional_information")
  List<String>? get additionalInformation;
  @override
  @JsonKey(name: "amount_ordered")
  int? get amountOrdered;
  @override
  @JsonKey(name: "base_amount_ordered")
  int? get baseAmountOrdered;
  @override
  @JsonKey(name: "base_shipping_amount")
  int? get baseShippingAmount;
  @override
  @JsonKey(name: "cc_exp_year")
  String? get ccExpYear;
  @override
  @JsonKey(name: "cc_last4")
  dynamic get ccLast4;
  @override
  @JsonKey(name: "cc_ss_start_month")
  String? get ccSsStartMonth;
  @override
  @JsonKey(name: "cc_ss_start_year")
  String? get ccSsStartYear;
  @override
  @JsonKey(name: "entity_id")
  int? get entityId;
  @override
  @JsonKey(name: "method")
  String? get method;
  @override
  @JsonKey(name: "parent_id")
  int? get parentId;
  @override
  @JsonKey(name: "shipping_amount")
  int? get shippingAmount;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusHistory _$StatusHistoryFromJson(Map<String, dynamic> json) {
  return _StatusHistory.fromJson(json);
}

/// @nodoc
mixin _$StatusHistory {
  @JsonKey(name: "comment")
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "entity_id")
  int? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "entity_name")
  String? get entityName => throw _privateConstructorUsedError;
  @JsonKey(name: "is_customer_notified")
  int? get isCustomerNotified => throw _privateConstructorUsedError;
  @JsonKey(name: "is_visible_on_front")
  int? get isVisibleOnFront => throw _privateConstructorUsedError;
  @JsonKey(name: "parent_id")
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this StatusHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusHistoryCopyWith<StatusHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusHistoryCopyWith<$Res> {
  factory $StatusHistoryCopyWith(
    StatusHistory value,
    $Res Function(StatusHistory) then,
  ) = _$StatusHistoryCopyWithImpl<$Res, StatusHistory>;
  @useResult
  $Res call({
    @JsonKey(name: "comment") String? comment,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? createdAt,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "entity_name") String? entityName,
    @JsonKey(name: "is_customer_notified") int? isCustomerNotified,
    @JsonKey(name: "is_visible_on_front") int? isVisibleOnFront,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "status") String? status,
  });
}

/// @nodoc
class _$StatusHistoryCopyWithImpl<$Res, $Val extends StatusHistory>
    implements $StatusHistoryCopyWith<$Res> {
  _$StatusHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? entityId = freezed,
    Object? entityName = freezed,
    Object? isCustomerNotified = freezed,
    Object? isVisibleOnFront = freezed,
    Object? parentId = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _value.copyWith(
            comment:
                freezed == comment
                    ? _value.comment
                    : comment // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            entityId:
                freezed == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as int?,
            entityName:
                freezed == entityName
                    ? _value.entityName
                    : entityName // ignore: cast_nullable_to_non_nullable
                        as String?,
            isCustomerNotified:
                freezed == isCustomerNotified
                    ? _value.isCustomerNotified
                    : isCustomerNotified // ignore: cast_nullable_to_non_nullable
                        as int?,
            isVisibleOnFront:
                freezed == isVisibleOnFront
                    ? _value.isVisibleOnFront
                    : isVisibleOnFront // ignore: cast_nullable_to_non_nullable
                        as int?,
            parentId:
                freezed == parentId
                    ? _value.parentId
                    : parentId // ignore: cast_nullable_to_non_nullable
                        as int?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StatusHistoryImplCopyWith<$Res>
    implements $StatusHistoryCopyWith<$Res> {
  factory _$$StatusHistoryImplCopyWith(
    _$StatusHistoryImpl value,
    $Res Function(_$StatusHistoryImpl) then,
  ) = __$$StatusHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "comment") String? comment,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    DateTime? createdAt,
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "entity_name") String? entityName,
    @JsonKey(name: "is_customer_notified") int? isCustomerNotified,
    @JsonKey(name: "is_visible_on_front") int? isVisibleOnFront,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "status") String? status,
  });
}

/// @nodoc
class __$$StatusHistoryImplCopyWithImpl<$Res>
    extends _$StatusHistoryCopyWithImpl<$Res, _$StatusHistoryImpl>
    implements _$$StatusHistoryImplCopyWith<$Res> {
  __$$StatusHistoryImplCopyWithImpl(
    _$StatusHistoryImpl _value,
    $Res Function(_$StatusHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? entityId = freezed,
    Object? entityName = freezed,
    Object? isCustomerNotified = freezed,
    Object? isVisibleOnFront = freezed,
    Object? parentId = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$StatusHistoryImpl(
        comment:
            freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        entityId:
            freezed == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as int?,
        entityName:
            freezed == entityName
                ? _value.entityName
                : entityName // ignore: cast_nullable_to_non_nullable
                    as String?,
        isCustomerNotified:
            freezed == isCustomerNotified
                ? _value.isCustomerNotified
                : isCustomerNotified // ignore: cast_nullable_to_non_nullable
                    as int?,
        isVisibleOnFront:
            freezed == isVisibleOnFront
                ? _value.isVisibleOnFront
                : isVisibleOnFront // ignore: cast_nullable_to_non_nullable
                    as int?,
        parentId:
            freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                    as int?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusHistoryImpl implements _StatusHistory {
  const _$StatusHistoryImpl({
    @JsonKey(name: "comment") this.comment,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    this.createdAt,
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "entity_name") this.entityName,
    @JsonKey(name: "is_customer_notified") this.isCustomerNotified,
    @JsonKey(name: "is_visible_on_front") this.isVisibleOnFront,
    @JsonKey(name: "parent_id") this.parentId,
    @JsonKey(name: "status") this.status,
  });

  factory _$StatusHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusHistoryImplFromJson(json);

  @override
  @JsonKey(name: "comment")
  final String? comment;
  @override
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  final DateTime? createdAt;
  @override
  @JsonKey(name: "entity_id")
  final int? entityId;
  @override
  @JsonKey(name: "entity_name")
  final String? entityName;
  @override
  @JsonKey(name: "is_customer_notified")
  final int? isCustomerNotified;
  @override
  @JsonKey(name: "is_visible_on_front")
  final int? isVisibleOnFront;
  @override
  @JsonKey(name: "parent_id")
  final int? parentId;
  @override
  @JsonKey(name: "status")
  final String? status;

  @override
  String toString() {
    return 'StatusHistory(comment: $comment, createdAt: $createdAt, entityId: $entityId, entityName: $entityName, isCustomerNotified: $isCustomerNotified, isVisibleOnFront: $isVisibleOnFront, parentId: $parentId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusHistoryImpl &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            (identical(other.isCustomerNotified, isCustomerNotified) ||
                other.isCustomerNotified == isCustomerNotified) &&
            (identical(other.isVisibleOnFront, isVisibleOnFront) ||
                other.isVisibleOnFront == isVisibleOnFront) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    comment,
    createdAt,
    entityId,
    entityName,
    isCustomerNotified,
    isVisibleOnFront,
    parentId,
    status,
  );

  /// Create a copy of StatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusHistoryImplCopyWith<_$StatusHistoryImpl> get copyWith =>
      __$$StatusHistoryImplCopyWithImpl<_$StatusHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusHistoryImplToJson(this);
  }
}

abstract class _StatusHistory implements StatusHistory {
  const factory _StatusHistory({
    @JsonKey(name: "comment") final String? comment,
    @JsonKey(
      name: "created_at",
      fromJson: safeDateTimeFromJson,
      toJson: safeDateTimeToJson,
    )
    final DateTime? createdAt,
    @JsonKey(name: "entity_id") final int? entityId,
    @JsonKey(name: "entity_name") final String? entityName,
    @JsonKey(name: "is_customer_notified") final int? isCustomerNotified,
    @JsonKey(name: "is_visible_on_front") final int? isVisibleOnFront,
    @JsonKey(name: "parent_id") final int? parentId,
    @JsonKey(name: "status") final String? status,
  }) = _$StatusHistoryImpl;

  factory _StatusHistory.fromJson(Map<String, dynamic> json) =
      _$StatusHistoryImpl.fromJson;

  @override
  @JsonKey(name: "comment")
  String? get comment;
  @override
  @JsonKey(
    name: "created_at",
    fromJson: safeDateTimeFromJson,
    toJson: safeDateTimeToJson,
  )
  DateTime? get createdAt;
  @override
  @JsonKey(name: "entity_id")
  int? get entityId;
  @override
  @JsonKey(name: "entity_name")
  String? get entityName;
  @override
  @JsonKey(name: "is_customer_notified")
  int? get isCustomerNotified;
  @override
  @JsonKey(name: "is_visible_on_front")
  int? get isVisibleOnFront;
  @override
  @JsonKey(name: "parent_id")
  int? get parentId;
  @override
  @JsonKey(name: "status")
  String? get status;

  /// Create a copy of StatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusHistoryImplCopyWith<_$StatusHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
