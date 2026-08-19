// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'related_products_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RelatedProductsResponse _$RelatedProductsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RelatedProductsResponse.fromJson(json);
}

/// @nodoc
mixin _$RelatedProductsResponse {
  @JsonKey(name: "similar_products")
  List<Product>? get similarProducts => throw _privateConstructorUsedError;
  @JsonKey(name: "recently_viewed_products")
  List<Product>? get recentlyViewedProducts =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "you_may_also_like")
  List<Product>? get youMayAlsoLike => throw _privateConstructorUsedError;

  /// Serializes this RelatedProductsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelatedProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelatedProductsResponseCopyWith<RelatedProductsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatedProductsResponseCopyWith<$Res> {
  factory $RelatedProductsResponseCopyWith(
    RelatedProductsResponse value,
    $Res Function(RelatedProductsResponse) then,
  ) = _$RelatedProductsResponseCopyWithImpl<$Res, RelatedProductsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "similar_products") List<Product>? similarProducts,
    @JsonKey(name: "recently_viewed_products")
    List<Product>? recentlyViewedProducts,
    @JsonKey(name: "you_may_also_like") List<Product>? youMayAlsoLike,
  });
}

/// @nodoc
class _$RelatedProductsResponseCopyWithImpl<
  $Res,
  $Val extends RelatedProductsResponse
>
    implements $RelatedProductsResponseCopyWith<$Res> {
  _$RelatedProductsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelatedProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? similarProducts = freezed,
    Object? recentlyViewedProducts = freezed,
    Object? youMayAlsoLike = freezed,
  }) {
    return _then(
      _value.copyWith(
            similarProducts:
                freezed == similarProducts
                    ? _value.similarProducts
                    : similarProducts // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
            recentlyViewedProducts:
                freezed == recentlyViewedProducts
                    ? _value.recentlyViewedProducts
                    : recentlyViewedProducts // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
            youMayAlsoLike:
                freezed == youMayAlsoLike
                    ? _value.youMayAlsoLike
                    : youMayAlsoLike // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RelatedProductsResponseImplCopyWith<$Res>
    implements $RelatedProductsResponseCopyWith<$Res> {
  factory _$$RelatedProductsResponseImplCopyWith(
    _$RelatedProductsResponseImpl value,
    $Res Function(_$RelatedProductsResponseImpl) then,
  ) = __$$RelatedProductsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "similar_products") List<Product>? similarProducts,
    @JsonKey(name: "recently_viewed_products")
    List<Product>? recentlyViewedProducts,
    @JsonKey(name: "you_may_also_like") List<Product>? youMayAlsoLike,
  });
}

/// @nodoc
class __$$RelatedProductsResponseImplCopyWithImpl<$Res>
    extends
        _$RelatedProductsResponseCopyWithImpl<
          $Res,
          _$RelatedProductsResponseImpl
        >
    implements _$$RelatedProductsResponseImplCopyWith<$Res> {
  __$$RelatedProductsResponseImplCopyWithImpl(
    _$RelatedProductsResponseImpl _value,
    $Res Function(_$RelatedProductsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelatedProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? similarProducts = freezed,
    Object? recentlyViewedProducts = freezed,
    Object? youMayAlsoLike = freezed,
  }) {
    return _then(
      _$RelatedProductsResponseImpl(
        similarProducts:
            freezed == similarProducts
                ? _value._similarProducts
                : similarProducts // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
        recentlyViewedProducts:
            freezed == recentlyViewedProducts
                ? _value._recentlyViewedProducts
                : recentlyViewedProducts // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
        youMayAlsoLike:
            freezed == youMayAlsoLike
                ? _value._youMayAlsoLike
                : youMayAlsoLike // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelatedProductsResponseImpl implements _RelatedProductsResponse {
  const _$RelatedProductsResponseImpl({
    @JsonKey(name: "similar_products") final List<Product>? similarProducts,
    @JsonKey(name: "recently_viewed_products")
    final List<Product>? recentlyViewedProducts,
    @JsonKey(name: "you_may_also_like") final List<Product>? youMayAlsoLike,
  }) : _similarProducts = similarProducts,
       _recentlyViewedProducts = recentlyViewedProducts,
       _youMayAlsoLike = youMayAlsoLike;

  factory _$RelatedProductsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelatedProductsResponseImplFromJson(json);

  final List<Product>? _similarProducts;
  @override
  @JsonKey(name: "similar_products")
  List<Product>? get similarProducts {
    final value = _similarProducts;
    if (value == null) return null;
    if (_similarProducts is EqualUnmodifiableListView) return _similarProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Product>? _recentlyViewedProducts;
  @override
  @JsonKey(name: "recently_viewed_products")
  List<Product>? get recentlyViewedProducts {
    final value = _recentlyViewedProducts;
    if (value == null) return null;
    if (_recentlyViewedProducts is EqualUnmodifiableListView)
      return _recentlyViewedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Product>? _youMayAlsoLike;
  @override
  @JsonKey(name: "you_may_also_like")
  List<Product>? get youMayAlsoLike {
    final value = _youMayAlsoLike;
    if (value == null) return null;
    if (_youMayAlsoLike is EqualUnmodifiableListView) return _youMayAlsoLike;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RelatedProductsResponse(similarProducts: $similarProducts, recentlyViewedProducts: $recentlyViewedProducts, youMayAlsoLike: $youMayAlsoLike)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelatedProductsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._similarProducts,
              _similarProducts,
            ) &&
            const DeepCollectionEquality().equals(
              other._recentlyViewedProducts,
              _recentlyViewedProducts,
            ) &&
            const DeepCollectionEquality().equals(
              other._youMayAlsoLike,
              _youMayAlsoLike,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_similarProducts),
    const DeepCollectionEquality().hash(_recentlyViewedProducts),
    const DeepCollectionEquality().hash(_youMayAlsoLike),
  );

  /// Create a copy of RelatedProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelatedProductsResponseImplCopyWith<_$RelatedProductsResponseImpl>
  get copyWith => __$$RelatedProductsResponseImplCopyWithImpl<
    _$RelatedProductsResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelatedProductsResponseImplToJson(this);
  }
}

abstract class _RelatedProductsResponse implements RelatedProductsResponse {
  const factory _RelatedProductsResponse({
    @JsonKey(name: "similar_products") final List<Product>? similarProducts,
    @JsonKey(name: "recently_viewed_products")
    final List<Product>? recentlyViewedProducts,
    @JsonKey(name: "you_may_also_like") final List<Product>? youMayAlsoLike,
  }) = _$RelatedProductsResponseImpl;

  factory _RelatedProductsResponse.fromJson(Map<String, dynamic> json) =
      _$RelatedProductsResponseImpl.fromJson;

  @override
  @JsonKey(name: "similar_products")
  List<Product>? get similarProducts;
  @override
  @JsonKey(name: "recently_viewed_products")
  List<Product>? get recentlyViewedProducts;
  @override
  @JsonKey(name: "you_may_also_like")
  List<Product>? get youMayAlsoLike;

  /// Create a copy of RelatedProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelatedProductsResponseImplCopyWith<_$RelatedProductsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
