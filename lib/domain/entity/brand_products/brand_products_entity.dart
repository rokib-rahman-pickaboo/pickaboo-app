import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';

export 'package:pickaboo/domain/entity/category_products/category_products_entity.dart'
    show FilterAttributeEntity, FilterItemEntity, SortOptionEntity;

class BrandProductsEntity {
  final int brandId;
  final String brandSlug;
  final String brandName;
  final String metaTitle;
  final String metaKeywords;
  final String metaDescription;
  final String image;
  final String mobileImage;
  final List<BrandBannerEntity> banners;
  final List<BrandBannerEntity> filters;
  final int featuredProductTotal;
  final int totalBrandProds;
  final List<ProductEntity> products;
  final List<ProductEntity> featuredProducts;
  final List<BrandFeaturedCategoryEntity> featuredCategories;
  final List<BrandItemEntity> brands;
  final List<SortOptionEntity> sortOptions;
  final List<FilterAttributeEntity> filterableAttributes;
  final List<BrandAppliedFilterEntity> appliedFilters;
  final String brandDescription;
  final DateTime? cacheTime;

  const BrandProductsEntity({
    required this.brandId,
    required this.brandSlug,
    required this.brandName,
    required this.metaTitle,
    required this.metaKeywords,
    required this.metaDescription,
    required this.image,
    required this.mobileImage,
    required this.banners,
    required this.filters,
    required this.featuredProductTotal,
    required this.totalBrandProds,
    required this.products,
    required this.featuredProducts,
    this.featuredCategories = const [],
    required this.brands,
    required this.sortOptions,
    required this.filterableAttributes,
    this.appliedFilters = const [],
    required this.brandDescription,
    this.cacheTime,
  });
}

class BrandFeaturedCategoryEntity {
  final int categoryId;
  final String categoryName;
  final String slug;
  final List<ProductEntity> products;

  const BrandFeaturedCategoryEntity({
    required this.categoryId,
    required this.categoryName,
    required this.slug,
    required this.products,
  });
}

class BrandBannerEntity {
  final String id;
  final String title;
  final String mobileSlug;
  final String? targetUrl;
  final String image;
  final String mobileImage;
  final String imagePosition;
  final String link;
  final String linkType;
  final String order;
  final String status;
  final String? urlKey;
  final String? name;
  final String mobileImageUrl;
  final String imageUrl;

  const BrandBannerEntity({
    required this.id,
    required this.title,
    required this.mobileSlug,
    this.targetUrl,
    required this.image,
    required this.mobileImage,
    required this.imagePosition,
    required this.link,
    required this.linkType,
    required this.order,
    required this.status,
    this.urlKey,
    this.name,
    required this.mobileImageUrl,
    required this.imageUrl,
  });
}

class BrandItemEntity {
  final String id;
  final String name;
  final bool isSpecial;
  final String icon;

  const BrandItemEntity({
    required this.id,
    required this.name,
    required this.isSpecial,
    required this.icon,
  });
}

class BrandAppliedFilterEntity {
  final String code;
  final String label;
  final String value;
  final String valueLabel;

  const BrandAppliedFilterEntity({
    this.code = '',
    this.label = '',
    this.value = '',
    this.valueLabel = '',
  });
}
