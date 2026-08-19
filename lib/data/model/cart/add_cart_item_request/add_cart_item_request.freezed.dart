// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_cart_item_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddCartItemRequest _$AddCartItemRequestFromJson(Map<String, dynamic> json) {
  return _AddCartItemRequest.fromJson(json);
}

/// @nodoc
mixin _$AddCartItemRequest {
  @JsonKey(name: "cartItem")
  CartItem get cartItem => throw _privateConstructorUsedError;

  /// Serializes this AddCartItemRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddCartItemRequestCopyWith<AddCartItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCartItemRequestCopyWith<$Res> {
  factory $AddCartItemRequestCopyWith(
    AddCartItemRequest value,
    $Res Function(AddCartItemRequest) then,
  ) = _$AddCartItemRequestCopyWithImpl<$Res, AddCartItemRequest>;
  @useResult
  $Res call({@JsonKey(name: "cartItem") CartItem cartItem});

  $CartItemCopyWith<$Res> get cartItem;
}

/// @nodoc
class _$AddCartItemRequestCopyWithImpl<$Res, $Val extends AddCartItemRequest>
    implements $AddCartItemRequestCopyWith<$Res> {
  _$AddCartItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartItem = null}) {
    return _then(
      _value.copyWith(
            cartItem:
                null == cartItem
                    ? _value.cartItem
                    : cartItem // ignore: cast_nullable_to_non_nullable
                        as CartItem,
          )
          as $Val,
    );
  }

  /// Create a copy of AddCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res> get cartItem {
    return $CartItemCopyWith<$Res>(_value.cartItem, (value) {
      return _then(_value.copyWith(cartItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddCartItemRequestImplCopyWith<$Res>
    implements $AddCartItemRequestCopyWith<$Res> {
  factory _$$AddCartItemRequestImplCopyWith(
    _$AddCartItemRequestImpl value,
    $Res Function(_$AddCartItemRequestImpl) then,
  ) = __$$AddCartItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "cartItem") CartItem cartItem});

  @override
  $CartItemCopyWith<$Res> get cartItem;
}

/// @nodoc
class __$$AddCartItemRequestImplCopyWithImpl<$Res>
    extends _$AddCartItemRequestCopyWithImpl<$Res, _$AddCartItemRequestImpl>
    implements _$$AddCartItemRequestImplCopyWith<$Res> {
  __$$AddCartItemRequestImplCopyWithImpl(
    _$AddCartItemRequestImpl _value,
    $Res Function(_$AddCartItemRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartItem = null}) {
    return _then(
      _$AddCartItemRequestImpl(
        cartItem:
            null == cartItem
                ? _value.cartItem
                : cartItem // ignore: cast_nullable_to_non_nullable
                    as CartItem,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddCartItemRequestImpl implements _AddCartItemRequest {
  const _$AddCartItemRequestImpl({
    @JsonKey(name: "cartItem") required this.cartItem,
  });

  factory _$AddCartItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddCartItemRequestImplFromJson(json);

  @override
  @JsonKey(name: "cartItem")
  final CartItem cartItem;

  @override
  String toString() {
    return 'AddCartItemRequest(cartItem: $cartItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCartItemRequestImpl &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cartItem);

  /// Create a copy of AddCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCartItemRequestImplCopyWith<_$AddCartItemRequestImpl> get copyWith =>
      __$$AddCartItemRequestImplCopyWithImpl<_$AddCartItemRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddCartItemRequestImplToJson(this);
  }
}

abstract class _AddCartItemRequest implements AddCartItemRequest {
  const factory _AddCartItemRequest({
    @JsonKey(name: "cartItem") required final CartItem cartItem,
  }) = _$AddCartItemRequestImpl;

  factory _AddCartItemRequest.fromJson(Map<String, dynamic> json) =
      _$AddCartItemRequestImpl.fromJson;

  @override
  @JsonKey(name: "cartItem")
  CartItem get cartItem;

  /// Create a copy of AddCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCartItemRequestImplCopyWith<_$AddCartItemRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  @JsonKey(name: "quote_id")
  String get quoteId => throw _privateConstructorUsedError;
  @JsonKey(name: "sku")
  String get sku => throw _privateConstructorUsedError;
  @JsonKey(name: "qty")
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: "product_type")
  String? get productType => throw _privateConstructorUsedError;
  @JsonKey(name: "product_option")
  ProductOption? get productOption => throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call({
    @JsonKey(name: "quote_id") String quoteId,
    @JsonKey(name: "sku") String sku,
    @JsonKey(name: "qty") int qty,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "product_option") ProductOption? productOption,
  });

  $ProductOptionCopyWith<$Res>? get productOption;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quoteId = null,
    Object? sku = null,
    Object? qty = null,
    Object? productType = freezed,
    Object? productOption = freezed,
  }) {
    return _then(
      _value.copyWith(
            quoteId:
                null == quoteId
                    ? _value.quoteId
                    : quoteId // ignore: cast_nullable_to_non_nullable
                        as String,
            sku:
                null == sku
                    ? _value.sku
                    : sku // ignore: cast_nullable_to_non_nullable
                        as String,
            qty:
                null == qty
                    ? _value.qty
                    : qty // ignore: cast_nullable_to_non_nullable
                        as int,
            productType:
                freezed == productType
                    ? _value.productType
                    : productType // ignore: cast_nullable_to_non_nullable
                        as String?,
            productOption:
                freezed == productOption
                    ? _value.productOption
                    : productOption // ignore: cast_nullable_to_non_nullable
                        as ProductOption?,
          )
          as $Val,
    );
  }

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductOptionCopyWith<$Res>? get productOption {
    if (_value.productOption == null) {
      return null;
    }

    return $ProductOptionCopyWith<$Res>(_value.productOption!, (value) {
      return _then(_value.copyWith(productOption: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
    _$CartItemImpl value,
    $Res Function(_$CartItemImpl) then,
  ) = __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "quote_id") String quoteId,
    @JsonKey(name: "sku") String sku,
    @JsonKey(name: "qty") int qty,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "product_option") ProductOption? productOption,
  });

  @override
  $ProductOptionCopyWith<$Res>? get productOption;
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
    _$CartItemImpl _value,
    $Res Function(_$CartItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quoteId = null,
    Object? sku = null,
    Object? qty = null,
    Object? productType = freezed,
    Object? productOption = freezed,
  }) {
    return _then(
      _$CartItemImpl(
        quoteId:
            null == quoteId
                ? _value.quoteId
                : quoteId // ignore: cast_nullable_to_non_nullable
                    as String,
        sku:
            null == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                    as String,
        qty:
            null == qty
                ? _value.qty
                : qty // ignore: cast_nullable_to_non_nullable
                    as int,
        productType:
            freezed == productType
                ? _value.productType
                : productType // ignore: cast_nullable_to_non_nullable
                    as String?,
        productOption:
            freezed == productOption
                ? _value.productOption
                : productOption // ignore: cast_nullable_to_non_nullable
                    as ProductOption?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl({
    @JsonKey(name: "quote_id") required this.quoteId,
    @JsonKey(name: "sku") required this.sku,
    @JsonKey(name: "qty") required this.qty,
    @JsonKey(name: "product_type") this.productType,
    @JsonKey(name: "product_option") this.productOption,
  });

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  @JsonKey(name: "quote_id")
  final String quoteId;
  @override
  @JsonKey(name: "sku")
  final String sku;
  @override
  @JsonKey(name: "qty")
  final int qty;
  @override
  @JsonKey(name: "product_type")
  final String? productType;
  @override
  @JsonKey(name: "product_option")
  final ProductOption? productOption;

  @override
  String toString() {
    return 'CartItem(quoteId: $quoteId, sku: $sku, qty: $qty, productType: $productType, productOption: $productOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.productOption, productOption) ||
                other.productOption == productOption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, quoteId, sku, qty, productType, productOption);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(this);
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem({
    @JsonKey(name: "quote_id") required final String quoteId,
    @JsonKey(name: "sku") required final String sku,
    @JsonKey(name: "qty") required final int qty,
    @JsonKey(name: "product_type") final String? productType,
    @JsonKey(name: "product_option") final ProductOption? productOption,
  }) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  @JsonKey(name: "quote_id")
  String get quoteId;
  @override
  @JsonKey(name: "sku")
  String get sku;
  @override
  @JsonKey(name: "qty")
  int get qty;
  @override
  @JsonKey(name: "product_type")
  String? get productType;
  @override
  @JsonKey(name: "product_option")
  ProductOption? get productOption;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductOption _$ProductOptionFromJson(Map<String, dynamic> json) {
  return _ProductOption.fromJson(json);
}

/// @nodoc
mixin _$ProductOption {
  @JsonKey(name: "extension_attributes")
  ExtensionAttributes? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this ProductOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductOptionCopyWith<ProductOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOptionCopyWith<$Res> {
  factory $ProductOptionCopyWith(
    ProductOption value,
    $Res Function(ProductOption) then,
  ) = _$ProductOptionCopyWithImpl<$Res, ProductOption>;
  @useResult
  $Res call({
    @JsonKey(name: "extension_attributes")
    ExtensionAttributes? extensionAttributes,
  });

  $ExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class _$ProductOptionCopyWithImpl<$Res, $Val extends ProductOption>
    implements $ProductOptionCopyWith<$Res> {
  _$ProductOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? extensionAttributes = freezed}) {
    return _then(
      _value.copyWith(
            extensionAttributes:
                freezed == extensionAttributes
                    ? _value.extensionAttributes
                    : extensionAttributes // ignore: cast_nullable_to_non_nullable
                        as ExtensionAttributes?,
          )
          as $Val,
    );
  }

  /// Create a copy of ProductOption
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
abstract class _$$ProductOptionImplCopyWith<$Res>
    implements $ProductOptionCopyWith<$Res> {
  factory _$$ProductOptionImplCopyWith(
    _$ProductOptionImpl value,
    $Res Function(_$ProductOptionImpl) then,
  ) = __$$ProductOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "extension_attributes")
    ExtensionAttributes? extensionAttributes,
  });

  @override
  $ExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class __$$ProductOptionImplCopyWithImpl<$Res>
    extends _$ProductOptionCopyWithImpl<$Res, _$ProductOptionImpl>
    implements _$$ProductOptionImplCopyWith<$Res> {
  __$$ProductOptionImplCopyWithImpl(
    _$ProductOptionImpl _value,
    $Res Function(_$ProductOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? extensionAttributes = freezed}) {
    return _then(
      _$ProductOptionImpl(
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
class _$ProductOptionImpl implements _ProductOption {
  const _$ProductOptionImpl({
    @JsonKey(name: "extension_attributes") this.extensionAttributes,
  });

  factory _$ProductOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductOptionImplFromJson(json);

  @override
  @JsonKey(name: "extension_attributes")
  final ExtensionAttributes? extensionAttributes;

  @override
  String toString() {
    return 'ProductOption(extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductOptionImpl &&
            (identical(other.extensionAttributes, extensionAttributes) ||
                other.extensionAttributes == extensionAttributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, extensionAttributes);

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductOptionImplCopyWith<_$ProductOptionImpl> get copyWith =>
      __$$ProductOptionImplCopyWithImpl<_$ProductOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductOptionImplToJson(this);
  }
}

abstract class _ProductOption implements ProductOption {
  const factory _ProductOption({
    @JsonKey(name: "extension_attributes")
    final ExtensionAttributes? extensionAttributes,
  }) = _$ProductOptionImpl;

  factory _ProductOption.fromJson(Map<String, dynamic> json) =
      _$ProductOptionImpl.fromJson;

  @override
  @JsonKey(name: "extension_attributes")
  ExtensionAttributes? get extensionAttributes;

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductOptionImplCopyWith<_$ProductOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtensionAttributes _$ExtensionAttributesFromJson(Map<String, dynamic> json) {
  return _ExtensionAttributes.fromJson(json);
}

/// @nodoc
mixin _$ExtensionAttributes {
  @JsonKey(name: "configurable_item_options")
  List<MOption>? get configurableItemOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "custom_options")
  List<MOption>? get customOptions => throw _privateConstructorUsedError;

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
    @JsonKey(name: "configurable_item_options")
    List<MOption>? configurableItemOptions,
    @JsonKey(name: "custom_options") List<MOption>? customOptions,
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
    Object? configurableItemOptions = freezed,
    Object? customOptions = freezed,
  }) {
    return _then(
      _value.copyWith(
            configurableItemOptions:
                freezed == configurableItemOptions
                    ? _value.configurableItemOptions
                    : configurableItemOptions // ignore: cast_nullable_to_non_nullable
                        as List<MOption>?,
            customOptions:
                freezed == customOptions
                    ? _value.customOptions
                    : customOptions // ignore: cast_nullable_to_non_nullable
                        as List<MOption>?,
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
    @JsonKey(name: "configurable_item_options")
    List<MOption>? configurableItemOptions,
    @JsonKey(name: "custom_options") List<MOption>? customOptions,
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
    Object? configurableItemOptions = freezed,
    Object? customOptions = freezed,
  }) {
    return _then(
      _$ExtensionAttributesImpl(
        configurableItemOptions:
            freezed == configurableItemOptions
                ? _value._configurableItemOptions
                : configurableItemOptions // ignore: cast_nullable_to_non_nullable
                    as List<MOption>?,
        customOptions:
            freezed == customOptions
                ? _value._customOptions
                : customOptions // ignore: cast_nullable_to_non_nullable
                    as List<MOption>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtensionAttributesImpl implements _ExtensionAttributes {
  const _$ExtensionAttributesImpl({
    @JsonKey(name: "configurable_item_options")
    final List<MOption>? configurableItemOptions,
    @JsonKey(name: "custom_options") final List<MOption>? customOptions,
  }) : _configurableItemOptions = configurableItemOptions,
       _customOptions = customOptions;

  factory _$ExtensionAttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtensionAttributesImplFromJson(json);

  final List<MOption>? _configurableItemOptions;
  @override
  @JsonKey(name: "configurable_item_options")
  List<MOption>? get configurableItemOptions {
    final value = _configurableItemOptions;
    if (value == null) return null;
    if (_configurableItemOptions is EqualUnmodifiableListView)
      return _configurableItemOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MOption>? _customOptions;
  @override
  @JsonKey(name: "custom_options")
  List<MOption>? get customOptions {
    final value = _customOptions;
    if (value == null) return null;
    if (_customOptions is EqualUnmodifiableListView) return _customOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExtensionAttributes(configurableItemOptions: $configurableItemOptions, customOptions: $customOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionAttributesImpl &&
            const DeepCollectionEquality().equals(
              other._configurableItemOptions,
              _configurableItemOptions,
            ) &&
            const DeepCollectionEquality().equals(
              other._customOptions,
              _customOptions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_configurableItemOptions),
    const DeepCollectionEquality().hash(_customOptions),
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
    @JsonKey(name: "configurable_item_options")
    final List<MOption>? configurableItemOptions,
    @JsonKey(name: "custom_options") final List<MOption>? customOptions,
  }) = _$ExtensionAttributesImpl;

  factory _ExtensionAttributes.fromJson(Map<String, dynamic> json) =
      _$ExtensionAttributesImpl.fromJson;

  @override
  @JsonKey(name: "configurable_item_options")
  List<MOption>? get configurableItemOptions;
  @override
  @JsonKey(name: "custom_options")
  List<MOption>? get customOptions;

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionAttributesImplCopyWith<_$ExtensionAttributesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MOption _$MOptionFromJson(Map<String, dynamic> json) {
  return _MOption.fromJson(json);
}

/// @nodoc
mixin _$MOption {
  @JsonKey(name: "option_id", fromJson: _anyToString)
  String? get optionId => throw _privateConstructorUsedError;
  @JsonKey(name: "option_value", fromJson: _anyToString)
  String? get optionValue => throw _privateConstructorUsedError;

  /// Serializes this MOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MOptionCopyWith<MOption> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MOptionCopyWith<$Res> {
  factory $MOptionCopyWith(MOption value, $Res Function(MOption) then) =
      _$MOptionCopyWithImpl<$Res, MOption>;
  @useResult
  $Res call({
    @JsonKey(name: "option_id", fromJson: _anyToString) String? optionId,
    @JsonKey(name: "option_value", fromJson: _anyToString) String? optionValue,
  });
}

/// @nodoc
class _$MOptionCopyWithImpl<$Res, $Val extends MOption>
    implements $MOptionCopyWith<$Res> {
  _$MOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? optionId = freezed, Object? optionValue = freezed}) {
    return _then(
      _value.copyWith(
            optionId:
                freezed == optionId
                    ? _value.optionId
                    : optionId // ignore: cast_nullable_to_non_nullable
                        as String?,
            optionValue:
                freezed == optionValue
                    ? _value.optionValue
                    : optionValue // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MOptionImplCopyWith<$Res> implements $MOptionCopyWith<$Res> {
  factory _$$MOptionImplCopyWith(
    _$MOptionImpl value,
    $Res Function(_$MOptionImpl) then,
  ) = __$$MOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "option_id", fromJson: _anyToString) String? optionId,
    @JsonKey(name: "option_value", fromJson: _anyToString) String? optionValue,
  });
}

/// @nodoc
class __$$MOptionImplCopyWithImpl<$Res>
    extends _$MOptionCopyWithImpl<$Res, _$MOptionImpl>
    implements _$$MOptionImplCopyWith<$Res> {
  __$$MOptionImplCopyWithImpl(
    _$MOptionImpl _value,
    $Res Function(_$MOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? optionId = freezed, Object? optionValue = freezed}) {
    return _then(
      _$MOptionImpl(
        optionId:
            freezed == optionId
                ? _value.optionId
                : optionId // ignore: cast_nullable_to_non_nullable
                    as String?,
        optionValue:
            freezed == optionValue
                ? _value.optionValue
                : optionValue // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MOptionImpl implements _MOption {
  const _$MOptionImpl({
    @JsonKey(name: "option_id", fromJson: _anyToString) this.optionId,
    @JsonKey(name: "option_value", fromJson: _anyToString) this.optionValue,
  });

  factory _$MOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MOptionImplFromJson(json);

  @override
  @JsonKey(name: "option_id", fromJson: _anyToString)
  final String? optionId;
  @override
  @JsonKey(name: "option_value", fromJson: _anyToString)
  final String? optionValue;

  @override
  String toString() {
    return 'MOption(optionId: $optionId, optionValue: $optionValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MOptionImpl &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.optionValue, optionValue) ||
                other.optionValue == optionValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, optionId, optionValue);

  /// Create a copy of MOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MOptionImplCopyWith<_$MOptionImpl> get copyWith =>
      __$$MOptionImplCopyWithImpl<_$MOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MOptionImplToJson(this);
  }
}

abstract class _MOption implements MOption {
  const factory _MOption({
    @JsonKey(name: "option_id", fromJson: _anyToString) final String? optionId,
    @JsonKey(name: "option_value", fromJson: _anyToString)
    final String? optionValue,
  }) = _$MOptionImpl;

  factory _MOption.fromJson(Map<String, dynamic> json) = _$MOptionImpl.fromJson;

  @override
  @JsonKey(name: "option_id", fromJson: _anyToString)
  String? get optionId;
  @override
  @JsonKey(name: "option_value", fromJson: _anyToString)
  String? get optionValue;

  /// Create a copy of MOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MOptionImplCopyWith<_$MOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
