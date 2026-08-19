// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'related_product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RelatedProductResponse _$RelatedProductResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RelatedProductResponse.fromJson(json);
}

/// @nodoc
mixin _$RelatedProductResponse {
  @JsonKey(name: "product_id")
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: "product_name")
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: "related_products")
  List<Product>? get relatedProducts => throw _privateConstructorUsedError;

  /// Serializes this RelatedProductResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelatedProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelatedProductResponseCopyWith<RelatedProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatedProductResponseCopyWith<$Res> {
  factory $RelatedProductResponseCopyWith(
    RelatedProductResponse value,
    $Res Function(RelatedProductResponse) then,
  ) = _$RelatedProductResponseCopyWithImpl<$Res, RelatedProductResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "related_products") List<Product>? relatedProducts,
  });
}

/// @nodoc
class _$RelatedProductResponseCopyWithImpl<
  $Res,
  $Val extends RelatedProductResponse
>
    implements $RelatedProductResponseCopyWith<$Res> {
  _$RelatedProductResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelatedProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? relatedProducts = freezed,
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
            relatedProducts:
                freezed == relatedProducts
                    ? _value.relatedProducts
                    : relatedProducts // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RelatedProductResponseImplCopyWith<$Res>
    implements $RelatedProductResponseCopyWith<$Res> {
  factory _$$RelatedProductResponseImplCopyWith(
    _$RelatedProductResponseImpl value,
    $Res Function(_$RelatedProductResponseImpl) then,
  ) = __$$RelatedProductResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "related_products") List<Product>? relatedProducts,
  });
}

/// @nodoc
class __$$RelatedProductResponseImplCopyWithImpl<$Res>
    extends
        _$RelatedProductResponseCopyWithImpl<$Res, _$RelatedProductResponseImpl>
    implements _$$RelatedProductResponseImplCopyWith<$Res> {
  __$$RelatedProductResponseImplCopyWithImpl(
    _$RelatedProductResponseImpl _value,
    $Res Function(_$RelatedProductResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelatedProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? relatedProducts = freezed,
  }) {
    return _then(
      _$RelatedProductResponseImpl(
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
        relatedProducts:
            freezed == relatedProducts
                ? _value._relatedProducts
                : relatedProducts // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelatedProductResponseImpl implements _RelatedProductResponse {
  const _$RelatedProductResponseImpl({
    @JsonKey(name: "product_id") this.productId,
    @JsonKey(name: "product_name") this.productName,
    @JsonKey(name: "related_products") final List<Product>? relatedProducts,
  }) : _relatedProducts = relatedProducts;

  factory _$RelatedProductResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelatedProductResponseImplFromJson(json);

  @override
  @JsonKey(name: "product_id")
  final int? productId;
  @override
  @JsonKey(name: "product_name")
  final String? productName;
  final List<Product>? _relatedProducts;
  @override
  @JsonKey(name: "related_products")
  List<Product>? get relatedProducts {
    final value = _relatedProducts;
    if (value == null) return null;
    if (_relatedProducts is EqualUnmodifiableListView) return _relatedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RelatedProductResponse(productId: $productId, productName: $productName, relatedProducts: $relatedProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelatedProductResponseImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            const DeepCollectionEquality().equals(
              other._relatedProducts,
              _relatedProducts,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    productId,
    productName,
    const DeepCollectionEquality().hash(_relatedProducts),
  );

  /// Create a copy of RelatedProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelatedProductResponseImplCopyWith<_$RelatedProductResponseImpl>
  get copyWith =>
      __$$RelatedProductResponseImplCopyWithImpl<_$RelatedProductResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RelatedProductResponseImplToJson(this);
  }
}

abstract class _RelatedProductResponse implements RelatedProductResponse {
  const factory _RelatedProductResponse({
    @JsonKey(name: "product_id") final int? productId,
    @JsonKey(name: "product_name") final String? productName,
    @JsonKey(name: "related_products") final List<Product>? relatedProducts,
  }) = _$RelatedProductResponseImpl;

  factory _RelatedProductResponse.fromJson(Map<String, dynamic> json) =
      _$RelatedProductResponseImpl.fromJson;

  @override
  @JsonKey(name: "product_id")
  int? get productId;
  @override
  @JsonKey(name: "product_name")
  String? get productName;
  @override
  @JsonKey(name: "related_products")
  List<Product>? get relatedProducts;

  /// Create a copy of RelatedProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelatedProductResponseImplCopyWith<_$RelatedProductResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
