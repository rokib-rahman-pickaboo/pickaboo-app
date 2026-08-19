// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BrandProductsResponseImpl _$$BrandProductsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BrandProductsResponseImpl(
  brandId: _toIntSafe(json['category_id']),
  brandSlug: json['category_slug'] as String?,
  brandName: json['category_name'] as String?,
  metaTitle: json['meta_title'] as String?,
  metaKeywords: json['meta_keywords'] as String?,
  metaDescription: json['meta_description'] as String?,
  image: json['image'] as String?,
  mobileImage: json['mobile_image'] as String?,
  banner: _slidersFromJson(json['banner']),
  filterData: _slidersFromJson(json['filter_data']),
  featuredProductTotal: _toIntSafe(json['featured_product_total']),
  totalBrandProds: _toIntSafe(json['total_cat_prods']),
  brandProds: _productsFromJson(json['cat_prods']),
  featuredProducts: _productsFromJson(json['featured_products']),
  featuredCategory: _featuredCategoriesFromJson(json['featured_category']),
  brands: _categoriesFromJson(json['brands']),
  sortData: _sortOptionsFromJson(json['sort_data']),
  filterableAttributes: _filterAttributesFromJson(
    json['filterable_attributes'],
  ),
  appliedFilters: _appliedFiltersFromJson(json['applied_filters']),
  brandDiscription: json['category_discription'] as String?,
  cacheTime:
      json['cache_time'] == null
          ? null
          : DateTime.parse(json['cache_time'] as String),
);

Map<String, dynamic> _$$BrandProductsResponseImplToJson(
  _$BrandProductsResponseImpl instance,
) => <String, dynamic>{
  'category_id': instance.brandId,
  'category_slug': instance.brandSlug,
  'category_name': instance.brandName,
  'meta_title': instance.metaTitle,
  'meta_keywords': instance.metaKeywords,
  'meta_description': instance.metaDescription,
  'image': instance.image,
  'mobile_image': instance.mobileImage,
  'banner': instance.banner,
  'filter_data': instance.filterData,
  'featured_product_total': instance.featuredProductTotal,
  'total_cat_prods': instance.totalBrandProds,
  'cat_prods': instance.brandProds,
  'featured_products': instance.featuredProducts,
  'featured_category': instance.featuredCategory,
  'brands': instance.brands,
  'sort_data': instance.sortData,
  'filterable_attributes': instance.filterableAttributes,
  'applied_filters': instance.appliedFilters,
  'category_discription': instance.brandDiscription,
  'cache_time': instance.cacheTime?.toIso8601String(),
};

_$BrandAppliedFilterImpl _$$BrandAppliedFilterImplFromJson(
  Map<String, dynamic> json,
) => _$BrandAppliedFilterImpl(
  code: json['code'] as String?,
  label: json['label'] as String?,
  value: _toStringSafe(json['value']),
  valueLabel: _toStringSafe(json['value_label']),
);

Map<String, dynamic> _$$BrandAppliedFilterImplToJson(
  _$BrandAppliedFilterImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'label': instance.label,
  'value': instance.value,
  'value_label': instance.valueLabel,
};

_$BrandFeaturedCategoryImpl _$$BrandFeaturedCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$BrandFeaturedCategoryImpl(
  categoryId: _toIntSafe(json['category_id']),
  categoryName: json['category_name'] as String?,
  slug: json['slug'] as String?,
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$BrandFeaturedCategoryImplToJson(
  _$BrandFeaturedCategoryImpl instance,
) => <String, dynamic>{
  'category_id': instance.categoryId,
  'category_name': instance.categoryName,
  'slug': instance.slug,
  'products': instance.products,
};
