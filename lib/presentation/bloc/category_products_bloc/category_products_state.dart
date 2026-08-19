part of 'category_products_bloc.dart';

@freezed
class CategoryProductsState with _$CategoryProductsState {
  const CategoryProductsState._();

  const factory CategoryProductsState({
    @Default('') String categoryKey,
    required PagingState<int, ProductEntity> pagingState,
    CategoryProductsEntity? categoryData,
    Map<String, List<String>>? currentFilters,
    String? currentSort,

    CategoryFacets? cachedFacets,
  }) = _CategoryProductsState;

  List<FilterAttributeEntity> get facetAttributes =>
      categoryData?.filterableAttributes ??
      cachedFacets?.attributes ??
      const <FilterAttributeEntity>[];

  List<SortOptionEntity> get facetSortOptions =>
      categoryData?.sortOptions ??
      cachedFacets?.sortOptions ??
      const <SortOptionEntity>[];

  bool get hasFacets =>
      facetAttributes.isNotEmpty || facetSortOptions.isNotEmpty;
}
