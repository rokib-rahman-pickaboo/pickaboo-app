class UserReviewModel {
  final String? productName;
  final String? productImage;
  final double? reviewerRating;
  final String? postedOn;
  final String? detail;
  final List<String>? images;

  UserReviewModel({
    this.productName,
    this.productImage,
    this.reviewerRating,
    this.postedOn,
    this.detail,
    this.images,
  });
}
