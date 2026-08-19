part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required PagingState<int, ProductEntity> pagingState,
    String? correctedQuery,
    @Default([]) List<SearchFacetEntity> facets,
    @Default([]) List<String> suggestions,

    @Default([]) List<SearchCategoryEntity> categories,
  }) = _SearchState;
}
