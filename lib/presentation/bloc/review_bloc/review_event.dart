part of 'review_bloc.dart';

@freezed
class ReviewEvent with _$ReviewEvent {
  const factory ReviewEvent.load({required String productId}) = _Load;

  const factory ReviewEvent.refresh({required String productId}) = _Refresh;

  const factory ReviewEvent.voteHelpful({
    required String productId,
    required String reviewId,
  }) = _VoteHelpful;

  const factory ReviewEvent.voteNotHelpful({
    required String productId,
    required String reviewId,
  }) = _VoteNotHelpful;

  const factory ReviewEvent.getUserReviews() = _GetUserReviews;
}
