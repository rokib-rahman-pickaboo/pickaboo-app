part of 'seller_products_bloc.dart';

@freezed
class SellerProductsState with _$SellerProductsState {
  const factory SellerProductsState({
    required PagingState<int, ProductEntity> pagingState,
    SellerProductsEntity? sellerData,
  }) = _SellerProductsState;
}
