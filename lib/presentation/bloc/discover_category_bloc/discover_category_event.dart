part of 'discover_category_bloc.dart';

@freezed
class DiscoverCategoryEvent with _$DiscoverCategoryEvent {
  const factory DiscoverCategoryEvent.getDiscoverCategories() = _GetDiscoverCategories;
  const factory DiscoverCategoryEvent.refresh() = _Refresh;
}
