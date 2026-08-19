part of 'discover_category_bloc.dart';

enum DiscoverCategoryStatus { initial, loading, success, empty, error }

@freezed
class DiscoverCategoryState with _$DiscoverCategoryState {
  const factory DiscoverCategoryState({
    @Default(DiscoverCategoryStatus.initial) DiscoverCategoryStatus status,
    AppErrorEntity? error,
    List<DiscoverCategoryEntity>? discoverCategories,
  }) = _DiscoverCategoryState;
}
