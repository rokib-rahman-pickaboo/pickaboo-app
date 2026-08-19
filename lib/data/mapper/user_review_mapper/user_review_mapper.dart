import 'package:pickaboo/data/model/user_review_response/user_review_response.dart';
import 'package:pickaboo/domain/entity/user_review/user_review_entity.dart';

extension UserReviewResponseMapper on UserReviewResponse {
  UserReviewEntity toEntity() {
    return UserReviewEntity(
      reviewId: reviewId ?? 0,
      postedOn: postedOn ?? DateTime.now(),
      productId: productId ?? 0,
      productUrlKey: productUrlKey ?? '',
      productName: productName ?? '',
      productImage: productImage ?? '',
      reviwerRating: reviwerRating ?? 0,
      title: title ?? '',
      detail: detail ?? '',
      images: images ?? [],
    );
  }
}
