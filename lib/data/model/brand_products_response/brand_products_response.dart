import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/common/slider/slider.dart';
import 'package:pickaboo/data/model/common/category/category.dart';
import 'package:pickaboo/data/model/common/product/product.dart';
import 'package:pickaboo/data/model/common/filter/filter.dart';

part 'brand_products_response.freezed.dart';
part 'brand_products_response.g.dart';

int? _toIntSafe(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return num.tryParse(value)?.toInt();
  return null;
}

String? _toStringSafe(dynamic value) => value?.toString();

List<BrandAppliedFilter>? _appliedFiltersFromJson(dynamic value) {
  if (value is! List) return null;
  return value
      .whereType<Map>()
      .map((e) => BrandAppliedFilter.fromJson(Map<String, dynamic>.from(e)))
      .toList();
}

List<T>? _listOrNull<T>(dynamic value, T Function(Map<String, dynamic>) fromJson) {
  if (value is! List) return null;
  return value
      .whereType<Map>()
      .map((e) => fromJson(Map<String, dynamic>.from(e)))
      .toList();
}

List<Slider>? _slidersFromJson(dynamic v) => _listOrNull(v, Slider.fromJson);
List<Product>? _productsFromJson(dynamic v) => _listOrNull(v, Product.fromJson);
List<Category>? _categoriesFromJson(dynamic v) => _listOrNull(v, Category.fromJson);
List<SortOption>? _sortOptionsFromJson(dynamic v) =>
    _listOrNull(v, SortOption.fromJson);
List<FilterAttribute>? _filterAttributesFromJson(dynamic v) =>
    _listOrNull(v, FilterAttribute.fromJson);
List<BrandFeaturedCategory>? _featuredCategoriesFromJson(dynamic v) =>
    _listOrNull(v, BrandFeaturedCategory.fromJson);

@freezed
class BrandProductsResponse with _$BrandProductsResponse {
  const factory BrandProductsResponse({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) int? brandId,
    @JsonKey(name: "category_slug") String? brandSlug,
    @JsonKey(name: "category_name") String? brandName,
    @JsonKey(name: "meta_title") String? metaTitle,
    @JsonKey(name: "meta_keywords") String? metaKeywords,
    @JsonKey(name: "meta_description") String? metaDescription,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "mobile_image") String? mobileImage,
    @JsonKey(name: "banner", fromJson: _slidersFromJson) List<Slider>? banner,
    @JsonKey(name: "filter_data", fromJson: _slidersFromJson)
    List<Slider>? filterData,
    @JsonKey(name: "featured_product_total", fromJson: _toIntSafe)
    int? featuredProductTotal,
    @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe)
    int? totalBrandProds,
    @JsonKey(name: "cat_prods", fromJson: _productsFromJson)
    List<Product>? brandProds,
    @JsonKey(name: "featured_products", fromJson: _productsFromJson)
    List<Product>? featuredProducts,
    @JsonKey(name: "featured_category", fromJson: _featuredCategoriesFromJson)
    List<BrandFeaturedCategory>? featuredCategory,
    @JsonKey(name: "brands", fromJson: _categoriesFromJson)
    List<Category>? brands,
    @JsonKey(name: "sort_data", fromJson: _sortOptionsFromJson)
    List<SortOption>? sortData,
    @JsonKey(name: "filterable_attributes", fromJson: _filterAttributesFromJson)
    List<FilterAttribute>? filterableAttributes,
    @JsonKey(name: "applied_filters", fromJson: _appliedFiltersFromJson)
    List<BrandAppliedFilter>? appliedFilters,
    @JsonKey(name: "category_discription") String? brandDiscription,
    @JsonKey(name: "cache_time") DateTime? cacheTime,
  }) = _BrandProductsResponse;

  factory BrandProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandProductsResponseFromJson(json);
}

@freezed
class BrandAppliedFilter with _$BrandAppliedFilter {
  const factory BrandAppliedFilter({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "value", fromJson: _toStringSafe) String? value,
    @JsonKey(name: "value_label", fromJson: _toStringSafe) String? valueLabel,
  }) = _BrandAppliedFilter;

  factory BrandAppliedFilter.fromJson(Map<String, dynamic> json) =>
      _$BrandAppliedFilterFromJson(json);
}

@freezed
class BrandFeaturedCategory with _$BrandFeaturedCategory {
  const factory BrandFeaturedCategory({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) int? categoryId,
    @JsonKey(name: "category_name") String? categoryName,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "products") List<Product>? products,
  }) = _BrandFeaturedCategory;

  factory BrandFeaturedCategory.fromJson(Map<String, dynamic> json) =>
      _$BrandFeaturedCategoryFromJson(json);
}
