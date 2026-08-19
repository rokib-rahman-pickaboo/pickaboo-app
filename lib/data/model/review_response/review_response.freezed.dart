// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) {
  return _ReviewResponse.fromJson(json);
}

/// @nodoc
mixin _$ReviewResponse {
  @JsonKey(name: "review_id", fromJson: _toStringSafe)
  String? get reviewId => throw _privateConstructorUsedError;
  @JsonKey(name: "posted_on", fromJson: _toDateTimeSafe)
  DateTime? get postedOn => throw _privateConstructorUsedError;
  @JsonKey(name: "reviwer_id", fromJson: _toStringSafe)
  String? get reviwerId => throw _privateConstructorUsedError;
  @JsonKey(name: "reviwer_name", fromJson: _toStringSafe)
  String? get reviwerName => throw _privateConstructorUsedError;
  @JsonKey(name: "reviwer_image", fromJson: _toStringSafe)
  String? get reviwerImage => throw _privateConstructorUsedError;
  @JsonKey(name: "reviwer_rating", fromJson: _toDoubleSafe)
  double? get reviwerRating => throw _privateConstructorUsedError;
  @JsonKey(name: "title", fromJson: _toStringSafe)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "detail", fromJson: _toStringSafe)
  String? get detail => throw _privateConstructorUsedError;
  @JsonKey(name: "is_recommended", fromJson: _toStringSafe)
  String? get isRecommended => throw _privateConstructorUsedError;
  @JsonKey(name: "images", fromJson: _toStringListSafe)
  List<String>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: "like_count", fromJson: _toIntSafe)
  int? get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: "dislikes_count", fromJson: _toIntSafe)
  int? get dislikesCount => throw _privateConstructorUsedError;
  @JsonKey(name: "do_like", fromJson: _toBoolSafe)
  bool? get doLike => throw _privateConstructorUsedError;
  @JsonKey(name: "do_dislike", fromJson: _toBoolSafe)
  bool? get doDislike => throw _privateConstructorUsedError;

  /// Serializes this ReviewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewResponseCopyWith<ReviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewResponseCopyWith<$Res> {
  factory $ReviewResponseCopyWith(
    ReviewResponse value,
    $Res Function(ReviewResponse) then,
  ) = _$ReviewResponseCopyWithImpl<$Res, ReviewResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "review_id", fromJson: _toStringSafe) String? reviewId,
    @JsonKey(name: "posted_on", fromJson: _toDateTimeSafe) DateTime? postedOn,
    @JsonKey(name: "reviwer_id", fromJson: _toStringSafe) String? reviwerId,
    @JsonKey(name: "reviwer_name", fromJson: _toStringSafe) String? reviwerName,
    @JsonKey(name: "reviwer_image", fromJson: _toStringSafe)
    String? reviwerImage,
    @JsonKey(name: "reviwer_rating", fromJson: _toDoubleSafe)
    double? reviwerRating,
    @JsonKey(name: "title", fromJson: _toStringSafe) String? title,
    @JsonKey(name: "detail", fromJson: _toStringSafe) String? detail,
    @JsonKey(name: "is_recommended", fromJson: _toStringSafe)
    String? isRecommended,
    @JsonKey(name: "images", fromJson: _toStringListSafe) List<String>? images,
    @JsonKey(name: "like_count", fromJson: _toIntSafe) int? likeCount,
    @JsonKey(name: "dislikes_count", fromJson: _toIntSafe) int? dislikesCount,
    @JsonKey(name: "do_like", fromJson: _toBoolSafe) bool? doLike,
    @JsonKey(name: "do_dislike", fromJson: _toBoolSafe) bool? doDislike,
  });
}

/// @nodoc
class _$ReviewResponseCopyWithImpl<$Res, $Val extends ReviewResponse>
    implements $ReviewResponseCopyWith<$Res> {
  _$ReviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? postedOn = freezed,
    Object? reviwerId = freezed,
    Object? reviwerName = freezed,
    Object? reviwerImage = freezed,
    Object? reviwerRating = freezed,
    Object? title = freezed,
    Object? detail = freezed,
    Object? isRecommended = freezed,
    Object? images = freezed,
    Object? likeCount = freezed,
    Object? dislikesCount = freezed,
    Object? doLike = freezed,
    Object? doDislike = freezed,
  }) {
    return _then(
      _value.copyWith(
            reviewId:
                freezed == reviewId
                    ? _value.reviewId
                    : reviewId // ignore: cast_nullable_to_non_nullable
                        as String?,
            postedOn:
                freezed == postedOn
                    ? _value.postedOn
                    : postedOn // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            reviwerId:
                freezed == reviwerId
                    ? _value.reviwerId
                    : reviwerId // ignore: cast_nullable_to_non_nullable
                        as String?,
            reviwerName:
                freezed == reviwerName
                    ? _value.reviwerName
                    : reviwerName // ignore: cast_nullable_to_non_nullable
                        as String?,
            reviwerImage:
                freezed == reviwerImage
                    ? _value.reviwerImage
                    : reviwerImage // ignore: cast_nullable_to_non_nullable
                        as String?,
            reviwerRating:
                freezed == reviwerRating
                    ? _value.reviwerRating
                    : reviwerRating // ignore: cast_nullable_to_non_nullable
                        as double?,
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
            isRecommended:
                freezed == isRecommended
                    ? _value.isRecommended
                    : isRecommended // ignore: cast_nullable_to_non_nullable
                        as String?,
            images:
                freezed == images
                    ? _value.images
                    : images // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            likeCount:
                freezed == likeCount
                    ? _value.likeCount
                    : likeCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            dislikesCount:
                freezed == dislikesCount
                    ? _value.dislikesCount
                    : dislikesCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            doLike:
                freezed == doLike
                    ? _value.doLike
                    : doLike // ignore: cast_nullable_to_non_nullable
                        as bool?,
            doDislike:
                freezed == doDislike
                    ? _value.doDislike
                    : doDislike // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewResponseImplCopyWith<$Res>
    implements $ReviewResponseCopyWith<$Res> {
  factory _$$ReviewResponseImplCopyWith(
    _$ReviewResponseImpl value,
    $Res Function(_$ReviewResponseImpl) then,
  ) = __$$ReviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "review_id", fromJson: _toStringSafe) String? reviewId,
    @JsonKey(name: "posted_on", fromJson: _toDateTimeSafe) DateTime? postedOn,
    @JsonKey(name: "reviwer_id", fromJson: _toStringSafe) String? reviwerId,
    @JsonKey(name: "reviwer_name", fromJson: _toStringSafe) String? reviwerName,
    @JsonKey(name: "reviwer_image", fromJson: _toStringSafe)
    String? reviwerImage,
    @JsonKey(name: "reviwer_rating", fromJson: _toDoubleSafe)
    double? reviwerRating,
    @JsonKey(name: "title", fromJson: _toStringSafe) String? title,
    @JsonKey(name: "detail", fromJson: _toStringSafe) String? detail,
    @JsonKey(name: "is_recommended", fromJson: _toStringSafe)
    String? isRecommended,
    @JsonKey(name: "images", fromJson: _toStringListSafe) List<String>? images,
    @JsonKey(name: "like_count", fromJson: _toIntSafe) int? likeCount,
    @JsonKey(name: "dislikes_count", fromJson: _toIntSafe) int? dislikesCount,
    @JsonKey(name: "do_like", fromJson: _toBoolSafe) bool? doLike,
    @JsonKey(name: "do_dislike", fromJson: _toBoolSafe) bool? doDislike,
  });
}

/// @nodoc
class __$$ReviewResponseImplCopyWithImpl<$Res>
    extends _$ReviewResponseCopyWithImpl<$Res, _$ReviewResponseImpl>
    implements _$$ReviewResponseImplCopyWith<$Res> {
  __$$ReviewResponseImplCopyWithImpl(
    _$ReviewResponseImpl _value,
    $Res Function(_$ReviewResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? postedOn = freezed,
    Object? reviwerId = freezed,
    Object? reviwerName = freezed,
    Object? reviwerImage = freezed,
    Object? reviwerRating = freezed,
    Object? title = freezed,
    Object? detail = freezed,
    Object? isRecommended = freezed,
    Object? images = freezed,
    Object? likeCount = freezed,
    Object? dislikesCount = freezed,
    Object? doLike = freezed,
    Object? doDislike = freezed,
  }) {
    return _then(
      _$ReviewResponseImpl(
        reviewId:
            freezed == reviewId
                ? _value.reviewId
                : reviewId // ignore: cast_nullable_to_non_nullable
                    as String?,
        postedOn:
            freezed == postedOn
                ? _value.postedOn
                : postedOn // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        reviwerId:
            freezed == reviwerId
                ? _value.reviwerId
                : reviwerId // ignore: cast_nullable_to_non_nullable
                    as String?,
        reviwerName:
            freezed == reviwerName
                ? _value.reviwerName
                : reviwerName // ignore: cast_nullable_to_non_nullable
                    as String?,
        reviwerImage:
            freezed == reviwerImage
                ? _value.reviwerImage
                : reviwerImage // ignore: cast_nullable_to_non_nullable
                    as String?,
        reviwerRating:
            freezed == reviwerRating
                ? _value.reviwerRating
                : reviwerRating // ignore: cast_nullable_to_non_nullable
                    as double?,
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
        isRecommended:
            freezed == isRecommended
                ? _value.isRecommended
                : isRecommended // ignore: cast_nullable_to_non_nullable
                    as String?,
        images:
            freezed == images
                ? _value._images
                : images // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        likeCount:
            freezed == likeCount
                ? _value.likeCount
                : likeCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        dislikesCount:
            freezed == dislikesCount
                ? _value.dislikesCount
                : dislikesCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        doLike:
            freezed == doLike
                ? _value.doLike
                : doLike // ignore: cast_nullable_to_non_nullable
                    as bool?,
        doDislike:
            freezed == doDislike
                ? _value.doDislike
                : doDislike // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewResponseImpl implements _ReviewResponse {
  const _$ReviewResponseImpl({
    @JsonKey(name: "review_id", fromJson: _toStringSafe) this.reviewId,
    @JsonKey(name: "posted_on", fromJson: _toDateTimeSafe) this.postedOn,
    @JsonKey(name: "reviwer_id", fromJson: _toStringSafe) this.reviwerId,
    @JsonKey(name: "reviwer_name", fromJson: _toStringSafe) this.reviwerName,
    @JsonKey(name: "reviwer_image", fromJson: _toStringSafe) this.reviwerImage,
    @JsonKey(name: "reviwer_rating", fromJson: _toDoubleSafe)
    this.reviwerRating,
    @JsonKey(name: "title", fromJson: _toStringSafe) this.title,
    @JsonKey(name: "detail", fromJson: _toStringSafe) this.detail,
    @JsonKey(name: "is_recommended", fromJson: _toStringSafe)
    this.isRecommended,
    @JsonKey(name: "images", fromJson: _toStringListSafe)
    final List<String>? images,
    @JsonKey(name: "like_count", fromJson: _toIntSafe) this.likeCount,
    @JsonKey(name: "dislikes_count", fromJson: _toIntSafe) this.dislikesCount,
    @JsonKey(name: "do_like", fromJson: _toBoolSafe) this.doLike,
    @JsonKey(name: "do_dislike", fromJson: _toBoolSafe) this.doDislike,
  }) : _images = images;

  factory _$ReviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewResponseImplFromJson(json);

  @override
  @JsonKey(name: "review_id", fromJson: _toStringSafe)
  final String? reviewId;
  @override
  @JsonKey(name: "posted_on", fromJson: _toDateTimeSafe)
  final DateTime? postedOn;
  @override
  @JsonKey(name: "reviwer_id", fromJson: _toStringSafe)
  final String? reviwerId;
  @override
  @JsonKey(name: "reviwer_name", fromJson: _toStringSafe)
  final String? reviwerName;
  @override
  @JsonKey(name: "reviwer_image", fromJson: _toStringSafe)
  final String? reviwerImage;
  @override
  @JsonKey(name: "reviwer_rating", fromJson: _toDoubleSafe)
  final double? reviwerRating;
  @override
  @JsonKey(name: "title", fromJson: _toStringSafe)
  final String? title;
  @override
  @JsonKey(name: "detail", fromJson: _toStringSafe)
  final String? detail;
  @override
  @JsonKey(name: "is_recommended", fromJson: _toStringSafe)
  final String? isRecommended;
  final List<String>? _images;
  @override
  @JsonKey(name: "images", fromJson: _toStringListSafe)
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "like_count", fromJson: _toIntSafe)
  final int? likeCount;
  @override
  @JsonKey(name: "dislikes_count", fromJson: _toIntSafe)
  final int? dislikesCount;
  @override
  @JsonKey(name: "do_like", fromJson: _toBoolSafe)
  final bool? doLike;
  @override
  @JsonKey(name: "do_dislike", fromJson: _toBoolSafe)
  final bool? doDislike;

  @override
  String toString() {
    return 'ReviewResponse(reviewId: $reviewId, postedOn: $postedOn, reviwerId: $reviwerId, reviwerName: $reviwerName, reviwerImage: $reviwerImage, reviwerRating: $reviwerRating, title: $title, detail: $detail, isRecommended: $isRecommended, images: $images, likeCount: $likeCount, dislikesCount: $dislikesCount, doLike: $doLike, doDislike: $doDislike)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewResponseImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.postedOn, postedOn) ||
                other.postedOn == postedOn) &&
            (identical(other.reviwerId, reviwerId) ||
                other.reviwerId == reviwerId) &&
            (identical(other.reviwerName, reviwerName) ||
                other.reviwerName == reviwerName) &&
            (identical(other.reviwerImage, reviwerImage) ||
                other.reviwerImage == reviwerImage) &&
            (identical(other.reviwerRating, reviwerRating) ||
                other.reviwerRating == reviwerRating) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.dislikesCount, dislikesCount) ||
                other.dislikesCount == dislikesCount) &&
            (identical(other.doLike, doLike) || other.doLike == doLike) &&
            (identical(other.doDislike, doDislike) ||
                other.doDislike == doDislike));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    reviewId,
    postedOn,
    reviwerId,
    reviwerName,
    reviwerImage,
    reviwerRating,
    title,
    detail,
    isRecommended,
    const DeepCollectionEquality().hash(_images),
    likeCount,
    dislikesCount,
    doLike,
    doDislike,
  );

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewResponseImplCopyWith<_$ReviewResponseImpl> get copyWith =>
      __$$ReviewResponseImplCopyWithImpl<_$ReviewResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewResponseImplToJson(this);
  }
}

abstract class _ReviewResponse implements ReviewResponse {
  const factory _ReviewResponse({
    @JsonKey(name: "review_id", fromJson: _toStringSafe) final String? reviewId,
    @JsonKey(name: "posted_on", fromJson: _toDateTimeSafe)
    final DateTime? postedOn,
    @JsonKey(name: "reviwer_id", fromJson: _toStringSafe)
    final String? reviwerId,
    @JsonKey(name: "reviwer_name", fromJson: _toStringSafe)
    final String? reviwerName,
    @JsonKey(name: "reviwer_image", fromJson: _toStringSafe)
    final String? reviwerImage,
    @JsonKey(name: "reviwer_rating", fromJson: _toDoubleSafe)
    final double? reviwerRating,
    @JsonKey(name: "title", fromJson: _toStringSafe) final String? title,
    @JsonKey(name: "detail", fromJson: _toStringSafe) final String? detail,
    @JsonKey(name: "is_recommended", fromJson: _toStringSafe)
    final String? isRecommended,
    @JsonKey(name: "images", fromJson: _toStringListSafe)
    final List<String>? images,
    @JsonKey(name: "like_count", fromJson: _toIntSafe) final int? likeCount,
    @JsonKey(name: "dislikes_count", fromJson: _toIntSafe)
    final int? dislikesCount,
    @JsonKey(name: "do_like", fromJson: _toBoolSafe) final bool? doLike,
    @JsonKey(name: "do_dislike", fromJson: _toBoolSafe) final bool? doDislike,
  }) = _$ReviewResponseImpl;

  factory _ReviewResponse.fromJson(Map<String, dynamic> json) =
      _$ReviewResponseImpl.fromJson;

  @override
  @JsonKey(name: "review_id", fromJson: _toStringSafe)
  String? get reviewId;
  @override
  @JsonKey(name: "posted_on", fromJson: _toDateTimeSafe)
  DateTime? get postedOn;
  @override
  @JsonKey(name: "reviwer_id", fromJson: _toStringSafe)
  String? get reviwerId;
  @override
  @JsonKey(name: "reviwer_name", fromJson: _toStringSafe)
  String? get reviwerName;
  @override
  @JsonKey(name: "reviwer_image", fromJson: _toStringSafe)
  String? get reviwerImage;
  @override
  @JsonKey(name: "reviwer_rating", fromJson: _toDoubleSafe)
  double? get reviwerRating;
  @override
  @JsonKey(name: "title", fromJson: _toStringSafe)
  String? get title;
  @override
  @JsonKey(name: "detail", fromJson: _toStringSafe)
  String? get detail;
  @override
  @JsonKey(name: "is_recommended", fromJson: _toStringSafe)
  String? get isRecommended;
  @override
  @JsonKey(name: "images", fromJson: _toStringListSafe)
  List<String>? get images;
  @override
  @JsonKey(name: "like_count", fromJson: _toIntSafe)
  int? get likeCount;
  @override
  @JsonKey(name: "dislikes_count", fromJson: _toIntSafe)
  int? get dislikesCount;
  @override
  @JsonKey(name: "do_like", fromJson: _toBoolSafe)
  bool? get doLike;
  @override
  @JsonKey(name: "do_dislike", fromJson: _toBoolSafe)
  bool? get doDislike;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewResponseImplCopyWith<_$ReviewResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
