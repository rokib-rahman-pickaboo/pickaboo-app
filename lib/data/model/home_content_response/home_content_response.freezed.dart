// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_content_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HomeContentResponse _$HomeContentResponseFromJson(Map<String, dynamic> json) {
  return _HomeContentResponse.fromJson(json);
}

/// @nodoc
mixin _$HomeContentResponse {
  @HiveField(0)
  @JsonKey(name: "category_list")
  List<Category>? get categoryList => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "main_slider")
  List<Slider>? get mainSlider => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "common_link_slider")
  List<Slider>? get commonLinkSlider => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "category_slider")
  List<CategorySlider>? get categorySlider =>
      throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "category_products")
  List<CategoryProduct>? get categoryProducts =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: "just_for_you")
  JustForYou? get justForYou => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: "cache_time")
  DateTime? get cacheTime => throw _privateConstructorUsedError;

  /// Serializes this HomeContentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeContentResponseCopyWith<HomeContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeContentResponseCopyWith<$Res> {
  factory $HomeContentResponseCopyWith(
    HomeContentResponse value,
    $Res Function(HomeContentResponse) then,
  ) = _$HomeContentResponseCopyWithImpl<$Res, HomeContentResponse>;
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "category_list") List<Category>? categoryList,
    @HiveField(1) @JsonKey(name: "main_slider") List<Slider>? mainSlider,
    @HiveField(2)
    @JsonKey(name: "common_link_slider")
    List<Slider>? commonLinkSlider,
    @HiveField(3)
    @JsonKey(name: "category_slider")
    List<CategorySlider>? categorySlider,
    @HiveField(4)
    @JsonKey(name: "category_products")
    List<CategoryProduct>? categoryProducts,
    @HiveField(5) @JsonKey(name: "just_for_you") JustForYou? justForYou,
    @HiveField(6) @JsonKey(name: "cache_time") DateTime? cacheTime,
  });

  $JustForYouCopyWith<$Res>? get justForYou;
}

/// @nodoc
class _$HomeContentResponseCopyWithImpl<$Res, $Val extends HomeContentResponse>
    implements $HomeContentResponseCopyWith<$Res> {
  _$HomeContentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryList = freezed,
    Object? mainSlider = freezed,
    Object? commonLinkSlider = freezed,
    Object? categorySlider = freezed,
    Object? categoryProducts = freezed,
    Object? justForYou = freezed,
    Object? cacheTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            categoryList:
                freezed == categoryList
                    ? _value.categoryList
                    : categoryList // ignore: cast_nullable_to_non_nullable
                        as List<Category>?,
            mainSlider:
                freezed == mainSlider
                    ? _value.mainSlider
                    : mainSlider // ignore: cast_nullable_to_non_nullable
                        as List<Slider>?,
            commonLinkSlider:
                freezed == commonLinkSlider
                    ? _value.commonLinkSlider
                    : commonLinkSlider // ignore: cast_nullable_to_non_nullable
                        as List<Slider>?,
            categorySlider:
                freezed == categorySlider
                    ? _value.categorySlider
                    : categorySlider // ignore: cast_nullable_to_non_nullable
                        as List<CategorySlider>?,
            categoryProducts:
                freezed == categoryProducts
                    ? _value.categoryProducts
                    : categoryProducts // ignore: cast_nullable_to_non_nullable
                        as List<CategoryProduct>?,
            justForYou:
                freezed == justForYou
                    ? _value.justForYou
                    : justForYou // ignore: cast_nullable_to_non_nullable
                        as JustForYou?,
            cacheTime:
                freezed == cacheTime
                    ? _value.cacheTime
                    : cacheTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JustForYouCopyWith<$Res>? get justForYou {
    if (_value.justForYou == null) {
      return null;
    }

    return $JustForYouCopyWith<$Res>(_value.justForYou!, (value) {
      return _then(_value.copyWith(justForYou: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeContentResponseImplCopyWith<$Res>
    implements $HomeContentResponseCopyWith<$Res> {
  factory _$$HomeContentResponseImplCopyWith(
    _$HomeContentResponseImpl value,
    $Res Function(_$HomeContentResponseImpl) then,
  ) = __$$HomeContentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "category_list") List<Category>? categoryList,
    @HiveField(1) @JsonKey(name: "main_slider") List<Slider>? mainSlider,
    @HiveField(2)
    @JsonKey(name: "common_link_slider")
    List<Slider>? commonLinkSlider,
    @HiveField(3)
    @JsonKey(name: "category_slider")
    List<CategorySlider>? categorySlider,
    @HiveField(4)
    @JsonKey(name: "category_products")
    List<CategoryProduct>? categoryProducts,
    @HiveField(5) @JsonKey(name: "just_for_you") JustForYou? justForYou,
    @HiveField(6) @JsonKey(name: "cache_time") DateTime? cacheTime,
  });

  @override
  $JustForYouCopyWith<$Res>? get justForYou;
}

/// @nodoc
class __$$HomeContentResponseImplCopyWithImpl<$Res>
    extends _$HomeContentResponseCopyWithImpl<$Res, _$HomeContentResponseImpl>
    implements _$$HomeContentResponseImplCopyWith<$Res> {
  __$$HomeContentResponseImplCopyWithImpl(
    _$HomeContentResponseImpl _value,
    $Res Function(_$HomeContentResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryList = freezed,
    Object? mainSlider = freezed,
    Object? commonLinkSlider = freezed,
    Object? categorySlider = freezed,
    Object? categoryProducts = freezed,
    Object? justForYou = freezed,
    Object? cacheTime = freezed,
  }) {
    return _then(
      _$HomeContentResponseImpl(
        categoryList:
            freezed == categoryList
                ? _value._categoryList
                : categoryList // ignore: cast_nullable_to_non_nullable
                    as List<Category>?,
        mainSlider:
            freezed == mainSlider
                ? _value._mainSlider
                : mainSlider // ignore: cast_nullable_to_non_nullable
                    as List<Slider>?,
        commonLinkSlider:
            freezed == commonLinkSlider
                ? _value._commonLinkSlider
                : commonLinkSlider // ignore: cast_nullable_to_non_nullable
                    as List<Slider>?,
        categorySlider:
            freezed == categorySlider
                ? _value._categorySlider
                : categorySlider // ignore: cast_nullable_to_non_nullable
                    as List<CategorySlider>?,
        categoryProducts:
            freezed == categoryProducts
                ? _value._categoryProducts
                : categoryProducts // ignore: cast_nullable_to_non_nullable
                    as List<CategoryProduct>?,
        justForYou:
            freezed == justForYou
                ? _value.justForYou
                : justForYou // ignore: cast_nullable_to_non_nullable
                    as JustForYou?,
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
class _$HomeContentResponseImpl implements _HomeContentResponse {
  const _$HomeContentResponseImpl({
    @HiveField(0)
    @JsonKey(name: "category_list")
    final List<Category>? categoryList,
    @HiveField(1) @JsonKey(name: "main_slider") final List<Slider>? mainSlider,
    @HiveField(2)
    @JsonKey(name: "common_link_slider")
    final List<Slider>? commonLinkSlider,
    @HiveField(3)
    @JsonKey(name: "category_slider")
    final List<CategorySlider>? categorySlider,
    @HiveField(4)
    @JsonKey(name: "category_products")
    final List<CategoryProduct>? categoryProducts,
    @HiveField(5) @JsonKey(name: "just_for_you") this.justForYou,
    @HiveField(6) @JsonKey(name: "cache_time") this.cacheTime,
  }) : _categoryList = categoryList,
       _mainSlider = mainSlider,
       _commonLinkSlider = commonLinkSlider,
       _categorySlider = categorySlider,
       _categoryProducts = categoryProducts;

  factory _$HomeContentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeContentResponseImplFromJson(json);

  final List<Category>? _categoryList;
  @override
  @HiveField(0)
  @JsonKey(name: "category_list")
  List<Category>? get categoryList {
    final value = _categoryList;
    if (value == null) return null;
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Slider>? _mainSlider;
  @override
  @HiveField(1)
  @JsonKey(name: "main_slider")
  List<Slider>? get mainSlider {
    final value = _mainSlider;
    if (value == null) return null;
    if (_mainSlider is EqualUnmodifiableListView) return _mainSlider;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Slider>? _commonLinkSlider;
  @override
  @HiveField(2)
  @JsonKey(name: "common_link_slider")
  List<Slider>? get commonLinkSlider {
    final value = _commonLinkSlider;
    if (value == null) return null;
    if (_commonLinkSlider is EqualUnmodifiableListView)
      return _commonLinkSlider;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CategorySlider>? _categorySlider;
  @override
  @HiveField(3)
  @JsonKey(name: "category_slider")
  List<CategorySlider>? get categorySlider {
    final value = _categorySlider;
    if (value == null) return null;
    if (_categorySlider is EqualUnmodifiableListView) return _categorySlider;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CategoryProduct>? _categoryProducts;
  @override
  @HiveField(4)
  @JsonKey(name: "category_products")
  List<CategoryProduct>? get categoryProducts {
    final value = _categoryProducts;
    if (value == null) return null;
    if (_categoryProducts is EqualUnmodifiableListView)
      return _categoryProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(5)
  @JsonKey(name: "just_for_you")
  final JustForYou? justForYou;
  @override
  @HiveField(6)
  @JsonKey(name: "cache_time")
  final DateTime? cacheTime;

  @override
  String toString() {
    return 'HomeContentResponse(categoryList: $categoryList, mainSlider: $mainSlider, commonLinkSlider: $commonLinkSlider, categorySlider: $categorySlider, categoryProducts: $categoryProducts, justForYou: $justForYou, cacheTime: $cacheTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeContentResponseImpl &&
            const DeepCollectionEquality().equals(
              other._categoryList,
              _categoryList,
            ) &&
            const DeepCollectionEquality().equals(
              other._mainSlider,
              _mainSlider,
            ) &&
            const DeepCollectionEquality().equals(
              other._commonLinkSlider,
              _commonLinkSlider,
            ) &&
            const DeepCollectionEquality().equals(
              other._categorySlider,
              _categorySlider,
            ) &&
            const DeepCollectionEquality().equals(
              other._categoryProducts,
              _categoryProducts,
            ) &&
            (identical(other.justForYou, justForYou) ||
                other.justForYou == justForYou) &&
            (identical(other.cacheTime, cacheTime) ||
                other.cacheTime == cacheTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categoryList),
    const DeepCollectionEquality().hash(_mainSlider),
    const DeepCollectionEquality().hash(_commonLinkSlider),
    const DeepCollectionEquality().hash(_categorySlider),
    const DeepCollectionEquality().hash(_categoryProducts),
    justForYou,
    cacheTime,
  );

  /// Create a copy of HomeContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeContentResponseImplCopyWith<_$HomeContentResponseImpl> get copyWith =>
      __$$HomeContentResponseImplCopyWithImpl<_$HomeContentResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeContentResponseImplToJson(this);
  }
}

abstract class _HomeContentResponse implements HomeContentResponse {
  const factory _HomeContentResponse({
    @HiveField(0)
    @JsonKey(name: "category_list")
    final List<Category>? categoryList,
    @HiveField(1) @JsonKey(name: "main_slider") final List<Slider>? mainSlider,
    @HiveField(2)
    @JsonKey(name: "common_link_slider")
    final List<Slider>? commonLinkSlider,
    @HiveField(3)
    @JsonKey(name: "category_slider")
    final List<CategorySlider>? categorySlider,
    @HiveField(4)
    @JsonKey(name: "category_products")
    final List<CategoryProduct>? categoryProducts,
    @HiveField(5) @JsonKey(name: "just_for_you") final JustForYou? justForYou,
    @HiveField(6) @JsonKey(name: "cache_time") final DateTime? cacheTime,
  }) = _$HomeContentResponseImpl;

  factory _HomeContentResponse.fromJson(Map<String, dynamic> json) =
      _$HomeContentResponseImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "category_list")
  List<Category>? get categoryList;
  @override
  @HiveField(1)
  @JsonKey(name: "main_slider")
  List<Slider>? get mainSlider;
  @override
  @HiveField(2)
  @JsonKey(name: "common_link_slider")
  List<Slider>? get commonLinkSlider;
  @override
  @HiveField(3)
  @JsonKey(name: "category_slider")
  List<CategorySlider>? get categorySlider;
  @override
  @HiveField(4)
  @JsonKey(name: "category_products")
  List<CategoryProduct>? get categoryProducts;
  @override
  @HiveField(5)
  @JsonKey(name: "just_for_you")
  JustForYou? get justForYou;
  @override
  @HiveField(6)
  @JsonKey(name: "cache_time")
  DateTime? get cacheTime;

  /// Create a copy of HomeContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeContentResponseImplCopyWith<_$HomeContentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryProduct _$CategoryProductFromJson(Map<String, dynamic> json) {
  return _CategoryProduct.fromJson(json);
}

/// @nodoc
mixin _$CategoryProduct {
  @HiveField(0)
  @JsonKey(name: "category_id")
  String? get categoryId => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "category_slug")
  String? get categorySlug => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "is_home")
  String? get isHome => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "is_todays_special")
  String? get isTodaysSpecial => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "is_launching_soon")
  String? get isLaunchingSoon => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: "is_brand")
  String? get isBrand => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: "is_featured")
  String? get isFeatured => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: "is_banner")
  String? get isBanner => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: "home_block_bg")
  String? get homeBlockBg => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: "is_flash_hour_cat")
  String? get isFlashHourCat => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: "flash_hr_start_date_time")
  DateTime? get flashHrStartDateTime => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: "flash_hr_end_date_time")
  DateTime? get flashHrEndDateTime => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: "background")
  String? get background => throw _privateConstructorUsedError;
  @HiveField(13)
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @HiveField(14)
  @JsonKey(name: "cat_slider")
  dynamic get catSlider => throw _privateConstructorUsedError;
  @HiveField(15)
  @JsonKey(name: "category_name")
  String? get categoryName => throw _privateConstructorUsedError;
  @HiveField(16)
  @JsonKey(name: "is_special")
  String? get isSpecial => throw _privateConstructorUsedError;
  @HiveField(17)
  @JsonKey(name: "products")
  List<Product>? get products => throw _privateConstructorUsedError;

  /// Serializes this CategoryProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryProductCopyWith<CategoryProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryProductCopyWith<$Res> {
  factory $CategoryProductCopyWith(
    CategoryProduct value,
    $Res Function(CategoryProduct) then,
  ) = _$CategoryProductCopyWithImpl<$Res, CategoryProduct>;
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "category_id") String? categoryId,
    @HiveField(1) @JsonKey(name: "category_slug") String? categorySlug,
    @HiveField(2) @JsonKey(name: "is_home") String? isHome,
    @HiveField(3) @JsonKey(name: "is_todays_special") String? isTodaysSpecial,
    @HiveField(4) @JsonKey(name: "is_launching_soon") String? isLaunchingSoon,
    @HiveField(5) @JsonKey(name: "is_brand") String? isBrand,
    @HiveField(6) @JsonKey(name: "is_featured") String? isFeatured,
    @HiveField(7) @JsonKey(name: "is_banner") String? isBanner,
    @HiveField(8) @JsonKey(name: "home_block_bg") String? homeBlockBg,
    @HiveField(9) @JsonKey(name: "is_flash_hour_cat") String? isFlashHourCat,
    @HiveField(10)
    @JsonKey(name: "flash_hr_start_date_time")
    DateTime? flashHrStartDateTime,
    @HiveField(11)
    @JsonKey(name: "flash_hr_end_date_time")
    DateTime? flashHrEndDateTime,
    @HiveField(12) @JsonKey(name: "background") String? background,
    @HiveField(13) @JsonKey(name: "image") String? image,
    @HiveField(14) @JsonKey(name: "cat_slider") dynamic catSlider,
    @HiveField(15) @JsonKey(name: "category_name") String? categoryName,
    @HiveField(16) @JsonKey(name: "is_special") String? isSpecial,
    @HiveField(17) @JsonKey(name: "products") List<Product>? products,
  });
}

/// @nodoc
class _$CategoryProductCopyWithImpl<$Res, $Val extends CategoryProduct>
    implements $CategoryProductCopyWith<$Res> {
  _$CategoryProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categorySlug = freezed,
    Object? isHome = freezed,
    Object? isTodaysSpecial = freezed,
    Object? isLaunchingSoon = freezed,
    Object? isBrand = freezed,
    Object? isFeatured = freezed,
    Object? isBanner = freezed,
    Object? homeBlockBg = freezed,
    Object? isFlashHourCat = freezed,
    Object? flashHrStartDateTime = freezed,
    Object? flashHrEndDateTime = freezed,
    Object? background = freezed,
    Object? image = freezed,
    Object? catSlider = freezed,
    Object? categoryName = freezed,
    Object? isSpecial = freezed,
    Object? products = freezed,
  }) {
    return _then(
      _value.copyWith(
            categoryId:
                freezed == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as String?,
            categorySlug:
                freezed == categorySlug
                    ? _value.categorySlug
                    : categorySlug // ignore: cast_nullable_to_non_nullable
                        as String?,
            isHome:
                freezed == isHome
                    ? _value.isHome
                    : isHome // ignore: cast_nullable_to_non_nullable
                        as String?,
            isTodaysSpecial:
                freezed == isTodaysSpecial
                    ? _value.isTodaysSpecial
                    : isTodaysSpecial // ignore: cast_nullable_to_non_nullable
                        as String?,
            isLaunchingSoon:
                freezed == isLaunchingSoon
                    ? _value.isLaunchingSoon
                    : isLaunchingSoon // ignore: cast_nullable_to_non_nullable
                        as String?,
            isBrand:
                freezed == isBrand
                    ? _value.isBrand
                    : isBrand // ignore: cast_nullable_to_non_nullable
                        as String?,
            isFeatured:
                freezed == isFeatured
                    ? _value.isFeatured
                    : isFeatured // ignore: cast_nullable_to_non_nullable
                        as String?,
            isBanner:
                freezed == isBanner
                    ? _value.isBanner
                    : isBanner // ignore: cast_nullable_to_non_nullable
                        as String?,
            homeBlockBg:
                freezed == homeBlockBg
                    ? _value.homeBlockBg
                    : homeBlockBg // ignore: cast_nullable_to_non_nullable
                        as String?,
            isFlashHourCat:
                freezed == isFlashHourCat
                    ? _value.isFlashHourCat
                    : isFlashHourCat // ignore: cast_nullable_to_non_nullable
                        as String?,
            flashHrStartDateTime:
                freezed == flashHrStartDateTime
                    ? _value.flashHrStartDateTime
                    : flashHrStartDateTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            flashHrEndDateTime:
                freezed == flashHrEndDateTime
                    ? _value.flashHrEndDateTime
                    : flashHrEndDateTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            background:
                freezed == background
                    ? _value.background
                    : background // ignore: cast_nullable_to_non_nullable
                        as String?,
            image:
                freezed == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String?,
            catSlider:
                freezed == catSlider
                    ? _value.catSlider
                    : catSlider // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            categoryName:
                freezed == categoryName
                    ? _value.categoryName
                    : categoryName // ignore: cast_nullable_to_non_nullable
                        as String?,
            isSpecial:
                freezed == isSpecial
                    ? _value.isSpecial
                    : isSpecial // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CategoryProductImplCopyWith<$Res>
    implements $CategoryProductCopyWith<$Res> {
  factory _$$CategoryProductImplCopyWith(
    _$CategoryProductImpl value,
    $Res Function(_$CategoryProductImpl) then,
  ) = __$$CategoryProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "category_id") String? categoryId,
    @HiveField(1) @JsonKey(name: "category_slug") String? categorySlug,
    @HiveField(2) @JsonKey(name: "is_home") String? isHome,
    @HiveField(3) @JsonKey(name: "is_todays_special") String? isTodaysSpecial,
    @HiveField(4) @JsonKey(name: "is_launching_soon") String? isLaunchingSoon,
    @HiveField(5) @JsonKey(name: "is_brand") String? isBrand,
    @HiveField(6) @JsonKey(name: "is_featured") String? isFeatured,
    @HiveField(7) @JsonKey(name: "is_banner") String? isBanner,
    @HiveField(8) @JsonKey(name: "home_block_bg") String? homeBlockBg,
    @HiveField(9) @JsonKey(name: "is_flash_hour_cat") String? isFlashHourCat,
    @HiveField(10)
    @JsonKey(name: "flash_hr_start_date_time")
    DateTime? flashHrStartDateTime,
    @HiveField(11)
    @JsonKey(name: "flash_hr_end_date_time")
    DateTime? flashHrEndDateTime,
    @HiveField(12) @JsonKey(name: "background") String? background,
    @HiveField(13) @JsonKey(name: "image") String? image,
    @HiveField(14) @JsonKey(name: "cat_slider") dynamic catSlider,
    @HiveField(15) @JsonKey(name: "category_name") String? categoryName,
    @HiveField(16) @JsonKey(name: "is_special") String? isSpecial,
    @HiveField(17) @JsonKey(name: "products") List<Product>? products,
  });
}

/// @nodoc
class __$$CategoryProductImplCopyWithImpl<$Res>
    extends _$CategoryProductCopyWithImpl<$Res, _$CategoryProductImpl>
    implements _$$CategoryProductImplCopyWith<$Res> {
  __$$CategoryProductImplCopyWithImpl(
    _$CategoryProductImpl _value,
    $Res Function(_$CategoryProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categorySlug = freezed,
    Object? isHome = freezed,
    Object? isTodaysSpecial = freezed,
    Object? isLaunchingSoon = freezed,
    Object? isBrand = freezed,
    Object? isFeatured = freezed,
    Object? isBanner = freezed,
    Object? homeBlockBg = freezed,
    Object? isFlashHourCat = freezed,
    Object? flashHrStartDateTime = freezed,
    Object? flashHrEndDateTime = freezed,
    Object? background = freezed,
    Object? image = freezed,
    Object? catSlider = freezed,
    Object? categoryName = freezed,
    Object? isSpecial = freezed,
    Object? products = freezed,
  }) {
    return _then(
      _$CategoryProductImpl(
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as String?,
        categorySlug:
            freezed == categorySlug
                ? _value.categorySlug
                : categorySlug // ignore: cast_nullable_to_non_nullable
                    as String?,
        isHome:
            freezed == isHome
                ? _value.isHome
                : isHome // ignore: cast_nullable_to_non_nullable
                    as String?,
        isTodaysSpecial:
            freezed == isTodaysSpecial
                ? _value.isTodaysSpecial
                : isTodaysSpecial // ignore: cast_nullable_to_non_nullable
                    as String?,
        isLaunchingSoon:
            freezed == isLaunchingSoon
                ? _value.isLaunchingSoon
                : isLaunchingSoon // ignore: cast_nullable_to_non_nullable
                    as String?,
        isBrand:
            freezed == isBrand
                ? _value.isBrand
                : isBrand // ignore: cast_nullable_to_non_nullable
                    as String?,
        isFeatured:
            freezed == isFeatured
                ? _value.isFeatured
                : isFeatured // ignore: cast_nullable_to_non_nullable
                    as String?,
        isBanner:
            freezed == isBanner
                ? _value.isBanner
                : isBanner // ignore: cast_nullable_to_non_nullable
                    as String?,
        homeBlockBg:
            freezed == homeBlockBg
                ? _value.homeBlockBg
                : homeBlockBg // ignore: cast_nullable_to_non_nullable
                    as String?,
        isFlashHourCat:
            freezed == isFlashHourCat
                ? _value.isFlashHourCat
                : isFlashHourCat // ignore: cast_nullable_to_non_nullable
                    as String?,
        flashHrStartDateTime:
            freezed == flashHrStartDateTime
                ? _value.flashHrStartDateTime
                : flashHrStartDateTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        flashHrEndDateTime:
            freezed == flashHrEndDateTime
                ? _value.flashHrEndDateTime
                : flashHrEndDateTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        background:
            freezed == background
                ? _value.background
                : background // ignore: cast_nullable_to_non_nullable
                    as String?,
        image:
            freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String?,
        catSlider:
            freezed == catSlider
                ? _value.catSlider
                : catSlider // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        categoryName:
            freezed == categoryName
                ? _value.categoryName
                : categoryName // ignore: cast_nullable_to_non_nullable
                    as String?,
        isSpecial:
            freezed == isSpecial
                ? _value.isSpecial
                : isSpecial // ignore: cast_nullable_to_non_nullable
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
class _$CategoryProductImpl implements _CategoryProduct {
  const _$CategoryProductImpl({
    @HiveField(0) @JsonKey(name: "category_id") this.categoryId,
    @HiveField(1) @JsonKey(name: "category_slug") this.categorySlug,
    @HiveField(2) @JsonKey(name: "is_home") this.isHome,
    @HiveField(3) @JsonKey(name: "is_todays_special") this.isTodaysSpecial,
    @HiveField(4) @JsonKey(name: "is_launching_soon") this.isLaunchingSoon,
    @HiveField(5) @JsonKey(name: "is_brand") this.isBrand,
    @HiveField(6) @JsonKey(name: "is_featured") this.isFeatured,
    @HiveField(7) @JsonKey(name: "is_banner") this.isBanner,
    @HiveField(8) @JsonKey(name: "home_block_bg") this.homeBlockBg,
    @HiveField(9) @JsonKey(name: "is_flash_hour_cat") this.isFlashHourCat,
    @HiveField(10)
    @JsonKey(name: "flash_hr_start_date_time")
    this.flashHrStartDateTime,
    @HiveField(11)
    @JsonKey(name: "flash_hr_end_date_time")
    this.flashHrEndDateTime,
    @HiveField(12) @JsonKey(name: "background") this.background,
    @HiveField(13) @JsonKey(name: "image") this.image,
    @HiveField(14) @JsonKey(name: "cat_slider") this.catSlider,
    @HiveField(15) @JsonKey(name: "category_name") this.categoryName,
    @HiveField(16) @JsonKey(name: "is_special") this.isSpecial,
    @HiveField(17) @JsonKey(name: "products") final List<Product>? products,
  }) : _products = products;

  factory _$CategoryProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryProductImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "category_id")
  final String? categoryId;
  @override
  @HiveField(1)
  @JsonKey(name: "category_slug")
  final String? categorySlug;
  @override
  @HiveField(2)
  @JsonKey(name: "is_home")
  final String? isHome;
  @override
  @HiveField(3)
  @JsonKey(name: "is_todays_special")
  final String? isTodaysSpecial;
  @override
  @HiveField(4)
  @JsonKey(name: "is_launching_soon")
  final String? isLaunchingSoon;
  @override
  @HiveField(5)
  @JsonKey(name: "is_brand")
  final String? isBrand;
  @override
  @HiveField(6)
  @JsonKey(name: "is_featured")
  final String? isFeatured;
  @override
  @HiveField(7)
  @JsonKey(name: "is_banner")
  final String? isBanner;
  @override
  @HiveField(8)
  @JsonKey(name: "home_block_bg")
  final String? homeBlockBg;
  @override
  @HiveField(9)
  @JsonKey(name: "is_flash_hour_cat")
  final String? isFlashHourCat;
  @override
  @HiveField(10)
  @JsonKey(name: "flash_hr_start_date_time")
  final DateTime? flashHrStartDateTime;
  @override
  @HiveField(11)
  @JsonKey(name: "flash_hr_end_date_time")
  final DateTime? flashHrEndDateTime;
  @override
  @HiveField(12)
  @JsonKey(name: "background")
  final String? background;
  @override
  @HiveField(13)
  @JsonKey(name: "image")
  final String? image;
  @override
  @HiveField(14)
  @JsonKey(name: "cat_slider")
  final dynamic catSlider;
  @override
  @HiveField(15)
  @JsonKey(name: "category_name")
  final String? categoryName;
  @override
  @HiveField(16)
  @JsonKey(name: "is_special")
  final String? isSpecial;
  final List<Product>? _products;
  @override
  @HiveField(17)
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
    return 'CategoryProduct(categoryId: $categoryId, categorySlug: $categorySlug, isHome: $isHome, isTodaysSpecial: $isTodaysSpecial, isLaunchingSoon: $isLaunchingSoon, isBrand: $isBrand, isFeatured: $isFeatured, isBanner: $isBanner, homeBlockBg: $homeBlockBg, isFlashHourCat: $isFlashHourCat, flashHrStartDateTime: $flashHrStartDateTime, flashHrEndDateTime: $flashHrEndDateTime, background: $background, image: $image, catSlider: $catSlider, categoryName: $categoryName, isSpecial: $isSpecial, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryProductImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug) &&
            (identical(other.isHome, isHome) || other.isHome == isHome) &&
            (identical(other.isTodaysSpecial, isTodaysSpecial) ||
                other.isTodaysSpecial == isTodaysSpecial) &&
            (identical(other.isLaunchingSoon, isLaunchingSoon) ||
                other.isLaunchingSoon == isLaunchingSoon) &&
            (identical(other.isBrand, isBrand) || other.isBrand == isBrand) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.isBanner, isBanner) ||
                other.isBanner == isBanner) &&
            (identical(other.homeBlockBg, homeBlockBg) ||
                other.homeBlockBg == homeBlockBg) &&
            (identical(other.isFlashHourCat, isFlashHourCat) ||
                other.isFlashHourCat == isFlashHourCat) &&
            (identical(other.flashHrStartDateTime, flashHrStartDateTime) ||
                other.flashHrStartDateTime == flashHrStartDateTime) &&
            (identical(other.flashHrEndDateTime, flashHrEndDateTime) ||
                other.flashHrEndDateTime == flashHrEndDateTime) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other.catSlider, catSlider) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.isSpecial, isSpecial) ||
                other.isSpecial == isSpecial) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryId,
    categorySlug,
    isHome,
    isTodaysSpecial,
    isLaunchingSoon,
    isBrand,
    isFeatured,
    isBanner,
    homeBlockBg,
    isFlashHourCat,
    flashHrStartDateTime,
    flashHrEndDateTime,
    background,
    image,
    const DeepCollectionEquality().hash(catSlider),
    categoryName,
    isSpecial,
    const DeepCollectionEquality().hash(_products),
  );

  /// Create a copy of CategoryProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryProductImplCopyWith<_$CategoryProductImpl> get copyWith =>
      __$$CategoryProductImplCopyWithImpl<_$CategoryProductImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryProductImplToJson(this);
  }
}

abstract class _CategoryProduct implements CategoryProduct {
  const factory _CategoryProduct({
    @HiveField(0) @JsonKey(name: "category_id") final String? categoryId,
    @HiveField(1) @JsonKey(name: "category_slug") final String? categorySlug,
    @HiveField(2) @JsonKey(name: "is_home") final String? isHome,
    @HiveField(3)
    @JsonKey(name: "is_todays_special")
    final String? isTodaysSpecial,
    @HiveField(4)
    @JsonKey(name: "is_launching_soon")
    final String? isLaunchingSoon,
    @HiveField(5) @JsonKey(name: "is_brand") final String? isBrand,
    @HiveField(6) @JsonKey(name: "is_featured") final String? isFeatured,
    @HiveField(7) @JsonKey(name: "is_banner") final String? isBanner,
    @HiveField(8) @JsonKey(name: "home_block_bg") final String? homeBlockBg,
    @HiveField(9)
    @JsonKey(name: "is_flash_hour_cat")
    final String? isFlashHourCat,
    @HiveField(10)
    @JsonKey(name: "flash_hr_start_date_time")
    final DateTime? flashHrStartDateTime,
    @HiveField(11)
    @JsonKey(name: "flash_hr_end_date_time")
    final DateTime? flashHrEndDateTime,
    @HiveField(12) @JsonKey(name: "background") final String? background,
    @HiveField(13) @JsonKey(name: "image") final String? image,
    @HiveField(14) @JsonKey(name: "cat_slider") final dynamic catSlider,
    @HiveField(15) @JsonKey(name: "category_name") final String? categoryName,
    @HiveField(16) @JsonKey(name: "is_special") final String? isSpecial,
    @HiveField(17) @JsonKey(name: "products") final List<Product>? products,
  }) = _$CategoryProductImpl;

  factory _CategoryProduct.fromJson(Map<String, dynamic> json) =
      _$CategoryProductImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "category_id")
  String? get categoryId;
  @override
  @HiveField(1)
  @JsonKey(name: "category_slug")
  String? get categorySlug;
  @override
  @HiveField(2)
  @JsonKey(name: "is_home")
  String? get isHome;
  @override
  @HiveField(3)
  @JsonKey(name: "is_todays_special")
  String? get isTodaysSpecial;
  @override
  @HiveField(4)
  @JsonKey(name: "is_launching_soon")
  String? get isLaunchingSoon;
  @override
  @HiveField(5)
  @JsonKey(name: "is_brand")
  String? get isBrand;
  @override
  @HiveField(6)
  @JsonKey(name: "is_featured")
  String? get isFeatured;
  @override
  @HiveField(7)
  @JsonKey(name: "is_banner")
  String? get isBanner;
  @override
  @HiveField(8)
  @JsonKey(name: "home_block_bg")
  String? get homeBlockBg;
  @override
  @HiveField(9)
  @JsonKey(name: "is_flash_hour_cat")
  String? get isFlashHourCat;
  @override
  @HiveField(10)
  @JsonKey(name: "flash_hr_start_date_time")
  DateTime? get flashHrStartDateTime;
  @override
  @HiveField(11)
  @JsonKey(name: "flash_hr_end_date_time")
  DateTime? get flashHrEndDateTime;
  @override
  @HiveField(12)
  @JsonKey(name: "background")
  String? get background;
  @override
  @HiveField(13)
  @JsonKey(name: "image")
  String? get image;
  @override
  @HiveField(14)
  @JsonKey(name: "cat_slider")
  dynamic get catSlider;
  @override
  @HiveField(15)
  @JsonKey(name: "category_name")
  String? get categoryName;
  @override
  @HiveField(16)
  @JsonKey(name: "is_special")
  String? get isSpecial;
  @override
  @HiveField(17)
  @JsonKey(name: "products")
  List<Product>? get products;

  /// Create a copy of CategoryProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryProductImplCopyWith<_$CategoryProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategorySlider _$CategorySliderFromJson(Map<String, dynamic> json) {
  return _CategorySlider.fromJson(json);
}

/// @nodoc
mixin _$CategorySlider {
  @HiveField(0)
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "alias")
  String? get alias => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "tagrget-url")
  dynamic get tagrgetUrl => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "background_color")
  String? get backgroundColor => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "link_title_color")
  String? get linkTitleColor => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: "slides_data")
  List<Slider>? get slidesData => throw _privateConstructorUsedError;

  /// Serializes this CategorySlider to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategorySlider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategorySliderCopyWith<CategorySlider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySliderCopyWith<$Res> {
  factory $CategorySliderCopyWith(
    CategorySlider value,
    $Res Function(CategorySlider) then,
  ) = _$CategorySliderCopyWithImpl<$Res, CategorySlider>;
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "name") String? name,
    @HiveField(1) @JsonKey(name: "alias") String? alias,
    @HiveField(2) @JsonKey(name: "tagrget-url") dynamic tagrgetUrl,
    @HiveField(3) @JsonKey(name: "background_color") String? backgroundColor,
    @HiveField(4) @JsonKey(name: "link_title_color") String? linkTitleColor,
    @HiveField(5) @JsonKey(name: "status") String? status,
    @HiveField(6) @JsonKey(name: "slides_data") List<Slider>? slidesData,
  });
}

/// @nodoc
class _$CategorySliderCopyWithImpl<$Res, $Val extends CategorySlider>
    implements $CategorySliderCopyWith<$Res> {
  _$CategorySliderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategorySlider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? alias = freezed,
    Object? tagrgetUrl = freezed,
    Object? backgroundColor = freezed,
    Object? linkTitleColor = freezed,
    Object? status = freezed,
    Object? slidesData = freezed,
  }) {
    return _then(
      _value.copyWith(
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            alias:
                freezed == alias
                    ? _value.alias
                    : alias // ignore: cast_nullable_to_non_nullable
                        as String?,
            tagrgetUrl:
                freezed == tagrgetUrl
                    ? _value.tagrgetUrl
                    : tagrgetUrl // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            backgroundColor:
                freezed == backgroundColor
                    ? _value.backgroundColor
                    : backgroundColor // ignore: cast_nullable_to_non_nullable
                        as String?,
            linkTitleColor:
                freezed == linkTitleColor
                    ? _value.linkTitleColor
                    : linkTitleColor // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            slidesData:
                freezed == slidesData
                    ? _value.slidesData
                    : slidesData // ignore: cast_nullable_to_non_nullable
                        as List<Slider>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategorySliderImplCopyWith<$Res>
    implements $CategorySliderCopyWith<$Res> {
  factory _$$CategorySliderImplCopyWith(
    _$CategorySliderImpl value,
    $Res Function(_$CategorySliderImpl) then,
  ) = __$$CategorySliderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "name") String? name,
    @HiveField(1) @JsonKey(name: "alias") String? alias,
    @HiveField(2) @JsonKey(name: "tagrget-url") dynamic tagrgetUrl,
    @HiveField(3) @JsonKey(name: "background_color") String? backgroundColor,
    @HiveField(4) @JsonKey(name: "link_title_color") String? linkTitleColor,
    @HiveField(5) @JsonKey(name: "status") String? status,
    @HiveField(6) @JsonKey(name: "slides_data") List<Slider>? slidesData,
  });
}

/// @nodoc
class __$$CategorySliderImplCopyWithImpl<$Res>
    extends _$CategorySliderCopyWithImpl<$Res, _$CategorySliderImpl>
    implements _$$CategorySliderImplCopyWith<$Res> {
  __$$CategorySliderImplCopyWithImpl(
    _$CategorySliderImpl _value,
    $Res Function(_$CategorySliderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategorySlider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? alias = freezed,
    Object? tagrgetUrl = freezed,
    Object? backgroundColor = freezed,
    Object? linkTitleColor = freezed,
    Object? status = freezed,
    Object? slidesData = freezed,
  }) {
    return _then(
      _$CategorySliderImpl(
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        alias:
            freezed == alias
                ? _value.alias
                : alias // ignore: cast_nullable_to_non_nullable
                    as String?,
        tagrgetUrl:
            freezed == tagrgetUrl
                ? _value.tagrgetUrl
                : tagrgetUrl // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        backgroundColor:
            freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                    as String?,
        linkTitleColor:
            freezed == linkTitleColor
                ? _value.linkTitleColor
                : linkTitleColor // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        slidesData:
            freezed == slidesData
                ? _value._slidesData
                : slidesData // ignore: cast_nullable_to_non_nullable
                    as List<Slider>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategorySliderImpl implements _CategorySlider {
  const _$CategorySliderImpl({
    @HiveField(0) @JsonKey(name: "name") this.name,
    @HiveField(1) @JsonKey(name: "alias") this.alias,
    @HiveField(2) @JsonKey(name: "tagrget-url") this.tagrgetUrl,
    @HiveField(3) @JsonKey(name: "background_color") this.backgroundColor,
    @HiveField(4) @JsonKey(name: "link_title_color") this.linkTitleColor,
    @HiveField(5) @JsonKey(name: "status") this.status,
    @HiveField(6) @JsonKey(name: "slides_data") final List<Slider>? slidesData,
  }) : _slidesData = slidesData;

  factory _$CategorySliderImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorySliderImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "name")
  final String? name;
  @override
  @HiveField(1)
  @JsonKey(name: "alias")
  final String? alias;
  @override
  @HiveField(2)
  @JsonKey(name: "tagrget-url")
  final dynamic tagrgetUrl;
  @override
  @HiveField(3)
  @JsonKey(name: "background_color")
  final String? backgroundColor;
  @override
  @HiveField(4)
  @JsonKey(name: "link_title_color")
  final String? linkTitleColor;
  @override
  @HiveField(5)
  @JsonKey(name: "status")
  final String? status;
  final List<Slider>? _slidesData;
  @override
  @HiveField(6)
  @JsonKey(name: "slides_data")
  List<Slider>? get slidesData {
    final value = _slidesData;
    if (value == null) return null;
    if (_slidesData is EqualUnmodifiableListView) return _slidesData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategorySlider(name: $name, alias: $alias, tagrgetUrl: $tagrgetUrl, backgroundColor: $backgroundColor, linkTitleColor: $linkTitleColor, status: $status, slidesData: $slidesData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySliderImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.alias, alias) || other.alias == alias) &&
            const DeepCollectionEquality().equals(
              other.tagrgetUrl,
              tagrgetUrl,
            ) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.linkTitleColor, linkTitleColor) ||
                other.linkTitleColor == linkTitleColor) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._slidesData,
              _slidesData,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    alias,
    const DeepCollectionEquality().hash(tagrgetUrl),
    backgroundColor,
    linkTitleColor,
    status,
    const DeepCollectionEquality().hash(_slidesData),
  );

  /// Create a copy of CategorySlider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySliderImplCopyWith<_$CategorySliderImpl> get copyWith =>
      __$$CategorySliderImplCopyWithImpl<_$CategorySliderImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorySliderImplToJson(this);
  }
}

abstract class _CategorySlider implements CategorySlider {
  const factory _CategorySlider({
    @HiveField(0) @JsonKey(name: "name") final String? name,
    @HiveField(1) @JsonKey(name: "alias") final String? alias,
    @HiveField(2) @JsonKey(name: "tagrget-url") final dynamic tagrgetUrl,
    @HiveField(3)
    @JsonKey(name: "background_color")
    final String? backgroundColor,
    @HiveField(4)
    @JsonKey(name: "link_title_color")
    final String? linkTitleColor,
    @HiveField(5) @JsonKey(name: "status") final String? status,
    @HiveField(6) @JsonKey(name: "slides_data") final List<Slider>? slidesData,
  }) = _$CategorySliderImpl;

  factory _CategorySlider.fromJson(Map<String, dynamic> json) =
      _$CategorySliderImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "name")
  String? get name;
  @override
  @HiveField(1)
  @JsonKey(name: "alias")
  String? get alias;
  @override
  @HiveField(2)
  @JsonKey(name: "tagrget-url")
  dynamic get tagrgetUrl;
  @override
  @HiveField(3)
  @JsonKey(name: "background_color")
  String? get backgroundColor;
  @override
  @HiveField(4)
  @JsonKey(name: "link_title_color")
  String? get linkTitleColor;
  @override
  @HiveField(5)
  @JsonKey(name: "status")
  String? get status;
  @override
  @HiveField(6)
  @JsonKey(name: "slides_data")
  List<Slider>? get slidesData;

  /// Create a copy of CategorySlider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySliderImplCopyWith<_$CategorySliderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JustForYou _$JustForYouFromJson(Map<String, dynamic> json) {
  return _JustForYou.fromJson(json);
}

/// @nodoc
mixin _$JustForYou {
  @HiveField(0)
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "list")
  List<Product>? get list => throw _privateConstructorUsedError;

  /// Serializes this JustForYou to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JustForYou
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JustForYouCopyWith<JustForYou> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JustForYouCopyWith<$Res> {
  factory $JustForYouCopyWith(
    JustForYou value,
    $Res Function(JustForYou) then,
  ) = _$JustForYouCopyWithImpl<$Res, JustForYou>;
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "total") int? total,
    @HiveField(1) @JsonKey(name: "list") List<Product>? list,
  });
}

/// @nodoc
class _$JustForYouCopyWithImpl<$Res, $Val extends JustForYou>
    implements $JustForYouCopyWith<$Res> {
  _$JustForYouCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JustForYou
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = freezed, Object? list = freezed}) {
    return _then(
      _value.copyWith(
            total:
                freezed == total
                    ? _value.total
                    : total // ignore: cast_nullable_to_non_nullable
                        as int?,
            list:
                freezed == list
                    ? _value.list
                    : list // ignore: cast_nullable_to_non_nullable
                        as List<Product>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JustForYouImplCopyWith<$Res>
    implements $JustForYouCopyWith<$Res> {
  factory _$$JustForYouImplCopyWith(
    _$JustForYouImpl value,
    $Res Function(_$JustForYouImpl) then,
  ) = __$$JustForYouImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "total") int? total,
    @HiveField(1) @JsonKey(name: "list") List<Product>? list,
  });
}

/// @nodoc
class __$$JustForYouImplCopyWithImpl<$Res>
    extends _$JustForYouCopyWithImpl<$Res, _$JustForYouImpl>
    implements _$$JustForYouImplCopyWith<$Res> {
  __$$JustForYouImplCopyWithImpl(
    _$JustForYouImpl _value,
    $Res Function(_$JustForYouImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JustForYou
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = freezed, Object? list = freezed}) {
    return _then(
      _$JustForYouImpl(
        total:
            freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                    as int?,
        list:
            freezed == list
                ? _value._list
                : list // ignore: cast_nullable_to_non_nullable
                    as List<Product>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JustForYouImpl implements _JustForYou {
  const _$JustForYouImpl({
    @HiveField(0) @JsonKey(name: "total") this.total,
    @HiveField(1) @JsonKey(name: "list") final List<Product>? list,
  }) : _list = list;

  factory _$JustForYouImpl.fromJson(Map<String, dynamic> json) =>
      _$$JustForYouImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "total")
  final int? total;
  final List<Product>? _list;
  @override
  @HiveField(1)
  @JsonKey(name: "list")
  List<Product>? get list {
    final value = _list;
    if (value == null) return null;
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'JustForYou(total: $total, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JustForYouImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    total,
    const DeepCollectionEquality().hash(_list),
  );

  /// Create a copy of JustForYou
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JustForYouImplCopyWith<_$JustForYouImpl> get copyWith =>
      __$$JustForYouImplCopyWithImpl<_$JustForYouImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JustForYouImplToJson(this);
  }
}

abstract class _JustForYou implements JustForYou {
  const factory _JustForYou({
    @HiveField(0) @JsonKey(name: "total") final int? total,
    @HiveField(1) @JsonKey(name: "list") final List<Product>? list,
  }) = _$JustForYouImpl;

  factory _JustForYou.fromJson(Map<String, dynamic> json) =
      _$JustForYouImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "total")
  int? get total;
  @override
  @HiveField(1)
  @JsonKey(name: "list")
  List<Product>? get list;

  /// Create a copy of JustForYou
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JustForYouImplCopyWith<_$JustForYouImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
