part of 'product_detail_bloc.dart';

@freezed
class ProductDetailEvent with _$ProductDetailEvent {
  const factory ProductDetailEvent.load({
    required String productId
  }) = _Load;

  const factory ProductDetailEvent.refresh({
    required String productId
  }) = _Refresh;

}
