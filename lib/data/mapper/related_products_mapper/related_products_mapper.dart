import 'package:pickaboo/data/mapper/product_list_mapper/product_list_mapper.dart';
import 'package:pickaboo/data/model/related_products_response/related_products_response.dart';
import 'package:pickaboo/domain/entity/related_products/related_products_entity.dart';

extension RelatedProductsResponseMapper on RelatedProductsResponse {
  RelatedProductsEntity toEntity() {
    return RelatedProductsEntity(
      similarProducts: similarProducts?.map((p) => p.toDomain()).toList() ?? [],
      recentlyViewedProducts:
          recentlyViewedProducts?.map((p) => p.toDomain()).toList() ?? [],
      youMayAlsoLike: youMayAlsoLike?.map((p) => p.toDomain()).toList() ?? [],
    );
  }
}
