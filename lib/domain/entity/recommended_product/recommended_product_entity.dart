import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

class RecommendedProductEntity {
  final int productId;
  final String productName;
  final List<ProductEntity> sellerRecommendedProducts;

  const RecommendedProductEntity({
    required this.productId,
    required this.productName,
    required this.sellerRecommendedProducts,
  });
}
