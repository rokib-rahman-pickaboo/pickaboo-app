// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_products_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryProductsResponse _$CategoryProductsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CategoryProductsResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryProductsResponse {
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "category_slug")
  String? get categorySlug => throw _privateConstructorUsedError;
  @JsonKey(name: "category_name")
  String? get categoryName => throw _privateConstructorUsedError;
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
  @JsonKey(name: "banner")
  List<Slider>? get banner => throw _privateConstructorUsedError;
  @JsonKey(name: "filter_data")
  List<Slider>? get filterData => throw _privateConstructorUsedError;
  @JsonKey(name: "featured_product_total", fromJson: _toIntSafe)
  int? get featuredProductTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe)
  int? get totalCatProds => throw _privateConstructorUsedError;
  @JsonKey(name: "cat_prods")
  List<Product>? get catProds => throw _privateConstructorUsedError;
  @JsonKey(name: "featured_products")
  List<Product>? get featuredProducts => throw _privateConstructorUsedError;
  @JsonKey(name: "featured_category")
  List<FeaturedCategory>? get featuredCategory =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "brands")
  List<Category>? get brands => throw _privateConstructorUsedError;
  @JsonKey(name: "sort_data")
  List<SortOption>? get sortData => throw _privateConstructorUsedError;
  @JsonKey(name: "filterable_attributes")
  List<FilterAttribute>? get filterableAttributes =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "applied_filters")
  List<AppliedFilter>? get appliedFilters => throw _privateConstructorUsedError;
  @JsonKey(name: "category_discription")
  String? get categoryDiscription => throw _privateConstructorUsedError;
  @JsonKey(name: "cache_time")
  DateTime? get cacheTime => throw _privateConstructorUsedError;

  /// Serializes this CategoryProductsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryProductsResponseCopyWith<CategoryProductsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryProductsResponseCopyWith<$Res> {
  factory $CategoryProductsResponseCopyWith(
    CategoryProductsResponse value,
    $Res Function(CategoryProductsResponse) then,
  ) = _$CategoryProductsResponseCopyWithImpl<$Res, CategoryProductsResponse>;
  @useResult
  $Res call({
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
    @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe) int? totalCatProds,
    @JsonKey(name: "cat_prods") List<Product>? catProds,
    @JsonKey(name: "featured_products") List<Product>? featuredProducts,
    @JsonKey(name: "featured_category")
    List<FeaturedCategory>? featuredCategory,
    @JsonKey(name: "brands") List<Category>? brands,
    @JsonKey(name: "sort_data") List<SortOption>? sortData,
    @JsonKey(name: "filterable_attributes")
    List<FilterAttribute>? filterableAttributes,
    @JsonKey(name: "applied_filters") List<AppliedFilter>? appliedFilters,
    @JsonKey(name: "category_discription") String? categoryDiscription,
    @JsonKey(name: "cache_time") DateTime? cacheTime,
  });
}

/// @nodoc
class _$CategoryProductsResponseCopyWithImpl<
  $Res,
  $Val extends CategoryProductsResponse
>
    implements $CategoryProductsResponseCopyWith<$Res> {
  _$CategoryProductsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categorySlug = freezed,
    Object? categoryName = freezed,
    Object? metaTitle = freezed,
    Object? metaKeywords = freezed,
    Object? metaDescription = freezed,
    Object? image = freezed,
    Object? mobileImage = freezed,
    Object? banner = freezed,
    Object? filterData = freezed,
    Object? featuredProductTotal = freezed,
    Object? totalCatProds = freezed,
    Object? catProds = freezed,
    Object? featuredProducts = freezed,
    Object? featuredCategory = freezed,
    Object? brands = freezed,
    Object? sortData = freezed,
    Object? filterableAttributes = freezed,
    Object? appliedFilters = freezed,
    Object? categoryDiscription = freezed,
    Object? cacheTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            categoryId:
                freezed == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as int?,
            categorySlug:
                freezed == categorySlug
                    ? _value.categorySlug
                    : categorySlug // ignore: cast_nullable_to_non_nullable
                        as String?,
            categoryName:
                freezed == categoryName
                    ? _value.categoryName
                    : categoryName // ignore: cast_nullable_to_non_nullable
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
            totalCatProds:
                freezed == totalCatProds
                    ? _value.totalCatProds
                    : totalCatProds // ignore: cast_nullable_to_non_nullable
                        as int?,
            catProds:
                freezed == catProds
                    ? _value.catProds
                    : catProds // ignore: cast_nullable_to_non_nullable
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
                        as List<FeaturedCategory>?,
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
                        as List<AppliedFilter>?,
            categoryDiscription:
                freezed == categoryDiscription
                    ? _value.categoryDiscription
                    : categoryDiscription // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CategoryProductsResponseImplCopyWith<$Res>
    implements $CategoryProductsResponseCopyWith<$Res> {
  factory _$$CategoryProductsResponseImplCopyWith(
    _$CategoryProductsResponseImpl value,
    $Res Function(_$CategoryProductsResponseImpl) then,
  ) = __$$CategoryProductsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
    @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe) int? totalCatProds,
    @JsonKey(name: "cat_prods") List<Product>? catProds,
    @JsonKey(name: "featured_products") List<Product>? featuredProducts,
    @JsonKey(name: "featured_category")
    List<FeaturedCategory>? featuredCategory,
    @JsonKey(name: "brands") List<Category>? brands,
    @JsonKey(name: "sort_data") List<SortOption>? sortData,
    @JsonKey(name: "filterable_attributes")
    List<FilterAttribute>? filterableAttributes,
    @JsonKey(name: "applied_filters") List<AppliedFilter>? appliedFilters,
    @JsonKey(name: "category_discription") String? categoryDiscription,
    @JsonKey(name: "cache_time") DateTime? cacheTime,
  });
}

/// @nodoc
class __$$CategoryProductsResponseImplCopyWithImpl<$Res>
    extends
        _$CategoryProductsResponseCopyWithImpl<
          $Res,
          _$CategoryProductsResponseImpl
        >
    implements _$$CategoryProductsResponseImplCopyWith<$Res> {
  __$$CategoryProductsResponseImplCopyWithImpl(
    _$CategoryProductsResponseImpl _value,
    $Res Function(_$CategoryProductsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categorySlug = freezed,
    Object? categoryName = freezed,
    Object? metaTitle = freezed,
    Object? metaKeywords = freezed,
    Object? metaDescription = freezed,
    Object? image = freezed,
    Object? mobileImage = freezed,
    Object? banner = freezed,
    Object? filterData = freezed,
    Object? featuredProductTotal = freezed,
    Object? totalCatProds = freezed,
    Object? catProds = freezed,
    Object? featuredProducts = freezed,
    Object? featuredCategory = freezed,
    Object? brands = freezed,
    Object? sortData = freezed,
    Object? filterableAttributes = freezed,
    Object? appliedFilters = freezed,
    Object? categoryDiscription = freezed,
    Object? cacheTime = freezed,
  }) {
    return _then(
      _$CategoryProductsResponseImpl(
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as int?,
        categorySlug:
            freezed == categorySlug
                ? _value.categorySlug
                : categorySlug // ignore: cast_nullable_to_non_nullable
                    as String?,
        categoryName:
            freezed == categoryName
                ? _value.categoryName
                : categoryName // ignore: cast_nullable_to_non_nullable
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
        totalCatProds:
            freezed == totalCatProds
                ? _value.totalCatProds
                : totalCatProds // ignore: cast_nullable_to_non_nullable
                    as int?,
        catProds:
            freezed == catProds
                ? _value._catProds
                : catProds // ignore: cast_nullable_to_non_nullable
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
                    as List<FeaturedCategory>?,
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
                    as List<AppliedFilter>?,
        categoryDiscription:
            freezed == categoryDiscription
                ? _value.categoryDiscription
                : categoryDiscription // ignore: cast_nullable_to_non_nullable
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
class _$CategoryProductsResponseImpl implements _CategoryProductsResponse {
  const _$CategoryProductsResponseImpl({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) this.categoryId,
    @JsonKey(name: "category_slug") this.categorySlug,
    @JsonKey(name: "category_name") this.categoryName,
    @JsonKey(name: "meta_title") this.metaTitle,
    @JsonKey(name: "meta_keywords") this.metaKeywords,
    @JsonKey(name: "meta_description") this.metaDescription,
    @JsonKey(name: "image") this.image,
    @JsonKey(name: "mobile_image") this.mobileImage,
    @JsonKey(name: "banner") final List<Slider>? banner,
    @JsonKey(name: "filter_data") final List<Slider>? filterData,
    @JsonKey(name: "featured_product_total", fromJson: _toIntSafe)
    this.featuredProductTotal,
    @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe) this.totalCatProds,
    @JsonKey(name: "cat_prods") final List<Product>? catProds,
    @JsonKey(name: "featured_products") final List<Product>? featuredProducts,
    @JsonKey(name: "featured_category")
    final List<FeaturedCategory>? featuredCategory,
    @JsonKey(name: "brands") final List<Category>? brands,
    @JsonKey(name: "sort_data") final List<SortOption>? sortData,
    @JsonKey(name: "filterable_attributes")
    final List<FilterAttribute>? filterableAttributes,
    @JsonKey(name: "applied_filters") final List<AppliedFilter>? appliedFilters,
    @JsonKey(name: "category_discription") this.categoryDiscription,
    @JsonKey(name: "cache_time") this.cacheTime,
  }) : _banner = banner,
       _filterData = filterData,
       _catProds = catProds,
       _featuredProducts = featuredProducts,
       _featuredCategory = featuredCategory,
       _brands = brands,
       _sortData = sortData,
       _filterableAttributes = filterableAttributes,
       _appliedFilters = appliedFilters;

  factory _$CategoryProductsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryProductsResponseImplFromJson(json);

  @override
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  final int? categoryId;
  @override
  @JsonKey(name: "category_slug")
  final String? categorySlug;
  @override
  @JsonKey(name: "category_name")
  final String? categoryName;
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
  @JsonKey(name: "banner")
  List<Slider>? get banner {
    final value = _banner;
    if (value == null) return null;
    if (_banner is EqualUnmodifiableListView) return _banner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Slider>? _filterData;
  @override
  @JsonKey(name: "filter_data")
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
  final int? totalCatProds;
  final List<Product>? _catProds;
  @override
  @JsonKey(name: "cat_prods")
  List<Product>? get catProds {
    final value = _catProds;
    if (value == null) return null;
    if (_catProds is EqualUnmodifiableListView) return _catProds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Product>? _featuredProducts;
  @override
  @JsonKey(name: "featured_products")
  List<Product>? get featuredProducts {
    final value = _featuredProducts;
    if (value == null) return null;
    if (_featuredProducts is EqualUnmodifiableListView)
      return _featuredProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FeaturedCategory>? _featuredCategory;
  @override
  @JsonKey(name: "featured_category")
  List<FeaturedCategory>? get featuredCategory {
    final value = _featuredCategory;
    if (value == null) return null;
    if (_featuredCategory is EqualUnmodifiableListView)
      return _featuredCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Category>? _brands;
  @override
  @JsonKey(name: "brands")
  List<Category>? get brands {
    final value = _brands;
    if (value == null) return null;
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SortOption>? _sortData;
  @override
  @JsonKey(name: "sort_data")
  List<SortOption>? get sortData {
    final value = _sortData;
    if (value == null) return null;
    if (_sortData is EqualUnmodifiableListView) return _sortData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FilterAttribute>? _filterableAttributes;
  @override
  @JsonKey(name: "filterable_attributes")
  List<FilterAttribute>? get filterableAttributes {
    final value = _filterableAttributes;
    if (value == null) return null;
    if (_filterableAttributes is EqualUnmodifiableListView)
      return _filterableAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AppliedFilter>? _appliedFilters;
  @override
  @JsonKey(name: "applied_filters")
  List<AppliedFilter>? get appliedFilters {
    final value = _appliedFilters;
    if (value == null) return null;
    if (_appliedFilters is EqualUnmodifiableListView) return _appliedFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "category_discription")
  final String? categoryDiscription;
  @override
  @JsonKey(name: "cache_time")
  final DateTime? cacheTime;

  @override
  String toString() {
    return 'CategoryProductsResponse(categoryId: $categoryId, categorySlug: $categorySlug, categoryName: $categoryName, metaTitle: $metaTitle, metaKeywords: $metaKeywords, metaDescription: $metaDescription, image: $image, mobileImage: $mobileImage, banner: $banner, filterData: $filterData, featuredProductTotal: $featuredProductTotal, totalCatProds: $totalCatProds, catProds: $catProds, featuredProducts: $featuredProducts, featuredCategory: $featuredCategory, brands: $brands, sortData: $sortData, filterableAttributes: $filterableAttributes, appliedFilters: $appliedFilters, categoryDiscription: $categoryDiscription, cacheTime: $cacheTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryProductsResponseImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
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
            (identical(other.totalCatProds, totalCatProds) ||
                other.totalCatProds == totalCatProds) &&
            const DeepCollectionEquality().equals(other._catProds, _catProds) &&
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
            (identical(other.categoryDiscription, categoryDiscription) ||
                other.categoryDiscription == categoryDiscription) &&
            (identical(other.cacheTime, cacheTime) ||
                other.cacheTime == cacheTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    categoryId,
    categorySlug,
    categoryName,
    metaTitle,
    metaKeywords,
    metaDescription,
    image,
    mobileImage,
    const DeepCollectionEquality().hash(_banner),
    const DeepCollectionEquality().hash(_filterData),
    featuredProductTotal,
    totalCatProds,
    const DeepCollectionEquality().hash(_catProds),
    const DeepCollectionEquality().hash(_featuredProducts),
    const DeepCollectionEquality().hash(_featuredCategory),
    const DeepCollectionEquality().hash(_brands),
    const DeepCollectionEquality().hash(_sortData),
    const DeepCollectionEquality().hash(_filterableAttributes),
    const DeepCollectionEquality().hash(_appliedFilters),
    categoryDiscription,
    cacheTime,
  ]);

  /// Create a copy of CategoryProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryProductsResponseImplCopyWith<_$CategoryProductsResponseImpl>
  get copyWith => __$$CategoryProductsResponseImplCopyWithImpl<
    _$CategoryProductsResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryProductsResponseImplToJson(this);
  }
}

abstract class _CategoryProductsResponse implements CategoryProductsResponse {
  const factory _CategoryProductsResponse({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) final int? categoryId,
    @JsonKey(name: "category_slug") final String? categorySlug,
    @JsonKey(name: "category_name") final String? categoryName,
    @JsonKey(name: "meta_title") final String? metaTitle,
    @JsonKey(name: "meta_keywords") final String? metaKeywords,
    @JsonKey(name: "meta_description") final String? metaDescription,
    @JsonKey(name: "image") final String? image,
    @JsonKey(name: "mobile_image") final String? mobileImage,
    @JsonKey(name: "banner") final List<Slider>? banner,
    @JsonKey(name: "filter_data") final List<Slider>? filterData,
    @JsonKey(name: "featured_product_total", fromJson: _toIntSafe)
    final int? featuredProductTotal,
    @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe)
    final int? totalCatProds,
    @JsonKey(name: "cat_prods") final List<Product>? catProds,
    @JsonKey(name: "featured_products") final List<Product>? featuredProducts,
    @JsonKey(name: "featured_category")
    final List<FeaturedCategory>? featuredCategory,
    @JsonKey(name: "brands") final List<Category>? brands,
    @JsonKey(name: "sort_data") final List<SortOption>? sortData,
    @JsonKey(name: "filterable_attributes")
    final List<FilterAttribute>? filterableAttributes,
    @JsonKey(name: "applied_filters") final List<AppliedFilter>? appliedFilters,
    @JsonKey(name: "category_discription") final String? categoryDiscription,
    @JsonKey(name: "cache_time") final DateTime? cacheTime,
  }) = _$CategoryProductsResponseImpl;

  factory _CategoryProductsResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryProductsResponseImpl.fromJson;

  @override
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  int? get categoryId;
  @override
  @JsonKey(name: "category_slug")
  String? get categorySlug;
  @override
  @JsonKey(name: "category_name")
  String? get categoryName;
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
  @JsonKey(name: "banner")
  List<Slider>? get banner;
  @override
  @JsonKey(name: "filter_data")
  List<Slider>? get filterData;
  @override
  @JsonKey(name: "featured_product_total", fromJson: _toIntSafe)
  int? get featuredProductTotal;
  @override
  @JsonKey(name: "total_cat_prods", fromJson: _toIntSafe)
  int? get totalCatProds;
  @override
  @JsonKey(name: "cat_prods")
  List<Product>? get catProds;
  @override
  @JsonKey(name: "featured_products")
  List<Product>? get featuredProducts;
  @override
  @JsonKey(name: "featured_category")
  List<FeaturedCategory>? get featuredCategory;
  @override
  @JsonKey(name: "brands")
  List<Category>? get brands;
  @override
  @JsonKey(name: "sort_data")
  List<SortOption>? get sortData;
  @override
  @JsonKey(name: "filterable_attributes")
  List<FilterAttribute>? get filterableAttributes;
  @override
  @JsonKey(name: "applied_filters")
  List<AppliedFilter>? get appliedFilters;
  @override
  @JsonKey(name: "category_discription")
  String? get categoryDiscription;
  @override
  @JsonKey(name: "cache_time")
  DateTime? get cacheTime;

  /// Create a copy of CategoryProductsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryProductsResponseImplCopyWith<_$CategoryProductsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AppliedFilter _$AppliedFilterFromJson(Map<String, dynamic> json) {
  return _AppliedFilter.fromJson(json);
}

/// @nodoc
mixin _$AppliedFilter {
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "label")
  String? get label => throw _privateConstructorUsedError;
  @JsonKey(name: "value", fromJson: _toStringSafe)
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: "value_label", fromJson: _toStringSafe)
  String? get valueLabel => throw _privateConstructorUsedError;

  /// Serializes this AppliedFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppliedFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppliedFilterCopyWith<AppliedFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppliedFilterCopyWith<$Res> {
  factory $AppliedFilterCopyWith(
    AppliedFilter value,
    $Res Function(AppliedFilter) then,
  ) = _$AppliedFilterCopyWithImpl<$Res, AppliedFilter>;
  @useResult
  $Res call({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "value", fromJson: _toStringSafe) String? value,
    @JsonKey(name: "value_label", fromJson: _toStringSafe) String? valueLabel,
  });
}

/// @nodoc
class _$AppliedFilterCopyWithImpl<$Res, $Val extends AppliedFilter>
    implements $AppliedFilterCopyWith<$Res> {
  _$AppliedFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppliedFilter
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
abstract class _$$AppliedFilterImplCopyWith<$Res>
    implements $AppliedFilterCopyWith<$Res> {
  factory _$$AppliedFilterImplCopyWith(
    _$AppliedFilterImpl value,
    $Res Function(_$AppliedFilterImpl) then,
  ) = __$$AppliedFilterImplCopyWithImpl<$Res>;
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
class __$$AppliedFilterImplCopyWithImpl<$Res>
    extends _$AppliedFilterCopyWithImpl<$Res, _$AppliedFilterImpl>
    implements _$$AppliedFilterImplCopyWith<$Res> {
  __$$AppliedFilterImplCopyWithImpl(
    _$AppliedFilterImpl _value,
    $Res Function(_$AppliedFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppliedFilter
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
      _$AppliedFilterImpl(
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
class _$AppliedFilterImpl implements _AppliedFilter {
  const _$AppliedFilterImpl({
    @JsonKey(name: "code") this.code,
    @JsonKey(name: "label") this.label,
    @JsonKey(name: "value", fromJson: _toStringSafe) this.value,
    @JsonKey(name: "value_label", fromJson: _toStringSafe) this.valueLabel,
  });

  factory _$AppliedFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppliedFilterImplFromJson(json);

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
    return 'AppliedFilter(code: $code, label: $label, value: $value, valueLabel: $valueLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppliedFilterImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.valueLabel, valueLabel) ||
                other.valueLabel == valueLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, label, value, valueLabel);

  /// Create a copy of AppliedFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppliedFilterImplCopyWith<_$AppliedFilterImpl> get copyWith =>
      __$$AppliedFilterImplCopyWithImpl<_$AppliedFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppliedFilterImplToJson(this);
  }
}

abstract class _AppliedFilter implements AppliedFilter {
  const factory _AppliedFilter({
    @JsonKey(name: "code") final String? code,
    @JsonKey(name: "label") final String? label,
    @JsonKey(name: "value", fromJson: _toStringSafe) final String? value,
    @JsonKey(name: "value_label", fromJson: _toStringSafe)
    final String? valueLabel,
  }) = _$AppliedFilterImpl;

  factory _AppliedFilter.fromJson(Map<String, dynamic> json) =
      _$AppliedFilterImpl.fromJson;

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

  /// Create a copy of AppliedFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppliedFilterImplCopyWith<_$AppliedFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeaturedCategory _$FeaturedCategoryFromJson(Map<String, dynamic> json) {
  return _FeaturedCategory.fromJson(json);
}

/// @nodoc
mixin _$FeaturedCategory {
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "category_name")
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "products")
  List<Product>? get products => throw _privateConstructorUsedError;

  /// Serializes this FeaturedCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeaturedCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeaturedCategoryCopyWith<FeaturedCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturedCategoryCopyWith<$Res> {
  factory $FeaturedCategoryCopyWith(
    FeaturedCategory value,
    $Res Function(FeaturedCategory) then,
  ) = _$FeaturedCategoryCopyWithImpl<$Res, FeaturedCategory>;
  @useResult
  $Res call({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) int? categoryId,
    @JsonKey(name: "category_name") String? categoryName,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "products") List<Product>? products,
  });
}

/// @nodoc
class _$FeaturedCategoryCopyWithImpl<$Res, $Val extends FeaturedCategory>
    implements $FeaturedCategoryCopyWith<$Res> {
  _$FeaturedCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeaturedCategory
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
abstract class _$$FeaturedCategoryImplCopyWith<$Res>
    implements $FeaturedCategoryCopyWith<$Res> {
  factory _$$FeaturedCategoryImplCopyWith(
    _$FeaturedCategoryImpl value,
    $Res Function(_$FeaturedCategoryImpl) then,
  ) = __$$FeaturedCategoryImplCopyWithImpl<$Res>;
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
class __$$FeaturedCategoryImplCopyWithImpl<$Res>
    extends _$FeaturedCategoryCopyWithImpl<$Res, _$FeaturedCategoryImpl>
    implements _$$FeaturedCategoryImplCopyWith<$Res> {
  __$$FeaturedCategoryImplCopyWithImpl(
    _$FeaturedCategoryImpl _value,
    $Res Function(_$FeaturedCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeaturedCategory
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
      _$FeaturedCategoryImpl(
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
class _$FeaturedCategoryImpl implements _FeaturedCategory {
  const _$FeaturedCategoryImpl({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) this.categoryId,
    @JsonKey(name: "category_name") this.categoryName,
    @JsonKey(name: "slug") this.slug,
    @JsonKey(name: "products") final List<Product>? products,
  }) : _products = products;

  factory _$FeaturedCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeaturedCategoryImplFromJson(json);

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
    return 'FeaturedCategory(categoryId: $categoryId, categoryName: $categoryName, slug: $slug, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeaturedCategoryImpl &&
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

  /// Create a copy of FeaturedCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeaturedCategoryImplCopyWith<_$FeaturedCategoryImpl> get copyWith =>
      __$$FeaturedCategoryImplCopyWithImpl<_$FeaturedCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FeaturedCategoryImplToJson(this);
  }
}

abstract class _FeaturedCategory implements FeaturedCategory {
  const factory _FeaturedCategory({
    @JsonKey(name: "category_id", fromJson: _toIntSafe) final int? categoryId,
    @JsonKey(name: "category_name") final String? categoryName,
    @JsonKey(name: "slug") final String? slug,
    @JsonKey(name: "products") final List<Product>? products,
  }) = _$FeaturedCategoryImpl;

  factory _FeaturedCategory.fromJson(Map<String, dynamic> json) =
      _$FeaturedCategoryImpl.fromJson;

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

  /// Create a copy of FeaturedCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeaturedCategoryImplCopyWith<_$FeaturedCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
