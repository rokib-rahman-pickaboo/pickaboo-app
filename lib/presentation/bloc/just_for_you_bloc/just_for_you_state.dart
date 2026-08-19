part of 'just_for_you_bloc.dart';

@freezed
class JustForYouState with _$JustForYouState {
  const factory JustForYouState({
    required PagingState<int, ProductEntity> pagingState,
  }) = _JustForYouState;
}
