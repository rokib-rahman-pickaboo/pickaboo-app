// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_products_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BrandProductsResponse _$BrandProductsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _BrandProductsResponse.fromJson(json);
}

/// @nodoc
mixin _$BrandProductsResponse {
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  int? get brandId => throw _privateConstructorUsedError;
  @JsonKey(name: "category_slug")
  String? get brandSlug => throw _privateConstructorUsedError;
  @JsonKey(name: "category_name")
  String? get brandName => throw _privateConstructorUsedError;
  @JsonKey(name: "meta_title")
  String? get metaTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "meta_keywords")
  String? get metaKeywords => throw _privateConstructorUsedError;
  @JsonKey(name: "meta_description")
  String? get metaDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "mobile_image")
  String? get mobileImage => throw _privateConstructorUsedError;
  @JsonKey(name: "banner", fromJson: _slidersFromJson)
  List<Slider>? get banner => throw _privateConstructorUsedError;
  @JsonKey(name: "filter_data", fromJson: _slidersFromJson)
  List<Slider>? get filterData => throw _privateConstructorUsedError;
  @JsonKey(name: "featured_product_total", fromJson: _toIntSafe)
  int? get featuredProductTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe)
  int? get totalBrandProds => throw _privateConstructorUsedError;
  @JsonKey(name: "cat_prods", fromJson: _productsFromJson)
  List<Product>? get brandProds => throw _privateConstructorUsedError;
  @JsonKey(name: "featured_products", fromJson: _productsFromJson)
  List<Product>? get featuredProducts => throw _privateConstructorUsedError;
  @JsonKey(name: "featured_category", fromJson: _featuredCategoriesFromJson)
  List<BrandFeaturedCategory>? get featuredCategory =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "brands", fromJson: _categoriesFromJson)
  List<Category>? get brands => throw _privateConstructorUsedError;
  @JsonKey(name: "sort_data", fromJson: _sortOptionsFromJson)
  List<SortOption>? get sortData => throw _privateConstructorUsedError;
  @JsonKey(name: "filterable_attributes", fromJson: _filterAttributesFromJson)
  List<FilterAttribute>? get filterableAttributes =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "applied_filters", fromJson: _appliedFiltersFromJson)
  List<BrandAppliedFilter>? get appliedFilters =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "category_discription")
  String? get brandDiscription => throw _privateConstructorUsedError;
  @JsonKey(name: "cache_time")
  DateTime? get cacheTime => throw _privateConstructorUsedError;

  /// Serializes this BrandProductsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandProductsResponseCopyWith<BrandProductsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandProductsResponseCopyWith<$Res> {
  factory $BrandProductsResponseCopyWith(
    BrandProductsResponse value,
    $Res Function(BrandProductsResponse) then,
  ) = _$BrandProductsResponseCopyWithImpl<$Res, BrandProductsResponse>;
  @useResult
  $Res call({
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
  });
}

/// @nodoc
class _$BrandProductsResponseCopyWithImpl<
  $Res,
  $Val extends BrandProductsResponse
>
    implements $BrandProductsResponseCopyWith<$Res> {
  _$BrandProductsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandId = freezed,
    Object? brandSlug = freezed,
    Object? brandName = freezed,
    Object? metaTitle = freezed,
    Object? metaKeywords = freezed,
    Object? metaDescription = freezed,
    Object? image = freezed,
    Object? mobileImage = freezed,
    Object? banner = freezed,
    Object? filterData = freezed,
    Object? featuredProductTotal = freezed,
    Object? totalBrandProds = freezed,
    Object? brandProds = freezed,
    Object? featuredProducts = freezed,
    Object? featuredCategory = freezed,
    Object? brands = freezed,
    Object? sortData = freezed,
    Object? filterableAttributes = freezed,
    Object? appliedFilters = freezed,
    Object? brandDiscription = freezed,
    Object? cacheTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            brandId:
                freezed == brandId
                    ? _value.brandId
                    : brandId // ignore: cast_nullable_to_non_nullable
                        as int?,
            brandSlug:
                freezed == brandSlug
                    ? _value.brandSlug
                    : brandSlug // ignore: cast_nullable_to_non_nullable
                        as String?,
            brandName:
                freezed == brandName
                    ? _value.brandName
                    : brandName // ignore: cast_nullable_to_non_nullable
                        as String?,
            metaTitle:
                freezed == metaTitle
                    ? _value.metaTitle
                    : metaTitle // ignore: cast_nullable_to_non_nullable
                        as String?,
            metaKeywords:
                freezed == metaKeywords
                    ? _value.metaKeywords
                    : metaKeywords // ignore: cast_nullable_to_non_nullable
                        as String?,
            metaDescription:
                freezed == metaDescription
                    ? _value.metaDescription
                    : metaDescription // ignore: cast_nullable_to_non_nullable
                        as String?,
            image:
                freezed == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String?,
            mobileImage:
                freezed == mobileImage
                    ? _value.mobileImage
                    : mobileImage // ignore: cast_nullable_to_non_nullable
                        as String?,
            banner:
                freezed == banner
                    ? _value.banner
                    : banner // ignore: cast_nullable_to_non_nullable
                        as List<Slider>?,
            filterData:
                freezed == filterData
                    ? _value.filterData
                    : filterData // ignore: cast_nullable_to_non_nullable
                        as List<Slider>?,
            featuredProductTotal:
                freezed == featuredProductTotal
                    ? _value.featuredProductTotal
                    : featuredProductTotal // ignore: cast_nullable_to_non_nullable
                        as int?,
            totalBrandProds:
                freezed == totalBrandProds
                    ? _value.totalBrandProds
                    : totalBrandProds // ignore: cast_nullable_to_non_nullable
                        as int?,
            brandProds:
                freezed == brandProds
                    ? _value.brandProds
                    : brandProds // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
            featuredProducts:
                freezed == featuredProducts
                    ? _value.featuredProducts
                    : featuredProducts // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
            featuredCategory:
                freezed == featuredCategory
                    ? _value.featuredCategory
                    : featuredCategory // ignore: cast_nullable_to_non_nullable
                        as List<BrandFeaturedCategory>?,
            brands:
                freezed == brands
                    ? _value.brands
                    : brands // ignore: cast_nullable_to_non_nullable
                        as List<Category>?,
            sortData:
                freezed == sortData
                    ? _value.sortData
                    : sortData // ignore: cast_nullable_to_non_nullable
                        as List<SortOption>?,
            filterableAttributes:
                freezed == filterableAttributes
                    ? _value.filterableAttributes
                    : filterableAttributes // ignore: cast_nullable_to_non_nullable
                        as List<FilterAttribute>?,
            appliedFilters:
                freezed == appliedFilters
                    ? _value.appliedFilters
                    : appliedFilters // ignore: cast_nullable_to_non_nullable
                        as List<BrandAppliedFilter>?,
            brandDiscription:
                freezed == brandDiscription
                    ? _value.brandDiscription
                    : brandDiscription // ignore: cast_nullable_to_non_nullable
                        as String?,
            cacheTime:
                freezed == cacheTime
                    ? _value.cacheTime
                    : cacheTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BrandProductsResponseImplCopyWith<$Res>
    implements $BrandProductsResponseCopyWith<$Res> {
  factory _$$BrandProductsResponseImplCopyWith(
    _$BrandProductsResponseImpl value,
    $Res Function(_$BrandProductsResponseImpl) then,
  ) = __$$BrandProductsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
  });
}

/// @nodoc
class __$$BrandProductsResponseImplCopyWithImpl<$Res>
    extends
        _$BrandProductsResponseCopyWithImpl<$Res, _$BrandProductsResponseImpl>
    implements _$$BrandProductsResponseImplCopyWith<$Res> {
  __$$BrandProductsResponseImplCopyWithImpl(
    _$BrandProductsResponseImpl _value,
    $Res Function(_$BrandProductsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BrandProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandId = freezed,
    Object? brandSlug = freezed,
    Object? brandName = freezed,
    Object? metaTitle = freezed,
    Object? metaKeywords = freezed,
    Object? metaDescription = freezed,
    Object? image = freezed,
    Object? mobileImage = freezed,
    Object? banner = freezed,
    Object? filterData = freezed,
    Object? featuredProductTotal = freezed,
    Object? totalBrandProds = freezed,
    Object? brandProds = freezed,
    Object? featuredProducts = freezed,
    Object? featuredCategory = freezed,
    Object? brands = freezed,
    Object? sortData = freezed,
    Object? filterableAttributes = freezed,
    Object? appliedFilters = freezed,
    Object? brandDiscription = freezed,
    Object? cacheTime = freezed,
  }) {
    return _then(
      _$BrandProductsResponseImpl(
        brandId:
            freezed == brandId
                ? _value.brandId
                : brandId // ignore: cast_nullable_to_non_nullable
                    as int?,
        brandSlug:
            freezed == brandSlug
                ? _value.brandSlug
                : brandSlug // ignore: cast_nullable_to_non_nullable
                    as String?,
        brandName:
            freezed == brandName
                ? _value.brandName
                : brandName // ignore: cast_nullable_to_non_nullable
                    as String?,
        metaTitle:
            freezed == metaTitle
                ? _value.metaTitle
                : metaTitle // ignore: cast_nullable_to_non_nullable
                    as String?,
        metaKeywords:
            freezed == metaKeywords
                ? _value.metaKeywords
                : metaKeywords // ignore: cast_nullable_to_non_nullable
                    as String?,
        metaDescription:
            freezed == metaDescription
                ? _value.metaDescription
                : metaDescription // ignore: cast_nullable_to_non_nullable
                    as String?,
        image:
            freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String?,
        mobileImage:
            freezed == mobileImage
                ? _value.mobileImage
                : mobileImage // ignore: cast_nullable_to_non_nullable
                    as String?,
        banner:
            freezed == banner
                ? _value._banner
                : banner // ignore: cast_nullable_to_non_nullable
                    as List<Slider>?,
        filterData:
            freezed == filterData
                ? _value._filterData
                : filterData // ignore: cast_nullable_to_non_nullable
                    as List<Slider>?,
        featuredProductTotal:
            freezed == featuredProductTotal
                ? _value.featuredProductTotal
                : featuredProductTotal // ignore: cast_nullable_to_non_nullable
                    as int?,
        totalBrandProds:
            freezed == totalBrandProds
                ? _value.totalBrandProds
                : totalBrandProds // ignore: cast_nullable_to_non_nullable
                    as int?,
        brandProds:
            freezed == brandProds
                ? _value._brandProds
                : brandProds // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
        featuredProducts:
            freezed == featuredProducts
                ? _value._featuredProducts
                : featuredProducts // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
        featuredCategory:
            freezed == featuredCategory
                ? _value._featuredCategory
                : featuredCategory // ignore: cast_nullable_to_non_nullable
                    as List<BrandFeaturedCategory>?,
        brands:
            freezed == brands
                ? _value._brands
                : brands // ignore: cast_nullable_to_non_nullable
                    as List<Category>?,
        sortData:
            freezed == sortData
                ? _value._sortData
                : sortData // ignore: cast_nullable_to_non_nullable
                    as List<SortOption>?,
        filterableAttributes:
            freezed == filterableAttributes
                ? _value._filterableAttributes
                : filterableAttributes // ignore: cast_nullable_to_non_nullable
                    as List<FilterAttribute>?,
        appliedFilters:
            freezed == appliedFilters
                ? _value._appliedFilters
                : appliedFilters // ignore: cast_nullable_to_non_nullable
                    as List<BrandAppliedFilter>?,
        brandDiscription:
            freezed == brandDiscription
                ? _value.brandDiscription
                : brandDiscription // ignore: cast_nullable_to_non_nullable
                    as String?,
        cacheTime:
            freezed == cacheTime
                ? _value.cacheTime
                : cacheTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandProductsResponseImpl implements _BrandProductsResponse {
  const _$BrandProductsResponseImpl({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) this.brandId,
    @JsonKey(name: "category_slug") this.brandSlug,
    @JsonKey(name: "category_name") this.brandName,
    @JsonKey(name: "meta_title") this.metaTitle,
    @JsonKey(name: "meta_keywords") this.metaKeywords,
    @JsonKey(name: "meta_description") this.metaDescription,
    @JsonKey(name: "image") this.image,
    @JsonKey(name: "mobile_image") this.mobileImage,
    @JsonKey(name: "banner", fromJson: _slidersFromJson)
    final List<Slider>? banner,
    @JsonKey(name: "filter_data", fromJson: _slidersFromJson)
    final List<Slider>? filterData,
    @JsonKey(name: "featured_product_total", fromJson: _toIntSafe)
    this.featuredProductTotal,
    @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe)
    this.totalBrandProds,
    @JsonKey(name: "cat_prods", fromJson: _productsFromJson)
    final List<Product>? brandProds,
    @JsonKey(name: "featured_products", fromJson: _productsFromJson)
    final List<Product>? featuredProducts,
    @JsonKey(name: "featured_category", fromJson: _featuredCategoriesFromJson)
    final List<BrandFeaturedCategory>? featuredCategory,
    @JsonKey(name: "brands", fromJson: _categoriesFromJson)
    final List<Category>? brands,
    @JsonKey(name: "sort_data", fromJson: _sortOptionsFromJson)
    final List<SortOption>? sortData,
    @JsonKey(name: "filterable_attributes", fromJson: _filterAttributesFromJson)
    final List<FilterAttribute>? filterableAttributes,
    @JsonKey(name: "applied_filters", fromJson: _appliedFiltersFromJson)
    final List<BrandAppliedFilter>? appliedFilters,
    @JsonKey(name: "category_discription") this.brandDiscription,
    @JsonKey(name: "cache_time") this.cacheTime,
  }) : _banner = banner,
       _filterData = filterData,
       _brandProds = brandProds,
       _featuredProducts = featuredProducts,
       _featuredCategory = featuredCategory,
       _brands = brands,
       _sortData = sortData,
       _filterableAttributes = filterableAttributes,
       _appliedFilters = appliedFilters;

  factory _$BrandProductsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandProductsResponseImplFromJson(json);

  @override
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  final int? brandId;
  @override
  @JsonKey(name: "category_slug")
  final String? brandSlug;
  @override
  @JsonKey(name: "category_name")
  final String? brandName;
  @override
  @JsonKey(name: "meta_title")
  final String? metaTitle;
  @override
  @JsonKey(name: "meta_keywords")
  final String? metaKeywords;
  @override
  @JsonKey(name: "meta_description")
  final String? metaDescription;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "mobile_image")
  final String? mobileImage;
  final List<Slider>? _banner;
  @override
  @JsonKey(name: "banner", fromJson: _slidersFromJson)
  List<Slider>? get banner {
    final value = _banner;
    if (value == null) return null;
    if (_banner is EqualUnmodifiableListView) return _banner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Slider>? _filterData;
  @override
  @JsonKey(name: "filter_data", fromJson: _slidersFromJson)
  List<Slider>? get filterData {
    final value = _filterData;
    if (value == null) return null;
    if (_filterData is EqualUnmodifiableListView) return _filterData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "featured_product_total", fromJson: _toIntSafe)
  final int? featuredProductTotal;
  @override
  @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe)
  final int? totalBrandProds;
  final List<Product>? _brandProds;
  @override
  @JsonKey(name: "cat_prods", fromJson: _productsFromJson)
  List<Product>? get brandProds {
    final value = _brandProds;
    if (value == null) return null;
    if (_brandProds is EqualUnmodifiableListView) return _brandProds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Product>? _featuredProducts;
  @override
  @JsonKey(name: "featured_products", fromJson: _productsFromJson)
  List<Product>? get featuredProducts {
    final value = _featuredProducts;
    if (value == null) return null;
    if (_featuredProducts is EqualUnmodifiableListView)
      return _featuredProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BrandFeaturedCategory>? _featuredCategory;
  @override
  @JsonKey(name: "featured_category", fromJson: _featuredCategoriesFromJson)
  List<BrandFeaturedCategory>? get featuredCategory {
    final value = _featuredCategory;
    if (value == null) return null;
    if (_featuredCategory is EqualUnmodifiableListView)
      return _featuredCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Category>? _brands;
  @override
  @JsonKey(name: "brands", fromJson: _categoriesFromJson)
  List<Category>? get brands {
    final value = _brands;
    if (value == null) return null;
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SortOption>? _sortData;
  @override
  @JsonKey(name: "sort_data", fromJson: _sortOptionsFromJson)
  List<SortOption>? get sortData {
    final value = _sortData;
    if (value == null) return null;
    if (_sortData is EqualUnmodifiableListView) return _sortData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FilterAttribute>? _filterableAttributes;
  @override
  @JsonKey(name: "filterable_attributes", fromJson: _filterAttributesFromJson)
  List<FilterAttribute>? get filterableAttributes {
    final value = _filterableAttributes;
    if (value == null) return null;
    if (_filterableAttributes is EqualUnmodifiableListView)
      return _filterableAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BrandAppliedFilter>? _appliedFilters;
  @override
  @JsonKey(name: "applied_filters", fromJson: _appliedFiltersFromJson)
  List<BrandAppliedFilter>? get appliedFilters {
    final value = _appliedFilters;
    if (value == null) return null;
    if (_appliedFilters is EqualUnmodifiableListView) return _appliedFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "category_discription")
  final String? brandDiscription;
  @override
  @JsonKey(name: "cache_time")
  final DateTime? cacheTime;

  @override
  String toString() {
    return 'BrandProductsResponse(brandId: $brandId, brandSlug: $brandSlug, brandName: $brandName, metaTitle: $metaTitle, metaKeywords: $metaKeywords, metaDescription: $metaDescription, image: $image, mobileImage: $mobileImage, banner: $banner, filterData: $filterData, featuredProductTotal: $featuredProductTotal, totalBrandProds: $totalBrandProds, brandProds: $brandProds, featuredProducts: $featuredProducts, featuredCategory: $featuredCategory, brands: $brands, sortData: $sortData, filterableAttributes: $filterableAttributes, appliedFilters: $appliedFilters, brandDiscription: $brandDiscription, cacheTime: $cacheTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandProductsResponseImpl &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.brandSlug, brandSlug) ||
                other.brandSlug == brandSlug) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.metaTitle, metaTitle) ||
                other.metaTitle == metaTitle) &&
            (identical(other.metaKeywords, metaKeywords) ||
                other.metaKeywords == metaKeywords) &&
            (identical(other.metaDescription, metaDescription) ||
                other.metaDescription == metaDescription) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.mobileImage, mobileImage) ||
                other.mobileImage == mobileImage) &&
            const DeepCollectionEquality().equals(other._banner, _banner) &&
            const DeepCollectionEquality().equals(
              other._filterData,
              _filterData,
            ) &&
            (identical(other.featuredProductTotal, featuredProductTotal) ||
                other.featuredProductTotal == featuredProductTotal) &&
            (identical(other.totalBrandProds, totalBrandProds) ||
                other.totalBrandProds == totalBrandProds) &&
            const DeepCollectionEquality().equals(
              other._brandProds,
              _brandProds,
            ) &&
            const DeepCollectionEquality().equals(
              other._featuredProducts,
              _featuredProducts,
            ) &&
            const DeepCollectionEquality().equals(
              other._featuredCategory,
              _featuredCategory,
            ) &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            const DeepCollectionEquality().equals(other._sortData, _sortData) &&
            const DeepCollectionEquality().equals(
              other._filterableAttributes,
              _filterableAttributes,
            ) &&
            const DeepCollectionEquality().equals(
              other._appliedFilters,
              _appliedFilters,
            ) &&
            (identical(other.brandDiscription, brandDiscription) ||
                other.brandDiscription == brandDiscription) &&
            (identical(other.cacheTime, cacheTime) ||
                other.cacheTime == cacheTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    brandId,
    brandSlug,
    brandName,
    metaTitle,
    metaKeywords,
    metaDescription,
    image,
    mobileImage,
    const DeepCollectionEquality().hash(_banner),
    const DeepCollectionEquality().hash(_filterData),
    featuredProductTotal,
    totalBrandProds,
    const DeepCollectionEquality().hash(_brandProds),
    const DeepCollectionEquality().hash(_featuredProducts),
    const DeepCollectionEquality().hash(_featuredCategory),
    const DeepCollectionEquality().hash(_brands),
    const DeepCollectionEquality().hash(_sortData),
    const DeepCollectionEquality().hash(_filterableAttributes),
    const DeepCollectionEquality().hash(_appliedFilters),
    brandDiscription,
    cacheTime,
  ]);

  /// Create a copy of BrandProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandProductsResponseImplCopyWith<_$BrandProductsResponseImpl>
  get copyWith =>
      __$$BrandProductsResponseImplCopyWithImpl<_$BrandProductsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandProductsResponseImplToJson(this);
  }
}

abstract class _BrandProductsResponse implements BrandProductsResponse {
  const factory _BrandProductsResponse({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) final int? brandId,
    @JsonKey(name: "category_slug") final String? brandSlug,
    @JsonKey(name: "category_name") final String? brandName,
    @JsonKey(name: "meta_title") final String? metaTitle,
    @JsonKey(name: "meta_keywords") final String? metaKeywords,
    @JsonKey(name: "meta_description") final String? metaDescription,
    @JsonKey(name: "image") final String? image,
    @JsonKey(name: "mobile_image") final String? mobileImage,
    @JsonKey(name: "banner", fromJson: _slidersFromJson)
    final List<Slider>? banner,
    @JsonKey(name: "filter_data", fromJson: _slidersFromJson)
    final List<Slider>? filterData,
    @JsonKey(name: "featured_product_total", fromJson: _toIntSafe)
    final int? featuredProductTotal,
    @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe)
    final int? totalBrandProds,
    @JsonKey(name: "cat_prods", fromJson: _productsFromJson)
    final List<Product>? brandProds,
    @JsonKey(name: "featured_products", fromJson: _productsFromJson)
    final List<Product>? featuredProducts,
    @JsonKey(name: "featured_category", fromJson: _featuredCategoriesFromJson)
    final List<BrandFeaturedCategory>? featuredCategory,
    @JsonKey(name: "brands", fromJson: _categoriesFromJson)
    final List<Category>? brands,
    @JsonKey(name: "sort_data", fromJson: _sortOptionsFromJson)
    final List<SortOption>? sortData,
    @JsonKey(name: "filterable_attributes", fromJson: _filterAttributesFromJson)
    final List<FilterAttribute>? filterableAttributes,
    @JsonKey(name: "applied_filters", fromJson: _appliedFiltersFromJson)
    final List<BrandAppliedFilter>? appliedFilters,
    @JsonKey(name: "category_discription") final String? brandDiscription,
    @JsonKey(name: "cache_time") final DateTime? cacheTime,
  }) = _$BrandProductsResponseImpl;

  factory _BrandProductsResponse.fromJson(Map<String, dynamic> json) =
      _$BrandProductsResponseImpl.fromJson;

  @override
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  int? get brandId;
  @override
  @JsonKey(name: "category_slug")
  String? get brandSlug;
  @override
  @JsonKey(name: "category_name")
  String? get brandName;
  @override
  @JsonKey(name: "meta_title")
  String? get metaTitle;
  @override
  @JsonKey(name: "meta_keywords")
  String? get metaKeywords;
  @override
  @JsonKey(name: "meta_description")
  String? get metaDescription;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "mobile_image")
  String? get mobileImage;
  @override
  @JsonKey(name: "banner", fromJson: _slidersFromJson)
  List<Slider>? get banner;
  @override
  @JsonKey(name: "filter_data", fromJson: _slidersFromJson)
  List<Slider>? get filterData;
  @override
  @JsonKey(name: "featured_product_total", fromJson: _toIntSafe)
  int? get featuredProductTotal;
  @override
  @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe)
  int? get totalBrandProds;
  @override
  @JsonKey(name: "cat_prods", fromJson: _productsFromJson)
  List<Product>? get brandProds;
  @override
  @JsonKey(name: "featured_products", fromJson: _productsFromJson)
  List<Product>? get featuredProducts;
  @override
  @JsonKey(name: "featured_category", fromJson: _featuredCategoriesFromJson)
  List<BrandFeaturedCategory>? get featuredCategory;
  @override
  @JsonKey(name: "brands", fromJson: _categoriesFromJson)
  List<Category>? get brands;
  @override
  @JsonKey(name: "sort_data", fromJson: _sortOptionsFromJson)
  List<SortOption>? get sortData;
  @override
  @JsonKey(name: "filterable_attributes", fromJson: _filterAttributesFromJson)
  List<FilterAttribute>? get filterableAttributes;
  @override
  @JsonKey(name: "applied_filters", fromJson: _appliedFiltersFromJson)
  List<BrandAppliedFilter>? get appliedFilters;
  @override
  @JsonKey(name: "category_discription")
  String? get brandDiscription;
  @override
  @JsonKey(name: "cache_time")
  DateTime? get cacheTime;

  /// Create a copy of BrandProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandProductsResponseImplCopyWith<_$BrandProductsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BrandAppliedFilter _$BrandAppliedFilterFromJson(Map<String, dynamic> json) {
  return _BrandAppliedFilter.fromJson(json);
}

/// @nodoc
mixin _$BrandAppliedFilter {
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "label")
  String? get label => throw _privateConstructorUsedError;
  @JsonKey(name: "value", fromJson: _toStringSafe)
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: "value_label", fromJson: _toStringSafe)
  String? get valueLabel => throw _privateConstructorUsedError;

  /// Serializes this BrandAppliedFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandAppliedFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandAppliedFilterCopyWith<BrandAppliedFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandAppliedFilterCopyWith<$Res> {
  factory $BrandAppliedFilterCopyWith(
    BrandAppliedFilter value,
    $Res Function(BrandAppliedFilter) then,
  ) = _$BrandAppliedFilterCopyWithImpl<$Res, BrandAppliedFilter>;
  @useResult
  $Res call({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "value", fromJson: _toStringSafe) String? value,
    @JsonKey(name: "value_label", fromJson: _toStringSafe) String? valueLabel,
  });
}

/// @nodoc
class _$BrandAppliedFilterCopyWithImpl<$Res, $Val extends BrandAppliedFilter>
    implements $BrandAppliedFilterCopyWith<$Res> {
  _$BrandAppliedFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandAppliedFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? label = freezed,
    Object? value = freezed,
    Object? valueLabel = freezed,
  }) {
    return _then(
      _value.copyWith(
            code:
                freezed == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as String?,
            label:
                freezed == label
                    ? _value.label
                    : label // ignore: cast_nullable_to_non_nullable
                        as String?,
            value:
                freezed == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String?,
            valueLabel:
                freezed == valueLabel
                    ? _value.valueLabel
                    : valueLabel // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BrandAppliedFilterImplCopyWith<$Res>
    implements $BrandAppliedFilterCopyWith<$Res> {
  factory _$$BrandAppliedFilterImplCopyWith(
    _$BrandAppliedFilterImpl value,
    $Res Function(_$BrandAppliedFilterImpl) then,
  ) = __$$BrandAppliedFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "value", fromJson: _toStringSafe) String? value,
    @JsonKey(name: "value_label", fromJson: _toStringSafe) String? valueLabel,
  });
}

/// @nodoc
class __$$BrandAppliedFilterImplCopyWithImpl<$Res>
    extends _$BrandAppliedFilterCopyWithImpl<$Res, _$BrandAppliedFilterImpl>
    implements _$$BrandAppliedFilterImplCopyWith<$Res> {
  __$$BrandAppliedFilterImplCopyWithImpl(
    _$BrandAppliedFilterImpl _value,
    $Res Function(_$BrandAppliedFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BrandAppliedFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? label = freezed,
    Object? value = freezed,
    Object? valueLabel = freezed,
  }) {
    return _then(
      _$BrandAppliedFilterImpl(
        code:
            freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                    as String?,
        label:
            freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                    as String?,
        value:
            freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String?,
        valueLabel:
            freezed == valueLabel
                ? _value.valueLabel
                : valueLabel // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandAppliedFilterImpl implements _BrandAppliedFilter {
  const _$BrandAppliedFilterImpl({
    @JsonKey(name: "code") this.code,
    @JsonKey(name: "label") this.label,
    @JsonKey(name: "value", fromJson: _toStringSafe) this.value,
    @JsonKey(name: "value_label", fromJson: _toStringSafe) this.valueLabel,
  });

  factory _$BrandAppliedFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandAppliedFilterImplFromJson(json);

  @override
  @JsonKey(name: "code")
  final String? code;
  @override
  @JsonKey(name: "label")
  final String? label;
  @override
  @JsonKey(name: "value", fromJson: _toStringSafe)
  final String? value;
  @override
  @JsonKey(name: "value_label", fromJson: _toStringSafe)
  final String? valueLabel;

  @override
  String toString() {
    return 'BrandAppliedFilter(code: $code, label: $label, value: $value, valueLabel: $valueLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandAppliedFilterImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.valueLabel, valueLabel) ||
                other.valueLabel == valueLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, label, value, valueLabel);

  /// Create a copy of BrandAppliedFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandAppliedFilterImplCopyWith<_$BrandAppliedFilterImpl> get copyWith =>
      __$$BrandAppliedFilterImplCopyWithImpl<_$BrandAppliedFilterImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandAppliedFilterImplToJson(this);
  }
}

abstract class _BrandAppliedFilter implements BrandAppliedFilter {
  const factory _BrandAppliedFilter({
    @JsonKey(name: "code") final String? code,
    @JsonKey(name: "label") final String? label,
    @JsonKey(name: "value", fromJson: _toStringSafe) final String? value,
    @JsonKey(name: "value_label", fromJson: _toStringSafe)
    final String? valueLabel,
  }) = _$BrandAppliedFilterImpl;

  factory _BrandAppliedFilter.fromJson(Map<String, dynamic> json) =
      _$BrandAppliedFilterImpl.fromJson;

  @override
  @JsonKey(name: "code")
  String? get code;
  @override
  @JsonKey(name: "label")
  String? get label;
  @override
  @JsonKey(name: "value", fromJson: _toStringSafe)
  String? get value;
  @override
  @JsonKey(name: "value_label", fromJson: _toStringSafe)
  String? get valueLabel;

  /// Create a copy of BrandAppliedFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandAppliedFilterImplCopyWith<_$BrandAppliedFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrandFeaturedCategory _$BrandFeaturedCategoryFromJson(
  Map<String, dynamic> json,
) {
  return _BrandFeaturedCategory.fromJson(json);
}

/// @nodoc
mixin _$BrandFeaturedCategory {
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "category_name")
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "products")
  List<Product>? get products => throw _privateConstructorUsedError;

  /// Serializes this BrandFeaturedCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandFeaturedCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandFeaturedCategoryCopyWith<BrandFeaturedCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandFeaturedCategoryCopyWith<$Res> {
  factory $BrandFeaturedCategoryCopyWith(
    BrandFeaturedCategory value,
    $Res Function(BrandFeaturedCategory) then,
  ) = _$BrandFeaturedCategoryCopyWithImpl<$Res, BrandFeaturedCategory>;
  @useResult
  $Res call({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) int? categoryId,
    @JsonKey(name: "category_name") String? categoryName,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "products") List<Product>? products,
  });
}

/// @nodoc
class _$BrandFeaturedCategoryCopyWithImpl<
  $Res,
  $Val extends BrandFeaturedCategory
>
    implements $BrandFeaturedCategoryCopyWith<$Res> {
  _$BrandFeaturedCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandFeaturedCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? slug = freezed,
    Object? products = freezed,
  }) {
    return _then(
      _value.copyWith(
            categoryId:
                freezed == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as int?,
            categoryName:
                freezed == categoryName
                    ? _value.categoryName
                    : categoryName // ignore: cast_nullable_to_non_nullable
                        as String?,
            slug:
                freezed == slug
                    ? _value.slug
                    : slug // ignore: cast_nullable_to_non_nullable
                        as String?,
            products:
                freezed == products
                    ? _value.products
                    : products // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BrandFeaturedCategoryImplCopyWith<$Res>
    implements $BrandFeaturedCategoryCopyWith<$Res> {
  factory _$$BrandFeaturedCategoryImplCopyWith(
    _$BrandFeaturedCategoryImpl value,
    $Res Function(_$BrandFeaturedCategoryImpl) then,
  ) = __$$BrandFeaturedCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) int? categoryId,
    @JsonKey(name: "category_name") String? categoryName,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "products") List<Product>? products,
  });
}

/// @nodoc
class __$$BrandFeaturedCategoryImplCopyWithImpl<$Res>
    extends
        _$BrandFeaturedCategoryCopyWithImpl<$Res, _$BrandFeaturedCategoryImpl>
    implements _$$BrandFeaturedCategoryImplCopyWith<$Res> {
  __$$BrandFeaturedCategoryImplCopyWithImpl(
    _$BrandFeaturedCategoryImpl _value,
    $Res Function(_$BrandFeaturedCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BrandFeaturedCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? slug = freezed,
    Object? products = freezed,
  }) {
    return _then(
      _$BrandFeaturedCategoryImpl(
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as int?,
        categoryName:
            freezed == categoryName
                ? _value.categoryName
                : categoryName // ignore: cast_nullable_to_non_nullable
                    as String?,
        slug:
            freezed == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                    as String?,
        products:
            freezed == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandFeaturedCategoryImpl implements _BrandFeaturedCategory {
  const _$BrandFeaturedCategoryImpl({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) this.categoryId,
    @JsonKey(name: "category_name") this.categoryName,
    @JsonKey(name: "slug") this.slug,
    @JsonKey(name: "products") final List<Product>? products,
  }) : _products = products;

  factory _$BrandFeaturedCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandFeaturedCategoryImplFromJson(json);

  @override
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  final int? categoryId;
  @override
  @JsonKey(name: "category_name")
  final String? categoryName;
  @override
  @JsonKey(name: "slug")
  final String? slug;
  final List<Product>? _products;
  @override
  @JsonKey(name: "products")
  List<Product>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BrandFeaturedCategory(categoryId: $categoryId, categoryName: $categoryName, slug: $slug, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandFeaturedCategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categoryName,
    slug,
    const DeepCollectionEquality().hash(_products),
  );

  /// Create a copy of BrandFeaturedCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandFeaturedCategoryImplCopyWith<_$BrandFeaturedCategoryImpl>
  get copyWith =>
      __$$BrandFeaturedCategoryImplCopyWithImpl<_$BrandFeaturedCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandFeaturedCategoryImplToJson(this);
  }
}

abstract class _BrandFeaturedCategory implements BrandFeaturedCategory {
  const factory _BrandFeaturedCategory({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) final int? categoryId,
    @JsonKey(name: "category_name") final String? categoryName,
    @JsonKey(name: "slug") final String? slug,
    @JsonKey(name: "products") final List<Product>? products,
  }) = _$BrandFeaturedCategoryImpl;

  factory _BrandFeaturedCategory.fromJson(Map<String, dynamic> json) =
      _$BrandFeaturedCategoryImpl.fromJson;

  @override
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  int? get categoryId;
  @override
  @JsonKey(name: "category_name")
  String? get categoryName;
  @override
  @JsonKey(name: "slug")
  String? get slug;
  @override
  @JsonKey(name: "products")
  List<Product>? get products;

  /// Create a copy of BrandFeaturedCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandFeaturedCategoryImplCopyWith<_$BrandFeaturedCategoryImpl>
  get copyWith => throw _privateConstructorUsedError;
}
