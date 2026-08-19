// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @HiveField(0)
  @JsonKey(name: "id", fromJson: _toStringSafe)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "express_delivery", fromJson: _toStringSafe)
  String? get expressDelivery => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "product_name")
  String? get productName => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "sku")
  String? get sku => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: "type_id")
  String? get typeId => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: "stock_available", fromJson: _toBoolSafe)
  bool? get stockAvailable => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: "free_delivery", fromJson: _toStringSafe)
  String? get freeDelivery => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: "product_price", fromJson: _toIntSafe)
  int? get productPrice => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: "product_specialPrice", fromJson: _toIntSafe)
  int? get productSpecialPrice => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: "product_discount", fromJson: _toIntSafe)
  int? get productDiscount => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: "offers", fromJson: _toStringSafe)
  String? get offers => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: "club_point", fromJson: _toDoubleSafe)
  double? get clubPoint => throw _privateConstructorUsedError;
  @HiveField(13)
  @JsonKey(name: "rating", fromJson: _toDoubleSafe)
  double? get rating => throw _privateConstructorUsedError;
  @HiveField(14)
  @JsonKey(name: "rating_count", fromJson: _toIntSafe)
  int? get ratingCount => throw _privateConstructorUsedError;
  @HiveField(15)
  @JsonKey(name: "product_img")
  String? get productImg => throw _privateConstructorUsedError;
  @HiveField(16)
  @JsonKey(name: "emi_available", fromJson: _toBoolSafe)
  bool? get emiAvailable => throw _privateConstructorUsedError;
  @HiveField(17)
  @JsonKey(name: "coming_soon", fromJson: _toBoolSafe)
  bool? get comingSoon => throw _privateConstructorUsedError;
  @HiveField(18)
  @JsonKey(name: "is_ad", fromJson: _toBoolSafe)
  bool? get isAd => throw _privateConstructorUsedError;
  @HiveField(19)
  @JsonKey(name: "attributes")
  List<ProductAttribute>? get attributes => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "id", fromJson: _toStringSafe) String? id,
    @HiveField(1)
    @JsonKey(name: "express_delivery", fromJson: _toStringSafe)
    String? expressDelivery,
    @HiveField(2) @JsonKey(name: "product_name") String? productName,
    @HiveField(3) @JsonKey(name: "sku") String? sku,
    @HiveField(4) @JsonKey(name: "slug") String? slug,
    @HiveField(5) @JsonKey(name: "type_id") String? typeId,
    @HiveField(6)
    @JsonKey(name: "stock_available", fromJson: _toBoolSafe)
    bool? stockAvailable,
    @HiveField(7)
    @JsonKey(name: "free_delivery", fromJson: _toStringSafe)
    String? freeDelivery,
    @HiveField(8)
    @JsonKey(name: "product_price", fromJson: _toIntSafe)
    int? productPrice,
    @HiveField(9)
    @JsonKey(name: "product_specialPrice", fromJson: _toIntSafe)
    int? productSpecialPrice,
    @HiveField(10)
    @JsonKey(name: "product_discount", fromJson: _toIntSafe)
    int? productDiscount,
    @HiveField(11)
    @JsonKey(name: "offers", fromJson: _toStringSafe)
    String? offers,
    @HiveField(12)
    @JsonKey(name: "club_point", fromJson: _toDoubleSafe)
    double? clubPoint,
    @HiveField(13)
    @JsonKey(name: "rating", fromJson: _toDoubleSafe)
    double? rating,
    @HiveField(14)
    @JsonKey(name: "rating_count", fromJson: _toIntSafe)
    int? ratingCount,
    @HiveField(15) @JsonKey(name: "product_img") String? productImg,
    @HiveField(16)
    @JsonKey(name: "emi_available", fromJson: _toBoolSafe)
    bool? emiAvailable,
    @HiveField(17)
    @JsonKey(name: "coming_soon", fromJson: _toBoolSafe)
    bool? comingSoon,
    @HiveField(18) @JsonKey(name: "is_ad", fromJson: _toBoolSafe) bool? isAd,
    @HiveField(19)
    @JsonKey(name: "attributes")
    List<ProductAttribute>? attributes,
  });
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? expressDelivery = freezed,
    Object? productName = freezed,
    Object? sku = freezed,
    Object? slug = freezed,
    Object? typeId = freezed,
    Object? stockAvailable = freezed,
    Object? freeDelivery = freezed,
    Object? productPrice = freezed,
    Object? productSpecialPrice = freezed,
    Object? productDiscount = freezed,
    Object? offers = freezed,
    Object? clubPoint = freezed,
    Object? rating = freezed,
    Object? ratingCount = freezed,
    Object? productImg = freezed,
    Object? emiAvailable = freezed,
    Object? comingSoon = freezed,
    Object? isAd = freezed,
    Object? attributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            expressDelivery:
                freezed == expressDelivery
                    ? _value.expressDelivery
                    : expressDelivery // ignore: cast_nullable_to_non_nullable
                        as String?,
            productName:
                freezed == productName
                    ? _value.productName
                    : productName // ignore: cast_nullable_to_non_nullable
                        as String?,
            sku:
                freezed == sku
                    ? _value.sku
                    : sku // ignore: cast_nullable_to_non_nullable
                        as String?,
            slug:
                freezed == slug
                    ? _value.slug
                    : slug // ignore: cast_nullable_to_non_nullable
                        as String?,
            typeId:
                freezed == typeId
                    ? _value.typeId
                    : typeId // ignore: cast_nullable_to_non_nullable
                        as String?,
            stockAvailable:
                freezed == stockAvailable
                    ? _value.stockAvailable
                    : stockAvailable // ignore: cast_nullable_to_non_nullable
                        as bool?,
            freeDelivery:
                freezed == freeDelivery
                    ? _value.freeDelivery
                    : freeDelivery // ignore: cast_nullable_to_non_nullable
                        as String?,
            productPrice:
                freezed == productPrice
                    ? _value.productPrice
                    : productPrice // ignore: cast_nullable_to_non_nullable
                        as int?,
            productSpecialPrice:
                freezed == productSpecialPrice
                    ? _value.productSpecialPrice
                    : productSpecialPrice // ignore: cast_nullable_to_non_nullable
                        as int?,
            productDiscount:
                freezed == productDiscount
                    ? _value.productDiscount
                    : productDiscount // ignore: cast_nullable_to_non_nullable
                        as int?,
            offers:
                freezed == offers
                    ? _value.offers
                    : offers // ignore: cast_nullable_to_non_nullable
                        as String?,
            clubPoint:
                freezed == clubPoint
                    ? _value.clubPoint
                    : clubPoint // ignore: cast_nullable_to_non_nullable
                        as double?,
            rating:
                freezed == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as double?,
            ratingCount:
                freezed == ratingCount
                    ? _value.ratingCount
                    : ratingCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            productImg:
                freezed == productImg
                    ? _value.productImg
                    : productImg // ignore: cast_nullable_to_non_nullable
                        as String?,
            emiAvailable:
                freezed == emiAvailable
                    ? _value.emiAvailable
                    : emiAvailable // ignore: cast_nullable_to_non_nullable
                        as bool?,
            comingSoon:
                freezed == comingSoon
                    ? _value.comingSoon
                    : comingSoon // ignore: cast_nullable_to_non_nullable
                        as bool?,
            isAd:
                freezed == isAd
                    ? _value.isAd
                    : isAd // ignore: cast_nullable_to_non_nullable
                        as bool?,
            attributes:
                freezed == attributes
                    ? _value.attributes
                    : attributes // ignore: cast_nullable_to_non_nullable
                        as List<ProductAttribute>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
    _$ProductImpl value,
    $Res Function(_$ProductImpl) then,
  ) = __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "id", fromJson: _toStringSafe) String? id,
    @HiveField(1)
    @JsonKey(name: "express_delivery", fromJson: _toStringSafe)
    String? expressDelivery,
    @HiveField(2) @JsonKey(name: "product_name") String? productName,
    @HiveField(3) @JsonKey(name: "sku") String? sku,
    @HiveField(4) @JsonKey(name: "slug") String? slug,
    @HiveField(5) @JsonKey(name: "type_id") String? typeId,
    @HiveField(6)
    @JsonKey(name: "stock_available", fromJson: _toBoolSafe)
    bool? stockAvailable,
    @HiveField(7)
    @JsonKey(name: "free_delivery", fromJson: _toStringSafe)
    String? freeDelivery,
    @HiveField(8)
    @JsonKey(name: "product_price", fromJson: _toIntSafe)
    int? productPrice,
    @HiveField(9)
    @JsonKey(name: "product_specialPrice", fromJson: _toIntSafe)
    int? productSpecialPrice,
    @HiveField(10)
    @JsonKey(name: "product_discount", fromJson: _toIntSafe)
    int? productDiscount,
    @HiveField(11)
    @JsonKey(name: "offers", fromJson: _toStringSafe)
    String? offers,
    @HiveField(12)
    @JsonKey(name: "club_point", fromJson: _toDoubleSafe)
    double? clubPoint,
    @HiveField(13)
    @JsonKey(name: "rating", fromJson: _toDoubleSafe)
    double? rating,
    @HiveField(14)
    @JsonKey(name: "rating_count", fromJson: _toIntSafe)
    int? ratingCount,
    @HiveField(15) @JsonKey(name: "product_img") String? productImg,
    @HiveField(16)
    @JsonKey(name: "emi_available", fromJson: _toBoolSafe)
    bool? emiAvailable,
    @HiveField(17)
    @JsonKey(name: "coming_soon", fromJson: _toBoolSafe)
    bool? comingSoon,
    @HiveField(18) @JsonKey(name: "is_ad", fromJson: _toBoolSafe) bool? isAd,
    @HiveField(19)
    @JsonKey(name: "attributes")
    List<ProductAttribute>? attributes,
  });
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
    _$ProductImpl _value,
    $Res Function(_$ProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? expressDelivery = freezed,
    Object? productName = freezed,
    Object? sku = freezed,
    Object? slug = freezed,
    Object? typeId = freezed,
    Object? stockAvailable = freezed,
    Object? freeDelivery = freezed,
    Object? productPrice = freezed,
    Object? productSpecialPrice = freezed,
    Object? productDiscount = freezed,
    Object? offers = freezed,
    Object? clubPoint = freezed,
    Object? rating = freezed,
    Object? ratingCount = freezed,
    Object? productImg = freezed,
    Object? emiAvailable = freezed,
    Object? comingSoon = freezed,
    Object? isAd = freezed,
    Object? attributes = freezed,
  }) {
    return _then(
      _$ProductImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        expressDelivery:
            freezed == expressDelivery
                ? _value.expressDelivery
                : expressDelivery // ignore: cast_nullable_to_non_nullable
                    as String?,
        productName:
            freezed == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                    as String?,
        sku:
            freezed == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                    as String?,
        slug:
            freezed == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                    as String?,
        typeId:
            freezed == typeId
                ? _value.typeId
                : typeId // ignore: cast_nullable_to_non_nullable
                    as String?,
        stockAvailable:
            freezed == stockAvailable
                ? _value.stockAvailable
                : stockAvailable // ignore: cast_nullable_to_non_nullable
                    as bool?,
        freeDelivery:
            freezed == freeDelivery
                ? _value.freeDelivery
                : freeDelivery // ignore: cast_nullable_to_non_nullable
                    as String?,
        productPrice:
            freezed == productPrice
                ? _value.productPrice
                : productPrice // ignore: cast_nullable_to_non_nullable
                    as int?,
        productSpecialPrice:
            freezed == productSpecialPrice
                ? _value.productSpecialPrice
                : productSpecialPrice // ignore: cast_nullable_to_non_nullable
                    as int?,
        productDiscount:
            freezed == productDiscount
                ? _value.productDiscount
                : productDiscount // ignore: cast_nullable_to_non_nullable
                    as int?,
        offers:
            freezed == offers
                ? _value.offers
                : offers // ignore: cast_nullable_to_non_nullable
                    as String?,
        clubPoint:
            freezed == clubPoint
                ? _value.clubPoint
                : clubPoint // ignore: cast_nullable_to_non_nullable
                    as double?,
        rating:
            freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as double?,
        ratingCount:
            freezed == ratingCount
                ? _value.ratingCount
                : ratingCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        productImg:
            freezed == productImg
                ? _value.productImg
                : productImg // ignore: cast_nullable_to_non_nullable
                    as String?,
        emiAvailable:
            freezed == emiAvailable
                ? _value.emiAvailable
                : emiAvailable // ignore: cast_nullable_to_non_nullable
                    as bool?,
        comingSoon:
            freezed == comingSoon
                ? _value.comingSoon
                : comingSoon // ignore: cast_nullable_to_non_nullable
                    as bool?,
        isAd:
            freezed == isAd
                ? _value.isAd
                : isAd // ignore: cast_nullable_to_non_nullable
                    as bool?,
        attributes:
            freezed == attributes
                ? _value._attributes
                : attributes // ignore: cast_nullable_to_non_nullable
                    as List<ProductAttribute>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl({
    @HiveField(0) @JsonKey(name: "id", fromJson: _toStringSafe) this.id,
    @HiveField(1)
    @JsonKey(name: "express_delivery", fromJson: _toStringSafe)
    this.expressDelivery,
    @HiveField(2) @JsonKey(name: "product_name") this.productName,
    @HiveField(3) @JsonKey(name: "sku") this.sku,
    @HiveField(4) @JsonKey(name: "slug") this.slug,
    @HiveField(5) @JsonKey(name: "type_id") this.typeId,
    @HiveField(6)
    @JsonKey(name: "stock_available", fromJson: _toBoolSafe)
    this.stockAvailable,
    @HiveField(7)
    @JsonKey(name: "free_delivery", fromJson: _toStringSafe)
    this.freeDelivery,
    @HiveField(8)
    @JsonKey(name: "product_price", fromJson: _toIntSafe)
    this.productPrice,
    @HiveField(9)
    @JsonKey(name: "product_specialPrice", fromJson: _toIntSafe)
    this.productSpecialPrice,
    @HiveField(10)
    @JsonKey(name: "product_discount", fromJson: _toIntSafe)
    this.productDiscount,
    @HiveField(11)
    @JsonKey(name: "offers", fromJson: _toStringSafe)
    this.offers,
    @HiveField(12)
    @JsonKey(name: "club_point", fromJson: _toDoubleSafe)
    this.clubPoint,
    @HiveField(13)
    @JsonKey(name: "rating", fromJson: _toDoubleSafe)
    this.rating,
    @HiveField(14)
    @JsonKey(name: "rating_count", fromJson: _toIntSafe)
    this.ratingCount,
    @HiveField(15) @JsonKey(name: "product_img") this.productImg,
    @HiveField(16)
    @JsonKey(name: "emi_available", fromJson: _toBoolSafe)
    this.emiAvailable,
    @HiveField(17)
    @JsonKey(name: "coming_soon", fromJson: _toBoolSafe)
    this.comingSoon,
    @HiveField(18) @JsonKey(name: "is_ad", fromJson: _toBoolSafe) this.isAd,
    @HiveField(19)
    @JsonKey(name: "attributes")
    final List<ProductAttribute>? attributes,
  }) : _attributes = attributes;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "id", fromJson: _toStringSafe)
  final String? id;
  @override
  @HiveField(1)
  @JsonKey(name: "express_delivery", fromJson: _toStringSafe)
  final String? expressDelivery;
  @override
  @HiveField(2)
  @JsonKey(name: "product_name")
  final String? productName;
  @override
  @HiveField(3)
  @JsonKey(name: "sku")
  final String? sku;
  @override
  @HiveField(4)
  @JsonKey(name: "slug")
  final String? slug;
  @override
  @HiveField(5)
  @JsonKey(name: "type_id")
  final String? typeId;
  @override
  @HiveField(6)
  @JsonKey(name: "stock_available", fromJson: _toBoolSafe)
  final bool? stockAvailable;
  @override
  @HiveField(7)
  @JsonKey(name: "free_delivery", fromJson: _toStringSafe)
  final String? freeDelivery;
  @override
  @HiveField(8)
  @JsonKey(name: "product_price", fromJson: _toIntSafe)
  final int? productPrice;
  @override
  @HiveField(9)
  @JsonKey(name: "product_specialPrice", fromJson: _toIntSafe)
  final int? productSpecialPrice;
  @override
  @HiveField(10)
  @JsonKey(name: "product_discount", fromJson: _toIntSafe)
  final int? productDiscount;
  @override
  @HiveField(11)
  @JsonKey(name: "offers", fromJson: _toStringSafe)
  final String? offers;
  @override
  @HiveField(12)
  @JsonKey(name: "club_point", fromJson: _toDoubleSafe)
  final double? clubPoint;
  @override
  @HiveField(13)
  @JsonKey(name: "rating", fromJson: _toDoubleSafe)
  final double? rating;
  @override
  @HiveField(14)
  @JsonKey(name: "rating_count", fromJson: _toIntSafe)
  final int? ratingCount;
  @override
  @HiveField(15)
  @JsonKey(name: "product_img")
  final String? productImg;
  @override
  @HiveField(16)
  @JsonKey(name: "emi_available", fromJson: _toBoolSafe)
  final bool? emiAvailable;
  @override
  @HiveField(17)
  @JsonKey(name: "coming_soon", fromJson: _toBoolSafe)
  final bool? comingSoon;
  @override
  @HiveField(18)
  @JsonKey(name: "is_ad", fromJson: _toBoolSafe)
  final bool? isAd;
  final List<ProductAttribute>? _attributes;
  @override
  @HiveField(19)
  @JsonKey(name: "attributes")
  List<ProductAttribute>? get attributes {
    final value = _attributes;
    if (value == null) return null;
    if (_attributes is EqualUnmodifiableListView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Product(id: $id, expressDelivery: $expressDelivery, productName: $productName, sku: $sku, slug: $slug, typeId: $typeId, stockAvailable: $stockAvailable, freeDelivery: $freeDelivery, productPrice: $productPrice, productSpecialPrice: $productSpecialPrice, productDiscount: $productDiscount, offers: $offers, clubPoint: $clubPoint, rating: $rating, ratingCount: $ratingCount, productImg: $productImg, emiAvailable: $emiAvailable, comingSoon: $comingSoon, isAd: $isAd, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.expressDelivery, expressDelivery) ||
                other.expressDelivery == expressDelivery) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.stockAvailable, stockAvailable) ||
                other.stockAvailable == stockAvailable) &&
            (identical(other.freeDelivery, freeDelivery) ||
                other.freeDelivery == freeDelivery) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.productSpecialPrice, productSpecialPrice) ||
                other.productSpecialPrice == productSpecialPrice) &&
            (identical(other.productDiscount, productDiscount) ||
                other.productDiscount == productDiscount) &&
            (identical(other.offers, offers) || other.offers == offers) &&
            (identical(other.clubPoint, clubPoint) ||
                other.clubPoint == clubPoint) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount) &&
            (identical(other.productImg, productImg) ||
                other.productImg == productImg) &&
            (identical(other.emiAvailable, emiAvailable) ||
                other.emiAvailable == emiAvailable) &&
            (identical(other.comingSoon, comingSoon) ||
                other.comingSoon == comingSoon) &&
            (identical(other.isAd, isAd) || other.isAd == isAd) &&
            const DeepCollectionEquality().equals(
              other._attributes,
              _attributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    expressDelivery,
    productName,
    sku,
    slug,
    typeId,
    stockAvailable,
    freeDelivery,
    productPrice,
    productSpecialPrice,
    productDiscount,
    offers,
    clubPoint,
    rating,
    ratingCount,
    productImg,
    emiAvailable,
    comingSoon,
    isAd,
    const DeepCollectionEquality().hash(_attributes),
  ]);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(this);
  }
}

abstract class _Product implements Product {
  const factory _Product({
    @HiveField(0)
    @JsonKey(name: "id", fromJson: _toStringSafe)
    final String? id,
    @HiveField(1)
    @JsonKey(name: "express_delivery", fromJson: _toStringSafe)
    final String? expressDelivery,
    @HiveField(2) @JsonKey(name: "product_name") final String? productName,
    @HiveField(3) @JsonKey(name: "sku") final String? sku,
    @HiveField(4) @JsonKey(name: "slug") final String? slug,
    @HiveField(5) @JsonKey(name: "type_id") final String? typeId,
    @HiveField(6)
    @JsonKey(name: "stock_available", fromJson: _toBoolSafe)
    final bool? stockAvailable,
    @HiveField(7)
    @JsonKey(name: "free_delivery", fromJson: _toStringSafe)
    final String? freeDelivery,
    @HiveField(8)
    @JsonKey(name: "product_price", fromJson: _toIntSafe)
    final int? productPrice,
    @HiveField(9)
    @JsonKey(name: "product_specialPrice", fromJson: _toIntSafe)
    final int? productSpecialPrice,
    @HiveField(10)
    @JsonKey(name: "product_discount", fromJson: _toIntSafe)
    final int? productDiscount,
    @HiveField(11)
    @JsonKey(name: "offers", fromJson: _toStringSafe)
    final String? offers,
    @HiveField(12)
    @JsonKey(name: "club_point", fromJson: _toDoubleSafe)
    final double? clubPoint,
    @HiveField(13)
    @JsonKey(name: "rating", fromJson: _toDoubleSafe)
    final double? rating,
    @HiveField(14)
    @JsonKey(name: "rating_count", fromJson: _toIntSafe)
    final int? ratingCount,
    @HiveField(15) @JsonKey(name: "product_img") final String? productImg,
    @HiveField(16)
    @JsonKey(name: "emi_available", fromJson: _toBoolSafe)
    final bool? emiAvailable,
    @HiveField(17)
    @JsonKey(name: "coming_soon", fromJson: _toBoolSafe)
    final bool? comingSoon,
    @HiveField(18)
    @JsonKey(name: "is_ad", fromJson: _toBoolSafe)
    final bool? isAd,
    @HiveField(19)
    @JsonKey(name: "attributes")
    final List<ProductAttribute>? attributes,
  }) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "id", fromJson: _toStringSafe)
  String? get id;
  @override
  @HiveField(1)
  @JsonKey(name: "express_delivery", fromJson: _toStringSafe)
  String? get expressDelivery;
  @override
  @HiveField(2)
  @JsonKey(name: "product_name")
  String? get productName;
  @override
  @HiveField(3)
  @JsonKey(name: "sku")
  String? get sku;
  @override
  @HiveField(4)
  @JsonKey(name: "slug")
  String? get slug;
  @override
  @HiveField(5)
  @JsonKey(name: "type_id")
  String? get typeId;
  @override
  @HiveField(6)
  @JsonKey(name: "stock_available", fromJson: _toBoolSafe)
  bool? get stockAvailable;
  @override
  @HiveField(7)
  @JsonKey(name: "free_delivery", fromJson: _toStringSafe)
  String? get freeDelivery;
  @override
  @HiveField(8)
  @JsonKey(name: "product_price", fromJson: _toIntSafe)
  int? get productPrice;
  @override
  @HiveField(9)
  @JsonKey(name: "product_specialPrice", fromJson: _toIntSafe)
  int? get productSpecialPrice;
  @override
  @HiveField(10)
  @JsonKey(name: "product_discount", fromJson: _toIntSafe)
  int? get productDiscount;
  @override
  @HiveField(11)
  @JsonKey(name: "offers", fromJson: _toStringSafe)
  String? get offers;
  @override
  @HiveField(12)
  @JsonKey(name: "club_point", fromJson: _toDoubleSafe)
  double? get clubPoint;
  @override
  @HiveField(13)
  @JsonKey(name: "rating", fromJson: _toDoubleSafe)
  double? get rating;
  @override
  @HiveField(14)
  @JsonKey(name: "rating_count", fromJson: _toIntSafe)
  int? get ratingCount;
  @override
  @HiveField(15)
  @JsonKey(name: "product_img")
  String? get productImg;
  @override
  @HiveField(16)
  @JsonKey(name: "emi_available", fromJson: _toBoolSafe)
  bool? get emiAvailable;
  @override
  @HiveField(17)
  @JsonKey(name: "coming_soon", fromJson: _toBoolSafe)
  bool? get comingSoon;
  @override
  @HiveField(18)
  @JsonKey(name: "is_ad", fromJson: _toBoolSafe)
  bool? get isAd;
  @override
  @HiveField(19)
  @JsonKey(name: "attributes")
  List<ProductAttribute>? get attributes;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
