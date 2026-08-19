part of 'related_products_bloc.dart';

@freezed
class RelatedProductsEvent with _$RelatedProductsEvent {
  const factory RelatedProductsEvent.load({
    required String slug,
  }) = _Load;
}
