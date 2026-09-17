import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pickaboo/data/model/common/product/product.dart';
import 'package:pickaboo/data/model/review_response/review_response.dart'
    show ReviewResponse;

part 'product_detail_response.freezed.dart';
part 'product_detail_response.g.dart';

String? _toStringSafe(dynamic value) => value?.toString();

bool _boolFromJson(dynamic value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is num) return value == 1;
  if (value is String) {
    final lower = value.toLowerCase().trim();
    return lower == 'true' || lower == '1';
  }
  return false;
}

@freezed
@HiveType(typeId: 19, adapterName: 'ProductDetailResponseAdapter')
class ProductDetailResponse with _$ProductDetailResponse {
  const factory ProductDetailResponse({
    @HiveField(0) @JsonKey(name: "id") int? id,
    @HiveField(1) @JsonKey(name: "sku") String? sku,
    @HiveField(2) @JsonKey(name: "slug") String? slug,
    @HiveField(3) @JsonKey(name: "type_id") String? typeId,
    @HiveField(4) @JsonKey(name: "name") String? name,
    @HiveField(5) @JsonKey(name: "prod_offer_price") int? prodOfferPrice,
    @HiveField(6) @JsonKey(name: "best_price") int? bestPrice,
    @HiveField(7) @JsonKey(name: "free_delivery") int? freeDelivery,
    @HiveField(8) @JsonKey(name: "category_ids") List<String>? categoryIds,
    @HiveField(9) @JsonKey(name: "meta_title") String? metaTitle,
    @HiveField(10) @JsonKey(name: "meta_keywords") String? metaKeywords,
    @HiveField(11) @JsonKey(name: "meta_description") String? metaDescription,
    @HiveField(12) @JsonKey(name: "images") List<String>? images,
    @HiveField(47) @JsonKey(name: "youtube_videos") List<YoutubeVideo>? youtubeVideos,
    @HiveField(13) @JsonKey(name: "is_wishlisted") bool? isWishlisted,
    @HiveField(14) @JsonKey(name: "is_eligible_for_review") bool? isEligibleForReview,
    @HiveField(15) @JsonKey(name: "share_url") String? shareUrl,
    @HiveField(16) @JsonKey(name: "regular_price") int? regularPrice,
    @HiveField(17) @JsonKey(name: "spacial_price") int? spacialPrice,
    @HiveField(18) @JsonKey(name: "discount") int? discount,
    @HiveField(19) @JsonKey(name: "stock_available") bool? stockAvailable,
    @HiveField(20) @JsonKey(name: "express_delivery") int? expressDelivery,
    @HiveField(21) @JsonKey(name: "coming_soon") bool? comingSoon,
    @HiveField(22) @JsonKey(name: "club_points") double? clubPoints,
    @HiveField(23) @JsonKey(name: "brand_id") String? brandId,
    @HiveField(24) @JsonKey(name: "brand") String? brand,
    @HiveField(25) @JsonKey(name: "sold_by_vendor_url_key") String? soldByVendorUrlKey,
    @HiveField(26) @JsonKey(name: "sold_by") String? soldBy,
    @HiveField(27) @JsonKey(name: "offers") String? offers,
    @HiveField(28) @JsonKey(name: "warranty") String? warranty,
    @HiveField(29) @JsonKey(name: "emi") double? emi,
    @HiveField(30) @JsonKey(name: "varient") List<Varient>? varient,
    @JsonKey(name: "variant_matrix") VariantMatrixResponse? variantMatrix,
    @HiveField(31) @JsonKey(name: "extra_options") List<ExtraOption>? extraOptions,
    @HiveField(32) @JsonKey(name: "buys_togather") List<BuysTogather>? buysTogather,
    @HiveField(33) @JsonKey(name: "product_details") String? productDetails,
    @HiveField(34) @JsonKey(name: "more_information") List<MoreInformation>? moreInformation,
    @HiveField(35) @JsonKey(name: "rating_summary_value") double? ratingSummaryValue,
    @HiveField(36) @JsonKey(name: "rating_summary") int? ratingSummary,
    @HiveField(37) @JsonKey(name: "reviews_count") int? reviewsCount,
    @HiveField(38) @JsonKey(name: "detailed_ratings") List<DetailedRating>? detailedRatings,
    @HiveField(39) @JsonKey(name: "detailed_summary") List<int>? detailedSummary,
    @HiveField(40) @JsonKey(name: "all_review_images") List<String>? allReviewImages,
    @JsonKey(name: "reviews_collection") List<ReviewResponse>? reviewsCollection,
    @HiveField(42) @JsonKey(name: "similar_products") List<Product>? similarProducts,
    @HiveField(43) @JsonKey(name: "you_may_also_like") List<Product>? youMayAlsoLike,
    @HiveField(44) @JsonKey(name: "other_brands") List<OtherBrand>? otherBrands,
    @HiveField(45) @JsonKey(name: "recently_viewed_products") List<Product>? recentlyViewedProducts,
    @HiveField(46) @JsonKey(name: "cache_time") DateTime? cacheTime,
  }) = _ProductDetailResponse;

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailResponseFromJson(json);
}

@freezed
@HiveType(typeId: 30, adapterName: 'YoutubeVideoAdapter')
class YoutubeVideo with _$YoutubeVideo {
  const factory YoutubeVideo({
    @HiveField(0) @JsonKey(name: "url") String? url,
    @HiveField(1) @JsonKey(name: "title") String? title,
  }) = _YoutubeVideo;

  factory YoutubeVideo.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoFromJson(json);
}

@freezed
@HiveType(typeId: 20, adapterName: 'DetailedRatingAdapter')
class DetailedRating with _$DetailedRating {
  const factory DetailedRating({
    @HiveField(0) @JsonKey(name: "rating") String? rating,
    @HiveField(1) @JsonKey(name: "avg_value") double? avgValue,
  }) = _DetailedRating;

  factory DetailedRating.fromJson(Map<String, dynamic> json) =>
      _$DetailedRatingFromJson(json);
}

@freezed
@HiveType(typeId: 21, adapterName: 'ExtraOptionAdapter')
class ExtraOption with _$ExtraOption {
  const factory ExtraOption({
    @HiveField(0) @JsonKey(name: "product_sku") String? productSku,
    @HiveField(1) @JsonKey(name: "option_id") int? optionId,
    @HiveField(2) @JsonKey(name: "title") String? title,
    @HiveField(3) @JsonKey(name: "type") String? type,
    @HiveField(4) @JsonKey(name: "sort_order") int? sortOrder,
    @HiveField(5) @JsonKey(name: "is_require") bool? isRequire,
    @HiveField(6) @JsonKey(name: "max_characters") int? maxCharacters,
    @HiveField(7) @JsonKey(name: "image_size_x") int? imageSizeX,
    @HiveField(8) @JsonKey(name: "image_size_y") int? imageSizeY,
    @HiveField(9) @JsonKey(name: "values") List<Value>? values,
  }) = _ExtraOption;

  factory ExtraOption.fromJson(Map<String, dynamic> json) =>
      _$ExtraOptionFromJson(json);
}

@freezed
@HiveType(typeId: 22, adapterName: 'ValueAdapter')
class Value with _$Value {
  const factory Value({
    @HiveField(0) @JsonKey(name: "title") String? title,
    @HiveField(1) @JsonKey(name: "sort_order") int? sortOrder,
    @HiveField(2) @JsonKey(name: "price") int? price,
    @HiveField(3) @JsonKey(name: "price_type") String? priceType,
    @HiveField(4) @JsonKey(name: "option_type_id") int? optionTypeId,
    @HiveField(5) @JsonKey(name: "details") String? details,
  }) = _Value;

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}

@freezed
@HiveType(typeId: 23, adapterName: 'MoreInformationAdapter')
class MoreInformation with _$MoreInformation {
  const factory MoreInformation({
    @HiveField(0) @JsonKey(name: "group_label") String? groupLabel,
    @HiveField(1) @JsonKey(name: "attr_list") List<AttrList>? attrList,
  }) = _MoreInformation;

  factory MoreInformation.fromJson(Map<String, dynamic> json) =>
      _$MoreInformationFromJson(json);
}

@freezed
@HiveType(typeId: 24, adapterName: 'AttrListAdapter')
class AttrList with _$AttrList {
  const factory AttrList({
    @HiveField(0) @JsonKey(name: "label") String? label,
    @HiveField(1) @JsonKey(name: "value") String? value,
    @HiveField(2) @JsonKey(name: "icon_url") String? iconUrl,
    @HiveField(3) @JsonKey(name: "icon") String? icon,
    @HiveField(4) @JsonKey(name: "is_featured", fromJson: _boolFromJson) @Default(false) bool isFeatured,
  }) = _AttrList;

  factory AttrList.fromJson(Map<String, dynamic> json) =>
      _$AttrListFromJson(json);
}

@freezed
@HiveType(typeId: 25, adapterName: 'OtherBrandAdapter')
class OtherBrand with _$OtherBrand {
  const factory OtherBrand({
    @HiveField(0) @JsonKey(name: "id") String? id,
    @HiveField(1) @JsonKey(name: "slug") String? slug,
    @HiveField(2) @JsonKey(name: "name") String? name,
    @HiveField(3) @JsonKey(name: "is_special") String? isSpecial,
    @HiveField(4) @JsonKey(name: "icon") String? icon,
  }) = _OtherBrand;

  factory OtherBrand.fromJson(Map<String, dynamic> json) =>
      _$OtherBrandFromJson(json);
}

@freezed
@HiveType(typeId: 26, adapterName: 'VarientAdapter')
class Varient with _$Varient {
  const factory Varient({
    @HiveField(0) @JsonKey(name: "option_id") String? optionId,
    @HiveField(1) @JsonKey(name: "option_name") String? optionName,
    @HiveField(2) @JsonKey(name: "options") List<Option>? options,
  }) = _Varient;

  factory Varient.fromJson(Map<String, dynamic> json) =>
      _$VarientFromJson(json);
}

@freezed
@HiveType(typeId: 27, adapterName: 'OptionAdapter')
class Option with _$Option {
  const factory Option({
    @HiveField(0) @JsonKey(name: "option_value") String? optionValue,
    @HiveField(1) @JsonKey(name: "option_text") String? optionText,
    @HiveField(2) @JsonKey(name: "configurable_product")
    ConfigurableProduct? configurableProduct,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}

@freezed
@HiveType(typeId: 28, adapterName: 'ConfigurableProductAdapter')
class ConfigurableProduct with _$ConfigurableProduct {
  const factory ConfigurableProduct({
    @HiveField(0) @JsonKey(name: "id") int? id,
    @HiveField(1) @JsonKey(name: "stock_available") bool? stockAvailable,
    @HiveField(2) @JsonKey(name: "product_price") int? productPrice,
    @HiveField(3) @JsonKey(name: "product_specialPrice") int? productSpecialPrice,
    @HiveField(4) @JsonKey(name: "product_discount") int? productDiscount,
    @HiveField(5) @JsonKey(name: "emi") double? emi,
    @HiveField(6) @JsonKey(name: "club_points") double? clubPoints,
    @HiveField(7) @JsonKey(name: "product_images") List<String>? productImages,
  }) = _ConfigurableProduct;

  factory ConfigurableProduct.fromJson(Map<String, dynamic> json) =>
      _$ConfigurableProductFromJson(json);
}

@freezed
class VariantMatrixResponse with _$VariantMatrixResponse {
  const factory VariantMatrixResponse({
    @JsonKey(name: "attributes") List<VariantMatrixAttribute>? attributes,
    @JsonKey(name: "products") List<VariantMatrixProduct>? products,
    @JsonKey(name: "tree") List<VariantMatrixNode>? tree,
  }) = _VariantMatrixResponse;

  factory VariantMatrixResponse.fromJson(Map<String, dynamic> json) =>
      _$VariantMatrixResponseFromJson(json);
}

@freezed
class VariantMatrixAttribute with _$VariantMatrixAttribute {
  const factory VariantMatrixAttribute({
    @JsonKey(name: "option_id", fromJson: _toStringSafe) String? optionId,
    @JsonKey(name: "option_name", fromJson: _toStringSafe) String? optionName,
    @JsonKey(name: "attribute_code", fromJson: _toStringSafe)
    String? attributeCode,
    @JsonKey(name: "options") List<VariantMatrixAttributeOption>? options,
  }) = _VariantMatrixAttribute;

  factory VariantMatrixAttribute.fromJson(Map<String, dynamic> json) =>
      _$VariantMatrixAttributeFromJson(json);
}

@freezed
class VariantMatrixAttributeOption with _$VariantMatrixAttributeOption {
  const factory VariantMatrixAttributeOption({
    @JsonKey(name: "option_value", fromJson: _toStringSafe) String? optionValue,
    @JsonKey(name: "option_text", fromJson: _toStringSafe) String? optionText,
  }) = _VariantMatrixAttributeOption;

  factory VariantMatrixAttributeOption.fromJson(Map<String, dynamic> json) =>
      _$VariantMatrixAttributeOptionFromJson(json);
}

@freezed
class VariantMatrixProduct with _$VariantMatrixProduct {
  const factory VariantMatrixProduct({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "stock_available") bool? stockAvailable,
    @JsonKey(name: "product_price") int? productPrice,
    @JsonKey(name: "product_specialPrice") int? productSpecialPrice,
    @JsonKey(name: "product_discount") int? productDiscount,
    @JsonKey(name: "emi") double? emi,
    @JsonKey(name: "club_points") double? clubPoints,
    @JsonKey(name: "product_images") List<String>? productImages,
    @JsonKey(name: "sku", fromJson: _toStringSafe) String? sku,
    @JsonKey(name: "variant_name", fromJson: _toStringSafe) String? variantName,
    @JsonKey(name: "selected_options")
    List<VariantMatrixSelectedOption>? selectedOptions,
    @JsonKey(name: "is_enabled") bool? isEnabled,
    @JsonKey(name: "salable") bool? salable,
  }) = _VariantMatrixProduct;

  factory VariantMatrixProduct.fromJson(Map<String, dynamic> json) =>
      _$VariantMatrixProductFromJson(json);
}

@freezed
class VariantMatrixSelectedOption with _$VariantMatrixSelectedOption {
  const factory VariantMatrixSelectedOption({
    @JsonKey(name: "option_id", fromJson: _toStringSafe) String? optionId,
    @JsonKey(name: "option_name", fromJson: _toStringSafe) String? optionName,
    @JsonKey(name: "attribute_code", fromJson: _toStringSafe)
    String? attributeCode,
    @JsonKey(name: "option_value", fromJson: _toStringSafe) String? optionValue,
    @JsonKey(name: "option_text", fromJson: _toStringSafe) String? optionText,
  }) = _VariantMatrixSelectedOption;

  factory VariantMatrixSelectedOption.fromJson(Map<String, dynamic> json) =>
      _$VariantMatrixSelectedOptionFromJson(json);
}

@freezed
class VariantMatrixNode with _$VariantMatrixNode {
  const factory VariantMatrixNode({
    @JsonKey(name: "option_value", fromJson: _toStringSafe) String? optionValue,
    @JsonKey(name: "option_text", fromJson: _toStringSafe) String? optionText,
    @JsonKey(name: "salable") bool? salable,
    @JsonKey(name: "children") List<VariantMatrixNode>? children,
    @JsonKey(name: "product") VariantMatrixProduct? product,
  }) = _VariantMatrixNode;

  factory VariantMatrixNode.fromJson(Map<String, dynamic> json) =>
      _$VariantMatrixNodeFromJson(json);
}

@freezed
@HiveType(typeId: 29, adapterName: 'BuysTogatherAdapter')
class BuysTogather with _$BuysTogather {
  const factory BuysTogather({
    @HiveField(0) @JsonKey(name: "id") String? id,
    @HiveField(1) @JsonKey(name: "sku") String? sku,
    @HiveField(2) @JsonKey(name: "slug") String? slug,
    @HiveField(3) @JsonKey(name: "type_id") String? typeId,
    @HiveField(4) @JsonKey(name: "express_delivery") String? expressDelivery,
    @HiveField(5) @JsonKey(name: "product_name") String? productName,
    @HiveField(6) @JsonKey(name: "stock_available") bool? stockAvailable,
    @HiveField(7) @JsonKey(name: "product_price") int? productPrice,
    @HiveField(8) @JsonKey(name: "product_specialPrice") int? productSpecialPrice,
    @HiveField(9) @JsonKey(name: "product_discount") int? productDiscount,
    @HiveField(10) @JsonKey(name: "rating") double? rating,
    @HiveField(11) @JsonKey(name: "rating_count") int? ratingCount,
    @HiveField(12) @JsonKey(name: "product_img") String? productImg,
  }) = _BuysTogather;

  factory BuysTogather.fromJson(Map<String, dynamic> json) =>
      _$BuysTogatherFromJson(json);
}
