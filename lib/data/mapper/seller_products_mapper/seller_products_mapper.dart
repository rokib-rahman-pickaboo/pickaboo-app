import 'package:pickaboo/data/model/seller_products_response/seller_products_response.dart';
import 'package:pickaboo/data/mapper/product_list_mapper/product_list_mapper.dart';
import 'package:pickaboo/domain/entity/seller_products/seller_products_entity.dart'
    as entity;

extension SellerProductsResponseMapper on SellerProductsResponse {
  entity.SellerProductsEntity toDomain() {
    return entity.SellerProductsEntity(
      vendorName: vendorName ?? '',
      totalCount: totalCount ?? 0,
      products: items?.map((e) => e.toDomain()).toList() ?? const [],
    );
  }
}
