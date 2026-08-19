import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/common/product/product.dart';

part 'related_product_response.freezed.dart';
part 'related_product_response.g.dart';

@freezed
class RelatedProductResponse with _$RelatedProductResponse {
  const factory RelatedProductResponse({
    @JsonKey(name: "product_id")
    int? productId,
    @JsonKey(name: "product_name")
    String? productName,
    @JsonKey(name: "related_products")
    List<Product>? relatedProducts,
  }) = _RelatedProductResponse;

  factory RelatedProductResponse.fromJson(Map<String, dynamic> json) => _$RelatedProductResponseFromJson(json);
}

