// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_cart_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddCartItemResponse _$AddCartItemResponseFromJson(Map<String, dynamic> json) {
  return _AddCartItemResponse.fromJson(json);
}

/// @nodoc
mixin _$AddCartItemResponse {
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
  ExtensionAttributes? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this AddCartItemResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddCartItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddCartItemResponseCopyWith<AddCartItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCartItemResponseCopyWith<$Res> {
  factory $AddCartItemResponseCopyWith(
    AddCartItemResponse value,
    $Res Function(AddCartItemResponse) then,
  ) = _$AddCartItemResponseCopyWithImpl<$Res, AddCartItemResponse>;
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
    ExtensionAttributes? extensionAttributes,
  });

  $ExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class _$AddCartItemResponseCopyWithImpl<$Res, $Val extends AddCartItemResponse>
    implements $AddCartItemResponseCopyWith<$Res> {
  _$AddCartItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddCartItemResponse
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
                        as ExtensionAttributes?,
          )
          as $Val,
    );
  }

  /// Create a copy of AddCartItemResponse
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
abstract class _$$AddCartItemResponseImplCopyWith<$Res>
    implements $AddCartItemResponseCopyWith<$Res> {
  factory _$$AddCartItemResponseImplCopyWith(
    _$AddCartItemResponseImpl value,
    $Res Function(_$AddCartItemResponseImpl) then,
  ) = __$$AddCartItemResponseImplCopyWithImpl<$Res>;
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
    ExtensionAttributes? extensionAttributes,
  });

  @override
  $ExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class __$$AddCartItemResponseImplCopyWithImpl<$Res>
    extends _$AddCartItemResponseCopyWithImpl<$Res, _$AddCartItemResponseImpl>
    implements _$$AddCartItemResponseImplCopyWith<$Res> {
  __$$AddCartItemResponseImplCopyWithImpl(
    _$AddCartItemResponseImpl _value,
    $Res Function(_$AddCartItemResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddCartItemResponse
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
      _$AddCartItemResponseImpl(
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
                    as ExtensionAttributes?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddCartItemResponseImpl implements _AddCartItemResponse {
  const _$AddCartItemResponseImpl({
    @JsonKey(name: "item_id") this.itemId,
    @JsonKey(name: "sku") this.sku,
    @JsonKey(name: "qty") this.qty,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "price") this.price,
    @JsonKey(name: "product_type") this.productType,
    @JsonKey(name: "quote_id") this.quoteId,
    @JsonKey(name: "extension_attributes") this.extensionAttributes,
  });

  factory _$AddCartItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddCartItemResponseImplFromJson(json);

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
  final ExtensionAttributes? extensionAttributes;

  @override
  String toString() {
    return 'AddCartItemResponse(itemId: $itemId, sku: $sku, qty: $qty, name: $name, price: $price, productType: $productType, quoteId: $quoteId, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCartItemResponseImpl &&
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

  /// Create a copy of AddCartItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCartItemResponseImplCopyWith<_$AddCartItemResponseImpl> get copyWith =>
      __$$AddCartItemResponseImplCopyWithImpl<_$AddCartItemResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddCartItemResponseImplToJson(this);
  }
}

abstract class _AddCartItemResponse implements AddCartItemResponse {
  const factory _AddCartItemResponse({
    @JsonKey(name: "item_id") final int? itemId,
    @JsonKey(name: "sku") final String? sku,
    @JsonKey(name: "qty") final int? qty,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "price") final int? price,
    @JsonKey(name: "product_type") final String? productType,
    @JsonKey(name: "quote_id") final String? quoteId,
    @JsonKey(name: "extension_attributes")
    final ExtensionAttributes? extensionAttributes,
  }) = _$AddCartItemResponseImpl;

  factory _AddCartItemResponse.fromJson(Map<String, dynamic> json) =
      _$AddCartItemResponseImpl.fromJson;

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
  ExtensionAttributes? get extensionAttributes;

  /// Create a copy of AddCartItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCartItemResponseImplCopyWith<_$AddCartItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtensionAttributes _$ExtensionAttributesFromJson(Map<String, dynamic> json) {
  return _ExtensionAttributes.fromJson(json);
}

/// @nodoc
mixin _$ExtensionAttributes {
  @JsonKey(name: "cart_items_count")
  int? get cartItemsCount => throw _privateConstructorUsedError;
  @JsonKey(name: "cart_items_qty")
  int? get cartItemsQty => throw _privateConstructorUsedError;
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
  @JsonKey(name: "item_subtotal")
  int? get itemSubtotal => throw _privateConstructorUsedError;

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
    @JsonKey(name: "cart_items_count") int? cartItemsCount,
    @JsonKey(name: "cart_items_qty") int? cartItemsQty,
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
    @JsonKey(name: "item_subtotal") int? itemSubtotal,
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
    Object? cartItemsCount = freezed,
    Object? cartItemsQty = freezed,
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
    Object? itemSubtotal = freezed,
  }) {
    return _then(
      _value.copyWith(
            cartItemsCount:
                freezed == cartItemsCount
                    ? _value.cartItemsCount
                    : cartItemsCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            cartItemsQty:
                freezed == cartItemsQty
                    ? _value.cartItemsQty
                    : cartItemsQty // ignore: cast_nullable_to_non_nullable
                        as int?,
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
            itemSubtotal:
                freezed == itemSubtotal
                    ? _value.itemSubtotal
                    : itemSubtotal // ignore: cast_nullable_to_non_nullable
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
    @JsonKey(name: "cart_items_count") int? cartItemsCount,
    @JsonKey(name: "cart_items_qty") int? cartItemsQty,
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
    @JsonKey(name: "item_subtotal") int? itemSubtotal,
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
    Object? cartItemsCount = freezed,
    Object? cartItemsQty = freezed,
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
    Object? itemSubtotal = freezed,
  }) {
    return _then(
      _$ExtensionAttributesImpl(
        cartItemsCount:
            freezed == cartItemsCount
                ? _value.cartItemsCount
                : cartItemsCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        cartItemsQty:
            freezed == cartItemsQty
                ? _value.cartItemsQty
                : cartItemsQty // ignore: cast_nullable_to_non_nullable
                    as int?,
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
        itemSubtotal:
            freezed == itemSubtotal
                ? _value.itemSubtotal
                : itemSubtotal // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtensionAttributesImpl implements _ExtensionAttributes {
  const _$ExtensionAttributesImpl({
    @JsonKey(name: "cart_items_count") this.cartItemsCount,
    @JsonKey(name: "cart_items_qty") this.cartItemsQty,
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
    @JsonKey(name: "item_subtotal") this.itemSubtotal,
  }) : _categoryIds = categoryIds,
       _categoryNames = categoryNames;

  factory _$ExtensionAttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtensionAttributesImplFromJson(json);

  @override
  @JsonKey(name: "cart_items_count")
  final int? cartItemsCount;
  @override
  @JsonKey(name: "cart_items_qty")
  final int? cartItemsQty;
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
  @override
  @JsonKey(name: "item_subtotal")
  final int? itemSubtotal;

  @override
  String toString() {
    return 'ExtensionAttributes(cartItemsCount: $cartItemsCount, cartItemsQty: $cartItemsQty, productId: $productId, productUrlKey: $productUrlKey, categoryIds: $categoryIds, categoryNames: $categoryNames, stockAvailable: $stockAvailable, brandId: $brandId, brand: $brand, imageUrl: $imageUrl, soldBy: $soldBy, regularPrice: $regularPrice, spacialPrice: $spacialPrice, discount: $discount, itemSubtotal: $itemSubtotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionAttributesImpl &&
            (identical(other.cartItemsCount, cartItemsCount) ||
                other.cartItemsCount == cartItemsCount) &&
            (identical(other.cartItemsQty, cartItemsQty) ||
                other.cartItemsQty == cartItemsQty) &&
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
            (identical(other.itemSubtotal, itemSubtotal) ||
                other.itemSubtotal == itemSubtotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    cartItemsCount,
    cartItemsQty,
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
    itemSubtotal,
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
    @JsonKey(name: "cart_items_count") final int? cartItemsCount,
    @JsonKey(name: "cart_items_qty") final int? cartItemsQty,
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
    @JsonKey(name: "item_subtotal") final int? itemSubtotal,
  }) = _$ExtensionAttributesImpl;

  factory _ExtensionAttributes.fromJson(Map<String, dynamic> json) =
      _$ExtensionAttributesImpl.fromJson;

  @override
  @JsonKey(name: "cart_items_count")
  int? get cartItemsCount;
  @override
  @JsonKey(name: "cart_items_qty")
  int? get cartItemsQty;
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
  @JsonKey(name: "item_subtotal")
  int? get itemSubtotal;

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionAttributesImplCopyWith<_$ExtensionAttributesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
