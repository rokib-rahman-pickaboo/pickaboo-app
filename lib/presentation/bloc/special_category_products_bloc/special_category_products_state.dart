part of 'special_category_products_bloc.dart';

@freezed
class SpecialCategoryProductsState with _$SpecialCategoryProductsState {
  const SpecialCategoryProductsState._();

  const factory SpecialCategoryProductsState({
    required String categorySlug,
    required PagingState<int, ProductEntity> pagingState,
    CategoryProductsEntity? categoryData,
    Map<String, List<String>>? currentFilters,
    String? currentSort,

    CategoryFacets? cachedFacets,
  }) = _SpecialCategoryProductsState;

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
