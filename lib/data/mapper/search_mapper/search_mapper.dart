import 'package:pickaboo/data/model/search_response/search_response.dart';
import 'package:pickaboo/data/model/search_response/search_facet_response.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/search/search_result_entity.dart';
import 'package:pickaboo/domain/entity/search/search_facet_entity.dart';

extension SearchResponseMapper on SearchResponse {
  SearchResultEntity toDomain() {
    return SearchResultEntity(
      correctedQuery: correctedQuery,
      totalItems: totalItems ?? 0,
      products: items?.map((e) => e.toDomain()).toList() ?? const [],
      facets: facets?.map((e) => e.toDomain()).toList() ?? const [],
      suggestions: suggestions ?? const [],
      categories: categories?.map((e) => e.toDomain()).toList() ?? const [],
    );
  }
}

extension SearchCategoryMapper on SearchCategory {
  SearchCategoryEntity toDomain() {
    return SearchCategoryEntity(
      id: categoryId ?? '',
      title: title ?? '',
      link: link ?? '',
      imageLink: imageLink,
      description: description,
    );
  }
}

extension SearchFacetMapper on SearchFacetResponse {
  SearchFacetEntity toDomain() {
    return SearchFacetEntity(
      attribute: attribute ?? '',
      label: title ?? defaultTitle ?? attribute ?? '',
      buckets: buckets?.map((e) => e.toDomain()).toList() ?? const [],
    );
  }
}

extension FacetBucketMapper on FacetBucketResponse {
  FacetBucketEntity toDomain() {
    return FacetBucketEntity(
      value: value ?? '',
      label: value ?? '',
      count: count ?? 0,
    );
  }
}

extension ItemMapper on Item {
  ProductEntity toDomain() {
    return ProductEntity(
      id: productId ?? '',
      expressDelivery: expressDelivery == '1',
      productName: title ?? '',
      sku: productCode ?? '',
      slug: urlKey ?? '',
      typeId: typeId ?? '',
      stockAvailable: !_isZeroQuantity(quantity),
      freeDelivery: expressDelivery == '1',
      productPrice: _parseDouble(listPrice ?? price).toInt(),
      productSpecialPrice: _parseDouble(price).toInt(),
      productDiscount: _calculateDiscount(
        listPrice: listPrice ?? price,
        price: price,
      ),
      offers: '',
      rating: _parseDouble(reviewsAverageScore),
      clubPoint: 0.0,
      ratingCount: _parseInt(totalReviews),
      productImg: imageLink ?? '',
      emiAvailable: false,
      comingSoon: false,
      isAd: false,
      attributes: const [],
    );
  }

  bool _isZeroQuantity(String? quantity) {
    if (quantity == null || quantity.isEmpty) return false;
    final parsed = double.tryParse(quantity);
    if (parsed == null) return false;
    return parsed <= 0;
  }

  int _calculateDiscount({String? listPrice, String? price}) {
    final list = _parseDouble(listPrice);
    final special = _parseDouble(price);
    if (list <= 0 || special <= 0 || list <= special) return 0;
    return (((list - special) / list) * 100).round();
  }

  int _parseInt(String? value) {
    if (value == null || value.isEmpty) return 0;
    return int.tryParse(value) ?? 0;
  }

  double _parseDouble(String? value) {
    if (value == null || value.isEmpty) return 0.0;
    return double.tryParse(value) ?? 0.0;
  }
}
