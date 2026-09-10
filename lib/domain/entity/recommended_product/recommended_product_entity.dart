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

  RecommendedProductEntity copyWith({
    int? productId,
    String? productName,
    List<ProductEntity>? sellerRecommendedProducts,
  }) {
    return RecommendedProductEntity(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      sellerRecommendedProducts:
          sellerRecommendedProducts ?? this.sellerRecommendedProducts,
    );
  }
}
