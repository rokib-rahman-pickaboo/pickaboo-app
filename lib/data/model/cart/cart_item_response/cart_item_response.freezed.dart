// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartItemResponse _$CartItemResponseFromJson(Map<String, dynamic> json) {
  return _CartItemResponse.fromJson(json);
}

/// @nodoc
mixin _$CartItemResponse {
  @JsonKey(name: "item_id")
  int? get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: "sku")
  String? get sku => throw _privateConstructorUsedError;
  @JsonKey(name: "qty")
  int? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "product_type")
  String? get productType => throw _privateConstructorUsedError;
  @JsonKey(name: "quote_id")
  String? get quoteId => throw _privateConstructorUsedError;
  @JsonKey(name: "product_option")
  ProductOptionResponse? get productOption =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "row_total")
  double? get rowTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "row_total_with_discount")
  double? get rowTotalWithDiscount => throw _privateConstructorUsedError;

  /// Serializes this CartItemResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemResponseCopyWith<CartItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemResponseCopyWith<$Res> {
  factory $CartItemResponseCopyWith(
    CartItemResponse value,
    $Res Function(CartItemResponse) then,
  ) = _$CartItemResponseCopyWithImpl<$Res, CartItemResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") double? price,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "quote_id") String? quoteId,
    @JsonKey(name: "product_option") ProductOptionResponse? productOption,
    @JsonKey(name: "row_total") double? rowTotal,
    @JsonKey(name: "row_total_with_discount") double? rowTotalWithDiscount,
  });

  $ProductOptionResponseCopyWith<$Res>? get productOption;
}

/// @nodoc
class _$CartItemResponseCopyWithImpl<$Res, $Val extends CartItemResponse>
    implements $CartItemResponseCopyWith<$Res> {
  _$CartItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItemResponse
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
    Object? productOption = freezed,
    Object? rowTotal = freezed,
    Object? rowTotalWithDiscount = freezed,
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
                        as double?,
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
            productOption:
                freezed == productOption
                    ? _value.productOption
                    : productOption // ignore: cast_nullable_to_non_nullable
                        as ProductOptionResponse?,
            rowTotal:
                freezed == rowTotal
                    ? _value.rowTotal
                    : rowTotal // ignore: cast_nullable_to_non_nullable
                        as double?,
            rowTotalWithDiscount:
                freezed == rowTotalWithDiscount
                    ? _value.rowTotalWithDiscount
                    : rowTotalWithDiscount // ignore: cast_nullable_to_non_nullable
                        as double?,
          )
          as $Val,
    );
  }

  /// Create a copy of CartItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductOptionResponseCopyWith<$Res>? get productOption {
    if (_value.productOption == null) {
      return null;
    }

    return $ProductOptionResponseCopyWith<$Res>(_value.productOption!, (value) {
      return _then(_value.copyWith(productOption: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemResponseImplCopyWith<$Res>
    implements $CartItemResponseCopyWith<$Res> {
  factory _$$CartItemResponseImplCopyWith(
    _$CartItemResponseImpl value,
    $Res Function(_$CartItemResponseImpl) then,
  ) = __$$CartItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "qty") int? qty,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") double? price,
    @JsonKey(name: "product_type") String? productType,
    @JsonKey(name: "quote_id") String? quoteId,
    @JsonKey(name: "product_option") ProductOptionResponse? productOption,
    @JsonKey(name: "row_total") double? rowTotal,
    @JsonKey(name: "row_total_with_discount") double? rowTotalWithDiscount,
  });

  @override
  $ProductOptionResponseCopyWith<$Res>? get productOption;
}

/// @nodoc
class __$$CartItemResponseImplCopyWithImpl<$Res>
    extends _$CartItemResponseCopyWithImpl<$Res, _$CartItemResponseImpl>
    implements _$$CartItemResponseImplCopyWith<$Res> {
  __$$CartItemResponseImplCopyWithImpl(
    _$CartItemResponseImpl _value,
    $Res Function(_$CartItemResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItemResponse
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
    Object? productOption = freezed,
    Object? rowTotal = freezed,
    Object? rowTotalWithDiscount = freezed,
  }) {
    return _then(
      _$CartItemResponseImpl(
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
                    as double?,
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
        productOption:
            freezed == productOption
                ? _value.productOption
                : productOption // ignore: cast_nullable_to_non_nullable
                    as ProductOptionResponse?,
        rowTotal:
            freezed == rowTotal
                ? _value.rowTotal
                : rowTotal // ignore: cast_nullable_to_non_nullable
                    as double?,
        rowTotalWithDiscount:
            freezed == rowTotalWithDiscount
                ? _value.rowTotalWithDiscount
                : rowTotalWithDiscount // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemResponseImpl implements _CartItemResponse {
  const _$CartItemResponseImpl({
    @JsonKey(name: "item_id") this.itemId,
    @JsonKey(name: "sku") this.sku,
    @JsonKey(name: "qty") this.qty,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "price") this.price,
    @JsonKey(name: "product_type") this.productType,
    @JsonKey(name: "quote_id") this.quoteId,
    @JsonKey(name: "product_option") this.productOption,
    @JsonKey(name: "row_total") this.rowTotal,
    @JsonKey(name: "row_total_with_discount") this.rowTotalWithDiscount,
  });

  factory _$CartItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemResponseImplFromJson(json);

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
  final double? price;
  @override
  @JsonKey(name: "product_type")
  final String? productType;
  @override
  @JsonKey(name: "quote_id")
  final String? quoteId;
  @override
  @JsonKey(name: "product_option")
  final ProductOptionResponse? productOption;
  @override
  @JsonKey(name: "row_total")
  final double? rowTotal;
  @override
  @JsonKey(name: "row_total_with_discount")
  final double? rowTotalWithDiscount;

  @override
  String toString() {
    return 'CartItemResponse(itemId: $itemId, sku: $sku, qty: $qty, name: $name, price: $price, productType: $productType, quoteId: $quoteId, productOption: $productOption, rowTotal: $rowTotal, rowTotalWithDiscount: $rowTotalWithDiscount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemResponseImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.productOption, productOption) ||
                other.productOption == productOption) &&
            (identical(other.rowTotal, rowTotal) ||
                other.rowTotal == rowTotal) &&
            (identical(other.rowTotalWithDiscount, rowTotalWithDiscount) ||
                other.rowTotalWithDiscount == rowTotalWithDiscount));
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
    productOption,
    rowTotal,
    rowTotalWithDiscount,
  );

  /// Create a copy of CartItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemResponseImplCopyWith<_$CartItemResponseImpl> get copyWith =>
      __$$CartItemResponseImplCopyWithImpl<_$CartItemResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemResponseImplToJson(this);
  }
}

abstract class _CartItemResponse implements CartItemResponse {
  const factory _CartItemResponse({
    @JsonKey(name: "item_id") final int? itemId,
    @JsonKey(name: "sku") final String? sku,
    @JsonKey(name: "qty") final int? qty,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "price") final double? price,
    @JsonKey(name: "product_type") final String? productType,
    @JsonKey(name: "quote_id") final String? quoteId,
    @JsonKey(name: "product_option") final ProductOptionResponse? productOption,
    @JsonKey(name: "row_total") final double? rowTotal,
    @JsonKey(name: "row_total_with_discount")
    final double? rowTotalWithDiscount,
  }) = _$CartItemResponseImpl;

  factory _CartItemResponse.fromJson(Map<String, dynamic> json) =
      _$CartItemResponseImpl.fromJson;

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
  double? get price;
  @override
  @JsonKey(name: "product_type")
  String? get productType;
  @override
  @JsonKey(name: "quote_id")
  String? get quoteId;
  @override
  @JsonKey(name: "product_option")
  ProductOptionResponse? get productOption;
  @override
  @JsonKey(name: "row_total")
  double? get rowTotal;
  @override
  @JsonKey(name: "row_total_with_discount")
  double? get rowTotalWithDiscount;

  /// Create a copy of CartItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemResponseImplCopyWith<_$CartItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
