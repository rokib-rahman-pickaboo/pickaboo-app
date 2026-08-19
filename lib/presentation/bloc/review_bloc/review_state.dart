part of 'review_bloc.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState({
    required PagingState<int, ReviewEntity> pagingState,

    ProductReviewsEntity? summary,

    String? votingReviewId,
    AppErrorEntity? voteError,

    @Default(false) bool isUserReviewsLoading,
    List<UserReviewEntity>? userReviews,
    AppErrorEntity? userReviewsError,
  }) = _ReviewState;
}

extension ReviewStateX on ReviewState {
  List<ReviewEntity> get reviews =>
      pagingState.pages?.expand((page) => page).toList() ?? const [];

  bool get isFirstPageLoading =>
      (pagingState.pages?.isEmpty ?? true) && pagingState.isLoading;

  AppErrorEntity? get error => pagingState.error is AppErrorEntity
      ? pagingState.error as AppErrorEntity
      : null;
}
