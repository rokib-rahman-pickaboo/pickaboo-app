part of 'category_banner_bloc.dart';

enum CategoryBannerStatus { initial, loading, loaded, error }

@freezed
class CategoryBannerState with _$CategoryBannerState {
  const factory CategoryBannerState({
    @Default(CategoryBannerStatus.initial) CategoryBannerStatus status,
    @Default(<CategoryBannerEntity>[]) List<CategoryBannerEntity> banners,
    AppErrorEntity? error,
  }) = _CategoryBannerState;
}
