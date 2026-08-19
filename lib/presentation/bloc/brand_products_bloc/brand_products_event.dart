part of 'brand_products_bloc.dart';

@freezed
class BrandProductsEvent with _$BrandProductsEvent {
  const factory BrandProductsEvent.getProducts({
    required String brandKey,
  }) = _GetProducts;
  const factory BrandProductsEvent.refresh({required String brandKey}) =
      _Refresh;
  const factory BrandProductsEvent.applyFilters({
    required String brandKey,
    required Map<String, List<String>> filters,
  }) = _ApplyFilters;
  const factory BrandProductsEvent.applySort({
    required String brandKey,
    required String sortValue,
  }) = _ApplySort;
}
