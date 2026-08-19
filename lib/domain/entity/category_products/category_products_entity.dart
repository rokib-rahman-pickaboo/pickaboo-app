import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

class CategoryProductsEntity {
  final int categoryId;
  final String categorySlug;
  final String categoryName;
  final String metaTitle;
  final String metaKeywords;
  final String metaDescription;
  final String image;
  final String mobileImage;
  final List<CategoryBannerEntity> banners;
  final List<CategoryBannerEntity> filters;
  final int featuredProductTotal;
  final int totalCatProds;
  final List<ProductEntity> products;
  final List<ProductEntity> featuredProducts;
  final List<FeaturedCategoryEntity> featuredCategories;
  final List<CategoryBrandEntity> brands;
  final List<SortOptionEntity> sortOptions;
  final List<FilterAttributeEntity> filterableAttributes;
  final List<AppliedFilterEntity> appliedFilters;
  final String categoryDescription;
  final DateTime? cacheTime;

  const CategoryProductsEntity({
    required this.categoryId,
    required this.categorySlug,
    required this.categoryName,
    required this.metaTitle,
    required this.metaKeywords,
    required this.metaDescription,
    required this.image,
    required this.mobileImage,
    required this.banners,
    required this.filters,
    required this.featuredProductTotal,
    required this.totalCatProds,
    required this.products,
    required this.featuredProducts,
    this.featuredCategories = const [],
    required this.brands,
    required this.sortOptions,
    required this.filterableAttributes,
    this.appliedFilters = const [],
    required this.categoryDescription,
    this.cacheTime,
  });
}

class FeaturedCategoryEntity {
  final int categoryId;
  final String categoryName;
  final String slug;
  final List<ProductEntity> products;

  const FeaturedCategoryEntity({
    required this.categoryId,
    required this.categoryName,
    required this.slug,
    required this.products,
  });
}

class CategoryBannerEntity {
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

  const CategoryBannerEntity({
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

class CategoryBrandEntity {
  final String id;
  final String name;
  final bool isSpecial;
  final String icon;

  const CategoryBrandEntity({
    required this.id,
    required this.name,
    required this.isSpecial,
    required this.icon,
  });
}

class SortOptionEntity {
  final String title;
  final String value;

  const SortOptionEntity({required this.title, required this.value});
}

class FilterAttributeEntity {
  final String filterName;
  final String filterCode;
  final List<FilterItemEntity> items;
  final bool specialForPhone;

  const FilterAttributeEntity({
    required this.filterName,
    required this.filterCode,
    required this.items,
    required this.specialForPhone,
  });
}

class FilterItemEntity {
  final String label;

  final String value;
  final int count;

  const FilterItemEntity({
    required this.label,
    required this.value,
    required this.count,
  });

  ({double min, double max})? get rangeBounds {
    final parts = value.split('-');
    if (parts.length != 2) return null;
    final min = double.tryParse(parts[0]);
    final max = double.tryParse(parts[1]);
    if (min == null || max == null || max <= min) return null;
    return (min: min, max: max);
  }
}

class AppliedFilterEntity {
  final String code;
  final String label;
  final String value;
  final String valueLabel;

  const AppliedFilterEntity({
    this.code = '',
    this.label = '',
    this.value = '',
    this.valueLabel = '',
  });
}
