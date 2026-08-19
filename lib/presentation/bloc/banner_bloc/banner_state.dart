part of 'banner_bloc.dart';

enum BannerStatus { initial, loading, success, error }

@freezed
class BannerState with _$BannerState {
  const factory BannerState({
    @Default(BannerStatus.initial) BannerStatus status,
    AppErrorEntity? error,
    @Default([]) List<BannerEntity> banners,
  }) = _BannerState;
}
