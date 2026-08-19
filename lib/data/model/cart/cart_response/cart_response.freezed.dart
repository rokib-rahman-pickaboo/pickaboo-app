// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) {
  return _CartResponse.fromJson(json);
}

/// @nodoc
mixin _$CartResponse {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "is_virtual")
  bool? get isVirtual => throw _privateConstructorUsedError;
  @JsonKey(name: "items")
  List<Item>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: "items_count")
  int? get itemsCount => throw _privateConstructorUsedError;
  @JsonKey(name: "items_qty")
  int? get itemsQty => throw _privateConstructorUsedError;
  @JsonKey(name: "customer")
  Customer? get customer => throw _privateConstructorUsedError;
  @JsonKey(name: "billing_address")
  BillingAddressClass? get billingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "orig_order_id")
  int? get origOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  Currency? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_is_guest")
  bool? get customerIsGuest => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_note_notify")
  bool? get customerNoteNotify => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_tax_class_id")
  int? get customerTaxClassId => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  int? get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: "extension_attributes")
  CartResponseExtensionAttributes? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CartResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartResponseCopyWith<CartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartResponseCopyWith<$Res> {
  factory $CartResponseCopyWith(
    CartResponse value,
    $Res Function(CartResponse) then,
  ) = _$CartResponseCopyWithImpl<$Res, CartResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "is_virtual") bool? isVirtual,
    @JsonKey(name: "items") List<Item>? items,
    @JsonKey(name: "items_count") int? itemsCount,
    @JsonKey(name: "items_qty") int? itemsQty,
    @JsonKey(name: "customer") Customer? customer,
    @JsonKey(name: "billing_address") BillingAddressClass? billingAddress,
    @JsonKey(name: "orig_order_id") int? origOrderId,
    @JsonKey(name: "currency") Currency? currency,
    @JsonKey(name: "customer_is_guest") bool? customerIsGuest,
    @JsonKey(name: "customer_note_notify") bool? customerNoteNotify,
    @JsonKey(name: "customer_tax_class_id") int? customerTaxClassId,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "extension_attributes")
    CartResponseExtensionAttributes? extensionAttributes,
  });

  $CustomerCopyWith<$Res>? get customer;
  $BillingAddressClassCopyWith<$Res>? get billingAddress;
  $CurrencyCopyWith<$Res>? get currency;
  $CartResponseExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class _$CartResponseCopyWithImpl<$Res, $Val extends CartResponse>
    implements $CartResponseCopyWith<$Res> {
  _$CartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
    Object? isVirtual = freezed,
    Object? items = freezed,
    Object? itemsCount = freezed,
    Object? itemsQty = freezed,
    Object? customer = freezed,
    Object? billingAddress = freezed,
    Object? origOrderId = freezed,
    Object? currency = freezed,
    Object? customerIsGuest = freezed,
    Object? customerNoteNotify = freezed,
    Object? customerTaxClassId = freezed,
    Object? storeId = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            isActive:
                freezed == isActive
                    ? _value.isActive
                    : isActive // ignore: cast_nullable_to_non_nullable
                        as bool?,
            isVirtual:
                freezed == isVirtual
                    ? _value.isVirtual
                    : isVirtual // ignore: cast_nullable_to_non_nullable
                        as bool?,
            items:
                freezed == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<Item>?,
            itemsCount:
                freezed == itemsCount
                    ? _value.itemsCount
                    : itemsCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            itemsQty:
                freezed == itemsQty
                    ? _value.itemsQty
                    : itemsQty // ignore: cast_nullable_to_non_nullable
                        as int?,
            customer:
                freezed == customer
                    ? _value.customer
                    : customer // ignore: cast_nullable_to_non_nullable
                        as Customer?,
            billingAddress:
                freezed == billingAddress
                    ? _value.billingAddress
                    : billingAddress // ignore: cast_nullable_to_non_nullable
                        as BillingAddressClass?,
            origOrderId:
                freezed == origOrderId
                    ? _value.origOrderId
                    : origOrderId // ignore: cast_nullable_to_non_nullable
                        as int?,
            currency:
                freezed == currency
                    ? _value.currency
                    : currency // ignore: cast_nullable_to_non_nullable
                        as Currency?,
            customerIsGuest:
                freezed == customerIsGuest
                    ? _value.customerIsGuest
                    : customerIsGuest // ignore: cast_nullable_to_non_nullable
                        as bool?,
            customerNoteNotify:
                freezed == customerNoteNotify
                    ? _value.customerNoteNotify
                    : customerNoteNotify // ignore: cast_nullable_to_non_nullable
                        as bool?,
            customerTaxClassId:
                freezed == customerTaxClassId
                    ? _value.customerTaxClassId
                    : customerTaxClassId // ignore: cast_nullable_to_non_nullable
                        as int?,
            storeId:
                freezed == storeId
                    ? _value.storeId
                    : storeId // ignore: cast_nullable_to_non_nullable
                        as int?,
            extensionAttributes:
                freezed == extensionAttributes
                    ? _value.extensionAttributes
                    : extensionAttributes // ignore: cast_nullable_to_non_nullable
                        as CartResponseExtensionAttributes?,
          )
          as $Val,
    );
  }

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BillingAddressClassCopyWith<$Res>? get billingAddress {
    if (_value.billingAddress == null) {
      return null;
    }

    return $BillingAddressClassCopyWith<$Res>(_value.billingAddress!, (value) {
      return _then(_value.copyWith(billingAddress: value) as $Val);
    });
  }

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get currency {
    if (_value.currency == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.currency!, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartResponseExtensionAttributesCopyWith<$Res>? get extensionAttributes {
    if (_value.extensionAttributes == null) {
      return null;
    }

    return $CartResponseExtensionAttributesCopyWith<$Res>(
      _value.extensionAttributes!,
      (value) {
        return _then(_value.copyWith(extensionAttributes: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$CartResponseImplCopyWith<$Res>
    implements $CartResponseCopyWith<$Res> {
  factory _$$CartResponseImplCopyWith(
    _$CartResponseImpl value,
    $Res Function(_$CartResponseImpl) then,
  ) = __$$CartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "is_virtual") bool? isVirtual,
    @JsonKey(name: "items") List<Item>? items,
    @JsonKey(name: "items_count") int? itemsCount,
    @JsonKey(name: "items_qty") int? itemsQty,
    @JsonKey(name: "customer") Customer? customer,
    @JsonKey(name: "billing_address") BillingAddressClass? billingAddress,
    @JsonKey(name: "orig_order_id") int? origOrderId,
    @JsonKey(name: "currency") Currency? currency,
    @JsonKey(name: "customer_is_guest") bool? customerIsGuest,
    @JsonKey(name: "customer_note_notify") bool? customerNoteNotify,
    @JsonKey(name: "customer_tax_class_id") int? customerTaxClassId,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "extension_attributes")
    CartResponseExtensionAttributes? extensionAttributes,
  });

  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $BillingAddressClassCopyWith<$Res>? get billingAddress;
  @override
  $CurrencyCopyWith<$Res>? get currency;
  @override
  $CartResponseExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class __$$CartResponseImplCopyWithImpl<$Res>
    extends _$CartResponseCopyWithImpl<$Res, _$CartResponseImpl>
    implements _$$CartResponseImplCopyWith<$Res> {
  __$$CartResponseImplCopyWithImpl(
    _$CartResponseImpl _value,
    $Res Function(_$CartResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
    Object? isVirtual = freezed,
    Object? items = freezed,
    Object? itemsCount = freezed,
    Object? itemsQty = freezed,
    Object? customer = freezed,
    Object? billingAddress = freezed,
    Object? origOrderId = freezed,
    Object? currency = freezed,
    Object? customerIsGuest = freezed,
    Object? customerNoteNotify = freezed,
    Object? customerTaxClassId = freezed,
    Object? storeId = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CartResponseImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        isActive:
            freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                    as bool?,
        isVirtual:
            freezed == isVirtual
                ? _value.isVirtual
                : isVirtual // ignore: cast_nullable_to_non_nullable
                    as bool?,
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<Item>?,
        itemsCount:
            freezed == itemsCount
                ? _value.itemsCount
                : itemsCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        itemsQty:
            freezed == itemsQty
                ? _value.itemsQty
                : itemsQty // ignore: cast_nullable_to_non_nullable
                    as int?,
        customer:
            freezed == customer
                ? _value.customer
                : customer // ignore: cast_nullable_to_non_nullable
                    as Customer?,
        billingAddress:
            freezed == billingAddress
                ? _value.billingAddress
                : billingAddress // ignore: cast_nullable_to_non_nullable
                    as BillingAddressClass?,
        origOrderId:
            freezed == origOrderId
                ? _value.origOrderId
                : origOrderId // ignore: cast_nullable_to_non_nullable
                    as int?,
        currency:
            freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                    as Currency?,
        customerIsGuest:
            freezed == customerIsGuest
                ? _value.customerIsGuest
                : customerIsGuest // ignore: cast_nullable_to_non_nullable
                    as bool?,
        customerNoteNotify:
            freezed == customerNoteNotify
                ? _value.customerNoteNotify
                : customerNoteNotify // ignore: cast_nullable_to_non_nullable
                    as bool?,
        customerTaxClassId:
            freezed == customerTaxClassId
                ? _value.customerTaxClassId
                : customerTaxClassId // ignore: cast_nullable_to_non_nullable
                    as int?,
        storeId:
            freezed == storeId
                ? _value.storeId
                : storeId // ignore: cast_nullable_to_non_nullable
                    as int?,
        extensionAttributes:
            freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                    as CartResponseExtensionAttributes?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartResponseImpl implements _CartResponse {
  const _$CartResponseImpl({
    @JsonKey(name: "id") this.id,
    @JsonKey(name: "created_at") this.createdAt,
    @JsonKey(name: "updated_at") this.updatedAt,
    @JsonKey(name: "is_active") this.isActive,
    @JsonKey(name: "is_virtual") this.isVirtual,
    @JsonKey(name: "items") final List<Item>? items,
    @JsonKey(name: "items_count") this.itemsCount,
    @JsonKey(name: "items_qty") this.itemsQty,
    @JsonKey(name: "customer") this.customer,
    @JsonKey(name: "billing_address") this.billingAddress,
    @JsonKey(name: "orig_order_id") this.origOrderId,
    @JsonKey(name: "currency") this.currency,
    @JsonKey(name: "customer_is_guest") this.customerIsGuest,
    @JsonKey(name: "customer_note_notify") this.customerNoteNotify,
    @JsonKey(name: "customer_tax_class_id") this.customerTaxClassId,
    @JsonKey(name: "store_id") this.storeId,
    @JsonKey(name: "extension_attributes") this.extensionAttributes,
  }) : _items = items;

  factory _$CartResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  @JsonKey(name: "is_virtual")
  final bool? isVirtual;
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
  @JsonKey(name: "items_count")
  final int? itemsCount;
  @override
  @JsonKey(name: "items_qty")
  final int? itemsQty;
  @override
  @JsonKey(name: "customer")
  final Customer? customer;
  @override
  @JsonKey(name: "billing_address")
  final BillingAddressClass? billingAddress;
  @override
  @JsonKey(name: "orig_order_id")
  final int? origOrderId;
  @override
  @JsonKey(name: "currency")
  final Currency? currency;
  @override
  @JsonKey(name: "customer_is_guest")
  final bool? customerIsGuest;
  @override
  @JsonKey(name: "customer_note_notify")
  final bool? customerNoteNotify;
  @override
  @JsonKey(name: "customer_tax_class_id")
  final int? customerTaxClassId;
  @override
  @JsonKey(name: "store_id")
  final int? storeId;
  @override
  @JsonKey(name: "extension_attributes")
  final CartResponseExtensionAttributes? extensionAttributes;

  @override
  String toString() {
    return 'CartResponse(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, isVirtual: $isVirtual, items: $items, itemsCount: $itemsCount, itemsQty: $itemsQty, customer: $customer, billingAddress: $billingAddress, origOrderId: $origOrderId, currency: $currency, customerIsGuest: $customerIsGuest, customerNoteNotify: $customerNoteNotify, customerTaxClassId: $customerTaxClassId, storeId: $storeId, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isVirtual, isVirtual) ||
                other.isVirtual == isVirtual) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            (identical(other.itemsQty, itemsQty) ||
                other.itemsQty == itemsQty) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.origOrderId, origOrderId) ||
                other.origOrderId == origOrderId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.customerIsGuest, customerIsGuest) ||
                other.customerIsGuest == customerIsGuest) &&
            (identical(other.customerNoteNotify, customerNoteNotify) ||
                other.customerNoteNotify == customerNoteNotify) &&
            (identical(other.customerTaxClassId, customerTaxClassId) ||
                other.customerTaxClassId == customerTaxClassId) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.extensionAttributes, extensionAttributes) ||
                other.extensionAttributes == extensionAttributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    updatedAt,
    isActive,
    isVirtual,
    const DeepCollectionEquality().hash(_items),
    itemsCount,
    itemsQty,
    customer,
    billingAddress,
    origOrderId,
    currency,
    customerIsGuest,
    customerNoteNotify,
    customerTaxClassId,
    storeId,
    extensionAttributes,
  );

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartResponseImplCopyWith<_$CartResponseImpl> get copyWith =>
      __$$CartResponseImplCopyWithImpl<_$CartResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartResponseImplToJson(this);
  }
}

abstract class _CartResponse implements CartResponse {
  const factory _CartResponse({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "created_at") final DateTime? createdAt,
    @JsonKey(name: "updated_at") final DateTime? updatedAt,
    @JsonKey(name: "is_active") final bool? isActive,
    @JsonKey(name: "is_virtual") final bool? isVirtual,
    @JsonKey(name: "items") final List<Item>? items,
    @JsonKey(name: "items_count") final int? itemsCount,
    @JsonKey(name: "items_qty") final int? itemsQty,
    @JsonKey(name: "customer") final Customer? customer,
    @JsonKey(name: "billing_address") final BillingAddressClass? billingAddress,
    @JsonKey(name: "orig_order_id") final int? origOrderId,
    @JsonKey(name: "currency") final Currency? currency,
    @JsonKey(name: "customer_is_guest") final bool? customerIsGuest,
    @JsonKey(name: "customer_note_notify") final bool? customerNoteNotify,
    @JsonKey(name: "customer_tax_class_id") final int? customerTaxClassId,
    @JsonKey(name: "store_id") final int? storeId,
    @JsonKey(name: "extension_attributes")
    final CartResponseExtensionAttributes? extensionAttributes,
  }) = _$CartResponseImpl;

  factory _CartResponse.fromJson(Map<String, dynamic> json) =
      _$CartResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  @JsonKey(name: "is_virtual")
  bool? get isVirtual;
  @override
  @JsonKey(name: "items")
  List<Item>? get items;
  @override
  @JsonKey(name: "items_count")
  int? get itemsCount;
  @override
  @JsonKey(name: "items_qty")
  int? get itemsQty;
  @override
  @JsonKey(name: "customer")
  Customer? get customer;
  @override
  @JsonKey(name: "billing_address")
  BillingAddressClass? get billingAddress;
  @override
  @JsonKey(name: "orig_order_id")
  int? get origOrderId;
  @override
  @JsonKey(name: "currency")
  Currency? get currency;
  @override
  @JsonKey(name: "customer_is_guest")
  bool? get customerIsGuest;
  @override
  @JsonKey(name: "customer_note_notify")
  bool? get customerNoteNotify;
  @override
  @JsonKey(name: "customer_tax_class_id")
  int? get customerTaxClassId;
  @override
  @JsonKey(name: "store_id")
  int? get storeId;
  @override
  @JsonKey(name: "extension_attributes")
  CartResponseExtensionAttributes? get extensionAttributes;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartResponseImplCopyWith<_$CartResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BillingAddressClass _$BillingAddressClassFromJson(Map<String, dynamic> json) {
  return _BillingAddressClass.fromJson(json);
}

/// @nodoc
mixin _$BillingAddressClass {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "region")
  dynamic get region => throw _privateConstructorUsedError;
  @JsonKey(name: "region_id")
  dynamic get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: "region_code")
  dynamic get regionCode => throw _privateConstructorUsedError;
  @JsonKey(name: "country_id")
  dynamic get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: "street")
  List<String>? get street => throw _privateConstructorUsedError;
  @JsonKey(name: "telephone")
  dynamic get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: "postcode")
  dynamic get postcode => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  dynamic get city => throw _privateConstructorUsedError;
  @JsonKey(name: "firstname")
  dynamic get firstname => throw _privateConstructorUsedError;
  @JsonKey(name: "lastname")
  dynamic get lastname => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_id")
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "same_as_billing")
  int? get sameAsBilling => throw _privateConstructorUsedError;
  @JsonKey(name: "save_in_address_book")
  int? get saveInAddressBook => throw _privateConstructorUsedError;

  /// Serializes this BillingAddressClass to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BillingAddressClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillingAddressClassCopyWith<BillingAddressClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillingAddressClassCopyWith<$Res> {
  factory $BillingAddressClassCopyWith(
    BillingAddressClass value,
    $Res Function(BillingAddressClass) then,
  ) = _$BillingAddressClassCopyWithImpl<$Res, BillingAddressClass>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "region") dynamic region,
    @JsonKey(name: "region_id") dynamic regionId,
    @JsonKey(name: "region_code") dynamic regionCode,
    @JsonKey(name: "country_id") dynamic countryId,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "telephone") dynamic telephone,
    @JsonKey(name: "postcode") dynamic postcode,
    @JsonKey(name: "city") dynamic city,
    @JsonKey(name: "firstname") dynamic firstname,
    @JsonKey(name: "lastname") dynamic lastname,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "same_as_billing") int? sameAsBilling,
    @JsonKey(name: "save_in_address_book") int? saveInAddressBook,
  });
}

/// @nodoc
class _$BillingAddressClassCopyWithImpl<$Res, $Val extends BillingAddressClass>
    implements $BillingAddressClassCopyWith<$Res> {
  _$BillingAddressClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillingAddressClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
    Object? regionCode = freezed,
    Object? countryId = freezed,
    Object? street = freezed,
    Object? telephone = freezed,
    Object? postcode = freezed,
    Object? city = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? customerId = freezed,
    Object? email = freezed,
    Object? sameAsBilling = freezed,
    Object? saveInAddressBook = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            region:
                freezed == region
                    ? _value.region
                    : region // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            regionId:
                freezed == regionId
                    ? _value.regionId
                    : regionId // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            regionCode:
                freezed == regionCode
                    ? _value.regionCode
                    : regionCode // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            countryId:
                freezed == countryId
                    ? _value.countryId
                    : countryId // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            street:
                freezed == street
                    ? _value.street
                    : street // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            telephone:
                freezed == telephone
                    ? _value.telephone
                    : telephone // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            postcode:
                freezed == postcode
                    ? _value.postcode
                    : postcode // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            city:
                freezed == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            firstname:
                freezed == firstname
                    ? _value.firstname
                    : firstname // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            lastname:
                freezed == lastname
                    ? _value.lastname
                    : lastname // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            customerId:
                freezed == customerId
                    ? _value.customerId
                    : customerId // ignore: cast_nullable_to_non_nullable
                        as int?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            sameAsBilling:
                freezed == sameAsBilling
                    ? _value.sameAsBilling
                    : sameAsBilling // ignore: cast_nullable_to_non_nullable
                        as int?,
            saveInAddressBook:
                freezed == saveInAddressBook
                    ? _value.saveInAddressBook
                    : saveInAddressBook // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BillingAddressClassImplCopyWith<$Res>
    implements $BillingAddressClassCopyWith<$Res> {
  factory _$$BillingAddressClassImplCopyWith(
    _$BillingAddressClassImpl value,
    $Res Function(_$BillingAddressClassImpl) then,
  ) = __$$BillingAddressClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "region") dynamic region,
    @JsonKey(name: "region_id") dynamic regionId,
    @JsonKey(name: "region_code") dynamic regionCode,
    @JsonKey(name: "country_id") dynamic countryId,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "telephone") dynamic telephone,
    @JsonKey(name: "postcode") dynamic postcode,
    @JsonKey(name: "city") dynamic city,
    @JsonKey(name: "firstname") dynamic firstname,
    @JsonKey(name: "lastname") dynamic lastname,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "same_as_billing") int? sameAsBilling,
    @JsonKey(name: "save_in_address_book") int? saveInAddressBook,
  });
}

/// @nodoc
class __$$BillingAddressClassImplCopyWithImpl<$Res>
    extends _$BillingAddressClassCopyWithImpl<$Res, _$BillingAddressClassImpl>
    implements _$$BillingAddressClassImplCopyWith<$Res> {
  __$$BillingAddressClassImplCopyWithImpl(
    _$BillingAddressClassImpl _value,
    $Res Function(_$BillingAddressClassImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BillingAddressClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
    Object? regionCode = freezed,
    Object? countryId = freezed,
    Object? street = freezed,
    Object? telephone = freezed,
    Object? postcode = freezed,
    Object? city = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? customerId = freezed,
    Object? email = freezed,
    Object? sameAsBilling = freezed,
    Object? saveInAddressBook = freezed,
  }) {
    return _then(
      _$BillingAddressClassImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        region:
            freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        regionId:
            freezed == regionId
                ? _value.regionId
                : regionId // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        regionCode:
            freezed == regionCode
                ? _value.regionCode
                : regionCode // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        countryId:
            freezed == countryId
                ? _value.countryId
                : countryId // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        street:
            freezed == street
                ? _value._street
                : street // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        telephone:
            freezed == telephone
                ? _value.telephone
                : telephone // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        postcode:
            freezed == postcode
                ? _value.postcode
                : postcode // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        city:
            freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        firstname:
            freezed == firstname
                ? _value.firstname
                : firstname // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        lastname:
            freezed == lastname
                ? _value.lastname
                : lastname // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        customerId:
            freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                    as int?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        sameAsBilling:
            freezed == sameAsBilling
                ? _value.sameAsBilling
                : sameAsBilling // ignore: cast_nullable_to_non_nullable
                    as int?,
        saveInAddressBook:
            freezed == saveInAddressBook
                ? _value.saveInAddressBook
                : saveInAddressBook // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BillingAddressClassImpl implements _BillingAddressClass {
  const _$BillingAddressClassImpl({
    @JsonKey(name: "id") this.id,
    @JsonKey(name: "region") this.region,
    @JsonKey(name: "region_id") this.regionId,
    @JsonKey(name: "region_code") this.regionCode,
    @JsonKey(name: "country_id") this.countryId,
    @JsonKey(name: "street") final List<String>? street,
    @JsonKey(name: "telephone") this.telephone,
    @JsonKey(name: "postcode") this.postcode,
    @JsonKey(name: "city") this.city,
    @JsonKey(name: "firstname") this.firstname,
    @JsonKey(name: "lastname") this.lastname,
    @JsonKey(name: "customer_id") this.customerId,
    @JsonKey(name: "email") this.email,
    @JsonKey(name: "same_as_billing") this.sameAsBilling,
    @JsonKey(name: "save_in_address_book") this.saveInAddressBook,
  }) : _street = street;

  factory _$BillingAddressClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillingAddressClassImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "region")
  final dynamic region;
  @override
  @JsonKey(name: "region_id")
  final dynamic regionId;
  @override
  @JsonKey(name: "region_code")
  final dynamic regionCode;
  @override
  @JsonKey(name: "country_id")
  final dynamic countryId;
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
  final dynamic telephone;
  @override
  @JsonKey(name: "postcode")
  final dynamic postcode;
  @override
  @JsonKey(name: "city")
  final dynamic city;
  @override
  @JsonKey(name: "firstname")
  final dynamic firstname;
  @override
  @JsonKey(name: "lastname")
  final dynamic lastname;
  @override
  @JsonKey(name: "customer_id")
  final int? customerId;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "same_as_billing")
  final int? sameAsBilling;
  @override
  @JsonKey(name: "save_in_address_book")
  final int? saveInAddressBook;

  @override
  String toString() {
    return 'BillingAddressClass(id: $id, region: $region, regionId: $regionId, regionCode: $regionCode, countryId: $countryId, street: $street, telephone: $telephone, postcode: $postcode, city: $city, firstname: $firstname, lastname: $lastname, customerId: $customerId, email: $email, sameAsBilling: $sameAsBilling, saveInAddressBook: $saveInAddressBook)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillingAddressClassImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.region, region) &&
            const DeepCollectionEquality().equals(other.regionId, regionId) &&
            const DeepCollectionEquality().equals(
              other.regionCode,
              regionCode,
            ) &&
            const DeepCollectionEquality().equals(other.countryId, countryId) &&
            const DeepCollectionEquality().equals(other._street, _street) &&
            const DeepCollectionEquality().equals(other.telephone, telephone) &&
            const DeepCollectionEquality().equals(other.postcode, postcode) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.sameAsBilling, sameAsBilling) ||
                other.sameAsBilling == sameAsBilling) &&
            (identical(other.saveInAddressBook, saveInAddressBook) ||
                other.saveInAddressBook == saveInAddressBook));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(region),
    const DeepCollectionEquality().hash(regionId),
    const DeepCollectionEquality().hash(regionCode),
    const DeepCollectionEquality().hash(countryId),
    const DeepCollectionEquality().hash(_street),
    const DeepCollectionEquality().hash(telephone),
    const DeepCollectionEquality().hash(postcode),
    const DeepCollectionEquality().hash(city),
    const DeepCollectionEquality().hash(firstname),
    const DeepCollectionEquality().hash(lastname),
    customerId,
    email,
    sameAsBilling,
    saveInAddressBook,
  );

  /// Create a copy of BillingAddressClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillingAddressClassImplCopyWith<_$BillingAddressClassImpl> get copyWith =>
      __$$BillingAddressClassImplCopyWithImpl<_$BillingAddressClassImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BillingAddressClassImplToJson(this);
  }
}

abstract class _BillingAddressClass implements BillingAddressClass {
  const factory _BillingAddressClass({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "region") final dynamic region,
    @JsonKey(name: "region_id") final dynamic regionId,
    @JsonKey(name: "region_code") final dynamic regionCode,
    @JsonKey(name: "country_id") final dynamic countryId,
    @JsonKey(name: "street") final List<String>? street,
    @JsonKey(name: "telephone") final dynamic telephone,
    @JsonKey(name: "postcode") final dynamic postcode,
    @JsonKey(name: "city") final dynamic city,
    @JsonKey(name: "firstname") final dynamic firstname,
    @JsonKey(name: "lastname") final dynamic lastname,
    @JsonKey(name: "customer_id") final int? customerId,
    @JsonKey(name: "email") final String? email,
    @JsonKey(name: "same_as_billing") final int? sameAsBilling,
    @JsonKey(name: "save_in_address_book") final int? saveInAddressBook,
  }) = _$BillingAddressClassImpl;

  factory _BillingAddressClass.fromJson(Map<String, dynamic> json) =
      _$BillingAddressClassImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "region")
  dynamic get region;
  @override
  @JsonKey(name: "region_id")
  dynamic get regionId;
  @override
  @JsonKey(name: "region_code")
  dynamic get regionCode;
  @override
  @JsonKey(name: "country_id")
  dynamic get countryId;
  @override
  @JsonKey(name: "street")
  List<String>? get street;
  @override
  @JsonKey(name: "telephone")
  dynamic get telephone;
  @override
  @JsonKey(name: "postcode")
  dynamic get postcode;
  @override
  @JsonKey(name: "city")
  dynamic get city;
  @override
  @JsonKey(name: "firstname")
  dynamic get firstname;
  @override
  @JsonKey(name: "lastname")
  dynamic get lastname;
  @override
  @JsonKey(name: "customer_id")
  int? get customerId;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "same_as_billing")
  int? get sameAsBilling;
  @override
  @JsonKey(name: "save_in_address_book")
  int? get saveInAddressBook;

  /// Create a copy of BillingAddressClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillingAddressClassImplCopyWith<_$BillingAddressClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$Currency {
  @JsonKey(name: "global_currency_code")
  String? get globalCurrencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: "base_currency_code")
  String? get baseCurrencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: "store_currency_code")
  String? get storeCurrencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: "quote_currency_code")
  String? get quoteCurrencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: "store_to_base_rate")
  int? get storeToBaseRate => throw _privateConstructorUsedError;
  @JsonKey(name: "store_to_quote_rate")
  int? get storeToQuoteRate => throw _privateConstructorUsedError;
  @JsonKey(name: "base_to_global_rate")
  int? get baseToGlobalRate => throw _privateConstructorUsedError;
  @JsonKey(name: "base_to_quote_rate")
  int? get baseToQuoteRate => throw _privateConstructorUsedError;

  /// Serializes this Currency to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call({
    @JsonKey(name: "global_currency_code") String? globalCurrencyCode,
    @JsonKey(name: "base_currency_code") String? baseCurrencyCode,
    @JsonKey(name: "store_currency_code") String? storeCurrencyCode,
    @JsonKey(name: "quote_currency_code") String? quoteCurrencyCode,
    @JsonKey(name: "store_to_base_rate") int? storeToBaseRate,
    @JsonKey(name: "store_to_quote_rate") int? storeToQuoteRate,
    @JsonKey(name: "base_to_global_rate") int? baseToGlobalRate,
    @JsonKey(name: "base_to_quote_rate") int? baseToQuoteRate,
  });
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? globalCurrencyCode = freezed,
    Object? baseCurrencyCode = freezed,
    Object? storeCurrencyCode = freezed,
    Object? quoteCurrencyCode = freezed,
    Object? storeToBaseRate = freezed,
    Object? storeToQuoteRate = freezed,
    Object? baseToGlobalRate = freezed,
    Object? baseToQuoteRate = freezed,
  }) {
    return _then(
      _value.copyWith(
            globalCurrencyCode:
                freezed == globalCurrencyCode
                    ? _value.globalCurrencyCode
                    : globalCurrencyCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            baseCurrencyCode:
                freezed == baseCurrencyCode
                    ? _value.baseCurrencyCode
                    : baseCurrencyCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            storeCurrencyCode:
                freezed == storeCurrencyCode
                    ? _value.storeCurrencyCode
                    : storeCurrencyCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            quoteCurrencyCode:
                freezed == quoteCurrencyCode
                    ? _value.quoteCurrencyCode
                    : quoteCurrencyCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            storeToBaseRate:
                freezed == storeToBaseRate
                    ? _value.storeToBaseRate
                    : storeToBaseRate // ignore: cast_nullable_to_non_nullable
                        as int?,
            storeToQuoteRate:
                freezed == storeToQuoteRate
                    ? _value.storeToQuoteRate
                    : storeToQuoteRate // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseToGlobalRate:
                freezed == baseToGlobalRate
                    ? _value.baseToGlobalRate
                    : baseToGlobalRate // ignore: cast_nullable_to_non_nullable
                        as int?,
            baseToQuoteRate:
                freezed == baseToQuoteRate
                    ? _value.baseToQuoteRate
                    : baseToQuoteRate // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CurrencyImplCopyWith<$Res>
    implements $CurrencyCopyWith<$Res> {
  factory _$$CurrencyImplCopyWith(
    _$CurrencyImpl value,
    $Res Function(_$CurrencyImpl) then,
  ) = __$$CurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "global_currency_code") String? globalCurrencyCode,
    @JsonKey(name: "base_currency_code") String? baseCurrencyCode,
    @JsonKey(name: "store_currency_code") String? storeCurrencyCode,
    @JsonKey(name: "quote_currency_code") String? quoteCurrencyCode,
    @JsonKey(name: "store_to_base_rate") int? storeToBaseRate,
    @JsonKey(name: "store_to_quote_rate") int? storeToQuoteRate,
    @JsonKey(name: "base_to_global_rate") int? baseToGlobalRate,
    @JsonKey(name: "base_to_quote_rate") int? baseToQuoteRate,
  });
}

/// @nodoc
class __$$CurrencyImplCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$CurrencyImpl>
    implements _$$CurrencyImplCopyWith<$Res> {
  __$$CurrencyImplCopyWithImpl(
    _$CurrencyImpl _value,
    $Res Function(_$CurrencyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? globalCurrencyCode = freezed,
    Object? baseCurrencyCode = freezed,
    Object? storeCurrencyCode = freezed,
    Object? quoteCurrencyCode = freezed,
    Object? storeToBaseRate = freezed,
    Object? storeToQuoteRate = freezed,
    Object? baseToGlobalRate = freezed,
    Object? baseToQuoteRate = freezed,
  }) {
    return _then(
      _$CurrencyImpl(
        globalCurrencyCode:
            freezed == globalCurrencyCode
                ? _value.globalCurrencyCode
                : globalCurrencyCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        baseCurrencyCode:
            freezed == baseCurrencyCode
                ? _value.baseCurrencyCode
                : baseCurrencyCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        storeCurrencyCode:
            freezed == storeCurrencyCode
                ? _value.storeCurrencyCode
                : storeCurrencyCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        quoteCurrencyCode:
            freezed == quoteCurrencyCode
                ? _value.quoteCurrencyCode
                : quoteCurrencyCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        storeToBaseRate:
            freezed == storeToBaseRate
                ? _value.storeToBaseRate
                : storeToBaseRate // ignore: cast_nullable_to_non_nullable
                    as int?,
        storeToQuoteRate:
            freezed == storeToQuoteRate
                ? _value.storeToQuoteRate
                : storeToQuoteRate // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseToGlobalRate:
            freezed == baseToGlobalRate
                ? _value.baseToGlobalRate
                : baseToGlobalRate // ignore: cast_nullable_to_non_nullable
                    as int?,
        baseToQuoteRate:
            freezed == baseToQuoteRate
                ? _value.baseToQuoteRate
                : baseToQuoteRate // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyImpl implements _Currency {
  const _$CurrencyImpl({
    @JsonKey(name: "global_currency_code") this.globalCurrencyCode,
    @JsonKey(name: "base_currency_code") this.baseCurrencyCode,
    @JsonKey(name: "store_currency_code") this.storeCurrencyCode,
    @JsonKey(name: "quote_currency_code") this.quoteCurrencyCode,
    @JsonKey(name: "store_to_base_rate") this.storeToBaseRate,
    @JsonKey(name: "store_to_quote_rate") this.storeToQuoteRate,
    @JsonKey(name: "base_to_global_rate") this.baseToGlobalRate,
    @JsonKey(name: "base_to_quote_rate") this.baseToQuoteRate,
  });

  factory _$CurrencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyImplFromJson(json);

  @override
  @JsonKey(name: "global_currency_code")
  final String? globalCurrencyCode;
  @override
  @JsonKey(name: "base_currency_code")
  final String? baseCurrencyCode;
  @override
  @JsonKey(name: "store_currency_code")
  final String? storeCurrencyCode;
  @override
  @JsonKey(name: "quote_currency_code")
  final String? quoteCurrencyCode;
  @override
  @JsonKey(name: "store_to_base_rate")
  final int? storeToBaseRate;
  @override
  @JsonKey(name: "store_to_quote_rate")
  final int? storeToQuoteRate;
  @override
  @JsonKey(name: "base_to_global_rate")
  final int? baseToGlobalRate;
  @override
  @JsonKey(name: "base_to_quote_rate")
  final int? baseToQuoteRate;

  @override
  String toString() {
    return 'Currency(globalCurrencyCode: $globalCurrencyCode, baseCurrencyCode: $baseCurrencyCode, storeCurrencyCode: $storeCurrencyCode, quoteCurrencyCode: $quoteCurrencyCode, storeToBaseRate: $storeToBaseRate, storeToQuoteRate: $storeToQuoteRate, baseToGlobalRate: $baseToGlobalRate, baseToQuoteRate: $baseToQuoteRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyImpl &&
            (identical(other.globalCurrencyCode, globalCurrencyCode) ||
                other.globalCurrencyCode == globalCurrencyCode) &&
            (identical(other.baseCurrencyCode, baseCurrencyCode) ||
                other.baseCurrencyCode == baseCurrencyCode) &&
            (identical(other.storeCurrencyCode, storeCurrencyCode) ||
                other.storeCurrencyCode == storeCurrencyCode) &&
            (identical(other.quoteCurrencyCode, quoteCurrencyCode) ||
                other.quoteCurrencyCode == quoteCurrencyCode) &&
            (identical(other.storeToBaseRate, storeToBaseRate) ||
                other.storeToBaseRate == storeToBaseRate) &&
            (identical(other.storeToQuoteRate, storeToQuoteRate) ||
                other.storeToQuoteRate == storeToQuoteRate) &&
            (identical(other.baseToGlobalRate, baseToGlobalRate) ||
                other.baseToGlobalRate == baseToGlobalRate) &&
            (identical(other.baseToQuoteRate, baseToQuoteRate) ||
                other.baseToQuoteRate == baseToQuoteRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    globalCurrencyCode,
    baseCurrencyCode,
    storeCurrencyCode,
    quoteCurrencyCode,
    storeToBaseRate,
    storeToQuoteRate,
    baseToGlobalRate,
    baseToQuoteRate,
  );

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      __$$CurrencyImplCopyWithImpl<_$CurrencyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyImplToJson(this);
  }
}

abstract class _Currency implements Currency {
  const factory _Currency({
    @JsonKey(name: "global_currency_code") final String? globalCurrencyCode,
    @JsonKey(name: "base_currency_code") final String? baseCurrencyCode,
    @JsonKey(name: "store_currency_code") final String? storeCurrencyCode,
    @JsonKey(name: "quote_currency_code") final String? quoteCurrencyCode,
    @JsonKey(name: "store_to_base_rate") final int? storeToBaseRate,
    @JsonKey(name: "store_to_quote_rate") final int? storeToQuoteRate,
    @JsonKey(name: "base_to_global_rate") final int? baseToGlobalRate,
    @JsonKey(name: "base_to_quote_rate") final int? baseToQuoteRate,
  }) = _$CurrencyImpl;

  factory _Currency.fromJson(Map<String, dynamic> json) =
      _$CurrencyImpl.fromJson;

  @override
  @JsonKey(name: "global_currency_code")
  String? get globalCurrencyCode;
  @override
  @JsonKey(name: "base_currency_code")
  String? get baseCurrencyCode;
  @override
  @JsonKey(name: "store_currency_code")
  String? get storeCurrencyCode;
  @override
  @JsonKey(name: "quote_currency_code")
  String? get quoteCurrencyCode;
  @override
  @JsonKey(name: "store_to_base_rate")
  int? get storeToBaseRate;
  @override
  @JsonKey(name: "store_to_quote_rate")
  int? get storeToQuoteRate;
  @override
  @JsonKey(name: "base_to_global_rate")
  int? get baseToGlobalRate;
  @override
  @JsonKey(name: "base_to_quote_rate")
  int? get baseToQuoteRate;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "group_id")
  int? get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: "default_shipping")
  String? get defaultShipping => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "created_in")
  String? get createdIn => throw _privateConstructorUsedError;
  @JsonKey(name: "dob")
  DateTime? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "firstname")
  String? get firstname => throw _privateConstructorUsedError;
  @JsonKey(name: "lastname")
  String? get lastname => throw _privateConstructorUsedError;
  @JsonKey(name: "gender")
  int? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  int? get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: "website_id")
  int? get websiteId => throw _privateConstructorUsedError;
  @JsonKey(name: "addresses")
  List<AddressElement>? get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: "disable_auto_group_change")
  int? get disableAutoGroupChange => throw _privateConstructorUsedError;
  @JsonKey(name: "extension_attributes")
  CustomerExtensionAttributes? get extensionAttributes =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "custom_attributes")
  List<CustomAttribute>? get customAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "group_id") int? groupId,
    @JsonKey(name: "default_shipping") String? defaultShipping,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "created_in") String? createdIn,
    @JsonKey(name: "dob") DateTime? dob,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "gender") int? gender,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "website_id") int? websiteId,
    @JsonKey(name: "addresses") List<AddressElement>? addresses,
    @JsonKey(name: "disable_auto_group_change") int? disableAutoGroupChange,
    @JsonKey(name: "extension_attributes")
    CustomerExtensionAttributes? extensionAttributes,
    @JsonKey(name: "custom_attributes") List<CustomAttribute>? customAttributes,
  });

  $CustomerExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupId = freezed,
    Object? defaultShipping = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? createdIn = freezed,
    Object? dob = freezed,
    Object? email = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? gender = freezed,
    Object? storeId = freezed,
    Object? websiteId = freezed,
    Object? addresses = freezed,
    Object? disableAutoGroupChange = freezed,
    Object? extensionAttributes = freezed,
    Object? customAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            groupId:
                freezed == groupId
                    ? _value.groupId
                    : groupId // ignore: cast_nullable_to_non_nullable
                        as int?,
            defaultShipping:
                freezed == defaultShipping
                    ? _value.defaultShipping
                    : defaultShipping // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            createdIn:
                freezed == createdIn
                    ? _value.createdIn
                    : createdIn // ignore: cast_nullable_to_non_nullable
                        as String?,
            dob:
                freezed == dob
                    ? _value.dob
                    : dob // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
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
            gender:
                freezed == gender
                    ? _value.gender
                    : gender // ignore: cast_nullable_to_non_nullable
                        as int?,
            storeId:
                freezed == storeId
                    ? _value.storeId
                    : storeId // ignore: cast_nullable_to_non_nullable
                        as int?,
            websiteId:
                freezed == websiteId
                    ? _value.websiteId
                    : websiteId // ignore: cast_nullable_to_non_nullable
                        as int?,
            addresses:
                freezed == addresses
                    ? _value.addresses
                    : addresses // ignore: cast_nullable_to_non_nullable
                        as List<AddressElement>?,
            disableAutoGroupChange:
                freezed == disableAutoGroupChange
                    ? _value.disableAutoGroupChange
                    : disableAutoGroupChange // ignore: cast_nullable_to_non_nullable
                        as int?,
            extensionAttributes:
                freezed == extensionAttributes
                    ? _value.extensionAttributes
                    : extensionAttributes // ignore: cast_nullable_to_non_nullable
                        as CustomerExtensionAttributes?,
            customAttributes:
                freezed == customAttributes
                    ? _value.customAttributes
                    : customAttributes // ignore: cast_nullable_to_non_nullable
                        as List<CustomAttribute>?,
          )
          as $Val,
    );
  }

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerExtensionAttributesCopyWith<$Res>? get extensionAttributes {
    if (_value.extensionAttributes == null) {
      return null;
    }

    return $CustomerExtensionAttributesCopyWith<$Res>(
      _value.extensionAttributes!,
      (value) {
        return _then(_value.copyWith(extensionAttributes: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
    _$CustomerImpl value,
    $Res Function(_$CustomerImpl) then,
  ) = __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "group_id") int? groupId,
    @JsonKey(name: "default_shipping") String? defaultShipping,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "created_in") String? createdIn,
    @JsonKey(name: "dob") DateTime? dob,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "gender") int? gender,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "website_id") int? websiteId,
    @JsonKey(name: "addresses") List<AddressElement>? addresses,
    @JsonKey(name: "disable_auto_group_change") int? disableAutoGroupChange,
    @JsonKey(name: "extension_attributes")
    CustomerExtensionAttributes? extensionAttributes,
    @JsonKey(name: "custom_attributes") List<CustomAttribute>? customAttributes,
  });

  @override
  $CustomerExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
    _$CustomerImpl _value,
    $Res Function(_$CustomerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupId = freezed,
    Object? defaultShipping = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? createdIn = freezed,
    Object? dob = freezed,
    Object? email = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? gender = freezed,
    Object? storeId = freezed,
    Object? websiteId = freezed,
    Object? addresses = freezed,
    Object? disableAutoGroupChange = freezed,
    Object? extensionAttributes = freezed,
    Object? customAttributes = freezed,
  }) {
    return _then(
      _$CustomerImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        groupId:
            freezed == groupId
                ? _value.groupId
                : groupId // ignore: cast_nullable_to_non_nullable
                    as int?,
        defaultShipping:
            freezed == defaultShipping
                ? _value.defaultShipping
                : defaultShipping // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        createdIn:
            freezed == createdIn
                ? _value.createdIn
                : createdIn // ignore: cast_nullable_to_non_nullable
                    as String?,
        dob:
            freezed == dob
                ? _value.dob
                : dob // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
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
        gender:
            freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                    as int?,
        storeId:
            freezed == storeId
                ? _value.storeId
                : storeId // ignore: cast_nullable_to_non_nullable
                    as int?,
        websiteId:
            freezed == websiteId
                ? _value.websiteId
                : websiteId // ignore: cast_nullable_to_non_nullable
                    as int?,
        addresses:
            freezed == addresses
                ? _value._addresses
                : addresses // ignore: cast_nullable_to_non_nullable
                    as List<AddressElement>?,
        disableAutoGroupChange:
            freezed == disableAutoGroupChange
                ? _value.disableAutoGroupChange
                : disableAutoGroupChange // ignore: cast_nullable_to_non_nullable
                    as int?,
        extensionAttributes:
            freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                    as CustomerExtensionAttributes?,
        customAttributes:
            freezed == customAttributes
                ? _value._customAttributes
                : customAttributes // ignore: cast_nullable_to_non_nullable
                    as List<CustomAttribute>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl implements _Customer {
  const _$CustomerImpl({
    @JsonKey(name: "id") this.id,
    @JsonKey(name: "group_id") this.groupId,
    @JsonKey(name: "default_shipping") this.defaultShipping,
    @JsonKey(name: "created_at") this.createdAt,
    @JsonKey(name: "updated_at") this.updatedAt,
    @JsonKey(name: "created_in") this.createdIn,
    @JsonKey(name: "dob") this.dob,
    @JsonKey(name: "email") this.email,
    @JsonKey(name: "firstname") this.firstname,
    @JsonKey(name: "lastname") this.lastname,
    @JsonKey(name: "gender") this.gender,
    @JsonKey(name: "store_id") this.storeId,
    @JsonKey(name: "website_id") this.websiteId,
    @JsonKey(name: "addresses") final List<AddressElement>? addresses,
    @JsonKey(name: "disable_auto_group_change") this.disableAutoGroupChange,
    @JsonKey(name: "extension_attributes") this.extensionAttributes,
    @JsonKey(name: "custom_attributes")
    final List<CustomAttribute>? customAttributes,
  }) : _addresses = addresses,
       _customAttributes = customAttributes;

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "group_id")
  final int? groupId;
  @override
  @JsonKey(name: "default_shipping")
  final String? defaultShipping;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "created_in")
  final String? createdIn;
  @override
  @JsonKey(name: "dob")
  final DateTime? dob;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "firstname")
  final String? firstname;
  @override
  @JsonKey(name: "lastname")
  final String? lastname;
  @override
  @JsonKey(name: "gender")
  final int? gender;
  @override
  @JsonKey(name: "store_id")
  final int? storeId;
  @override
  @JsonKey(name: "website_id")
  final int? websiteId;
  final List<AddressElement>? _addresses;
  @override
  @JsonKey(name: "addresses")
  List<AddressElement>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "disable_auto_group_change")
  final int? disableAutoGroupChange;
  @override
  @JsonKey(name: "extension_attributes")
  final CustomerExtensionAttributes? extensionAttributes;
  final List<CustomAttribute>? _customAttributes;
  @override
  @JsonKey(name: "custom_attributes")
  List<CustomAttribute>? get customAttributes {
    final value = _customAttributes;
    if (value == null) return null;
    if (_customAttributes is EqualUnmodifiableListView)
      return _customAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Customer(id: $id, groupId: $groupId, defaultShipping: $defaultShipping, createdAt: $createdAt, updatedAt: $updatedAt, createdIn: $createdIn, dob: $dob, email: $email, firstname: $firstname, lastname: $lastname, gender: $gender, storeId: $storeId, websiteId: $websiteId, addresses: $addresses, disableAutoGroupChange: $disableAutoGroupChange, extensionAttributes: $extensionAttributes, customAttributes: $customAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.defaultShipping, defaultShipping) ||
                other.defaultShipping == defaultShipping) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdIn, createdIn) ||
                other.createdIn == createdIn) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.websiteId, websiteId) ||
                other.websiteId == websiteId) &&
            const DeepCollectionEquality().equals(
              other._addresses,
              _addresses,
            ) &&
            (identical(other.disableAutoGroupChange, disableAutoGroupChange) ||
                other.disableAutoGroupChange == disableAutoGroupChange) &&
            (identical(other.extensionAttributes, extensionAttributes) ||
                other.extensionAttributes == extensionAttributes) &&
            const DeepCollectionEquality().equals(
              other._customAttributes,
              _customAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    groupId,
    defaultShipping,
    createdAt,
    updatedAt,
    createdIn,
    dob,
    email,
    firstname,
    lastname,
    gender,
    storeId,
    websiteId,
    const DeepCollectionEquality().hash(_addresses),
    disableAutoGroupChange,
    extensionAttributes,
    const DeepCollectionEquality().hash(_customAttributes),
  );

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(this);
  }
}

abstract class _Customer implements Customer {
  const factory _Customer({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "group_id") final int? groupId,
    @JsonKey(name: "default_shipping") final String? defaultShipping,
    @JsonKey(name: "created_at") final DateTime? createdAt,
    @JsonKey(name: "updated_at") final DateTime? updatedAt,
    @JsonKey(name: "created_in") final String? createdIn,
    @JsonKey(name: "dob") final DateTime? dob,
    @JsonKey(name: "email") final String? email,
    @JsonKey(name: "firstname") final String? firstname,
    @JsonKey(name: "lastname") final String? lastname,
    @JsonKey(name: "gender") final int? gender,
    @JsonKey(name: "store_id") final int? storeId,
    @JsonKey(name: "website_id") final int? websiteId,
    @JsonKey(name: "addresses") final List<AddressElement>? addresses,
    @JsonKey(name: "disable_auto_group_change")
    final int? disableAutoGroupChange,
    @JsonKey(name: "extension_attributes")
    final CustomerExtensionAttributes? extensionAttributes,
    @JsonKey(name: "custom_attributes")
    final List<CustomAttribute>? customAttributes,
  }) = _$CustomerImpl;

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "group_id")
  int? get groupId;
  @override
  @JsonKey(name: "default_shipping")
  String? get defaultShipping;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "created_in")
  String? get createdIn;
  @override
  @JsonKey(name: "dob")
  DateTime? get dob;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "firstname")
  String? get firstname;
  @override
  @JsonKey(name: "lastname")
  String? get lastname;
  @override
  @JsonKey(name: "gender")
  int? get gender;
  @override
  @JsonKey(name: "store_id")
  int? get storeId;
  @override
  @JsonKey(name: "website_id")
  int? get websiteId;
  @override
  @JsonKey(name: "addresses")
  List<AddressElement>? get addresses;
  @override
  @JsonKey(name: "disable_auto_group_change")
  int? get disableAutoGroupChange;
  @override
  @JsonKey(name: "extension_attributes")
  CustomerExtensionAttributes? get extensionAttributes;
  @override
  @JsonKey(name: "custom_attributes")
  List<CustomAttribute>? get customAttributes;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressElement _$AddressElementFromJson(Map<String, dynamic> json) {
  return _AddressElement.fromJson(json);
}

/// @nodoc
mixin _$AddressElement {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_id")
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "region")
  Region? get region => throw _privateConstructorUsedError;
  @JsonKey(name: "region_id")
  int? get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: "country_id")
  String? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: "street")
  List<String>? get street => throw _privateConstructorUsedError;
  @JsonKey(name: "telephone")
  String? get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: "postcode")
  String? get postcode => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "firstname")
  String? get firstname => throw _privateConstructorUsedError;
  @JsonKey(name: "lastname")
  String? get lastname => throw _privateConstructorUsedError;
  @JsonKey(name: "default_shipping")
  bool? get defaultShipping => throw _privateConstructorUsedError;
  @JsonKey(name: "default_billing")
  bool? get defaultBilling => throw _privateConstructorUsedError;

  /// Serializes this AddressElement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddressElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressElementCopyWith<AddressElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressElementCopyWith<$Res> {
  factory $AddressElementCopyWith(
    AddressElement value,
    $Res Function(AddressElement) then,
  ) = _$AddressElementCopyWithImpl<$Res, AddressElement>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "region") Region? region,
    @JsonKey(name: "region_id") int? regionId,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "telephone") String? telephone,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "default_shipping") bool? defaultShipping,
    @JsonKey(name: "default_billing") bool? defaultBilling,
  });

  $RegionCopyWith<$Res>? get region;
}

/// @nodoc
class _$AddressElementCopyWithImpl<$Res, $Val extends AddressElement>
    implements $AddressElementCopyWith<$Res> {
  _$AddressElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
    Object? countryId = freezed,
    Object? street = freezed,
    Object? telephone = freezed,
    Object? postcode = freezed,
    Object? city = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? defaultShipping = freezed,
    Object? defaultBilling = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            customerId:
                freezed == customerId
                    ? _value.customerId
                    : customerId // ignore: cast_nullable_to_non_nullable
                        as int?,
            region:
                freezed == region
                    ? _value.region
                    : region // ignore: cast_nullable_to_non_nullable
                        as Region?,
            regionId:
                freezed == regionId
                    ? _value.regionId
                    : regionId // ignore: cast_nullable_to_non_nullable
                        as int?,
            countryId:
                freezed == countryId
                    ? _value.countryId
                    : countryId // ignore: cast_nullable_to_non_nullable
                        as String?,
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
            postcode:
                freezed == postcode
                    ? _value.postcode
                    : postcode // ignore: cast_nullable_to_non_nullable
                        as String?,
            city:
                freezed == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as String?,
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
            defaultShipping:
                freezed == defaultShipping
                    ? _value.defaultShipping
                    : defaultShipping // ignore: cast_nullable_to_non_nullable
                        as bool?,
            defaultBilling:
                freezed == defaultBilling
                    ? _value.defaultBilling
                    : defaultBilling // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }

  /// Create a copy of AddressElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegionCopyWith<$Res>? get region {
    if (_value.region == null) {
      return null;
    }

    return $RegionCopyWith<$Res>(_value.region!, (value) {
      return _then(_value.copyWith(region: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressElementImplCopyWith<$Res>
    implements $AddressElementCopyWith<$Res> {
  factory _$$AddressElementImplCopyWith(
    _$AddressElementImpl value,
    $Res Function(_$AddressElementImpl) then,
  ) = __$$AddressElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "region") Region? region,
    @JsonKey(name: "region_id") int? regionId,
    @JsonKey(name: "country_id") String? countryId,
    @JsonKey(name: "street") List<String>? street,
    @JsonKey(name: "telephone") String? telephone,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "default_shipping") bool? defaultShipping,
    @JsonKey(name: "default_billing") bool? defaultBilling,
  });

  @override
  $RegionCopyWith<$Res>? get region;
}

/// @nodoc
class __$$AddressElementImplCopyWithImpl<$Res>
    extends _$AddressElementCopyWithImpl<$Res, _$AddressElementImpl>
    implements _$$AddressElementImplCopyWith<$Res> {
  __$$AddressElementImplCopyWithImpl(
    _$AddressElementImpl _value,
    $Res Function(_$AddressElementImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddressElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
    Object? countryId = freezed,
    Object? street = freezed,
    Object? telephone = freezed,
    Object? postcode = freezed,
    Object? city = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? defaultShipping = freezed,
    Object? defaultBilling = freezed,
  }) {
    return _then(
      _$AddressElementImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        customerId:
            freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                    as int?,
        region:
            freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                    as Region?,
        regionId:
            freezed == regionId
                ? _value.regionId
                : regionId // ignore: cast_nullable_to_non_nullable
                    as int?,
        countryId:
            freezed == countryId
                ? _value.countryId
                : countryId // ignore: cast_nullable_to_non_nullable
                    as String?,
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
        postcode:
            freezed == postcode
                ? _value.postcode
                : postcode // ignore: cast_nullable_to_non_nullable
                    as String?,
        city:
            freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String?,
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
        defaultShipping:
            freezed == defaultShipping
                ? _value.defaultShipping
                : defaultShipping // ignore: cast_nullable_to_non_nullable
                    as bool?,
        defaultBilling:
            freezed == defaultBilling
                ? _value.defaultBilling
                : defaultBilling // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressElementImpl implements _AddressElement {
  const _$AddressElementImpl({
    @JsonKey(name: "id") this.id,
    @JsonKey(name: "customer_id") this.customerId,
    @JsonKey(name: "region") this.region,
    @JsonKey(name: "region_id") this.regionId,
    @JsonKey(name: "country_id") this.countryId,
    @JsonKey(name: "street") final List<String>? street,
    @JsonKey(name: "telephone") this.telephone,
    @JsonKey(name: "postcode") this.postcode,
    @JsonKey(name: "city") this.city,
    @JsonKey(name: "firstname") this.firstname,
    @JsonKey(name: "lastname") this.lastname,
    @JsonKey(name: "default_shipping") this.defaultShipping,
    @JsonKey(name: "default_billing") this.defaultBilling,
  }) : _street = street;

  factory _$AddressElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressElementImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "customer_id")
  final int? customerId;
  @override
  @JsonKey(name: "region")
  final Region? region;
  @override
  @JsonKey(name: "region_id")
  final int? regionId;
  @override
  @JsonKey(name: "country_id")
  final String? countryId;
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
  @JsonKey(name: "postcode")
  final String? postcode;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "firstname")
  final String? firstname;
  @override
  @JsonKey(name: "lastname")
  final String? lastname;
  @override
  @JsonKey(name: "default_shipping")
  final bool? defaultShipping;
  @override
  @JsonKey(name: "default_billing")
  final bool? defaultBilling;

  @override
  String toString() {
    return 'AddressElement(id: $id, customerId: $customerId, region: $region, regionId: $regionId, countryId: $countryId, street: $street, telephone: $telephone, postcode: $postcode, city: $city, firstname: $firstname, lastname: $lastname, defaultShipping: $defaultShipping, defaultBilling: $defaultBilling)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            const DeepCollectionEquality().equals(other._street, _street) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.defaultShipping, defaultShipping) ||
                other.defaultShipping == defaultShipping) &&
            (identical(other.defaultBilling, defaultBilling) ||
                other.defaultBilling == defaultBilling));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    customerId,
    region,
    regionId,
    countryId,
    const DeepCollectionEquality().hash(_street),
    telephone,
    postcode,
    city,
    firstname,
    lastname,
    defaultShipping,
    defaultBilling,
  );

  /// Create a copy of AddressElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressElementImplCopyWith<_$AddressElementImpl> get copyWith =>
      __$$AddressElementImplCopyWithImpl<_$AddressElementImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressElementImplToJson(this);
  }
}

abstract class _AddressElement implements AddressElement {
  const factory _AddressElement({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "customer_id") final int? customerId,
    @JsonKey(name: "region") final Region? region,
    @JsonKey(name: "region_id") final int? regionId,
    @JsonKey(name: "country_id") final String? countryId,
    @JsonKey(name: "street") final List<String>? street,
    @JsonKey(name: "telephone") final String? telephone,
    @JsonKey(name: "postcode") final String? postcode,
    @JsonKey(name: "city") final String? city,
    @JsonKey(name: "firstname") final String? firstname,
    @JsonKey(name: "lastname") final String? lastname,
    @JsonKey(name: "default_shipping") final bool? defaultShipping,
    @JsonKey(name: "default_billing") final bool? defaultBilling,
  }) = _$AddressElementImpl;

  factory _AddressElement.fromJson(Map<String, dynamic> json) =
      _$AddressElementImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "customer_id")
  int? get customerId;
  @override
  @JsonKey(name: "region")
  Region? get region;
  @override
  @JsonKey(name: "region_id")
  int? get regionId;
  @override
  @JsonKey(name: "country_id")
  String? get countryId;
  @override
  @JsonKey(name: "street")
  List<String>? get street;
  @override
  @JsonKey(name: "telephone")
  String? get telephone;
  @override
  @JsonKey(name: "postcode")
  String? get postcode;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "firstname")
  String? get firstname;
  @override
  @JsonKey(name: "lastname")
  String? get lastname;
  @override
  @JsonKey(name: "default_shipping")
  bool? get defaultShipping;
  @override
  @JsonKey(name: "default_billing")
  bool? get defaultBilling;

  /// Create a copy of AddressElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressElementImplCopyWith<_$AddressElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Region _$RegionFromJson(Map<String, dynamic> json) {
  return _Region.fromJson(json);
}

/// @nodoc
mixin _$Region {
  @JsonKey(name: "region_code")
  String? get regionCode => throw _privateConstructorUsedError;
  @JsonKey(name: "region")
  String? get region => throw _privateConstructorUsedError;
  @JsonKey(name: "region_id")
  int? get regionId => throw _privateConstructorUsedError;

  /// Serializes this Region to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionCopyWith<Region> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res, Region>;
  @useResult
  $Res call({
    @JsonKey(name: "region_code") String? regionCode,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "region_id") int? regionId,
  });
}

/// @nodoc
class _$RegionCopyWithImpl<$Res, $Val extends Region>
    implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionCode = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
  }) {
    return _then(
      _value.copyWith(
            regionCode:
                freezed == regionCode
                    ? _value.regionCode
                    : regionCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            region:
                freezed == region
                    ? _value.region
                    : region // ignore: cast_nullable_to_non_nullable
                        as String?,
            regionId:
                freezed == regionId
                    ? _value.regionId
                    : regionId // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegionImplCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$$RegionImplCopyWith(
    _$RegionImpl value,
    $Res Function(_$RegionImpl) then,
  ) = __$$RegionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "region_code") String? regionCode,
    @JsonKey(name: "region") String? region,
    @JsonKey(name: "region_id") int? regionId,
  });
}

/// @nodoc
class __$$RegionImplCopyWithImpl<$Res>
    extends _$RegionCopyWithImpl<$Res, _$RegionImpl>
    implements _$$RegionImplCopyWith<$Res> {
  __$$RegionImplCopyWithImpl(
    _$RegionImpl _value,
    $Res Function(_$RegionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionCode = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
  }) {
    return _then(
      _$RegionImpl(
        regionCode:
            freezed == regionCode
                ? _value.regionCode
                : regionCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        region:
            freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                    as String?,
        regionId:
            freezed == regionId
                ? _value.regionId
                : regionId // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionImpl implements _Region {
  const _$RegionImpl({
    @JsonKey(name: "region_code") this.regionCode,
    @JsonKey(name: "region") this.region,
    @JsonKey(name: "region_id") this.regionId,
  });

  factory _$RegionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionImplFromJson(json);

  @override
  @JsonKey(name: "region_code")
  final String? regionCode;
  @override
  @JsonKey(name: "region")
  final String? region;
  @override
  @JsonKey(name: "region_id")
  final int? regionId;

  @override
  String toString() {
    return 'Region(regionCode: $regionCode, region: $region, regionId: $regionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionImpl &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, regionCode, region, regionId);

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      __$$RegionImplCopyWithImpl<_$RegionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionImplToJson(this);
  }
}

abstract class _Region implements Region {
  const factory _Region({
    @JsonKey(name: "region_code") final String? regionCode,
    @JsonKey(name: "region") final String? region,
    @JsonKey(name: "region_id") final int? regionId,
  }) = _$RegionImpl;

  factory _Region.fromJson(Map<String, dynamic> json) = _$RegionImpl.fromJson;

  @override
  @JsonKey(name: "region_code")
  String? get regionCode;
  @override
  @JsonKey(name: "region")
  String? get region;
  @override
  @JsonKey(name: "region_id")
  int? get regionId;

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomAttribute _$CustomAttributeFromJson(Map<String, dynamic> json) {
  return _CustomAttribute.fromJson(json);
}

/// @nodoc
mixin _$CustomAttribute {
  @JsonKey(name: "attribute_code")
  String? get attributeCode => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  String? get value => throw _privateConstructorUsedError;

  /// Serializes this CustomAttribute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomAttributeCopyWith<CustomAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomAttributeCopyWith<$Res> {
  factory $CustomAttributeCopyWith(
    CustomAttribute value,
    $Res Function(CustomAttribute) then,
  ) = _$CustomAttributeCopyWithImpl<$Res, CustomAttribute>;
  @useResult
  $Res call({
    @JsonKey(name: "attribute_code") String? attributeCode,
    @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class _$CustomAttributeCopyWithImpl<$Res, $Val extends CustomAttribute>
    implements $CustomAttributeCopyWith<$Res> {
  _$CustomAttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? attributeCode = freezed, Object? value = freezed}) {
    return _then(
      _value.copyWith(
            attributeCode:
                freezed == attributeCode
                    ? _value.attributeCode
                    : attributeCode // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CustomAttributeImplCopyWith<$Res>
    implements $CustomAttributeCopyWith<$Res> {
  factory _$$CustomAttributeImplCopyWith(
    _$CustomAttributeImpl value,
    $Res Function(_$CustomAttributeImpl) then,
  ) = __$$CustomAttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "attribute_code") String? attributeCode,
    @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class __$$CustomAttributeImplCopyWithImpl<$Res>
    extends _$CustomAttributeCopyWithImpl<$Res, _$CustomAttributeImpl>
    implements _$$CustomAttributeImplCopyWith<$Res> {
  __$$CustomAttributeImplCopyWithImpl(
    _$CustomAttributeImpl _value,
    $Res Function(_$CustomAttributeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? attributeCode = freezed, Object? value = freezed}) {
    return _then(
      _$CustomAttributeImpl(
        attributeCode:
            freezed == attributeCode
                ? _value.attributeCode
                : attributeCode // ignore: cast_nullable_to_non_nullable
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
class _$CustomAttributeImpl implements _CustomAttribute {
  const _$CustomAttributeImpl({
    @JsonKey(name: "attribute_code") this.attributeCode,
    @JsonKey(name: "value") this.value,
  });

  factory _$CustomAttributeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomAttributeImplFromJson(json);

  @override
  @JsonKey(name: "attribute_code")
  final String? attributeCode;
  @override
  @JsonKey(name: "value")
  final String? value;

  @override
  String toString() {
    return 'CustomAttribute(attributeCode: $attributeCode, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomAttributeImpl &&
            (identical(other.attributeCode, attributeCode) ||
                other.attributeCode == attributeCode) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attributeCode, value);

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomAttributeImplCopyWith<_$CustomAttributeImpl> get copyWith =>
      __$$CustomAttributeImplCopyWithImpl<_$CustomAttributeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomAttributeImplToJson(this);
  }
}

abstract class _CustomAttribute implements CustomAttribute {
  const factory _CustomAttribute({
    @JsonKey(name: "attribute_code") final String? attributeCode,
    @JsonKey(name: "value") final String? value,
  }) = _$CustomAttributeImpl;

  factory _CustomAttribute.fromJson(Map<String, dynamic> json) =
      _$CustomAttributeImpl.fromJson;

  @override
  @JsonKey(name: "attribute_code")
  String? get attributeCode;
  @override
  @JsonKey(name: "value")
  String? get value;

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomAttributeImplCopyWith<_$CustomAttributeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerExtensionAttributes _$CustomerExtensionAttributesFromJson(
  Map<String, dynamic> json,
) {
  return _CustomerExtensionAttributes.fromJson(json);
}

/// @nodoc
mixin _$CustomerExtensionAttributes {
  @JsonKey(name: "is_subscribed")
  bool? get isSubscribed => throw _privateConstructorUsedError;

  /// Serializes this CustomerExtensionAttributes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerExtensionAttributesCopyWith<CustomerExtensionAttributes>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerExtensionAttributesCopyWith<$Res> {
  factory $CustomerExtensionAttributesCopyWith(
    CustomerExtensionAttributes value,
    $Res Function(CustomerExtensionAttributes) then,
  ) =
      _$CustomerExtensionAttributesCopyWithImpl<
        $Res,
        CustomerExtensionAttributes
      >;
  @useResult
  $Res call({@JsonKey(name: "is_subscribed") bool? isSubscribed});
}

/// @nodoc
class _$CustomerExtensionAttributesCopyWithImpl<
  $Res,
  $Val extends CustomerExtensionAttributes
>
    implements $CustomerExtensionAttributesCopyWith<$Res> {
  _$CustomerExtensionAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isSubscribed = freezed}) {
    return _then(
      _value.copyWith(
            isSubscribed:
                freezed == isSubscribed
                    ? _value.isSubscribed
                    : isSubscribed // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerExtensionAttributesImplCopyWith<$Res>
    implements $CustomerExtensionAttributesCopyWith<$Res> {
  factory _$$CustomerExtensionAttributesImplCopyWith(
    _$CustomerExtensionAttributesImpl value,
    $Res Function(_$CustomerExtensionAttributesImpl) then,
  ) = __$$CustomerExtensionAttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "is_subscribed") bool? isSubscribed});
}

/// @nodoc
class __$$CustomerExtensionAttributesImplCopyWithImpl<$Res>
    extends
        _$CustomerExtensionAttributesCopyWithImpl<
          $Res,
          _$CustomerExtensionAttributesImpl
        >
    implements _$$CustomerExtensionAttributesImplCopyWith<$Res> {
  __$$CustomerExtensionAttributesImplCopyWithImpl(
    _$CustomerExtensionAttributesImpl _value,
    $Res Function(_$CustomerExtensionAttributesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isSubscribed = freezed}) {
    return _then(
      _$CustomerExtensionAttributesImpl(
        isSubscribed:
            freezed == isSubscribed
                ? _value.isSubscribed
                : isSubscribed // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerExtensionAttributesImpl
    implements _CustomerExtensionAttributes {
  const _$CustomerExtensionAttributesImpl({
    @JsonKey(name: "is_subscribed") this.isSubscribed,
  });

  factory _$CustomerExtensionAttributesImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CustomerExtensionAttributesImplFromJson(json);

  @override
  @JsonKey(name: "is_subscribed")
  final bool? isSubscribed;

  @override
  String toString() {
    return 'CustomerExtensionAttributes(isSubscribed: $isSubscribed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerExtensionAttributesImpl &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isSubscribed);

  /// Create a copy of CustomerExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerExtensionAttributesImplCopyWith<_$CustomerExtensionAttributesImpl>
  get copyWith => __$$CustomerExtensionAttributesImplCopyWithImpl<
    _$CustomerExtensionAttributesImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerExtensionAttributesImplToJson(this);
  }
}

abstract class _CustomerExtensionAttributes
    implements CustomerExtensionAttributes {
  const factory _CustomerExtensionAttributes({
    @JsonKey(name: "is_subscribed") final bool? isSubscribed,
  }) = _$CustomerExtensionAttributesImpl;

  factory _CustomerExtensionAttributes.fromJson(Map<String, dynamic> json) =
      _$CustomerExtensionAttributesImpl.fromJson;

  @override
  @JsonKey(name: "is_subscribed")
  bool? get isSubscribed;

  /// Create a copy of CustomerExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerExtensionAttributesImplCopyWith<_$CustomerExtensionAttributesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CartResponseExtensionAttributes _$CartResponseExtensionAttributesFromJson(
  Map<String, dynamic> json,
) {
  return _CartResponseExtensionAttributes.fromJson(json);
}

/// @nodoc
mixin _$CartResponseExtensionAttributes {
  @JsonKey(name: "shipping_assignments")
  List<ShippingAssignment>? get shippingAssignments =>
      throw _privateConstructorUsedError;

  /// Serializes this CartResponseExtensionAttributes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartResponseExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartResponseExtensionAttributesCopyWith<CartResponseExtensionAttributes>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartResponseExtensionAttributesCopyWith<$Res> {
  factory $CartResponseExtensionAttributesCopyWith(
    CartResponseExtensionAttributes value,
    $Res Function(CartResponseExtensionAttributes) then,
  ) =
      _$CartResponseExtensionAttributesCopyWithImpl<
        $Res,
        CartResponseExtensionAttributes
      >;
  @useResult
  $Res call({
    @JsonKey(name: "shipping_assignments")
    List<ShippingAssignment>? shippingAssignments,
  });
}

/// @nodoc
class _$CartResponseExtensionAttributesCopyWithImpl<
  $Res,
  $Val extends CartResponseExtensionAttributes
>
    implements $CartResponseExtensionAttributesCopyWith<$Res> {
  _$CartResponseExtensionAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartResponseExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shippingAssignments = freezed}) {
    return _then(
      _value.copyWith(
            shippingAssignments:
                freezed == shippingAssignments
                    ? _value.shippingAssignments
                    : shippingAssignments // ignore: cast_nullable_to_non_nullable
                        as List<ShippingAssignment>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartResponseExtensionAttributesImplCopyWith<$Res>
    implements $CartResponseExtensionAttributesCopyWith<$Res> {
  factory _$$CartResponseExtensionAttributesImplCopyWith(
    _$CartResponseExtensionAttributesImpl value,
    $Res Function(_$CartResponseExtensionAttributesImpl) then,
  ) = __$$CartResponseExtensionAttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "shipping_assignments")
    List<ShippingAssignment>? shippingAssignments,
  });
}

/// @nodoc
class __$$CartResponseExtensionAttributesImplCopyWithImpl<$Res>
    extends
        _$CartResponseExtensionAttributesCopyWithImpl<
          $Res,
          _$CartResponseExtensionAttributesImpl
        >
    implements _$$CartResponseExtensionAttributesImplCopyWith<$Res> {
  __$$CartResponseExtensionAttributesImplCopyWithImpl(
    _$CartResponseExtensionAttributesImpl _value,
    $Res Function(_$CartResponseExtensionAttributesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartResponseExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shippingAssignments = freezed}) {
    return _then(
      _$CartResponseExtensionAttributesImpl(
        shippingAssignments:
            freezed == shippingAssignments
                ? _value._shippingAssignments
                : shippingAssignments // ignore: cast_nullable_to_non_nullable
                    as List<ShippingAssignment>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartResponseExtensionAttributesImpl
    implements _CartResponseExtensionAttributes {
  const _$CartResponseExtensionAttributesImpl({
    @JsonKey(name: "shipping_assignments")
    final List<ShippingAssignment>? shippingAssignments,
  }) : _shippingAssignments = shippingAssignments;

  factory _$CartResponseExtensionAttributesImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CartResponseExtensionAttributesImplFromJson(json);

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

  @override
  String toString() {
    return 'CartResponseExtensionAttributes(shippingAssignments: $shippingAssignments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartResponseExtensionAttributesImpl &&
            const DeepCollectionEquality().equals(
              other._shippingAssignments,
              _shippingAssignments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_shippingAssignments),
  );

  /// Create a copy of CartResponseExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartResponseExtensionAttributesImplCopyWith<
    _$CartResponseExtensionAttributesImpl
  >
  get copyWith => __$$CartResponseExtensionAttributesImplCopyWithImpl<
    _$CartResponseExtensionAttributesImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartResponseExtensionAttributesImplToJson(this);
  }
}

abstract class _CartResponseExtensionAttributes
    implements CartResponseExtensionAttributes {
  const factory _CartResponseExtensionAttributes({
    @JsonKey(name: "shipping_assignments")
    final List<ShippingAssignment>? shippingAssignments,
  }) = _$CartResponseExtensionAttributesImpl;

  factory _CartResponseExtensionAttributes.fromJson(Map<String, dynamic> json) =
      _$CartResponseExtensionAttributesImpl.fromJson;

  @override
  @JsonKey(name: "shipping_assignments")
  List<ShippingAssignment>? get shippingAssignments;

  /// Create a copy of CartResponseExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartResponseExtensionAttributesImplCopyWith<
    _$CartResponseExtensionAttributesImpl
  >
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
  @JsonKey(name: "item_id")
  int? get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: "sku")
  String? get sku => throw _privateConstructorUsedError;
  @JsonKey(name: "qty")
  int? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "product_type")
  String? get productType => throw _privateConstructorUsedError;
  @JsonKey(name: "quote_id")
  String? get quoteId => throw _privateConstructorUsedError;
  @JsonKey(name: "extension_attributes")
  ItemExtensionAttributes? get extensionAttributes =>
      throw _privateConstructorUsedError;

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
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "quote_id") String? quoteId,
    @JsonKey(name: "extension_attributes")
    ItemExtensionAttributes? extensionAttributes,
  });

  $ItemExtensionAttributesCopyWith<$Res>? get extensionAttributes;
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
    Object? itemId = freezed,
    Object? sku = freezed,
    Object? qty = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? productType = freezed,
    Object? quoteId = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            itemId:
                freezed == itemId
                    ? _value.itemId
                    : itemId // ignore: cast_nullable_to_non_nullable
                        as int?,
            sku:
                freezed == sku
                    ? _value.sku
                    : sku // ignore: cast_nullable_to_non_nullable
                        as String?,
            qty:
                freezed == qty
                    ? _value.qty
                    : qty // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            price:
                freezed == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as int?,
            productType:
                freezed == productType
                    ? _value.productType
                    : productType // ignore: cast_nullable_to_non_nullable
                        as String?,
            quoteId:
                freezed == quoteId
                    ? _value.quoteId
                    : quoteId // ignore: cast_nullable_to_non_nullable
                        as String?,
            extensionAttributes:
                freezed == extensionAttributes
                    ? _value.extensionAttributes
                    : extensionAttributes // ignore: cast_nullable_to_non_nullable
                        as ItemExtensionAttributes?,
          )
          as $Val,
    );
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemExtensionAttributesCopyWith<$Res>? get extensionAttributes {
    if (_value.extensionAttributes == null) {
      return null;
    }

    return $ItemExtensionAttributesCopyWith<$Res>(_value.extensionAttributes!, (
      value,
    ) {
      return _then(_value.copyWith(extensionAttributes: value) as $Val);
    });
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
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "quote_id") String? quoteId,
    @JsonKey(name: "extension_attributes")
    ItemExtensionAttributes? extensionAttributes,
  });

  @override
  $ItemExtensionAttributesCopyWith<$Res>? get extensionAttributes;
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
    Object? itemId = freezed,
    Object? sku = freezed,
    Object? qty = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? productType = freezed,
    Object? quoteId = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$ItemImpl(
        itemId:
            freezed == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                    as int?,
        sku:
            freezed == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                    as String?,
        qty:
            freezed == qty
                ? _value.qty
                : qty // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        price:
            freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as int?,
        productType:
            freezed == productType
                ? _value.productType
                : productType // ignore: cast_nullable_to_non_nullable
                    as String?,
        quoteId:
            freezed == quoteId
                ? _value.quoteId
                : quoteId // ignore: cast_nullable_to_non_nullable
                    as String?,
        extensionAttributes:
            freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                    as ItemExtensionAttributes?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  const _$ItemImpl({
    @JsonKey(name: "item_id") this.itemId,
    @JsonKey(name: "sku") this.sku,
    @JsonKey(name: "qty") this.qty,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "price") this.price,
    @JsonKey(name: "product_type") this.productType,
    @JsonKey(name: "quote_id") this.quoteId,
    @JsonKey(name: "extension_attributes") this.extensionAttributes,
  });

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  @JsonKey(name: "item_id")
  final int? itemId;
  @override
  @JsonKey(name: "sku")
  final String? sku;
  @override
  @JsonKey(name: "qty")
  final int? qty;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "price")
  final int? price;
  @override
  @JsonKey(name: "product_type")
  final String? productType;
  @override
  @JsonKey(name: "quote_id")
  final String? quoteId;
  @override
  @JsonKey(name: "extension_attributes")
  final ItemExtensionAttributes? extensionAttributes;

  @override
  String toString() {
    return 'Item(itemId: $itemId, sku: $sku, qty: $qty, name: $name, price: $price, productType: $productType, quoteId: $quoteId, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.extensionAttributes, extensionAttributes) ||
                other.extensionAttributes == extensionAttributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    itemId,
    sku,
    qty,
    name,
    price,
    productType,
    quoteId,
    extensionAttributes,
  );

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
    @JsonKey(name: "item_id") final int? itemId,
    @JsonKey(name: "sku") final String? sku,
    @JsonKey(name: "qty") final int? qty,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "price") final int? price,
    @JsonKey(name: "product_type") final String? productType,
    @JsonKey(name: "quote_id") final String? quoteId,
    @JsonKey(name: "extension_attributes")
    final ItemExtensionAttributes? extensionAttributes,
  }) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  @JsonKey(name: "item_id")
  int? get itemId;
  @override
  @JsonKey(name: "sku")
  String? get sku;
  @override
  @JsonKey(name: "qty")
  int? get qty;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "price")
  int? get price;
  @override
  @JsonKey(name: "product_type")
  String? get productType;
  @override
  @JsonKey(name: "quote_id")
  String? get quoteId;
  @override
  @JsonKey(name: "extension_attributes")
  ItemExtensionAttributes? get extensionAttributes;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemExtensionAttributes _$ItemExtensionAttributesFromJson(
  Map<String, dynamic> json,
) {
  return _ItemExtensionAttributes.fromJson(json);
}

/// @nodoc
mixin _$ItemExtensionAttributes {
  @JsonKey(name: "product_id")
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: "product_url_key")
  String? get productUrlKey => throw _privateConstructorUsedError;
  @JsonKey(name: "category_ids")
  List<String>? get categoryIds => throw _privateConstructorUsedError;
  @JsonKey(name: "category_names")
  List<String>? get categoryNames => throw _privateConstructorUsedError;
  @JsonKey(name: "stock_available")
  bool? get stockAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: "brand_id")
  String? get brandId => throw _privateConstructorUsedError;
  @JsonKey(name: "brand")
  String? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "sold_by")
  String? get soldBy => throw _privateConstructorUsedError;
  @JsonKey(name: "regular_price")
  int? get regularPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "spacial_price")
  int? get spacialPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "discount")
  String? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: "custom_options")
  List<CustomOption>? get customOptions => throw _privateConstructorUsedError;
  @JsonKey(name: "item_subtotal")
  int? get itemSubtotal => throw _privateConstructorUsedError;
  @JsonKey(name: "config_options")
  List<ConfigOption>? get configOptions => throw _privateConstructorUsedError;
  @JsonKey(name: "reward_points")
  CartItemRewardPoints? get rewardPoints => throw _privateConstructorUsedError;

  /// Serializes this ItemExtensionAttributes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemExtensionAttributesCopyWith<ItemExtensionAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemExtensionAttributesCopyWith<$Res> {
  factory $ItemExtensionAttributesCopyWith(
    ItemExtensionAttributes value,
    $Res Function(ItemExtensionAttributes) then,
  ) = _$ItemExtensionAttributesCopyWithImpl<$Res, ItemExtensionAttributes>;
  @useResult
  $Res call({
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_url_key") String? productUrlKey,
    @JsonKey(name: "category_ids") List<String>? categoryIds,
    @JsonKey(name: "category_names") List<String>? categoryNames,
    @JsonKey(name: "stock_available") bool? stockAvailable,
    @JsonKey(name: "brand_id") String? brandId,
    @JsonKey(name: "brand") String? brand,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "sold_by") String? soldBy,
    @JsonKey(name: "regular_price") int? regularPrice,
    @JsonKey(name: "spacial_price") int? spacialPrice,
    @JsonKey(name: "discount") String? discount,
    @JsonKey(name: "custom_options") List<CustomOption>? customOptions,
    @JsonKey(name: "item_subtotal") int? itemSubtotal,
    @JsonKey(name: "config_options") List<ConfigOption>? configOptions,
    @JsonKey(name: "reward_points") CartItemRewardPoints? rewardPoints,
  });

  $CartItemRewardPointsCopyWith<$Res>? get rewardPoints;
}

/// @nodoc
class _$ItemExtensionAttributesCopyWithImpl<
  $Res,
  $Val extends ItemExtensionAttributes
>
    implements $ItemExtensionAttributesCopyWith<$Res> {
  _$ItemExtensionAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productUrlKey = freezed,
    Object? categoryIds = freezed,
    Object? categoryNames = freezed,
    Object? stockAvailable = freezed,
    Object? brandId = freezed,
    Object? brand = freezed,
    Object? imageUrl = freezed,
    Object? soldBy = freezed,
    Object? regularPrice = freezed,
    Object? spacialPrice = freezed,
    Object? discount = freezed,
    Object? customOptions = freezed,
    Object? itemSubtotal = freezed,
    Object? configOptions = freezed,
    Object? rewardPoints = freezed,
  }) {
    return _then(
      _value.copyWith(
            productId:
                freezed == productId
                    ? _value.productId
                    : productId // ignore: cast_nullable_to_non_nullable
                        as int?,
            productUrlKey:
                freezed == productUrlKey
                    ? _value.productUrlKey
                    : productUrlKey // ignore: cast_nullable_to_non_nullable
                        as String?,
            categoryIds:
                freezed == categoryIds
                    ? _value.categoryIds
                    : categoryIds // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            categoryNames:
                freezed == categoryNames
                    ? _value.categoryNames
                    : categoryNames // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            stockAvailable:
                freezed == stockAvailable
                    ? _value.stockAvailable
                    : stockAvailable // ignore: cast_nullable_to_non_nullable
                        as bool?,
            brandId:
                freezed == brandId
                    ? _value.brandId
                    : brandId // ignore: cast_nullable_to_non_nullable
                        as String?,
            brand:
                freezed == brand
                    ? _value.brand
                    : brand // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            soldBy:
                freezed == soldBy
                    ? _value.soldBy
                    : soldBy // ignore: cast_nullable_to_non_nullable
                        as String?,
            regularPrice:
                freezed == regularPrice
                    ? _value.regularPrice
                    : regularPrice // ignore: cast_nullable_to_non_nullable
                        as int?,
            spacialPrice:
                freezed == spacialPrice
                    ? _value.spacialPrice
                    : spacialPrice // ignore: cast_nullable_to_non_nullable
                        as int?,
            discount:
                freezed == discount
                    ? _value.discount
                    : discount // ignore: cast_nullable_to_non_nullable
                        as String?,
            customOptions:
                freezed == customOptions
                    ? _value.customOptions
                    : customOptions // ignore: cast_nullable_to_non_nullable
                        as List<CustomOption>?,
            itemSubtotal:
                freezed == itemSubtotal
                    ? _value.itemSubtotal
                    : itemSubtotal // ignore: cast_nullable_to_non_nullable
                        as int?,
            configOptions:
                freezed == configOptions
                    ? _value.configOptions
                    : configOptions // ignore: cast_nullable_to_non_nullable
                        as List<ConfigOption>?,
            rewardPoints:
                freezed == rewardPoints
                    ? _value.rewardPoints
                    : rewardPoints // ignore: cast_nullable_to_non_nullable
                        as CartItemRewardPoints?,
          )
          as $Val,
    );
  }

  /// Create a copy of ItemExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartItemRewardPointsCopyWith<$Res>? get rewardPoints {
    if (_value.rewardPoints == null) {
      return null;
    }

    return $CartItemRewardPointsCopyWith<$Res>(_value.rewardPoints!, (value) {
      return _then(_value.copyWith(rewardPoints: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemExtensionAttributesImplCopyWith<$Res>
    implements $ItemExtensionAttributesCopyWith<$Res> {
  factory _$$ItemExtensionAttributesImplCopyWith(
    _$ItemExtensionAttributesImpl value,
    $Res Function(_$ItemExtensionAttributesImpl) then,
  ) = __$$ItemExtensionAttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_url_key") String? productUrlKey,
    @JsonKey(name: "category_ids") List<String>? categoryIds,
    @JsonKey(name: "category_names") List<String>? categoryNames,
    @JsonKey(name: "stock_available") bool? stockAvailable,
    @JsonKey(name: "brand_id") String? brandId,
    @JsonKey(name: "brand") String? brand,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "sold_by") String? soldBy,
    @JsonKey(name: "regular_price") int? regularPrice,
    @JsonKey(name: "spacial_price") int? spacialPrice,
    @JsonKey(name: "discount") String? discount,
    @JsonKey(name: "custom_options") List<CustomOption>? customOptions,
    @JsonKey(name: "item_subtotal") int? itemSubtotal,
    @JsonKey(name: "config_options") List<ConfigOption>? configOptions,
    @JsonKey(name: "reward_points") CartItemRewardPoints? rewardPoints,
  });

  @override
  $CartItemRewardPointsCopyWith<$Res>? get rewardPoints;
}

/// @nodoc
class __$$ItemExtensionAttributesImplCopyWithImpl<$Res>
    extends
        _$ItemExtensionAttributesCopyWithImpl<
          $Res,
          _$ItemExtensionAttributesImpl
        >
    implements _$$ItemExtensionAttributesImplCopyWith<$Res> {
  __$$ItemExtensionAttributesImplCopyWithImpl(
    _$ItemExtensionAttributesImpl _value,
    $Res Function(_$ItemExtensionAttributesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productUrlKey = freezed,
    Object? categoryIds = freezed,
    Object? categoryNames = freezed,
    Object? stockAvailable = freezed,
    Object? brandId = freezed,
    Object? brand = freezed,
    Object? imageUrl = freezed,
    Object? soldBy = freezed,
    Object? regularPrice = freezed,
    Object? spacialPrice = freezed,
    Object? discount = freezed,
    Object? customOptions = freezed,
    Object? itemSubtotal = freezed,
    Object? configOptions = freezed,
    Object? rewardPoints = freezed,
  }) {
    return _then(
      _$ItemExtensionAttributesImpl(
        productId:
            freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as int?,
        productUrlKey:
            freezed == productUrlKey
                ? _value.productUrlKey
                : productUrlKey // ignore: cast_nullable_to_non_nullable
                    as String?,
        categoryIds:
            freezed == categoryIds
                ? _value._categoryIds
                : categoryIds // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        categoryNames:
            freezed == categoryNames
                ? _value._categoryNames
                : categoryNames // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        stockAvailable:
            freezed == stockAvailable
                ? _value.stockAvailable
                : stockAvailable // ignore: cast_nullable_to_non_nullable
                    as bool?,
        brandId:
            freezed == brandId
                ? _value.brandId
                : brandId // ignore: cast_nullable_to_non_nullable
                    as String?,
        brand:
            freezed == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        soldBy:
            freezed == soldBy
                ? _value.soldBy
                : soldBy // ignore: cast_nullable_to_non_nullable
                    as String?,
        regularPrice:
            freezed == regularPrice
                ? _value.regularPrice
                : regularPrice // ignore: cast_nullable_to_non_nullable
                    as int?,
        spacialPrice:
            freezed == spacialPrice
                ? _value.spacialPrice
                : spacialPrice // ignore: cast_nullable_to_non_nullable
                    as int?,
        discount:
            freezed == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                    as String?,
        customOptions:
            freezed == customOptions
                ? _value._customOptions
                : customOptions // ignore: cast_nullable_to_non_nullable
                    as List<CustomOption>?,
        itemSubtotal:
            freezed == itemSubtotal
                ? _value.itemSubtotal
                : itemSubtotal // ignore: cast_nullable_to_non_nullable
                    as int?,
        configOptions:
            freezed == configOptions
                ? _value._configOptions
                : configOptions // ignore: cast_nullable_to_non_nullable
                    as List<ConfigOption>?,
        rewardPoints:
            freezed == rewardPoints
                ? _value.rewardPoints
                : rewardPoints // ignore: cast_nullable_to_non_nullable
                    as CartItemRewardPoints?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemExtensionAttributesImpl implements _ItemExtensionAttributes {
  const _$ItemExtensionAttributesImpl({
    @JsonKey(name: "product_id") this.productId,
    @JsonKey(name: "product_url_key") this.productUrlKey,
    @JsonKey(name: "category_ids") final List<String>? categoryIds,
    @JsonKey(name: "category_names") final List<String>? categoryNames,
    @JsonKey(name: "stock_available") this.stockAvailable,
    @JsonKey(name: "brand_id") this.brandId,
    @JsonKey(name: "brand") this.brand,
    @JsonKey(name: "image_url") this.imageUrl,
    @JsonKey(name: "sold_by") this.soldBy,
    @JsonKey(name: "regular_price") this.regularPrice,
    @JsonKey(name: "spacial_price") this.spacialPrice,
    @JsonKey(name: "discount") this.discount,
    @JsonKey(name: "custom_options") final List<CustomOption>? customOptions,
    @JsonKey(name: "item_subtotal") this.itemSubtotal,
    @JsonKey(name: "config_options") final List<ConfigOption>? configOptions,
    @JsonKey(name: "reward_points") this.rewardPoints,
  }) : _categoryIds = categoryIds,
       _categoryNames = categoryNames,
       _customOptions = customOptions,
       _configOptions = configOptions;

  factory _$ItemExtensionAttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemExtensionAttributesImplFromJson(json);

  @override
  @JsonKey(name: "product_id")
  final int? productId;
  @override
  @JsonKey(name: "product_url_key")
  final String? productUrlKey;
  final List<String>? _categoryIds;
  @override
  @JsonKey(name: "category_ids")
  List<String>? get categoryIds {
    final value = _categoryIds;
    if (value == null) return null;
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _categoryNames;
  @override
  @JsonKey(name: "category_names")
  List<String>? get categoryNames {
    final value = _categoryNames;
    if (value == null) return null;
    if (_categoryNames is EqualUnmodifiableListView) return _categoryNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "stock_available")
  final bool? stockAvailable;
  @override
  @JsonKey(name: "brand_id")
  final String? brandId;
  @override
  @JsonKey(name: "brand")
  final String? brand;
  @override
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @override
  @JsonKey(name: "sold_by")
  final String? soldBy;
  @override
  @JsonKey(name: "regular_price")
  final int? regularPrice;
  @override
  @JsonKey(name: "spacial_price")
  final int? spacialPrice;
  @override
  @JsonKey(name: "discount")
  final String? discount;
  final List<CustomOption>? _customOptions;
  @override
  @JsonKey(name: "custom_options")
  List<CustomOption>? get customOptions {
    final value = _customOptions;
    if (value == null) return null;
    if (_customOptions is EqualUnmodifiableListView) return _customOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "item_subtotal")
  final int? itemSubtotal;
  final List<ConfigOption>? _configOptions;
  @override
  @JsonKey(name: "config_options")
  List<ConfigOption>? get configOptions {
    final value = _configOptions;
    if (value == null) return null;
    if (_configOptions is EqualUnmodifiableListView) return _configOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "reward_points")
  final CartItemRewardPoints? rewardPoints;

  @override
  String toString() {
    return 'ItemExtensionAttributes(productId: $productId, productUrlKey: $productUrlKey, categoryIds: $categoryIds, categoryNames: $categoryNames, stockAvailable: $stockAvailable, brandId: $brandId, brand: $brand, imageUrl: $imageUrl, soldBy: $soldBy, regularPrice: $regularPrice, spacialPrice: $spacialPrice, discount: $discount, customOptions: $customOptions, itemSubtotal: $itemSubtotal, configOptions: $configOptions, rewardPoints: $rewardPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemExtensionAttributesImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productUrlKey, productUrlKey) ||
                other.productUrlKey == productUrlKey) &&
            const DeepCollectionEquality().equals(
              other._categoryIds,
              _categoryIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._categoryNames,
              _categoryNames,
            ) &&
            (identical(other.stockAvailable, stockAvailable) ||
                other.stockAvailable == stockAvailable) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.soldBy, soldBy) || other.soldBy == soldBy) &&
            (identical(other.regularPrice, regularPrice) ||
                other.regularPrice == regularPrice) &&
            (identical(other.spacialPrice, spacialPrice) ||
                other.spacialPrice == spacialPrice) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            const DeepCollectionEquality().equals(
              other._customOptions,
              _customOptions,
            ) &&
            (identical(other.itemSubtotal, itemSubtotal) ||
                other.itemSubtotal == itemSubtotal) &&
            const DeepCollectionEquality().equals(
              other._configOptions,
              _configOptions,
            ) &&
            (identical(other.rewardPoints, rewardPoints) ||
                other.rewardPoints == rewardPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    productId,
    productUrlKey,
    const DeepCollectionEquality().hash(_categoryIds),
    const DeepCollectionEquality().hash(_categoryNames),
    stockAvailable,
    brandId,
    brand,
    imageUrl,
    soldBy,
    regularPrice,
    spacialPrice,
    discount,
    const DeepCollectionEquality().hash(_customOptions),
    itemSubtotal,
    const DeepCollectionEquality().hash(_configOptions),
    rewardPoints,
  );

  /// Create a copy of ItemExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemExtensionAttributesImplCopyWith<_$ItemExtensionAttributesImpl>
  get copyWith => __$$ItemExtensionAttributesImplCopyWithImpl<
    _$ItemExtensionAttributesImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemExtensionAttributesImplToJson(this);
  }
}

abstract class _ItemExtensionAttributes implements ItemExtensionAttributes {
  const factory _ItemExtensionAttributes({
    @JsonKey(name: "product_id") final int? productId,
    @JsonKey(name: "product_url_key") final String? productUrlKey,
    @JsonKey(name: "category_ids") final List<String>? categoryIds,
    @JsonKey(name: "category_names") final List<String>? categoryNames,
    @JsonKey(name: "stock_available") final bool? stockAvailable,
    @JsonKey(name: "brand_id") final String? brandId,
    @JsonKey(name: "brand") final String? brand,
    @JsonKey(name: "image_url") final String? imageUrl,
    @JsonKey(name: "sold_by") final String? soldBy,
    @JsonKey(name: "regular_price") final int? regularPrice,
    @JsonKey(name: "spacial_price") final int? spacialPrice,
    @JsonKey(name: "discount") final String? discount,
    @JsonKey(name: "custom_options") final List<CustomOption>? customOptions,
    @JsonKey(name: "item_subtotal") final int? itemSubtotal,
    @JsonKey(name: "config_options") final List<ConfigOption>? configOptions,
    @JsonKey(name: "reward_points") final CartItemRewardPoints? rewardPoints,
  }) = _$ItemExtensionAttributesImpl;

  factory _ItemExtensionAttributes.fromJson(Map<String, dynamic> json) =
      _$ItemExtensionAttributesImpl.fromJson;

  @override
  @JsonKey(name: "product_id")
  int? get productId;
  @override
  @JsonKey(name: "product_url_key")
  String? get productUrlKey;
  @override
  @JsonKey(name: "category_ids")
  List<String>? get categoryIds;
  @override
  @JsonKey(name: "category_names")
  List<String>? get categoryNames;
  @override
  @JsonKey(name: "stock_available")
  bool? get stockAvailable;
  @override
  @JsonKey(name: "brand_id")
  String? get brandId;
  @override
  @JsonKey(name: "brand")
  String? get brand;
  @override
  @JsonKey(name: "image_url")
  String? get imageUrl;
  @override
  @JsonKey(name: "sold_by")
  String? get soldBy;
  @override
  @JsonKey(name: "regular_price")
  int? get regularPrice;
  @override
  @JsonKey(name: "spacial_price")
  int? get spacialPrice;
  @override
  @JsonKey(name: "discount")
  String? get discount;
  @override
  @JsonKey(name: "custom_options")
  List<CustomOption>? get customOptions;
  @override
  @JsonKey(name: "item_subtotal")
  int? get itemSubtotal;
  @override
  @JsonKey(name: "config_options")
  List<ConfigOption>? get configOptions;
  @override
  @JsonKey(name: "reward_points")
  CartItemRewardPoints? get rewardPoints;

  /// Create a copy of ItemExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemExtensionAttributesImplCopyWith<_$ItemExtensionAttributesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CartItemRewardPoints _$CartItemRewardPointsFromJson(Map<String, dynamic> json) {
  return _CartItemRewardPoints.fromJson(json);
}

/// @nodoc
mixin _$CartItemRewardPoints {
  @JsonKey(name: "earn_points")
  num? get earnPoints => throw _privateConstructorUsedError;

  /// Serializes this CartItemRewardPoints to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItemRewardPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemRewardPointsCopyWith<CartItemRewardPoints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemRewardPointsCopyWith<$Res> {
  factory $CartItemRewardPointsCopyWith(
    CartItemRewardPoints value,
    $Res Function(CartItemRewardPoints) then,
  ) = _$CartItemRewardPointsCopyWithImpl<$Res, CartItemRewardPoints>;
  @useResult
  $Res call({@JsonKey(name: "earn_points") num? earnPoints});
}

/// @nodoc
class _$CartItemRewardPointsCopyWithImpl<
  $Res,
  $Val extends CartItemRewardPoints
>
    implements $CartItemRewardPointsCopyWith<$Res> {
  _$CartItemRewardPointsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItemRewardPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? earnPoints = freezed}) {
    return _then(
      _value.copyWith(
            earnPoints:
                freezed == earnPoints
                    ? _value.earnPoints
                    : earnPoints // ignore: cast_nullable_to_non_nullable
                        as num?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartItemRewardPointsImplCopyWith<$Res>
    implements $CartItemRewardPointsCopyWith<$Res> {
  factory _$$CartItemRewardPointsImplCopyWith(
    _$CartItemRewardPointsImpl value,
    $Res Function(_$CartItemRewardPointsImpl) then,
  ) = __$$CartItemRewardPointsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "earn_points") num? earnPoints});
}

/// @nodoc
class __$$CartItemRewardPointsImplCopyWithImpl<$Res>
    extends _$CartItemRewardPointsCopyWithImpl<$Res, _$CartItemRewardPointsImpl>
    implements _$$CartItemRewardPointsImplCopyWith<$Res> {
  __$$CartItemRewardPointsImplCopyWithImpl(
    _$CartItemRewardPointsImpl _value,
    $Res Function(_$CartItemRewardPointsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItemRewardPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? earnPoints = freezed}) {
    return _then(
      _$CartItemRewardPointsImpl(
        earnPoints:
            freezed == earnPoints
                ? _value.earnPoints
                : earnPoints // ignore: cast_nullable_to_non_nullable
                    as num?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemRewardPointsImpl implements _CartItemRewardPoints {
  const _$CartItemRewardPointsImpl({
    @JsonKey(name: "earn_points") this.earnPoints,
  });

  factory _$CartItemRewardPointsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemRewardPointsImplFromJson(json);

  @override
  @JsonKey(name: "earn_points")
  final num? earnPoints;

  @override
  String toString() {
    return 'CartItemRewardPoints(earnPoints: $earnPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemRewardPointsImpl &&
            (identical(other.earnPoints, earnPoints) ||
                other.earnPoints == earnPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, earnPoints);

  /// Create a copy of CartItemRewardPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemRewardPointsImplCopyWith<_$CartItemRewardPointsImpl>
  get copyWith =>
      __$$CartItemRewardPointsImplCopyWithImpl<_$CartItemRewardPointsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemRewardPointsImplToJson(this);
  }
}

abstract class _CartItemRewardPoints implements CartItemRewardPoints {
  const factory _CartItemRewardPoints({
    @JsonKey(name: "earn_points") final num? earnPoints,
  }) = _$CartItemRewardPointsImpl;

  factory _CartItemRewardPoints.fromJson(Map<String, dynamic> json) =
      _$CartItemRewardPointsImpl.fromJson;

  @override
  @JsonKey(name: "earn_points")
  num? get earnPoints;

  /// Create a copy of CartItemRewardPoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemRewardPointsImplCopyWith<_$CartItemRewardPointsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ConfigOption _$ConfigOptionFromJson(Map<String, dynamic> json) {
  return _ConfigOption.fromJson(json);
}

/// @nodoc
mixin _$ConfigOption {
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  String? get value => throw _privateConstructorUsedError;

  /// Serializes this ConfigOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfigOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigOptionCopyWith<ConfigOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigOptionCopyWith<$Res> {
  factory $ConfigOptionCopyWith(
    ConfigOption value,
    $Res Function(ConfigOption) then,
  ) = _$ConfigOptionCopyWithImpl<$Res, ConfigOption>;
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class _$ConfigOptionCopyWithImpl<$Res, $Val extends ConfigOption>
    implements $ConfigOptionCopyWith<$Res> {
  _$ConfigOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfigOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? title = freezed, Object? value = freezed}) {
    return _then(
      _value.copyWith(
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ConfigOptionImplCopyWith<$Res>
    implements $ConfigOptionCopyWith<$Res> {
  factory _$$ConfigOptionImplCopyWith(
    _$ConfigOptionImpl value,
    $Res Function(_$ConfigOptionImpl) then,
  ) = __$$ConfigOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class __$$ConfigOptionImplCopyWithImpl<$Res>
    extends _$ConfigOptionCopyWithImpl<$Res, _$ConfigOptionImpl>
    implements _$$ConfigOptionImplCopyWith<$Res> {
  __$$ConfigOptionImplCopyWithImpl(
    _$ConfigOptionImpl _value,
    $Res Function(_$ConfigOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConfigOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? title = freezed, Object? value = freezed}) {
    return _then(
      _$ConfigOptionImpl(
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
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
class _$ConfigOptionImpl implements _ConfigOption {
  const _$ConfigOptionImpl({
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "value") this.value,
  });

  factory _$ConfigOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigOptionImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "value")
  final String? value;

  @override
  String toString() {
    return 'ConfigOption(title: $title, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigOptionImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, value);

  /// Create a copy of ConfigOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigOptionImplCopyWith<_$ConfigOptionImpl> get copyWith =>
      __$$ConfigOptionImplCopyWithImpl<_$ConfigOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigOptionImplToJson(this);
  }
}

abstract class _ConfigOption implements ConfigOption {
  const factory _ConfigOption({
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "value") final String? value,
  }) = _$ConfigOptionImpl;

  factory _ConfigOption.fromJson(Map<String, dynamic> json) =
      _$ConfigOptionImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "value")
  String? get value;

  /// Create a copy of ConfigOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigOptionImplCopyWith<_$ConfigOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomOption _$CustomOptionFromJson(Map<String, dynamic> json) {
  return _CustomOption.fromJson(json);
}

/// @nodoc
mixin _$CustomOption {
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  String? get price => throw _privateConstructorUsedError;

  /// Serializes this CustomOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomOptionCopyWith<CustomOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomOptionCopyWith<$Res> {
  factory $CustomOptionCopyWith(
    CustomOption value,
    $Res Function(CustomOption) then,
  ) = _$CustomOptionCopyWithImpl<$Res, CustomOption>;
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") String? value,
    @JsonKey(name: "price") String? price,
  });
}

/// @nodoc
class _$CustomOptionCopyWithImpl<$Res, $Val extends CustomOption>
    implements $CustomOptionCopyWith<$Res> {
  _$CustomOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? value = freezed,
    Object? price = freezed,
  }) {
    return _then(
      _value.copyWith(
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            value:
                freezed == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String?,
            price:
                freezed == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomOptionImplCopyWith<$Res>
    implements $CustomOptionCopyWith<$Res> {
  factory _$$CustomOptionImplCopyWith(
    _$CustomOptionImpl value,
    $Res Function(_$CustomOptionImpl) then,
  ) = __$$CustomOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "value") String? value,
    @JsonKey(name: "price") String? price,
  });
}

/// @nodoc
class __$$CustomOptionImplCopyWithImpl<$Res>
    extends _$CustomOptionCopyWithImpl<$Res, _$CustomOptionImpl>
    implements _$$CustomOptionImplCopyWith<$Res> {
  __$$CustomOptionImplCopyWithImpl(
    _$CustomOptionImpl _value,
    $Res Function(_$CustomOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? value = freezed,
    Object? price = freezed,
  }) {
    return _then(
      _$CustomOptionImpl(
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        value:
            freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String?,
        price:
            freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomOptionImpl implements _CustomOption {
  const _$CustomOptionImpl({
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "value") this.value,
    @JsonKey(name: "price") this.price,
  });

  factory _$CustomOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomOptionImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "value")
  final String? value;
  @override
  @JsonKey(name: "price")
  final String? price;

  @override
  String toString() {
    return 'CustomOption(title: $title, value: $value, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomOptionImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, value, price);

  /// Create a copy of CustomOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomOptionImplCopyWith<_$CustomOptionImpl> get copyWith =>
      __$$CustomOptionImplCopyWithImpl<_$CustomOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomOptionImplToJson(this);
  }
}

abstract class _CustomOption implements CustomOption {
  const factory _CustomOption({
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "value") final String? value,
    @JsonKey(name: "price") final String? price,
  }) = _$CustomOptionImpl;

  factory _CustomOption.fromJson(Map<String, dynamic> json) =
      _$CustomOptionImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "value")
  String? get value;
  @override
  @JsonKey(name: "price")
  String? get price;

  /// Create a copy of CustomOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomOptionImplCopyWith<_$CustomOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Shipping _$ShippingFromJson(Map<String, dynamic> json) {
  return _Shipping.fromJson(json);
}

/// @nodoc
mixin _$Shipping {
  @JsonKey(name: "address")
  BillingAddressClass? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "method")
  dynamic get method => throw _privateConstructorUsedError;

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
    @JsonKey(name: "address") BillingAddressClass? address,
    @JsonKey(name: "method") dynamic method,
  });

  $BillingAddressClassCopyWith<$Res>? get address;
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
  $Res call({Object? address = freezed, Object? method = freezed}) {
    return _then(
      _value.copyWith(
            address:
                freezed == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as BillingAddressClass?,
            method:
                freezed == method
                    ? _value.method
                    : method // ignore: cast_nullable_to_non_nullable
                        as dynamic,
          )
          as $Val,
    );
  }

  /// Create a copy of Shipping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BillingAddressClassCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $BillingAddressClassCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
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
    @JsonKey(name: "address") BillingAddressClass? address,
    @JsonKey(name: "method") dynamic method,
  });

  @override
  $BillingAddressClassCopyWith<$Res>? get address;
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
  $Res call({Object? address = freezed, Object? method = freezed}) {
    return _then(
      _$ShippingImpl(
        address:
            freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as BillingAddressClass?,
        method:
            freezed == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                    as dynamic,
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
  });

  factory _$ShippingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingImplFromJson(json);

  @override
  @JsonKey(name: "address")
  final BillingAddressClass? address;
  @override
  @JsonKey(name: "method")
  final dynamic method;

  @override
  String toString() {
    return 'Shipping(address: $address, method: $method)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingImpl &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other.method, method));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    address,
    const DeepCollectionEquality().hash(method),
  );

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
    @JsonKey(name: "address") final BillingAddressClass? address,
    @JsonKey(name: "method") final dynamic method,
  }) = _$ShippingImpl;

  factory _Shipping.fromJson(Map<String, dynamic> json) =
      _$ShippingImpl.fromJson;

  @override
  @JsonKey(name: "address")
  BillingAddressClass? get address;
  @override
  @JsonKey(name: "method")
  dynamic get method;

  /// Create a copy of Shipping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShippingImplCopyWith<_$ShippingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
