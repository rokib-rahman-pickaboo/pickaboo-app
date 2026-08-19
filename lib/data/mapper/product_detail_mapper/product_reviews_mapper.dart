import 'package:pickaboo/data/model/product_reviews_response/product_reviews_response.dart';
import 'package:pickaboo/data/model/review_response/review_response.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart'
    show DetailedRatingEntity;
import 'package:pickaboo/domain/entity/review/product_reviews_entity.dart';
import 'package:pickaboo/domain/entity/review/review_entity.dart';

extension ProductReviewsResponseMapper on ProductReviewsResponse {
  ProductReviewsEntity toEntity() => ProductReviewsEntity(
    totalReviews: totalReviews ?? 0,
    averageRating: averageRating ?? 0,
    rating5Count: rating5Count ?? 0,
    rating4Count: rating4Count ?? 0,
    rating3Count: rating3Count ?? 0,
    rating2Count: rating2Count ?? 0,
    rating1Count: rating1Count ?? 0,
    currentPage: currentPage ?? 1,
    pageSize: pageSize ?? 0,
    totalPages: totalPages ?? 0,
    ratingSummary: ratingSummary ?? 0,
    reviews: reviews?.map((e) => e.toEntity()).toList() ?? const [],
    detailedRatings:
        detailedRatings?.map((e) => e.toEntity()).toList() ?? const [],
    allReviewImages: allReviewImages ?? const [],
  );
}

extension ProductReviewItemResponseMapper on ProductReviewItemResponse {
  ReviewEntity toEntity() => ReviewEntity(
    reviewId: reviewId?.toString() ?? '',
    postedOn: postedOn ?? DateTime.now(),
    reviwerId: '',
    reviwerName: reviewerName ?? '',
    reviwerImage: reviewerImage ?? '',
    reviwerRating: reviewerRating ?? 0,
    title: title ?? '',
    detail: detail ?? '',
    isRecommended: isRecommended == '1' || isRecommended == 'true',
    images: images ?? const [],
    likeCount: 0,
    dislikesCount: 0,
    doLike: false,
    doDislike: false,
  );
}

extension ReviewDetailedRatingResponseMapper on ReviewDetailedRatingResponse {
  DetailedRatingEntity toEntity() =>
      DetailedRatingEntity(rating: rating ?? '', avgValue: avgValue ?? 0);
}

extension ProductReviewsVoteMerge on ProductReviewsEntity {
  ProductReviewsEntity copyWithVotes(Map<String, ReviewResponse> votesById) {
    return ProductReviewsEntity(
      totalReviews: totalReviews,
      averageRating: averageRating,
      rating5Count: rating5Count,
      rating4Count: rating4Count,
      rating3Count: rating3Count,
      rating2Count: rating2Count,
      rating1Count: rating1Count,
      currentPage: currentPage,
      pageSize: pageSize,
      totalPages: totalPages,
      ratingSummary: ratingSummary,
      detailedRatings: detailedRatings,
      allReviewImages: allReviewImages,
      reviews: reviews.map((review) {
        final vote = votesById[review.reviewId];
        if (vote == null) return review;
        return review.copyWith(
          likeCount: vote.likeCount ?? review.likeCount,
          dislikesCount: vote.dislikesCount ?? review.dislikesCount,
          doLike: vote.doLike ?? review.doLike,
          doDislike: vote.doDislike ?? review.doDislike,
        );
      }).toList(),
    );
  }
}
