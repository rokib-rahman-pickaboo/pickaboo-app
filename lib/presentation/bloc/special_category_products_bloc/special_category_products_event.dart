part of 'special_category_products_bloc.dart';

@freezed
class SpecialCategoryProductsEvent with _$SpecialCategoryProductsEvent {
  const factory SpecialCategoryProductsEvent.getProducts({required String categorySlug}) =
      _GetProducts;
  const factory SpecialCategoryProductsEvent.refresh({required String categorySlug}) =
      _Refresh;
  const factory SpecialCategoryProductsEvent.applyFilters({
    required String categorySlug,
    required Map<String, List<String>> filters,
  }) = _ApplyFilters;
  const factory SpecialCategoryProductsEvent.applySort({
    required String categorySlug,
    required String sortValue,
  }) = _ApplySort;
}
