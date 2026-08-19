part of 'category_products_bloc.dart';

@freezed
class CategoryProductsEvent with _$CategoryProductsEvent {
  const factory CategoryProductsEvent.getProducts({
    required String categoryKey,
  }) = _GetProducts;
  const factory CategoryProductsEvent.refresh({required String categoryKey}) =
      _Refresh;
  const factory CategoryProductsEvent.applyFilters({
    required String categoryKey,
    required Map<String, List<String>> filters,
  }) = _ApplyFilters;
  const factory CategoryProductsEvent.applySort({
    required String categoryKey,
    required String sortValue,
  }) = _ApplySort;
}
