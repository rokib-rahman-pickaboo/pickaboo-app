part of 'product_flash_sale_bloc.dart';

enum ProductFlashSaleStatus { initial, loading, success, error }

@freezed
class ProductFlashSaleState with _$ProductFlashSaleState {
  const factory ProductFlashSaleState({
    @Default(ProductFlashSaleStatus.initial) ProductFlashSaleStatus status,
    AppErrorEntity? error,
    ProductFlashSaleEntity? flashSale,
  }) = _ProductFlashSaleState;
}
