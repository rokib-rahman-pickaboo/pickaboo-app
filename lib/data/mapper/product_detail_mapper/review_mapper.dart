import 'package:pickaboo/data/model/review_response/review_response.dart';
import 'package:pickaboo/domain/entity/review/review_entity.dart';

extension ReviewResponseMapper on ReviewResponse {
  ReviewEntity toEntity() {
    return ReviewEntity(
      reviewId: reviewId ?? '',
      postedOn: postedOn ?? DateTime.now(),
      reviwerId: reviwerId ?? '',
      reviwerName: reviwerName ?? '',
      reviwerImage: reviwerImage ?? '',
      reviwerRating: reviwerRating ?? 0.0,
      title: title ?? '',
      detail: detail ?? '',
      isRecommended: isRecommended == '1' || isRecommended == 'true',
      images: images ?? [],
      likeCount: likeCount ?? 0,
      dislikesCount: dislikesCount ?? 0,
      doLike: doLike ?? false,
      doDislike: doDislike ?? false,
    );
  }
}
