part of 'home_banner_bloc.dart';

enum HomeBannerStatus { initial, loading, loaded, error }

@freezed
class HomeBannerState with _$HomeBannerState {
  const factory HomeBannerState({
    @Default(HomeBannerStatus.initial) HomeBannerStatus status,
    @Default(<HomeBannerEntity>[]) List<HomeBannerEntity> banners,
    AppErrorEntity? error,
  }) = _HomeBannerState;
}
