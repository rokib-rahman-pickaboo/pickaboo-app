import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/common/product/product.dart';

part 'recommended_product_response.freezed.dart';
part 'recommended_product_response.g.dart';

@freezed
class RecommendedProductResponse with _$RecommendedProductResponse {
  const factory RecommendedProductResponse({
    @JsonKey(name: "product_id")
    int? productId,
    @JsonKey(name: "product_name")
    String? productName,
    @JsonKey(name: "seller_recommended_products")
    List<Product>? sellerRecommendedProducts,
  }) = _RecommendedProductResponse;

  factory RecommendedProductResponse.fromJson(Map<String, dynamic> json) => _$RecommendedProductResponseFromJson(json);
}
