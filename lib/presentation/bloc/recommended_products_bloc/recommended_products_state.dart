part of 'recommended_products_bloc.dart';

@freezed
class RecommendedProductsState with _$RecommendedProductsState {
  const factory RecommendedProductsState.initial() = _Initial;
  const factory RecommendedProductsState.loading() = _Loading;
  const factory RecommendedProductsState.loaded(RecommendedProductEntity recommendedProducts) = _Loaded;
  const factory RecommendedProductsState.error(AppErrorEntity error) = _Error;
}
