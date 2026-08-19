part of 'recommended_products_bloc.dart';

@freezed
class RecommendedProductsEvent with _$RecommendedProductsEvent {
  const factory RecommendedProductsEvent.load({
    required String slug,
  }) = _Load;
}
