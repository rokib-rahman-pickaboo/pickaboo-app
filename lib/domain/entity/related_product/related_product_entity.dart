import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

class RelatedProductEntity {
  final int productId;
  final String productName;
  final List<ProductEntity> relatedProducts;

  const RelatedProductEntity({
    required this.productId,
    required this.productName,
    required this.relatedProducts,
  });
}
