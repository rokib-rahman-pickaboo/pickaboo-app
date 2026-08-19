import 'package:pickaboo/data/mapper/product_list_mapper/product_list_mapper.dart';
import 'package:pickaboo/data/model/recommended_product_response/recommended_product_response.dart';
import 'package:pickaboo/domain/entity/recommended_product/recommended_product_entity.dart';

extension RecommendedProductResponseMapper on RecommendedProductResponse {
  RecommendedProductEntity toEntity() {
    return RecommendedProductEntity(
      productId: productId ?? 0,
      productName: productName ?? '',
      sellerRecommendedProducts:
          sellerRecommendedProducts?.map((p) => p.toDomain()).toList() ?? [],
    );
  }
}
