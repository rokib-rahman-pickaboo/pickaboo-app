import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/common/slider/slider.dart';
import 'package:pickaboo/data/model/common/category/category.dart';
import 'package:pickaboo/data/model/common/product/product.dart';
import 'package:pickaboo/data/model/common/filter/filter.dart';

part 'category_products_response.freezed.dart';
part 'category_products_response.g.dart';

int? _toIntSafe(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return num.tryParse(value)?.toInt();
  return null;
}

String? _toStringSafe(dynamic value) => value?.toString();

@freezed
class CategoryProductsResponse with _$CategoryProductsResponse {
  const factory CategoryProductsResponse({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) int? categoryId,
    @JsonKey(name: "category_slug") String? categorySlug,
    @JsonKey(name: "category_name") String? categoryName,
    @JsonKey(name: "meta_title") String? metaTitle,
    @JsonKey(name: "meta_keywords") String? metaKeywords,
    @JsonKey(name: "meta_description") String? metaDescription,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "mobile_image") String? mobileImage,
    @JsonKey(name: "banner") List<Slider>? banner,
    @JsonKey(name: "filter_data") List<Slider>? filterData,
    @JsonKey(name: "featured_product_total", fromJson: _toIntSafe)
    int? featuredProductTotal,
    @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe)
    int? totalCatProds,
    @JsonKey(name: "cat_prods") List<Product>? catProds,
    @JsonKey(name: "featured_products") List<Product>? featuredProducts,
    @JsonKey(name: "featured_category") List<FeaturedCategory>? featuredCategory,
    @JsonKey(name: "brands") List<Category>? brands,
    @JsonKey(name: "sort_data") List<SortOption>? sortData,
    @JsonKey(name: "filterable_attributes")
    List<FilterAttribute>? filterableAttributes,
    @JsonKey(name: "applied_filters") List<AppliedFilter>? appliedFilters,
    @JsonKey(name: "category_discription") String? categoryDiscription,
    @JsonKey(name: "cache_time") DateTime? cacheTime,
  }) = _CategoryProductsResponse;

  factory CategoryProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductsResponseFromJson(json);
}

@freezed
class AppliedFilter with _$AppliedFilter {
  const factory AppliedFilter({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "value", fromJson: _toStringSafe) String? value,
    @JsonKey(name: "value_label", fromJson: _toStringSafe) String? valueLabel,
  }) = _AppliedFilter;

  factory AppliedFilter.fromJson(Map<String, dynamic> json) =>
      _$AppliedFilterFromJson(json);
}

@freezed
class FeaturedCategory with _$FeaturedCategory {
  const factory FeaturedCategory({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) int? categoryId,
    @JsonKey(name: "category_name") String? categoryName,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "products") List<Product>? products,
  }) = _FeaturedCategory;

  factory FeaturedCategory.fromJson(Map<String, dynamic> json) =>
      _$FeaturedCategoryFromJson(json);
}
