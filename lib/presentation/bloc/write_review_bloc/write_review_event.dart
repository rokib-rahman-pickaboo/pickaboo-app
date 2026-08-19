part of 'write_review_bloc.dart';

@freezed
class WriteReviewEvent with _$WriteReviewEvent {
  const factory WriteReviewEvent.updateRating(String dimension, int rating) =
      _UpdateRating;
  const factory WriteReviewEvent.updateReviewText(String text) =
      _UpdateReviewText;
  const factory WriteReviewEvent.addImage(String path) = _AddImage;
  const factory WriteReviewEvent.removeImage(int index) = _RemoveImage;
  const factory WriteReviewEvent.updateImages(List<String> images) =
      _UpdateImages;
  const factory WriteReviewEvent.submitReview(String productId) = _SubmitReview;
}
