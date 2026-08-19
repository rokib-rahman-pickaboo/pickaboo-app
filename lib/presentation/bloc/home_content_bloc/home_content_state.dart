part of 'home_content_bloc.dart';

enum HomeContentStatus { initial, loading, success, error }

@freezed
class HomeContentState with _$HomeContentState {
  const factory HomeContentState({
    @Default(HomeContentStatus.initial) HomeContentStatus status,
    AppErrorEntity? error,
    HomeContentEntity? homeFeed,
  }) = _HomeContentState;
}
