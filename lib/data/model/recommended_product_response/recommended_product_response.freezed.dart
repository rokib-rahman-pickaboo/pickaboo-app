// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommended_product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecommendedProductResponse _$RecommendedProductResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RecommendedProductResponse.fromJson(json);
}

/// @nodoc
mixin _$RecommendedProductResponse {
  @JsonKey(name: "product_id")
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: "product_name")
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: "seller_recommended_products")
  List<Product>? get sellerRecommendedProducts =>
      throw _privateConstructorUsedError;

  /// Serializes this RecommendedProductResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendedProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendedProductResponseCopyWith<RecommendedProductResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendedProductResponseCopyWith<$Res> {
  factory $RecommendedProductResponseCopyWith(
    RecommendedProductResponse value,
    $Res Function(RecommendedProductResponse) then,
  ) =
      _$RecommendedProductResponseCopyWithImpl<
        $Res,
        RecommendedProductResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "seller_recommended_products")
    List<Product>? sellerRecommendedProducts,
  });
}

/// @nodoc
class _$RecommendedProductResponseCopyWithImpl<
  $Res,
  $Val extends RecommendedProductResponse
>
    implements $RecommendedProductResponseCopyWith<$Res> {
  _$RecommendedProductResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendedProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? sellerRecommendedProducts = freezed,
  }) {
    return _then(
      _value.copyWith(
            productId:
                freezed == productId
                    ? _value.productId
                    : productId // ignore: cast_nullable_to_non_nullable
                        as int?,
            productName:
                freezed == productName
                    ? _value.productName
                    : productName // ignore: cast_nullable_to_non_nullable
                        as String?,
            sellerRecommendedProducts:
                freezed == sellerRecommendedProducts
                    ? _value.sellerRecommendedProducts
                    : sellerRecommendedProducts // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecommendedProductResponseImplCopyWith<$Res>
    implements $RecommendedProductResponseCopyWith<$Res> {
  factory _$$RecommendedProductResponseImplCopyWith(
    _$RecommendedProductResponseImpl value,
    $Res Function(_$RecommendedProductResponseImpl) then,
  ) = __$$RecommendedProductResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "seller_recommended_products")
    List<Product>? sellerRecommendedProducts,
  });
}

/// @nodoc
class __$$RecommendedProductResponseImplCopyWithImpl<$Res>
    extends
        _$RecommendedProductResponseCopyWithImpl<
          $Res,
          _$RecommendedProductResponseImpl
        >
    implements _$$RecommendedProductResponseImplCopyWith<$Res> {
  __$$RecommendedProductResponseImplCopyWithImpl(
    _$RecommendedProductResponseImpl _value,
    $Res Function(_$RecommendedProductResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecommendedProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? sellerRecommendedProducts = freezed,
  }) {
    return _then(
      _$RecommendedProductResponseImpl(
        productId:
            freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as int?,
        productName:
            freezed == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                    as String?,
        sellerRecommendedProducts:
            freezed == sellerRecommendedProducts
                ? _value._sellerRecommendedProducts
                : sellerRecommendedProducts // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendedProductResponseImpl implements _RecommendedProductResponse {
  const _$RecommendedProductResponseImpl({
    @JsonKey(name: "product_id") this.productId,
    @JsonKey(name: "product_name") this.productName,
    @JsonKey(name: "seller_recommended_products")
    final List<Product>? sellerRecommendedProducts,
  }) : _sellerRecommendedProducts = sellerRecommendedProducts;

  factory _$RecommendedProductResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$RecommendedProductResponseImplFromJson(json);

  @override
  @JsonKey(name: "product_id")
  final int? productId;
  @override
  @JsonKey(name: "product_name")
  final String? productName;
  final List<Product>? _sellerRecommendedProducts;
  @override
  @JsonKey(name: "seller_recommended_products")
  List<Product>? get sellerRecommendedProducts {
    final value = _sellerRecommendedProducts;
    if (value == null) return null;
    if (_sellerRecommendedProducts is EqualUnmodifiableListView)
      return _sellerRecommendedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RecommendedProductResponse(productId: $productId, productName: $productName, sellerRecommendedProducts: $sellerRecommendedProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendedProductResponseImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            const DeepCollectionEquality().equals(
              other._sellerRecommendedProducts,
              _sellerRecommendedProducts,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    productId,
    productName,
    const DeepCollectionEquality().hash(_sellerRecommendedProducts),
  );

  /// Create a copy of RecommendedProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendedProductResponseImplCopyWith<_$RecommendedProductResponseImpl>
  get copyWith => __$$RecommendedProductResponseImplCopyWithImpl<
    _$RecommendedProductResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendedProductResponseImplToJson(this);
  }
}

abstract class _RecommendedProductResponse
    implements RecommendedProductResponse {
  const factory _RecommendedProductResponse({
    @JsonKey(name: "product_id") final int? productId,
    @JsonKey(name: "product_name") final String? productName,
    @JsonKey(name: "seller_recommended_products")
    final List<Product>? sellerRecommendedProducts,
  }) = _$RecommendedProductResponseImpl;

  factory _RecommendedProductResponse.fromJson(Map<String, dynamic> json) =
      _$RecommendedProductResponseImpl.fromJson;

  @override
  @JsonKey(name: "product_id")
  int? get productId;
  @override
  @JsonKey(name: "product_name")
  String? get productName;
  @override
  @JsonKey(name: "seller_recommended_products")
  List<Product>? get sellerRecommendedProducts;

  /// Create a copy of RecommendedProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendedProductResponseImplCopyWith<_$RecommendedProductResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
