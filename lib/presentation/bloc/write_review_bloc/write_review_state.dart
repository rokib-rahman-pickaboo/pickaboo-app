part of 'write_review_bloc.dart';

@freezed
class WriteReviewState with _$WriteReviewState {
  const factory WriteReviewState.initial({
    @Default(5) int priceRating,
    @Default(5) int valueRating,
    @Default(5) int qualityRating,
    @Default(5) int serviceRating,
    @Default('') String reviewText,
    @Default([]) List<String> images,
  }) = _Initial;

  const factory WriteReviewState.loading() = _Loading;
  const factory WriteReviewState.success() = _Success;
  const factory WriteReviewState.error(String message) = _Error;
}
