// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryProductsResponseImpl _$$CategoryProductsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryProductsResponseImpl(
  categoryId: _toIntSafe(json['category_id']),
  categorySlug: json['category_slug'] as String?,
  categoryName: json['category_name'] as String?,
  metaTitle: json['meta_title'] as String?,
  metaKeywords: json['meta_keywords'] as String?,
  metaDescription: json['meta_description'] as String?,
  image: json['image'] as String?,
  mobileImage: json['mobile_image'] as String?,
  banner: _slidersFromJson(json['banner']),
  filterData: _slidersFromJson(json['filter_data']),
  featuredProductTotal: _toIntSafe(json['featured_product_total']),
  totalCatProds: _toIntSafe(json['total_cat_prods']),
  catProds: _productsFromJson(json['cat_prods']),
  featuredProducts: _productsFromJson(json['featured_products']),
  featuredCategory: _featuredCategoriesFromJson(json['featured_category']),
  brands: _categoriesFromJson(json['brands']),
  sortData: _sortOptionsFromJson(json['sort_data']),
  filterableAttributes: _filterAttributesFromJson(
    json['filterable_attributes'],
  ),
  appliedFilters: _appliedFiltersFromJson(json['applied_filters']),
  categoryDiscription: json['category_discription'] as String?,
  cacheTime:
      json['cache_time'] == null
          ? null
          : DateTime.parse(json['cache_time'] as String),
);

Map<String, dynamic> _$$CategoryProductsResponseImplToJson(
  _$CategoryProductsResponseImpl instance,
) => <String, dynamic>{
  'category_id': instance.categoryId,
  'category_slug': instance.categorySlug,
  'category_name': instance.categoryName,
  'meta_title': instance.metaTitle,
  'meta_keywords': instance.metaKeywords,
  'meta_description': instance.metaDescription,
  'image': instance.image,
  'mobile_image': instance.mobileImage,
  'banner': instance.banner,
  'filter_data': instance.filterData,
  'featured_product_total': instance.featuredProductTotal,
  'total_cat_prods': instance.totalCatProds,
  'cat_prods': instance.catProds,
  'featured_products': instance.featuredProducts,
  'featured_category': instance.featuredCategory,
  'brands': instance.brands,
  'sort_data': instance.sortData,
  'filterable_attributes': instance.filterableAttributes,
  'applied_filters': instance.appliedFilters,
  'category_discription': instance.categoryDiscription,
  'cache_time': instance.cacheTime?.toIso8601String(),
};

_$AppliedFilterImpl _$$AppliedFilterImplFromJson(Map<String, dynamic> json) =>
    _$AppliedFilterImpl(
      code: json['code'] as String?,
      label: json['label'] as String?,
      value: _toStringSafe(json['value']),
      valueLabel: _toStringSafe(json['value_label']),
    );

Map<String, dynamic> _$$AppliedFilterImplToJson(_$AppliedFilterImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'value': instance.value,
      'value_label': instance.valueLabel,
    };

_$FeaturedCategoryImpl _$$FeaturedCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$FeaturedCategoryImpl(
  categoryId: _toIntSafe(json['category_id']),
  categoryName: json['category_name'] as String?,
  slug: json['slug'] as String?,
  products: _productsFromJson(json['products']),
);

Map<String, dynamic> _$$FeaturedCategoryImplToJson(
  _$FeaturedCategoryImpl instance,
) => <String, dynamic>{
  'category_id': instance.categoryId,
  'category_name': instance.categoryName,
  'slug': instance.slug,
  'products': instance.products,
};
