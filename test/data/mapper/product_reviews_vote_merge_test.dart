import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/data/mapper/product_detail_mapper/product_reviews_mapper.dart';
import 'package:pickaboo/data/model/product_reviews_response/product_reviews_response.dart';
import 'package:pickaboo/data/model/review_response/review_response.dart';
import 'package:pickaboo/domain/entity/review/product_reviews_entity.dart';

/// One page of reviews as the paginated endpoint returns it — note it carries
/// no vote fields at all, which is the reason the merge exists.
ProductReviewsEntity _reviewsPage() => const ProductReviewsResponse(
  totalReviews: 2,
  averageRating: 4.5,
  rating5Count: 1,
  rating4Count: 1,
  currentPage: 1,
  pageSize: 10,
  totalPages: 1,
  ratingSummary: 90,
  reviews: [
    ProductReviewItemResponse(
      reviewId: 57,
      reviewerName: 'Niaj',
      reviewerRating: 4.7,
      title: 'Great',
      detail: 'Good headphones',
    ),
    ProductReviewItemResponse(
      reviewId: 56,
      reviewerName: 'Tarun',
      reviewerRating: 4.3,
      title: 'Fine',
      detail: 'Works well',
    ),
  ],
).toEntity();

void main() {
  group('copyWithVotes', () {
    test('merges counts and this-user flags onto the matching review', () {
      final merged = _reviewsPage().copyWithVotes(const {
        '57': ReviewResponse(
          reviewId: '57',
          likeCount: 12,
          dislikesCount: 3,
          doLike: true,
          doDislike: false,
        ),
      });

      final voted = merged.reviews.firstWhere((r) => r.reviewId == '57');
      expect(voted.likeCount, 12);
      expect(voted.dislikesCount, 3);
      expect(voted.doLike, isTrue);
      expect(voted.doDislike, isFalse);
    });

    test('leaves reviews without a vote row at zero', () {
      final merged = _reviewsPage().copyWithVotes(const {
        '57': ReviewResponse(reviewId: '57', likeCount: 12),
      });

      final untouched = merged.reviews.firstWhere((r) => r.reviewId == '56');
      expect(untouched.likeCount, 0);
      expect(untouched.dislikesCount, 0);
      expect(untouched.doLike, isFalse);
      expect(untouched.doDislike, isFalse);
    });

    test('keeps the summary fields intact', () {
      final merged = _reviewsPage().copyWithVotes(const {
        '57': ReviewResponse(reviewId: '57', likeCount: 12),
      });

      expect(merged.totalReviews, 2);
      expect(merged.averageRating, 4.5);
      expect(merged.rating5Count, 1);
      expect(merged.totalPages, 1);
      expect(merged.ratingSummary, 90);
      expect(merged.reviews.length, 2);
    });

    test('a null field in the vote row does not clobber the review', () {
      final merged = _reviewsPage().copyWithVotes(const {
        '57': ReviewResponse(reviewId: '57'),
      });

      final review = merged.reviews.firstWhere((r) => r.reviewId == '57');
      expect(review.likeCount, 0);
      expect(review.doLike, isFalse);
    });
  });
}
