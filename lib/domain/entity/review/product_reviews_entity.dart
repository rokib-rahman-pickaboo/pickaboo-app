import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart'
    show DetailedRatingEntity;
import 'package:pickaboo/domain/entity/review/review_entity.dart';

class ProductReviewsEntity {
  final int totalReviews;
  final double averageRating;
  final int rating5Count;
  final int rating4Count;
  final int rating3Count;
  final int rating2Count;
  final int rating1Count;
  final int currentPage;
  final int pageSize;
  final int totalPages;
  final int ratingSummary;
  final List<ReviewEntity> reviews;
  final List<DetailedRatingEntity> detailedRatings;
  final List<String> allReviewImages;

  const ProductReviewsEntity({
    required this.totalReviews,
    required this.averageRating,
    required this.rating5Count,
    required this.rating4Count,
    required this.rating3Count,
    required this.rating2Count,
    required this.rating1Count,
    required this.currentPage,
    required this.pageSize,
    required this.totalPages,
    required this.ratingSummary,
    required this.reviews,
    required this.detailedRatings,
    required this.allReviewImages,
  });

  int ratingCount(int star) => switch (star) {
    5 => rating5Count,
    4 => rating4Count,
    3 => rating3Count,
    2 => rating2Count,
    1 => rating1Count,
    _ => 0,
  };

  bool get hasNextPage => currentPage < totalPages;
}
