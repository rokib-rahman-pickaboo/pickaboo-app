part of 'product_flash_sale_bloc.dart';

@freezed
class ProductFlashSaleEvent with _$ProductFlashSaleEvent {
  const factory ProductFlashSaleEvent.fetch({
    required String slug,
  }) = _Fetch;
}
