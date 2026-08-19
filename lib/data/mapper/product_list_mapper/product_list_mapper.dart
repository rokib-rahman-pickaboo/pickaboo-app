import 'package:pickaboo/data/model/common/product/product.dart';
import 'package:pickaboo/data/model/product_list_response/product_list_response.dart';
import 'package:pickaboo/domain/entity/product_list/product_list_entity.dart'
    as entity;
import 'package:pickaboo/domain/entity/common/product/product_entity.dart'
    as entity;

extension ProductListResponseMapper on ProductListResponse {
  entity.ProductListEntity toDomain() {
    return entity.ProductListEntity(
      total: total ?? 0,
      currentPage: currentPage ?? 1,
      limit: limit ?? 0,
      products: products?.map((e) => e.toDomain()).toList() ?? const [],
    );
  }
}

extension ProductListMapper on Product {
  entity.ProductEntity toDomain() {
    return entity.ProductEntity(
      id: id ?? '',
      expressDelivery: _parseBool(expressDelivery),
      productName: productName ?? '',
      sku: sku ?? '',
      slug: slug ?? '',
      typeId: typeId ?? '',
      stockAvailable: stockAvailable ?? true,
      freeDelivery: _parseBool(freeDelivery),
      productPrice: productPrice ?? 0,
      productSpecialPrice: productSpecialPrice ?? 0,
      productDiscount: productDiscount ?? 0,
      offers: offers ?? '',
      rating: rating ?? 0,
      clubPoint: clubPoint ?? 0,
      ratingCount: ratingCount ?? 0,
      productImg: productImg ?? '',
      emiAvailable: emiAvailable ?? false,
      comingSoon: comingSoon ?? false,
      isAd: isAd ?? false,
      attributes: attributes?.map((e) => entity.ProductAttributeEntity(
        code: e.code ?? '',
        label: e.label ?? '',
        value: e.value ?? '',
      )).toList() ?? const [],
    );
  }
}

bool _parseBool(String? value) =>
    value == '1' || value?.toLowerCase() == 'true';
