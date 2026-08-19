part of 'brand_products_bloc.dart';

@freezed
class BrandProductsState with _$BrandProductsState {
  const BrandProductsState._();

  const factory BrandProductsState({
    @Default('') String brandKey,
    required PagingState<int, ProductEntity> pagingState,
    BrandProductsEntity? brandData,
    Map<String, List<String>>? currentFilters,
    String? currentSort,

    CategoryFacets? cachedFacets,
  }) = _BrandProductsState;

  List<FilterAttributeEntity> get facetAttributes =>
      brandData?.filterableAttributes ??
      cachedFacets?.attributes ??
      const <FilterAttributeEntity>[];

  List<SortOptionEntity> get facetSortOptions =>
      brandData?.sortOptions ??
      cachedFacets?.sortOptions ??
      const <SortOptionEntity>[];

  bool get hasFacets =>
      facetAttributes.isNotEmpty || facetSortOptions.isNotEmpty;
}
