// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_products_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SellerProductsResponse _$SellerProductsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SellerProductsResponse.fromJson(json);
}

/// @nodoc
mixin _$SellerProductsResponse {
  @JsonKey(name: "vendor_name")
  String? get vendorName => throw _privateConstructorUsedError;
  @JsonKey(name: "vendor_meta_keywords")
  dynamic get vendorMetaKeywords => throw _privateConstructorUsedError;
  @JsonKey(name: "vendor_meta_description")
  dynamic get vendorMetaDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "total_count")
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: "items")
  List<Product>? get items => throw _privateConstructorUsedError;

  /// Serializes this SellerProductsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SellerProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerProductsResponseCopyWith<SellerProductsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerProductsResponseCopyWith<$Res> {
  factory $SellerProductsResponseCopyWith(
    SellerProductsResponse value,
    $Res Function(SellerProductsResponse) then,
  ) = _$SellerProductsResponseCopyWithImpl<$Res, SellerProductsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "vendor_name") String? vendorName,
    @JsonKey(name: "vendor_meta_keywords") dynamic vendorMetaKeywords,
    @JsonKey(name: "vendor_meta_description") dynamic vendorMetaDescription,
    @JsonKey(name: "total_count") int? totalCount,
    @JsonKey(name: "items") List<Product>? items,
  });
}

/// @nodoc
class _$SellerProductsResponseCopyWithImpl<
  $Res,
  $Val extends SellerProductsResponse
>
    implements $SellerProductsResponseCopyWith<$Res> {
  _$SellerProductsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorName = freezed,
    Object? vendorMetaKeywords = freezed,
    Object? vendorMetaDescription = freezed,
    Object? totalCount = freezed,
    Object? items = freezed,
  }) {
    return _then(
      _value.copyWith(
            vendorName:
                freezed == vendorName
                    ? _value.vendorName
                    : vendorName // ignore: cast_nullable_to_non_nullable
                        as String?,
            vendorMetaKeywords:
                freezed == vendorMetaKeywords
                    ? _value.vendorMetaKeywords
                    : vendorMetaKeywords // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            vendorMetaDescription:
                freezed == vendorMetaDescription
                    ? _value.vendorMetaDescription
                    : vendorMetaDescription // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            totalCount:
                freezed == totalCount
                    ? _value.totalCount
                    : totalCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            items:
                freezed == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SellerProductsResponseImplCopyWith<$Res>
    implements $SellerProductsResponseCopyWith<$Res> {
  factory _$$SellerProductsResponseImplCopyWith(
    _$SellerProductsResponseImpl value,
    $Res Function(_$SellerProductsResponseImpl) then,
  ) = __$$SellerProductsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "vendor_name") String? vendorName,
    @JsonKey(name: "vendor_meta_keywords") dynamic vendorMetaKeywords,
    @JsonKey(name: "vendor_meta_description") dynamic vendorMetaDescription,
    @JsonKey(name: "total_count") int? totalCount,
    @JsonKey(name: "items") List<Product>? items,
  });
}

/// @nodoc
class __$$SellerProductsResponseImplCopyWithImpl<$Res>
    extends
        _$SellerProductsResponseCopyWithImpl<$Res, _$SellerProductsResponseImpl>
    implements _$$SellerProductsResponseImplCopyWith<$Res> {
  __$$SellerProductsResponseImplCopyWithImpl(
    _$SellerProductsResponseImpl _value,
    $Res Function(_$SellerProductsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SellerProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorName = freezed,
    Object? vendorMetaKeywords = freezed,
    Object? vendorMetaDescription = freezed,
    Object? totalCount = freezed,
    Object? items = freezed,
  }) {
    return _then(
      _$SellerProductsResponseImpl(
        vendorName:
            freezed == vendorName
                ? _value.vendorName
                : vendorName // ignore: cast_nullable_to_non_nullable
                    as String?,
        vendorMetaKeywords:
            freezed == vendorMetaKeywords
                ? _value.vendorMetaKeywords
                : vendorMetaKeywords // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        vendorMetaDescription:
            freezed == vendorMetaDescription
                ? _value.vendorMetaDescription
                : vendorMetaDescription // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        totalCount:
            freezed == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerProductsResponseImpl implements _SellerProductsResponse {
  const _$SellerProductsResponseImpl({
    @JsonKey(name: "vendor_name") this.vendorName,
    @JsonKey(name: "vendor_meta_keywords") this.vendorMetaKeywords,
    @JsonKey(name: "vendor_meta_description") this.vendorMetaDescription,
    @JsonKey(name: "total_count") this.totalCount,
    @JsonKey(name: "items") final List<Product>? items,
  }) : _items = items;

  factory _$SellerProductsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerProductsResponseImplFromJson(json);

  @override
  @JsonKey(name: "vendor_name")
  final String? vendorName;
  @override
  @JsonKey(name: "vendor_meta_keywords")
  final dynamic vendorMetaKeywords;
  @override
  @JsonKey(name: "vendor_meta_description")
  final dynamic vendorMetaDescription;
  @override
  @JsonKey(name: "total_count")
  final int? totalCount;
  final List<Product>? _items;
  @override
  @JsonKey(name: "items")
  List<Product>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SellerProductsResponse(vendorName: $vendorName, vendorMetaKeywords: $vendorMetaKeywords, vendorMetaDescription: $vendorMetaDescription, totalCount: $totalCount, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerProductsResponseImpl &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            const DeepCollectionEquality().equals(
              other.vendorMetaKeywords,
              vendorMetaKeywords,
            ) &&
            const DeepCollectionEquality().equals(
              other.vendorMetaDescription,
              vendorMetaDescription,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    vendorName,
    const DeepCollectionEquality().hash(vendorMetaKeywords),
    const DeepCollectionEquality().hash(vendorMetaDescription),
    totalCount,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of SellerProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerProductsResponseImplCopyWith<_$SellerProductsResponseImpl>
  get copyWith =>
      __$$SellerProductsResponseImplCopyWithImpl<_$SellerProductsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerProductsResponseImplToJson(this);
  }
}

abstract class _SellerProductsResponse implements SellerProductsResponse {
  const factory _SellerProductsResponse({
    @JsonKey(name: "vendor_name") final String? vendorName,
    @JsonKey(name: "vendor_meta_keywords") final dynamic vendorMetaKeywords,
    @JsonKey(name: "vendor_meta_description")
    final dynamic vendorMetaDescription,
    @JsonKey(name: "total_count") final int? totalCount,
    @JsonKey(name: "items") final List<Product>? items,
  }) = _$SellerProductsResponseImpl;

  factory _SellerProductsResponse.fromJson(Map<String, dynamic> json) =
      _$SellerProductsResponseImpl.fromJson;

  @override
  @JsonKey(name: "vendor_name")
  String? get vendorName;
  @override
  @JsonKey(name: "vendor_meta_keywords")
  dynamic get vendorMetaKeywords;
  @override
  @JsonKey(name: "vendor_meta_description")
  dynamic get vendorMetaDescription;
  @override
  @JsonKey(name: "total_count")
  int? get totalCount;
  @override
  @JsonKey(name: "items")
  List<Product>? get items;

  /// Create a copy of SellerProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerProductsResponseImplCopyWith<_$SellerProductsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
