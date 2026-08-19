// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_reviews_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductReviewsResponse _$ProductReviewsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ProductReviewsResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductReviewsResponse {
  @JsonKey(name: "total_reviews")
  int? get totalReviews => throw _privateConstructorUsedError;
  @JsonKey(name: "average_rating")
  double? get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: "rating5_count")
  int? get rating5Count => throw _privateConstructorUsedError;
  @JsonKey(name: "rating4_count")
  int? get rating4Count => throw _privateConstructorUsedError;
  @JsonKey(name: "rating3_count")
  int? get rating3Count => throw _privateConstructorUsedError;
  @JsonKey(name: "rating2_count")
  int? get rating2Count => throw _privateConstructorUsedError;
  @JsonKey(name: "rating1_count")
  int? get rating1Count => throw _privateConstructorUsedError;
  @JsonKey(name: "current_page")
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: "page_size")
  int? get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: "total_pages")
  int? get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: "reviews")
  List<ProductReviewItemResponse>? get reviews =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "rating_summary")
  int? get ratingSummary => throw _privateConstructorUsedError;
  @JsonKey(name: "detailed_ratings")
  List<ReviewDetailedRatingResponse>? get detailedRatings =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "all_review_images")
  List<String>? get allReviewImages => throw _privateConstructorUsedError;

  /// Serializes this ProductReviewsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductReviewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductReviewsResponseCopyWith<ProductReviewsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReviewsResponseCopyWith<$Res> {
  factory $ProductReviewsResponseCopyWith(
    ProductReviewsResponse value,
    $Res Function(ProductReviewsResponse) then,
  ) = _$ProductReviewsResponseCopyWithImpl<$Res, ProductReviewsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "total_reviews") int? totalReviews,
    @JsonKey(name: "average_rating") double? averageRating,
    @JsonKey(name: "rating5_count") int? rating5Count,
    @JsonKey(name: "rating4_count") int? rating4Count,
    @JsonKey(name: "rating3_count") int? rating3Count,
    @JsonKey(name: "rating2_count") int? rating2Count,
    @JsonKey(name: "rating1_count") int? rating1Count,
    @JsonKey(name: "current_page") int? currentPage,
    @JsonKey(name: "page_size") int? pageSize,
    @JsonKey(name: "total_pages") int? totalPages,
    @JsonKey(name: "reviews") List<ProductReviewItemResponse>? reviews,
    @JsonKey(name: "rating_summary") int? ratingSummary,
    @JsonKey(name: "detailed_ratings")
    List<ReviewDetailedRatingResponse>? detailedRatings,
    @JsonKey(name: "all_review_images") List<String>? allReviewImages,
  });
}

/// @nodoc
class _$ProductReviewsResponseCopyWithImpl<
  $Res,
  $Val extends ProductReviewsResponse
>
    implements $ProductReviewsResponseCopyWith<$Res> {
  _$ProductReviewsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductReviewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReviews = freezed,
    Object? averageRating = freezed,
    Object? rating5Count = freezed,
    Object? rating4Count = freezed,
    Object? rating3Count = freezed,
    Object? rating2Count = freezed,
    Object? rating1Count = freezed,
    Object? currentPage = freezed,
    Object? pageSize = freezed,
    Object? totalPages = freezed,
    Object? reviews = freezed,
    Object? ratingSummary = freezed,
    Object? detailedRatings = freezed,
    Object? allReviewImages = freezed,
  }) {
    return _then(
      _value.copyWith(
            totalReviews:
                freezed == totalReviews
                    ? _value.totalReviews
                    : totalReviews // ignore: cast_nullable_to_non_nullable
                        as int?,
            averageRating:
                freezed == averageRating
                    ? _value.averageRating
                    : averageRating // ignore: cast_nullable_to_non_nullable
                        as double?,
            rating5Count:
                freezed == rating5Count
                    ? _value.rating5Count
                    : rating5Count // ignore: cast_nullable_to_non_nullable
                        as int?,
            rating4Count:
                freezed == rating4Count
                    ? _value.rating4Count
                    : rating4Count // ignore: cast_nullable_to_non_nullable
                        as int?,
            rating3Count:
                freezed == rating3Count
                    ? _value.rating3Count
                    : rating3Count // ignore: cast_nullable_to_non_nullable
                        as int?,
            rating2Count:
                freezed == rating2Count
                    ? _value.rating2Count
                    : rating2Count // ignore: cast_nullable_to_non_nullable
                        as int?,
            rating1Count:
                freezed == rating1Count
                    ? _value.rating1Count
                    : rating1Count // ignore: cast_nullable_to_non_nullable
                        as int?,
            currentPage:
                freezed == currentPage
                    ? _value.currentPage
                    : currentPage // ignore: cast_nullable_to_non_nullable
                        as int?,
            pageSize:
                freezed == pageSize
                    ? _value.pageSize
                    : pageSize // ignore: cast_nullable_to_non_nullable
                        as int?,
            totalPages:
                freezed == totalPages
                    ? _value.totalPages
                    : totalPages // ignore: cast_nullable_to_non_nullable
                        as int?,
            reviews:
                freezed == reviews
                    ? _value.reviews
                    : reviews // ignore: cast_nullable_to_non_nullable
                        as List<ProductReviewItemResponse>?,
            ratingSummary:
                freezed == ratingSummary
                    ? _value.ratingSummary
                    : ratingSummary // ignore: cast_nullable_to_non_nullable
                        as int?,
            detailedRatings:
                freezed == detailedRatings
                    ? _value.detailedRatings
                    : detailedRatings // ignore: cast_nullable_to_non_nullable
                        as List<ReviewDetailedRatingResponse>?,
            allReviewImages:
                freezed == allReviewImages
                    ? _value.allReviewImages
                    : allReviewImages // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductReviewsResponseImplCopyWith<$Res>
    implements $ProductReviewsResponseCopyWith<$Res> {
  factory _$$ProductReviewsResponseImplCopyWith(
    _$ProductReviewsResponseImpl value,
    $Res Function(_$ProductReviewsResponseImpl) then,
  ) = __$$ProductReviewsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "total_reviews") int? totalReviews,
    @JsonKey(name: "average_rating") double? averageRating,
    @JsonKey(name: "rating5_count") int? rating5Count,
    @JsonKey(name: "rating4_count") int? rating4Count,
    @JsonKey(name: "rating3_count") int? rating3Count,
    @JsonKey(name: "rating2_count") int? rating2Count,
    @JsonKey(name: "rating1_count") int? rating1Count,
    @JsonKey(name: "current_page") int? currentPage,
    @JsonKey(name: "page_size") int? pageSize,
    @JsonKey(name: "total_pages") int? totalPages,
    @JsonKey(name: "reviews") List<ProductReviewItemResponse>? reviews,
    @JsonKey(name: "rating_summary") int? ratingSummary,
    @JsonKey(name: "detailed_ratings")
    List<ReviewDetailedRatingResponse>? detailedRatings,
    @JsonKey(name: "all_review_images") List<String>? allReviewImages,
  });
}

/// @nodoc
class __$$ProductReviewsResponseImplCopyWithImpl<$Res>
    extends
        _$ProductReviewsResponseCopyWithImpl<$Res, _$ProductReviewsResponseImpl>
    implements _$$ProductReviewsResponseImplCopyWith<$Res> {
  __$$ProductReviewsResponseImplCopyWithImpl(
    _$ProductReviewsResponseImpl _value,
    $Res Function(_$ProductReviewsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductReviewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReviews = freezed,
    Object? averageRating = freezed,
    Object? rating5Count = freezed,
    Object? rating4Count = freezed,
    Object? rating3Count = freezed,
    Object? rating2Count = freezed,
    Object? rating1Count = freezed,
    Object? currentPage = freezed,
    Object? pageSize = freezed,
    Object? totalPages = freezed,
    Object? reviews = freezed,
    Object? ratingSummary = freezed,
    Object? detailedRatings = freezed,
    Object? allReviewImages = freezed,
  }) {
    return _then(
      _$ProductReviewsResponseImpl(
        totalReviews:
            freezed == totalReviews
                ? _value.totalReviews
                : totalReviews // ignore: cast_nullable_to_non_nullable
                    as int?,
        averageRating:
            freezed == averageRating
                ? _value.averageRating
                : averageRating // ignore: cast_nullable_to_non_nullable
                    as double?,
        rating5Count:
            freezed == rating5Count
                ? _value.rating5Count
                : rating5Count // ignore: cast_nullable_to_non_nullable
                    as int?,
        rating4Count:
            freezed == rating4Count
                ? _value.rating4Count
                : rating4Count // ignore: cast_nullable_to_non_nullable
                    as int?,
        rating3Count:
            freezed == rating3Count
                ? _value.rating3Count
                : rating3Count // ignore: cast_nullable_to_non_nullable
                    as int?,
        rating2Count:
            freezed == rating2Count
                ? _value.rating2Count
                : rating2Count // ignore: cast_nullable_to_non_nullable
                    as int?,
        rating1Count:
            freezed == rating1Count
                ? _value.rating1Count
                : rating1Count // ignore: cast_nullable_to_non_nullable
                    as int?,
        currentPage:
            freezed == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                    as int?,
        pageSize:
            freezed == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                    as int?,
        totalPages:
            freezed == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                    as int?,
        reviews:
            freezed == reviews
                ? _value._reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                    as List<ProductReviewItemResponse>?,
        ratingSummary:
            freezed == ratingSummary
                ? _value.ratingSummary
                : ratingSummary // ignore: cast_nullable_to_non_nullable
                    as int?,
        detailedRatings:
            freezed == detailedRatings
                ? _value._detailedRatings
                : detailedRatings // ignore: cast_nullable_to_non_nullable
                    as List<ReviewDetailedRatingResponse>?,
        allReviewImages:
            freezed == allReviewImages
                ? _value._allReviewImages
                : allReviewImages // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReviewsResponseImpl implements _ProductReviewsResponse {
  const _$ProductReviewsResponseImpl({
    @JsonKey(name: "total_reviews") this.totalReviews,
    @JsonKey(name: "average_rating") this.averageRating,
    @JsonKey(name: "rating5_count") this.rating5Count,
    @JsonKey(name: "rating4_count") this.rating4Count,
    @JsonKey(name: "rating3_count") this.rating3Count,
    @JsonKey(name: "rating2_count") this.rating2Count,
    @JsonKey(name: "rating1_count") this.rating1Count,
    @JsonKey(name: "current_page") this.currentPage,
    @JsonKey(name: "page_size") this.pageSize,
    @JsonKey(name: "total_pages") this.totalPages,
    @JsonKey(name: "reviews") final List<ProductReviewItemResponse>? reviews,
    @JsonKey(name: "rating_summary") this.ratingSummary,
    @JsonKey(name: "detailed_ratings")
    final List<ReviewDetailedRatingResponse>? detailedRatings,
    @JsonKey(name: "all_review_images") final List<String>? allReviewImages,
  }) : _reviews = reviews,
       _detailedRatings = detailedRatings,
       _allReviewImages = allReviewImages;

  factory _$ProductReviewsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReviewsResponseImplFromJson(json);

  @override
  @JsonKey(name: "total_reviews")
  final int? totalReviews;
  @override
  @JsonKey(name: "average_rating")
  final double? averageRating;
  @override
  @JsonKey(name: "rating5_count")
  final int? rating5Count;
  @override
  @JsonKey(name: "rating4_count")
  final int? rating4Count;
  @override
  @JsonKey(name: "rating3_count")
  final int? rating3Count;
  @override
  @JsonKey(name: "rating2_count")
  final int? rating2Count;
  @override
  @JsonKey(name: "rating1_count")
  final int? rating1Count;
  @override
  @JsonKey(name: "current_page")
  final int? currentPage;
  @override
  @JsonKey(name: "page_size")
  final int? pageSize;
  @override
  @JsonKey(name: "total_pages")
  final int? totalPages;
  final List<ProductReviewItemResponse>? _reviews;
  @override
  @JsonKey(name: "reviews")
  List<ProductReviewItemResponse>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "rating_summary")
  final int? ratingSummary;
  final List<ReviewDetailedRatingResponse>? _detailedRatings;
  @override
  @JsonKey(name: "detailed_ratings")
  List<ReviewDetailedRatingResponse>? get detailedRatings {
    final value = _detailedRatings;
    if (value == null) return null;
    if (_detailedRatings is EqualUnmodifiableListView) return _detailedRatings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _allReviewImages;
  @override
  @JsonKey(name: "all_review_images")
  List<String>? get allReviewImages {
    final value = _allReviewImages;
    if (value == null) return null;
    if (_allReviewImages is EqualUnmodifiableListView) return _allReviewImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductReviewsResponse(totalReviews: $totalReviews, averageRating: $averageRating, rating5Count: $rating5Count, rating4Count: $rating4Count, rating3Count: $rating3Count, rating2Count: $rating2Count, rating1Count: $rating1Count, currentPage: $currentPage, pageSize: $pageSize, totalPages: $totalPages, reviews: $reviews, ratingSummary: $ratingSummary, detailedRatings: $detailedRatings, allReviewImages: $allReviewImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReviewsResponseImpl &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.rating5Count, rating5Count) ||
                other.rating5Count == rating5Count) &&
            (identical(other.rating4Count, rating4Count) ||
                other.rating4Count == rating4Count) &&
            (identical(other.rating3Count, rating3Count) ||
                other.rating3Count == rating3Count) &&
            (identical(other.rating2Count, rating2Count) ||
                other.rating2Count == rating2Count) &&
            (identical(other.rating1Count, rating1Count) ||
                other.rating1Count == rating1Count) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.ratingSummary, ratingSummary) ||
                other.ratingSummary == ratingSummary) &&
            const DeepCollectionEquality().equals(
              other._detailedRatings,
              _detailedRatings,
            ) &&
            const DeepCollectionEquality().equals(
              other._allReviewImages,
              _allReviewImages,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalReviews,
    averageRating,
    rating5Count,
    rating4Count,
    rating3Count,
    rating2Count,
    rating1Count,
    currentPage,
    pageSize,
    totalPages,
    const DeepCollectionEquality().hash(_reviews),
    ratingSummary,
    const DeepCollectionEquality().hash(_detailedRatings),
    const DeepCollectionEquality().hash(_allReviewImages),
  );

  /// Create a copy of ProductReviewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReviewsResponseImplCopyWith<_$ProductReviewsResponseImpl>
  get copyWith =>
      __$$ProductReviewsResponseImplCopyWithImpl<_$ProductReviewsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReviewsResponseImplToJson(this);
  }
}

abstract class _ProductReviewsResponse implements ProductReviewsResponse {
  const factory _ProductReviewsResponse({
    @JsonKey(name: "total_reviews") final int? totalReviews,
    @JsonKey(name: "average_rating") final double? averageRating,
    @JsonKey(name: "rating5_count") final int? rating5Count,
    @JsonKey(name: "rating4_count") final int? rating4Count,
    @JsonKey(name: "rating3_count") final int? rating3Count,
    @JsonKey(name: "rating2_count") final int? rating2Count,
    @JsonKey(name: "rating1_count") final int? rating1Count,
    @JsonKey(name: "current_page") final int? currentPage,
    @JsonKey(name: "page_size") final int? pageSize,
    @JsonKey(name: "total_pages") final int? totalPages,
    @JsonKey(name: "reviews") final List<ProductReviewItemResponse>? reviews,
    @JsonKey(name: "rating_summary") final int? ratingSummary,
    @JsonKey(name: "detailed_ratings")
    final List<ReviewDetailedRatingResponse>? detailedRatings,
    @JsonKey(name: "all_review_images") final List<String>? allReviewImages,
  }) = _$ProductReviewsResponseImpl;

  factory _ProductReviewsResponse.fromJson(Map<String, dynamic> json) =
      _$ProductReviewsResponseImpl.fromJson;

  @override
  @JsonKey(name: "total_reviews")
  int? get totalReviews;
  @override
  @JsonKey(name: "average_rating")
  double? get averageRating;
  @override
  @JsonKey(name: "rating5_count")
  int? get rating5Count;
  @override
  @JsonKey(name: "rating4_count")
  int? get rating4Count;
  @override
  @JsonKey(name: "rating3_count")
  int? get rating3Count;
  @override
  @JsonKey(name: "rating2_count")
  int? get rating2Count;
  @override
  @JsonKey(name: "rating1_count")
  int? get rating1Count;
  @override
  @JsonKey(name: "current_page")
  int? get currentPage;
  @override
  @JsonKey(name: "page_size")
  int? get pageSize;
  @override
  @JsonKey(name: "total_pages")
  int? get totalPages;
  @override
  @JsonKey(name: "reviews")
  List<ProductReviewItemResponse>? get reviews;
  @override
  @JsonKey(name: "rating_summary")
  int? get ratingSummary;
  @override
  @JsonKey(name: "detailed_ratings")
  List<ReviewDetailedRatingResponse>? get detailedRatings;
  @override
  @JsonKey(name: "all_review_images")
  List<String>? get allReviewImages;

  /// Create a copy of ProductReviewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductReviewsResponseImplCopyWith<_$ProductReviewsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ProductReviewItemResponse _$ProductReviewItemResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ProductReviewItemResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductReviewItemResponse {
  @JsonKey(name: "review_id")
  int? get reviewId => throw _privateConstructorUsedError;
  @JsonKey(name: "posted_on")
  DateTime? get postedOn => throw _privateConstructorUsedError;
  @JsonKey(name: "reviewer_name")
  String? get reviewerName => throw _privateConstructorUsedError;
  @JsonKey(name: "reviewer_image")
  String? get reviewerImage => throw _privateConstructorUsedError;
  @JsonKey(name: "reviewer_rating")
  double? get reviewerRating => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "detail")
  String? get detail => throw _privateConstructorUsedError;
  @JsonKey(name: "is_recommended")
  String? get isRecommended => throw _privateConstructorUsedError;
  @JsonKey(name: "images")
  List<String>? get images => throw _privateConstructorUsedError;

  /// Serializes this ProductReviewItemResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductReviewItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductReviewItemResponseCopyWith<ProductReviewItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReviewItemResponseCopyWith<$Res> {
  factory $ProductReviewItemResponseCopyWith(
    ProductReviewItemResponse value,
    $Res Function(ProductReviewItemResponse) then,
  ) = _$ProductReviewItemResponseCopyWithImpl<$Res, ProductReviewItemResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "review_id") int? reviewId,
    @JsonKey(name: "posted_on") DateTime? postedOn,
    @JsonKey(name: "reviewer_name") String? reviewerName,
    @JsonKey(name: "reviewer_image") String? reviewerImage,
    @JsonKey(name: "reviewer_rating") double? reviewerRating,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "detail") String? detail,
    @JsonKey(name: "is_recommended") String? isRecommended,
    @JsonKey(name: "images") List<String>? images,
  });
}

/// @nodoc
class _$ProductReviewItemResponseCopyWithImpl<
  $Res,
  $Val extends ProductReviewItemResponse
>
    implements $ProductReviewItemResponseCopyWith<$Res> {
  _$ProductReviewItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductReviewItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? postedOn = freezed,
    Object? reviewerName = freezed,
    Object? reviewerImage = freezed,
    Object? reviewerRating = freezed,
    Object? title = freezed,
    Object? detail = freezed,
    Object? isRecommended = freezed,
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
            reviewerName:
                freezed == reviewerName
                    ? _value.reviewerName
                    : reviewerName // ignore: cast_nullable_to_non_nullable
                        as String?,
            reviewerImage:
                freezed == reviewerImage
                    ? _value.reviewerImage
                    : reviewerImage // ignore: cast_nullable_to_non_nullable
                        as String?,
            reviewerRating:
                freezed == reviewerRating
                    ? _value.reviewerRating
                    : reviewerRating // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductReviewItemResponseImplCopyWith<$Res>
    implements $ProductReviewItemResponseCopyWith<$Res> {
  factory _$$ProductReviewItemResponseImplCopyWith(
    _$ProductReviewItemResponseImpl value,
    $Res Function(_$ProductReviewItemResponseImpl) then,
  ) = __$$ProductReviewItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "review_id") int? reviewId,
    @JsonKey(name: "posted_on") DateTime? postedOn,
    @JsonKey(name: "reviewer_name") String? reviewerName,
    @JsonKey(name: "reviewer_image") String? reviewerImage,
    @JsonKey(name: "reviewer_rating") double? reviewerRating,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "detail") String? detail,
    @JsonKey(name: "is_recommended") String? isRecommended,
    @JsonKey(name: "images") List<String>? images,
  });
}

/// @nodoc
class __$$ProductReviewItemResponseImplCopyWithImpl<$Res>
    extends
        _$ProductReviewItemResponseCopyWithImpl<
          $Res,
          _$ProductReviewItemResponseImpl
        >
    implements _$$ProductReviewItemResponseImplCopyWith<$Res> {
  __$$ProductReviewItemResponseImplCopyWithImpl(
    _$ProductReviewItemResponseImpl _value,
    $Res Function(_$ProductReviewItemResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductReviewItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = freezed,
    Object? postedOn = freezed,
    Object? reviewerName = freezed,
    Object? reviewerImage = freezed,
    Object? reviewerRating = freezed,
    Object? title = freezed,
    Object? detail = freezed,
    Object? isRecommended = freezed,
    Object? images = freezed,
  }) {
    return _then(
      _$ProductReviewItemResponseImpl(
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
        reviewerName:
            freezed == reviewerName
                ? _value.reviewerName
                : reviewerName // ignore: cast_nullable_to_non_nullable
                    as String?,
        reviewerImage:
            freezed == reviewerImage
                ? _value.reviewerImage
                : reviewerImage // ignore: cast_nullable_to_non_nullable
                    as String?,
        reviewerRating:
            freezed == reviewerRating
                ? _value.reviewerRating
                : reviewerRating // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReviewItemResponseImpl implements _ProductReviewItemResponse {
  const _$ProductReviewItemResponseImpl({
    @JsonKey(name: "review_id") this.reviewId,
    @JsonKey(name: "posted_on") this.postedOn,
    @JsonKey(name: "reviewer_name") this.reviewerName,
    @JsonKey(name: "reviewer_image") this.reviewerImage,
    @JsonKey(name: "reviewer_rating") this.reviewerRating,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "detail") this.detail,
    @JsonKey(name: "is_recommended") this.isRecommended,
    @JsonKey(name: "images") final List<String>? images,
  }) : _images = images;

  factory _$ProductReviewItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReviewItemResponseImplFromJson(json);

  @override
  @JsonKey(name: "review_id")
  final int? reviewId;
  @override
  @JsonKey(name: "posted_on")
  final DateTime? postedOn;
  @override
  @JsonKey(name: "reviewer_name")
  final String? reviewerName;
  @override
  @JsonKey(name: "reviewer_image")
  final String? reviewerImage;
  @override
  @JsonKey(name: "reviewer_rating")
  final double? reviewerRating;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "detail")
  final String? detail;
  @override
  @JsonKey(name: "is_recommended")
  final String? isRecommended;
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
    return 'ProductReviewItemResponse(reviewId: $reviewId, postedOn: $postedOn, reviewerName: $reviewerName, reviewerImage: $reviewerImage, reviewerRating: $reviewerRating, title: $title, detail: $detail, isRecommended: $isRecommended, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReviewItemResponseImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.postedOn, postedOn) ||
                other.postedOn == postedOn) &&
            (identical(other.reviewerName, reviewerName) ||
                other.reviewerName == reviewerName) &&
            (identical(other.reviewerImage, reviewerImage) ||
                other.reviewerImage == reviewerImage) &&
            (identical(other.reviewerRating, reviewerRating) ||
                other.reviewerRating == reviewerRating) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    reviewId,
    postedOn,
    reviewerName,
    reviewerImage,
    reviewerRating,
    title,
    detail,
    isRecommended,
    const DeepCollectionEquality().hash(_images),
  );

  /// Create a copy of ProductReviewItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReviewItemResponseImplCopyWith<_$ProductReviewItemResponseImpl>
  get copyWith => __$$ProductReviewItemResponseImplCopyWithImpl<
    _$ProductReviewItemResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReviewItemResponseImplToJson(this);
  }
}

abstract class _ProductReviewItemResponse implements ProductReviewItemResponse {
  const factory _ProductReviewItemResponse({
    @JsonKey(name: "review_id") final int? reviewId,
    @JsonKey(name: "posted_on") final DateTime? postedOn,
    @JsonKey(name: "reviewer_name") final String? reviewerName,
    @JsonKey(name: "reviewer_image") final String? reviewerImage,
    @JsonKey(name: "reviewer_rating") final double? reviewerRating,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "detail") final String? detail,
    @JsonKey(name: "is_recommended") final String? isRecommended,
    @JsonKey(name: "images") final List<String>? images,
  }) = _$ProductReviewItemResponseImpl;

  factory _ProductReviewItemResponse.fromJson(Map<String, dynamic> json) =
      _$ProductReviewItemResponseImpl.fromJson;

  @override
  @JsonKey(name: "review_id")
  int? get reviewId;
  @override
  @JsonKey(name: "posted_on")
  DateTime? get postedOn;
  @override
  @JsonKey(name: "reviewer_name")
  String? get reviewerName;
  @override
  @JsonKey(name: "reviewer_image")
  String? get reviewerImage;
  @override
  @JsonKey(name: "reviewer_rating")
  double? get reviewerRating;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "detail")
  String? get detail;
  @override
  @JsonKey(name: "is_recommended")
  String? get isRecommended;
  @override
  @JsonKey(name: "images")
  List<String>? get images;

  /// Create a copy of ProductReviewItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductReviewItemResponseImplCopyWith<_$ProductReviewItemResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ReviewDetailedRatingResponse _$ReviewDetailedRatingResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ReviewDetailedRatingResponse.fromJson(json);
}

/// @nodoc
mixin _$ReviewDetailedRatingResponse {
  @JsonKey(name: "rating")
  String? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "avg_value")
  double? get avgValue => throw _privateConstructorUsedError;

  /// Serializes this ReviewDetailedRatingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewDetailedRatingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewDetailedRatingResponseCopyWith<ReviewDetailedRatingResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewDetailedRatingResponseCopyWith<$Res> {
  factory $ReviewDetailedRatingResponseCopyWith(
    ReviewDetailedRatingResponse value,
    $Res Function(ReviewDetailedRatingResponse) then,
  ) =
      _$ReviewDetailedRatingResponseCopyWithImpl<
        $Res,
        ReviewDetailedRatingResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: "rating") String? rating,
    @JsonKey(name: "avg_value") double? avgValue,
  });
}

/// @nodoc
class _$ReviewDetailedRatingResponseCopyWithImpl<
  $Res,
  $Val extends ReviewDetailedRatingResponse
>
    implements $ReviewDetailedRatingResponseCopyWith<$Res> {
  _$ReviewDetailedRatingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewDetailedRatingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rating = freezed, Object? avgValue = freezed}) {
    return _then(
      _value.copyWith(
            rating:
                freezed == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as String?,
            avgValue:
                freezed == avgValue
                    ? _value.avgValue
                    : avgValue // ignore: cast_nullable_to_non_nullable
                        as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewDetailedRatingResponseImplCopyWith<$Res>
    implements $ReviewDetailedRatingResponseCopyWith<$Res> {
  factory _$$ReviewDetailedRatingResponseImplCopyWith(
    _$ReviewDetailedRatingResponseImpl value,
    $Res Function(_$ReviewDetailedRatingResponseImpl) then,
  ) = __$$ReviewDetailedRatingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "rating") String? rating,
    @JsonKey(name: "avg_value") double? avgValue,
  });
}

/// @nodoc
class __$$ReviewDetailedRatingResponseImplCopyWithImpl<$Res>
    extends
        _$ReviewDetailedRatingResponseCopyWithImpl<
          $Res,
          _$ReviewDetailedRatingResponseImpl
        >
    implements _$$ReviewDetailedRatingResponseImplCopyWith<$Res> {
  __$$ReviewDetailedRatingResponseImplCopyWithImpl(
    _$ReviewDetailedRatingResponseImpl _value,
    $Res Function(_$ReviewDetailedRatingResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewDetailedRatingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rating = freezed, Object? avgValue = freezed}) {
    return _then(
      _$ReviewDetailedRatingResponseImpl(
        rating:
            freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as String?,
        avgValue:
            freezed == avgValue
                ? _value.avgValue
                : avgValue // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewDetailedRatingResponseImpl
    implements _ReviewDetailedRatingResponse {
  const _$ReviewDetailedRatingResponseImpl({
    @JsonKey(name: "rating") this.rating,
    @JsonKey(name: "avg_value") this.avgValue,
  });

  factory _$ReviewDetailedRatingResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ReviewDetailedRatingResponseImplFromJson(json);

  @override
  @JsonKey(name: "rating")
  final String? rating;
  @override
  @JsonKey(name: "avg_value")
  final double? avgValue;

  @override
  String toString() {
    return 'ReviewDetailedRatingResponse(rating: $rating, avgValue: $avgValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewDetailedRatingResponseImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.avgValue, avgValue) ||
                other.avgValue == avgValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rating, avgValue);

  /// Create a copy of ReviewDetailedRatingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewDetailedRatingResponseImplCopyWith<
    _$ReviewDetailedRatingResponseImpl
  >
  get copyWith => __$$ReviewDetailedRatingResponseImplCopyWithImpl<
    _$ReviewDetailedRatingResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewDetailedRatingResponseImplToJson(this);
  }
}

abstract class _ReviewDetailedRatingResponse
    implements ReviewDetailedRatingResponse {
  const factory _ReviewDetailedRatingResponse({
    @JsonKey(name: "rating") final String? rating,
    @JsonKey(name: "avg_value") final double? avgValue,
  }) = _$ReviewDetailedRatingResponseImpl;

  factory _ReviewDetailedRatingResponse.fromJson(Map<String, dynamic> json) =
      _$ReviewDetailedRatingResponseImpl.fromJson;

  @override
  @JsonKey(name: "rating")
  String? get rating;
  @override
  @JsonKey(name: "avg_value")
  double? get avgValue;

  /// Create a copy of ReviewDetailedRatingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewDetailedRatingResponseImplCopyWith<
    _$ReviewDetailedRatingResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
