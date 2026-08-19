part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchSubmitted({
    required String query,
    String? categoryId,
  }) = _SearchSubmitted;

  const factory SearchEvent.searchQueryChanged({required String query}) =
      _SearchQueryChanged;

  const factory SearchEvent.searchLoadMore() = _SearchLoadMore;

  const factory SearchEvent.searchFilterApplied({
    required Map<String, String> filters,
  }) = _SearchFilterApplied;

  const factory SearchEvent.searchSortApplied({
    required String sortBy,
    required String sortOrder,
  }) = _SearchSortApplied;

  const factory SearchEvent.searchCleared() = _SearchCleared;

  const factory SearchEvent.searchRefresh() = _SearchRefresh;
}
