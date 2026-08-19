// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_banner_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductBannerResponse _$ProductBannerResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ProductBannerResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductBannerResponse {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "sort_order")
  int? get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;

  /// Serializes this ProductBannerResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductBannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductBannerResponseCopyWith<ProductBannerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductBannerResponseCopyWith<$Res> {
  factory $ProductBannerResponseCopyWith(
    ProductBannerResponse value,
    $Res Function(ProductBannerResponse) then,
  ) = _$ProductBannerResponseCopyWithImpl<$Res, ProductBannerResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "sort_order") int? sortOrder,
    @JsonKey(name: "status") int? status,
  });
}

/// @nodoc
class _$ProductBannerResponseCopyWithImpl<
  $Res,
  $Val extends ProductBannerResponse
>
    implements $ProductBannerResponseCopyWith<$Res> {
  _$ProductBannerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductBannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? link = freezed,
    Object? sortOrder = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            image:
                freezed == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String?,
            link:
                freezed == link
                    ? _value.link
                    : link // ignore: cast_nullable_to_non_nullable
                        as String?,
            sortOrder:
                freezed == sortOrder
                    ? _value.sortOrder
                    : sortOrder // ignore: cast_nullable_to_non_nullable
                        as int?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductBannerResponseImplCopyWith<$Res>
    implements $ProductBannerResponseCopyWith<$Res> {
  factory _$$ProductBannerResponseImplCopyWith(
    _$ProductBannerResponseImpl value,
    $Res Function(_$ProductBannerResponseImpl) then,
  ) = __$$ProductBannerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "sort_order") int? sortOrder,
    @JsonKey(name: "status") int? status,
  });
}

/// @nodoc
class __$$ProductBannerResponseImplCopyWithImpl<$Res>
    extends
        _$ProductBannerResponseCopyWithImpl<$Res, _$ProductBannerResponseImpl>
    implements _$$ProductBannerResponseImplCopyWith<$Res> {
  __$$ProductBannerResponseImplCopyWithImpl(
    _$ProductBannerResponseImpl _value,
    $Res Function(_$ProductBannerResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductBannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? link = freezed,
    Object? sortOrder = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$ProductBannerResponseImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        image:
            freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String?,
        link:
            freezed == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                    as String?,
        sortOrder:
            freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                    as int?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductBannerResponseImpl implements _ProductBannerResponse {
  const _$ProductBannerResponseImpl({
    @JsonKey(name: "id") this.id,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "image") this.image,
    @JsonKey(name: "link") this.link,
    @JsonKey(name: "sort_order") this.sortOrder,
    @JsonKey(name: "status") this.status,
  });

  factory _$ProductBannerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductBannerResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "link")
  final String? link;
  @override
  @JsonKey(name: "sort_order")
  final int? sortOrder;
  @override
  @JsonKey(name: "status")
  final int? status;

  @override
  String toString() {
    return 'ProductBannerResponse(id: $id, title: $title, image: $image, link: $link, sortOrder: $sortOrder, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductBannerResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, image, link, sortOrder, status);

  /// Create a copy of ProductBannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductBannerResponseImplCopyWith<_$ProductBannerResponseImpl>
  get copyWith =>
      __$$ProductBannerResponseImplCopyWithImpl<_$ProductBannerResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductBannerResponseImplToJson(this);
  }
}

abstract class _ProductBannerResponse implements ProductBannerResponse {
  const factory _ProductBannerResponse({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "image") final String? image,
    @JsonKey(name: "link") final String? link,
    @JsonKey(name: "sort_order") final int? sortOrder,
    @JsonKey(name: "status") final int? status,
  }) = _$ProductBannerResponseImpl;

  factory _ProductBannerResponse.fromJson(Map<String, dynamic> json) =
      _$ProductBannerResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "link")
  String? get link;
  @override
  @JsonKey(name: "sort_order")
  int? get sortOrder;
  @override
  @JsonKey(name: "status")
  int? get status;

  /// Create a copy of ProductBannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductBannerResponseImplCopyWith<_$ProductBannerResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
