// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_review_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserReviewResponse _$UserReviewResponseFromJson(Map<String, dynamic> json) {
  return _UserReviewResponse.fromJson(json);
}

/// @nodoc
mixin _$UserReviewResponse {
  @JsonKey(name: "review_id")
  int? get reviewId => throw _privateConstructorUsedError;
  @JsonKey(name: "posted_on")
  DateTime? get postedOn => throw _privateConstructorUsedError;
  @JsonKey(name: "product_id")
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: "product_url_key")
  String? get productUrlKey => throw _privateConstructorUsedError;
  @JsonKey(name: "product_name")
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: "product_image")
  String? get productImage => throw _privateConstructorUsedError;
  @JsonKey(name: "reviwer_rating")
  int? get reviwerRating => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "detail")
  String? get detail => throw _privateConstructorUsedError;
  @JsonKey(name: "images")
  List<String>? get images => throw _privateConstructorUsedError;

  /// Serializes this UserReviewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserReviewResponseCopyWith<UserReviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReviewResponseCopyWith<$Res> {
  factory $UserReviewResponseCopyWith(
    UserReviewResponse value,
    $Res Function(UserReviewResponse) then,
  ) = _$UserReviewResponseCopyWithImpl<$Res, UserReviewResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "review_id") int? reviewId,
    @JsonKey(name: "posted_on") DateTime? postedOn,
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_url_key") String? productUrlKey,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "product_image") String? productImage,
    @JsonKey(name: "reviwer_rating") int? reviwerRating,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "detail") String? detail,
    @JsonKey(name: "images") List<String>? images,
  });
}

/// @nodoc
class _$UserReviewResponseCopyWithImpl<$Res, $Val extends UserReviewResponse>
    implements $UserReviewResponseCopyWith<$Res> {
  _$UserReviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? postedOn = freezed,
    Object? productId = freezed,
    Object? productUrlKey = freezed,
    Object? productName = freezed,
    Object? productImage = freezed,
    Object? reviwerRating = freezed,
    Object? title = freezed,
    Object? detail = freezed,
    Object? images = freezed,
  }) {
    return _then(
      _value.copyWith(
            reviewId:
                freezed == reviewId
                    ? _value.reviewId
                    : reviewId // ignore: cast_nullable_to_non_nullable
                        as int?,
            postedOn:
                freezed == postedOn
                    ? _value.postedOn
                    : postedOn // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
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
            productName:
                freezed == productName
                    ? _value.productName
                    : productName // ignore: cast_nullable_to_non_nullable
                        as String?,
            productImage:
                freezed == productImage
                    ? _value.productImage
                    : productImage // ignore: cast_nullable_to_non_nullable
                        as String?,
            reviwerRating:
                freezed == reviwerRating
                    ? _value.reviwerRating
                    : reviwerRating // ignore: cast_nullable_to_non_nullable
                        as int?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            detail:
                freezed == detail
                    ? _value.detail
                    : detail // ignore: cast_nullable_to_non_nullable
                        as String?,
            images:
                freezed == images
                    ? _value.images
                    : images // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserReviewResponseImplCopyWith<$Res>
    implements $UserReviewResponseCopyWith<$Res> {
  factory _$$UserReviewResponseImplCopyWith(
    _$UserReviewResponseImpl value,
    $Res Function(_$UserReviewResponseImpl) then,
  ) = __$$UserReviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "review_id") int? reviewId,
    @JsonKey(name: "posted_on") DateTime? postedOn,
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_url_key") String? productUrlKey,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "product_image") String? productImage,
    @JsonKey(name: "reviwer_rating") int? reviwerRating,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "detail") String? detail,
    @JsonKey(name: "images") List<String>? images,
  });
}

/// @nodoc
class __$$UserReviewResponseImplCopyWithImpl<$Res>
    extends _$UserReviewResponseCopyWithImpl<$Res, _$UserReviewResponseImpl>
    implements _$$UserReviewResponseImplCopyWith<$Res> {
  __$$UserReviewResponseImplCopyWithImpl(
    _$UserReviewResponseImpl _value,
    $Res Function(_$UserReviewResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? postedOn = freezed,
    Object? productId = freezed,
    Object? productUrlKey = freezed,
    Object? productName = freezed,
    Object? productImage = freezed,
    Object? reviwerRating = freezed,
    Object? title = freezed,
    Object? detail = freezed,
    Object? images = freezed,
  }) {
    return _then(
      _$UserReviewResponseImpl(
        reviewId:
            freezed == reviewId
                ? _value.reviewId
                : reviewId // ignore: cast_nullable_to_non_nullable
                    as int?,
        postedOn:
            freezed == postedOn
                ? _value.postedOn
                : postedOn // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
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
        productName:
            freezed == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                    as String?,
        productImage:
            freezed == productImage
                ? _value.productImage
                : productImage // ignore: cast_nullable_to_non_nullable
                    as String?,
        reviwerRating:
            freezed == reviwerRating
                ? _value.reviwerRating
                : reviwerRating // ignore: cast_nullable_to_non_nullable
                    as int?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        detail:
            freezed == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                    as String?,
        images:
            freezed == images
                ? _value._images
                : images // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserReviewResponseImpl implements _UserReviewResponse {
  const _$UserReviewResponseImpl({
    @JsonKey(name: "review_id") this.reviewId,
    @JsonKey(name: "posted_on") this.postedOn,
    @JsonKey(name: "product_id") this.productId,
    @JsonKey(name: "product_url_key") this.productUrlKey,
    @JsonKey(name: "product_name") this.productName,
    @JsonKey(name: "product_image") this.productImage,
    @JsonKey(name: "reviwer_rating") this.reviwerRating,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "detail") this.detail,
    @JsonKey(name: "images") final List<String>? images,
  }) : _images = images;

  factory _$UserReviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserReviewResponseImplFromJson(json);

  @override
  @JsonKey(name: "review_id")
  final int? reviewId;
  @override
  @JsonKey(name: "posted_on")
  final DateTime? postedOn;
  @override
  @JsonKey(name: "product_id")
  final int? productId;
  @override
  @JsonKey(name: "product_url_key")
  final String? productUrlKey;
  @override
  @JsonKey(name: "product_name")
  final String? productName;
  @override
  @JsonKey(name: "product_image")
  final String? productImage;
  @override
  @JsonKey(name: "reviwer_rating")
  final int? reviwerRating;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "detail")
  final String? detail;
  final List<String>? _images;
  @override
  @JsonKey(name: "images")
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserReviewResponse(reviewId: $reviewId, postedOn: $postedOn, productId: $productId, productUrlKey: $productUrlKey, productName: $productName, productImage: $productImage, reviwerRating: $reviwerRating, title: $title, detail: $detail, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserReviewResponseImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.postedOn, postedOn) ||
                other.postedOn == postedOn) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productUrlKey, productUrlKey) ||
                other.productUrlKey == productUrlKey) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.reviwerRating, reviwerRating) ||
                other.reviwerRating == reviwerRating) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    reviewId,
    postedOn,
    productId,
    productUrlKey,
    productName,
    productImage,
    reviwerRating,
    title,
    detail,
    const DeepCollectionEquality().hash(_images),
  );

  /// Create a copy of UserReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserReviewResponseImplCopyWith<_$UserReviewResponseImpl> get copyWith =>
      __$$UserReviewResponseImplCopyWithImpl<_$UserReviewResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserReviewResponseImplToJson(this);
  }
}

abstract class _UserReviewResponse implements UserReviewResponse {
  const factory _UserReviewResponse({
    @JsonKey(name: "review_id") final int? reviewId,
    @JsonKey(name: "posted_on") final DateTime? postedOn,
    @JsonKey(name: "product_id") final int? productId,
    @JsonKey(name: "product_url_key") final String? productUrlKey,
    @JsonKey(name: "product_name") final String? productName,
    @JsonKey(name: "product_image") final String? productImage,
    @JsonKey(name: "reviwer_rating") final int? reviwerRating,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "detail") final String? detail,
    @JsonKey(name: "images") final List<String>? images,
  }) = _$UserReviewResponseImpl;

  factory _UserReviewResponse.fromJson(Map<String, dynamic> json) =
      _$UserReviewResponseImpl.fromJson;

  @override
  @JsonKey(name: "review_id")
  int? get reviewId;
  @override
  @JsonKey(name: "posted_on")
  DateTime? get postedOn;
  @override
  @JsonKey(name: "product_id")
  int? get productId;
  @override
  @JsonKey(name: "product_url_key")
  String? get productUrlKey;
  @override
  @JsonKey(name: "product_name")
  String? get productName;
  @override
  @JsonKey(name: "product_image")
  String? get productImage;
  @override
  @JsonKey(name: "reviwer_rating")
  int? get reviwerRating;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "detail")
  String? get detail;
  @override
  @JsonKey(name: "images")
  List<String>? get images;

  /// Create a copy of UserReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserReviewResponseImplCopyWith<_$UserReviewResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
