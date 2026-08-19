import 'package:pickaboo/data/mapper/product_list_mapper/product_list_mapper.dart';
import 'package:pickaboo/data/model/related_product_response/related_product_response.dart';
import 'package:pickaboo/domain/entity/related_product/related_product_entity.dart';

extension RelatedProductResponseMapper on RelatedProductResponse {
  RelatedProductEntity toEntity() {
    return RelatedProductEntity(
      productId: productId ?? 0,
      productName: productName ?? '',
      relatedProducts:
          relatedProducts?.map((p) => p.toDomain()).toList() ?? [],
    );
  }
}
