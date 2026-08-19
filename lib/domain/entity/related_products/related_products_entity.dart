import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

class RelatedProductsEntity {
  final List<ProductEntity> similarProducts;
  final List<ProductEntity> recentlyViewedProducts;
  final List<ProductEntity> youMayAlsoLike;

  const RelatedProductsEntity({
    required this.similarProducts,
    required this.recentlyViewedProducts,
    required this.youMayAlsoLike,
  });
}
