class UserReviewEntity {
  final int reviewId;
  final DateTime postedOn;
  final int productId;
  final String productUrlKey;
  final String productName;
  final String productImage;
  final int reviwerRating;
  final String title;
  final String detail;
  final List<String> images;

  const UserReviewEntity({
    required this.reviewId,
    required this.postedOn,
    required this.productId,
    required this.productUrlKey,
    required this.productName,
    required this.productImage,
    required this.reviwerRating,
    required this.title,
    required this.detail,
    required this.images,
  });
}
