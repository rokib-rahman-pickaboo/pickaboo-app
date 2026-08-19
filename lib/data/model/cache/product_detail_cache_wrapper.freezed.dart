// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_cache_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductDetailCacheWrapper _$ProductDetailCacheWrapperFromJson(
  Map<String, dynamic> json,
) {
  return _ProductDetailCacheWrapper.fromJson(json);
}

/// @nodoc
mixin _$ProductDetailCacheWrapper {
  @HiveField(0)
  List<ProductDetailResponse> get productDetails =>
      throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get cachedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductDetailCacheWrapper to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductDetailCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductDetailCacheWrapperCopyWith<ProductDetailCacheWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailCacheWrapperCopyWith<$Res> {
  factory $ProductDetailCacheWrapperCopyWith(
    ProductDetailCacheWrapper value,
    $Res Function(ProductDetailCacheWrapper) then,
  ) = _$ProductDetailCacheWrapperCopyWithImpl<$Res, ProductDetailCacheWrapper>;
  @useResult
  $Res call({
    @HiveField(0) List<ProductDetailResponse> productDetails,
    @HiveField(1) DateTime cachedAt,
  });
}

/// @nodoc
class _$ProductDetailCacheWrapperCopyWithImpl<
  $Res,
  $Val extends ProductDetailCacheWrapper
>
    implements $ProductDetailCacheWrapperCopyWith<$Res> {
  _$ProductDetailCacheWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDetailCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productDetails = null, Object? cachedAt = null}) {
    return _then(
      _value.copyWith(
            productDetails:
                null == productDetails
                    ? _value.productDetails
                    : productDetails // ignore: cast_nullable_to_non_nullable
                        as List<ProductDetailResponse>,
            cachedAt:
                null == cachedAt
                    ? _value.cachedAt
                    : cachedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductDetailCacheWrapperImplCopyWith<$Res>
    implements $ProductDetailCacheWrapperCopyWith<$Res> {
  factory _$$ProductDetailCacheWrapperImplCopyWith(
    _$ProductDetailCacheWrapperImpl value,
    $Res Function(_$ProductDetailCacheWrapperImpl) then,
  ) = __$$ProductDetailCacheWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) List<ProductDetailResponse> productDetails,
    @HiveField(1) DateTime cachedAt,
  });
}

/// @nodoc
class __$$ProductDetailCacheWrapperImplCopyWithImpl<$Res>
    extends
        _$ProductDetailCacheWrapperCopyWithImpl<
          $Res,
          _$ProductDetailCacheWrapperImpl
        >
    implements _$$ProductDetailCacheWrapperImplCopyWith<$Res> {
  __$$ProductDetailCacheWrapperImplCopyWithImpl(
    _$ProductDetailCacheWrapperImpl _value,
    $Res Function(_$ProductDetailCacheWrapperImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductDetailCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productDetails = null, Object? cachedAt = null}) {
    return _then(
      _$ProductDetailCacheWrapperImpl(
        productDetails:
            null == productDetails
                ? _value._productDetails
                : productDetails // ignore: cast_nullable_to_non_nullable
                    as List<ProductDetailResponse>,
        cachedAt:
            null == cachedAt
                ? _value.cachedAt
                : cachedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDetailCacheWrapperImpl implements _ProductDetailCacheWrapper {
  const _$ProductDetailCacheWrapperImpl({
    @HiveField(0) required final List<ProductDetailResponse> productDetails,
    @HiveField(1) required this.cachedAt,
  }) : _productDetails = productDetails;

  factory _$ProductDetailCacheWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDetailCacheWrapperImplFromJson(json);

  final List<ProductDetailResponse> _productDetails;
  @override
  @HiveField(0)
  List<ProductDetailResponse> get productDetails {
    if (_productDetails is EqualUnmodifiableListView) return _productDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productDetails);
  }

  @override
  @HiveField(1)
  final DateTime cachedAt;

  @override
  String toString() {
    return 'ProductDetailCacheWrapper(productDetails: $productDetails, cachedAt: $cachedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailCacheWrapperImpl &&
            const DeepCollectionEquality().equals(
              other._productDetails,
              _productDetails,
            ) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_productDetails),
    cachedAt,
  );

  /// Create a copy of ProductDetailCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailCacheWrapperImplCopyWith<_$ProductDetailCacheWrapperImpl>
  get copyWith => __$$ProductDetailCacheWrapperImplCopyWithImpl<
    _$ProductDetailCacheWrapperImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDetailCacheWrapperImplToJson(this);
  }
}

abstract class _ProductDetailCacheWrapper implements ProductDetailCacheWrapper {
  const factory _ProductDetailCacheWrapper({
    @HiveField(0) required final List<ProductDetailResponse> productDetails,
    @HiveField(1) required final DateTime cachedAt,
  }) = _$ProductDetailCacheWrapperImpl;

  factory _ProductDetailCacheWrapper.fromJson(Map<String, dynamic> json) =
      _$ProductDetailCacheWrapperImpl.fromJson;

  @override
  @HiveField(0)
  List<ProductDetailResponse> get productDetails;
  @override
  @HiveField(1)
  DateTime get cachedAt;

  /// Create a copy of ProductDetailCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductDetailCacheWrapperImplCopyWith<_$ProductDetailCacheWrapperImpl>
  get copyWith => throw _privateConstructorUsedError;
}
