part of 'related_products_bloc.dart';

@freezed
class RelatedProductsState with _$RelatedProductsState {
  const factory RelatedProductsState.initial() = _Initial;
  const factory RelatedProductsState.loading() = _Loading;
  const factory RelatedProductsState.loaded(RelatedProductEntity relatedProducts) = _Loaded;
  const factory RelatedProductsState.error(AppErrorEntity error) = _Error;
}
