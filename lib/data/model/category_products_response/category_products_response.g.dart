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
  banner:
      (json['banner'] as List<dynamic>?)
          ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
          .toList(),
  filterData:
      (json['filter_data'] as List<dynamic>?)
          ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
          .toList(),
  featuredProductTotal: _toIntSafe(json['featured_product_total']),
  totalCatProds: _toIntSafe(json['total_cat_prods']),
  catProds:
      (json['cat_prods'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
  featuredProducts:
      (json['featured_products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
  featuredCategory:
      (json['featured_category'] as List<dynamic>?)
          ?.map((e) => FeaturedCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
  brands:
      (json['brands'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
  sortData:
      (json['sort_data'] as List<dynamic>?)
          ?.map((e) => SortOption.fromJson(e as Map<String, dynamic>))
          .toList(),
  filterableAttributes:
      (json['filterable_attributes'] as List<dynamic>?)
          ?.map((e) => FilterAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
  appliedFilters:
      (json['applied_filters'] as List<dynamic>?)
          ?.map((e) => AppliedFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
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
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$FeaturedCategoryImplToJson(
  _$FeaturedCategoryImpl instance,
) => <String, dynamic>{
  'category_id': instance.categoryId,
  'category_name': instance.categoryName,
  'slug': instance.slug,
  'products': instance.products,
};
