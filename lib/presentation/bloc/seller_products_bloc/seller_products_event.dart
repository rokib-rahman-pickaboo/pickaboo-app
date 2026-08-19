part of 'seller_products_bloc.dart';

@freezed
class SellerProductsEvent with _$SellerProductsEvent {
  const factory SellerProductsEvent.getProducts({required String shopUrl}) =
      _GetProducts;
  const factory SellerProductsEvent.refresh({required String shopUrl}) =
      _Refresh;
}
