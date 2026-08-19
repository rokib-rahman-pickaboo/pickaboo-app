import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

class ProductListEntity {
  final int total;
  final int currentPage;
  final int limit;
  final List<ProductEntity> products;

  const ProductListEntity({
    required this.total,
    required this.currentPage,
    required this.limit,
    required this.products,
  });
}
