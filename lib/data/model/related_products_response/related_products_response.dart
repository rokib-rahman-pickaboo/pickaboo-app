import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/common/product/product.dart';

part 'related_products_response.freezed.dart';
part 'related_products_response.g.dart';

@freezed
class RelatedProductsResponse with _$RelatedProductsResponse {
  const factory RelatedProductsResponse({
    @JsonKey(name: "similar_products") List<Product>? similarProducts,
    @JsonKey(name: "recently_viewed_products")
    List<Product>? recentlyViewedProducts,
    @JsonKey(name: "you_may_also_like") List<Product>? youMayAlsoLike,
  }) = _RelatedProductsResponse;

  factory RelatedProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$RelatedProductsResponseFromJson(json);
}
