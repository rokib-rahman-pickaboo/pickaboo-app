class ReviewEntity {
  final String reviewId;
  final DateTime postedOn;
  final String reviwerId;
  final String reviwerName;
  final String reviwerImage;
  final double reviwerRating;
  final String title;
  final String detail;
  final bool isRecommended;
  final List<String> images;
  final int likeCount;
  final int dislikesCount;
  final bool doLike;
  final bool doDislike;

  const ReviewEntity({
    required this.reviewId,
    required this.postedOn,
    required this.reviwerId,
    required this.reviwerName,
    required this.reviwerImage,
    required this.reviwerRating,
    required this.title,
    required this.detail,
    required this.isRecommended,
    required this.images,
    required this.likeCount,
    required this.dislikesCount,
    required this.doLike,
    required this.doDislike,
  });

  ReviewEntity copyWith({
    String? reviewId,
    DateTime? postedOn,
    String? reviwerId,
    String? reviwerName,
    String? reviwerImage,
    double? reviwerRating,
    String? title,
    String? detail,
    bool? isRecommended,
    List<String>? images,
    int? likeCount,
    int? dislikesCount,
    bool? doLike,
    bool? doDislike,
  }) {
    return ReviewEntity(
      reviewId: reviewId ?? this.reviewId,
      postedOn: postedOn ?? this.postedOn,
      reviwerId: reviwerId ?? this.reviwerId,
      reviwerName: reviwerName ?? this.reviwerName,
      reviwerImage: reviwerImage ?? this.reviwerImage,
      reviwerRating: reviwerRating ?? this.reviwerRating,
      title: title ?? this.title,
      detail: detail ?? this.detail,
      isRecommended: isRecommended ?? this.isRecommended,
      images: images ?? this.images,
      likeCount: likeCount ?? this.likeCount,
      dislikesCount: dislikesCount ?? this.dislikesCount,
      doLike: doLike ?? this.doLike,
      doDislike: doDislike ?? this.doDislike,
    );
  }
}
