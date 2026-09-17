// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDetailResponseAdapter extends TypeAdapter<ProductDetailResponse> {
  @override
  final int typeId = 19;

  @override
  ProductDetailResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDetailResponse(
      id: fields[0] as int?,
      sku: fields[1] as String?,
      slug: fields[2] as String?,
      typeId: fields[3] as String?,
      name: fields[4] as String?,
      prodOfferPrice: fields[5] as int?,
      bestPrice: fields[6] as int?,
      freeDelivery: fields[7] as int?,
      categoryIds: (fields[8] as List)?.cast<String>(),
      metaTitle: fields[9] as String?,
      metaKeywords: fields[10] as String?,
      metaDescription: fields[11] as String?,
      images: (fields[12] as List)?.cast<String>(),
      youtubeVideos: (fields[47] as List)?.cast<YoutubeVideo>(),
      isWishlisted: fields[13] as bool?,
      isEligibleForReview: fields[14] as bool?,
      shareUrl: fields[15] as String?,
      regularPrice: fields[16] as int?,
      spacialPrice: fields[17] as int?,
      discount: fields[18] as int?,
      stockAvailable: fields[19] as bool?,
      expressDelivery: fields[20] as int?,
      comingSoon: fields[21] as bool?,
      clubPoints: fields[22] as double?,
      brandId: fields[23] as String?,
      brand: fields[24] as String?,
      soldByVendorUrlKey: fields[25] as String?,
      soldBy: fields[26] as String?,
      offers: fields[27] as String?,
      warranty: fields[28] as String?,
      emi: fields[29] as double?,
      varient: (fields[30] as List)?.cast<Varient>(),
      extraOptions: (fields[31] as List)?.cast<ExtraOption>(),
      buysTogather: (fields[32] as List)?.cast<BuysTogather>(),
      productDetails: fields[33] as String?,
      moreInformation: (fields[34] as List)?.cast<MoreInformation>(),
      ratingSummaryValue: fields[35] as double?,
      ratingSummary: fields[36] as int?,
      reviewsCount: fields[37] as int?,
      detailedRatings: (fields[38] as List)?.cast<DetailedRating>(),
      detailedSummary: (fields[39] as List)?.cast<int>(),
      allReviewImages: (fields[40] as List)?.cast<String>(),
      similarProducts: (fields[42] as List)?.cast<Product>(),
      youMayAlsoLike: (fields[43] as List)?.cast<Product>(),
      otherBrands: (fields[44] as List)?.cast<OtherBrand>(),
      recentlyViewedProducts: (fields[45] as List)?.cast<Product>(),
      cacheTime: fields[46] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDetailResponse obj) {
    writer
      ..writeByte(47)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sku)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.typeId)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.prodOfferPrice)
      ..writeByte(6)
      ..write(obj.bestPrice)
      ..writeByte(7)
      ..write(obj.freeDelivery)
      ..writeByte(8)
      ..write(obj.categoryIds)
      ..writeByte(9)
      ..write(obj.metaTitle)
      ..writeByte(10)
      ..write(obj.metaKeywords)
      ..writeByte(11)
      ..write(obj.metaDescription)
      ..writeByte(12)
      ..write(obj.images)
      ..writeByte(47)
      ..write(obj.youtubeVideos)
      ..writeByte(13)
      ..write(obj.isWishlisted)
      ..writeByte(14)
      ..write(obj.isEligibleForReview)
      ..writeByte(15)
      ..write(obj.shareUrl)
      ..writeByte(16)
      ..write(obj.regularPrice)
      ..writeByte(17)
      ..write(obj.spacialPrice)
      ..writeByte(18)
      ..write(obj.discount)
      ..writeByte(19)
      ..write(obj.stockAvailable)
      ..writeByte(20)
      ..write(obj.expressDelivery)
      ..writeByte(21)
      ..write(obj.comingSoon)
      ..writeByte(22)
      ..write(obj.clubPoints)
      ..writeByte(23)
      ..write(obj.brandId)
      ..writeByte(24)
      ..write(obj.brand)
      ..writeByte(25)
      ..write(obj.soldByVendorUrlKey)
      ..writeByte(26)
      ..write(obj.soldBy)
      ..writeByte(27)
      ..write(obj.offers)
      ..writeByte(28)
      ..write(obj.warranty)
      ..writeByte(29)
      ..write(obj.emi)
      ..writeByte(30)
      ..write(obj.varient)
      ..writeByte(31)
      ..write(obj.extraOptions)
      ..writeByte(32)
      ..write(obj.buysTogather)
      ..writeByte(33)
      ..write(obj.productDetails)
      ..writeByte(34)
      ..write(obj.moreInformation)
      ..writeByte(35)
      ..write(obj.ratingSummaryValue)
      ..writeByte(36)
      ..write(obj.ratingSummary)
      ..writeByte(37)
      ..write(obj.reviewsCount)
      ..writeByte(38)
      ..write(obj.detailedRatings)
      ..writeByte(39)
      ..write(obj.detailedSummary)
      ..writeByte(40)
      ..write(obj.allReviewImages)
      ..writeByte(42)
      ..write(obj.similarProducts)
      ..writeByte(43)
      ..write(obj.youMayAlsoLike)
      ..writeByte(44)
      ..write(obj.otherBrands)
      ..writeByte(45)
      ..write(obj.recentlyViewedProducts)
      ..writeByte(46)
      ..write(obj.cacheTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class YoutubeVideoAdapter extends TypeAdapter<YoutubeVideo> {
  @override
  final int typeId = 30;

  @override
  YoutubeVideo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YoutubeVideo(url: fields[0] as String?, title: fields[1] as String?);
  }

  @override
  void write(BinaryWriter writer, YoutubeVideo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YoutubeVideoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DetailedRatingAdapter extends TypeAdapter<DetailedRating> {
  @override
  final int typeId = 20;

  @override
  DetailedRating read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailedRating(
      rating: fields[0] as String?,
      avgValue: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, DetailedRating obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.rating)
      ..writeByte(1)
      ..write(obj.avgValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailedRatingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExtraOptionAdapter extends TypeAdapter<ExtraOption> {
  @override
  final int typeId = 21;

  @override
  ExtraOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExtraOption(
      productSku: fields[0] as String?,
      optionId: fields[1] as int?,
      title: fields[2] as String?,
      type: fields[3] as String?,
      sortOrder: fields[4] as int?,
      isRequire: fields[5] as bool?,
      maxCharacters: fields[6] as int?,
      imageSizeX: fields[7] as int?,
      imageSizeY: fields[8] as int?,
      values: (fields[9] as List)?.cast<Value>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExtraOption obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.productSku)
      ..writeByte(1)
      ..write(obj.optionId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.sortOrder)
      ..writeByte(5)
      ..write(obj.isRequire)
      ..writeByte(6)
      ..write(obj.maxCharacters)
      ..writeByte(7)
      ..write(obj.imageSizeX)
      ..writeByte(8)
      ..write(obj.imageSizeY)
      ..writeByte(9)
      ..write(obj.values);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtraOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ValueAdapter extends TypeAdapter<Value> {
  @override
  final int typeId = 22;

  @override
  Value read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Value(
      title: fields[0] as String?,
      sortOrder: fields[1] as int?,
      price: fields[2] as int?,
      priceType: fields[3] as String?,
      optionTypeId: fields[4] as int?,
      details: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Value obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.sortOrder)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.priceType)
      ..writeByte(4)
      ..write(obj.optionTypeId)
      ..writeByte(5)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MoreInformationAdapter extends TypeAdapter<MoreInformation> {
  @override
  final int typeId = 23;

  @override
  MoreInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoreInformation(
      groupLabel: fields[0] as String?,
      attrList: (fields[1] as List)?.cast<AttrList>(),
    );
  }

  @override
  void write(BinaryWriter writer, MoreInformation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.groupLabel)
      ..writeByte(1)
      ..write(obj.attrList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoreInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttrListAdapter extends TypeAdapter<AttrList> {
  @override
  final int typeId = 24;

  @override
  AttrList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttrList(
      label: fields[0] as String?,
      value: fields[1] as String?,
      iconUrl: fields[2] as String?,
      icon: fields[3] as String?,
      isFeatured: fields[4] == null ? false : fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AttrList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.iconUrl)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.isFeatured);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttrListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OtherBrandAdapter extends TypeAdapter<OtherBrand> {
  @override
  final int typeId = 25;

  @override
  OtherBrand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OtherBrand(
      id: fields[0] as String?,
      slug: fields[1] as String?,
      name: fields[2] as String?,
      isSpecial: fields[3] as String?,
      icon: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OtherBrand obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.isSpecial)
      ..writeByte(4)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtherBrandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VarientAdapter extends TypeAdapter<Varient> {
  @override
  final int typeId = 26;

  @override
  Varient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Varient(
      optionId: fields[0] as String?,
      optionName: fields[1] as String?,
      options: (fields[2] as List)?.cast<Option>(),
    );
  }

  @override
  void write(BinaryWriter writer, Varient obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.optionId)
      ..writeByte(1)
      ..write(obj.optionName)
      ..writeByte(2)
      ..write(obj.options);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VarientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OptionAdapter extends TypeAdapter<Option> {
  @override
  final int typeId = 27;

  @override
  Option read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Option(
      optionValue: fields[0] as String?,
      optionText: fields[1] as String?,
      configurableProduct: fields[2] as ConfigurableProduct?,
    );
  }

  @override
  void write(BinaryWriter writer, Option obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.optionValue)
      ..writeByte(1)
      ..write(obj.optionText)
      ..writeByte(2)
      ..write(obj.configurableProduct);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ConfigurableProductAdapter extends TypeAdapter<ConfigurableProduct> {
  @override
  final int typeId = 28;

  @override
  ConfigurableProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigurableProduct(
      id: fields[0] as int?,
      stockAvailable: fields[1] as bool?,
      productPrice: fields[2] as int?,
      productSpecialPrice: fields[3] as int?,
      productDiscount: fields[4] as int?,
      emi: fields[5] as double?,
      clubPoints: fields[6] as double?,
      productImages: (fields[7] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ConfigurableProduct obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.stockAvailable)
      ..writeByte(2)
      ..write(obj.productPrice)
      ..writeByte(3)
      ..write(obj.productSpecialPrice)
      ..writeByte(4)
      ..write(obj.productDiscount)
      ..writeByte(5)
      ..write(obj.emi)
      ..writeByte(6)
      ..write(obj.clubPoints)
      ..writeByte(7)
      ..write(obj.productImages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigurableProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BuysTogatherAdapter extends TypeAdapter<BuysTogather> {
  @override
  final int typeId = 29;

  @override
  BuysTogather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BuysTogather(
      id: fields[0] as String?,
      sku: fields[1] as String?,
      slug: fields[2] as String?,
      typeId: fields[3] as String?,
      expressDelivery: fields[4] as String?,
      productName: fields[5] as String?,
      stockAvailable: fields[6] as bool?,
      productPrice: fields[7] as int?,
      productSpecialPrice: fields[8] as int?,
      productDiscount: fields[9] as int?,
      rating: fields[10] as double?,
      ratingCount: fields[11] as int?,
      productImg: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BuysTogather obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sku)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.typeId)
      ..writeByte(4)
      ..write(obj.expressDelivery)
      ..writeByte(5)
      ..write(obj.productName)
      ..writeByte(6)
      ..write(obj.stockAvailable)
      ..writeByte(7)
      ..write(obj.productPrice)
      ..writeByte(8)
      ..write(obj.productSpecialPrice)
      ..writeByte(9)
      ..write(obj.productDiscount)
      ..writeByte(10)
      ..write(obj.rating)
      ..writeByte(11)
      ..write(obj.ratingCount)
      ..writeByte(12)
      ..write(obj.productImg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuysTogatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailResponseImpl _$$ProductDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductDetailResponseImpl(
  id: (json['id'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  slug: json['slug'] as String?,
  typeId: json['type_id'] as String?,
  name: json['name'] as String?,
  prodOfferPrice: (json['prod_offer_price'] as num?)?.toInt(),
  bestPrice: (json['best_price'] as num?)?.toInt(),
  freeDelivery: (json['free_delivery'] as num?)?.toInt(),
  categoryIds:
      (json['category_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  metaTitle: json['meta_title'] as String?,
  metaKeywords: json['meta_keywords'] as String?,
  metaDescription: json['meta_description'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  youtubeVideos:
      (json['youtube_videos'] as List<dynamic>?)
          ?.map((e) => YoutubeVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
  isWishlisted: json['is_wishlisted'] as bool?,
  isEligibleForReview: json['is_eligible_for_review'] as bool?,
  shareUrl: json['share_url'] as String?,
  regularPrice: (json['regular_price'] as num?)?.toInt(),
  spacialPrice: (json['spacial_price'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
  stockAvailable: json['stock_available'] as bool?,
  expressDelivery: (json['express_delivery'] as num?)?.toInt(),
  comingSoon: json['coming_soon'] as bool?,
  clubPoints: (json['club_points'] as num?)?.toDouble(),
  brandId: json['brand_id'] as String?,
  brand: json['brand'] as String?,
  soldByVendorUrlKey: json['sold_by_vendor_url_key'] as String?,
  soldBy: json['sold_by'] as String?,
  offers: json['offers'] as String?,
  warranty: json['warranty'] as String?,
  emi: (json['emi'] as num?)?.toDouble(),
  varient:
      (json['varient'] as List<dynamic>?)
          ?.map((e) => Varient.fromJson(e as Map<String, dynamic>))
          .toList(),
  variantMatrix:
      json['variant_matrix'] == null
          ? null
          : VariantMatrixResponse.fromJson(
            json['variant_matrix'] as Map<String, dynamic>,
          ),
  extraOptions:
      (json['extra_options'] as List<dynamic>?)
          ?.map((e) => ExtraOption.fromJson(e as Map<String, dynamic>))
          .toList(),
  buysTogather:
      (json['buys_togather'] as List<dynamic>?)
          ?.map((e) => BuysTogather.fromJson(e as Map<String, dynamic>))
          .toList(),
  productDetails: json['product_details'] as String?,
  moreInformation:
      (json['more_information'] as List<dynamic>?)
          ?.map((e) => MoreInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
  ratingSummaryValue: (json['rating_summary_value'] as num?)?.toDouble(),
  ratingSummary: (json['rating_summary'] as num?)?.toInt(),
  reviewsCount: (json['reviews_count'] as num?)?.toInt(),
  detailedRatings:
      (json['detailed_ratings'] as List<dynamic>?)
          ?.map((e) => DetailedRating.fromJson(e as Map<String, dynamic>))
          .toList(),
  detailedSummary:
      (json['detailed_summary'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
  allReviewImages:
      (json['all_review_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  reviewsCollection:
      (json['reviews_collection'] as List<dynamic>?)
          ?.map((e) => ReviewResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  similarProducts:
      (json['similar_products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
  youMayAlsoLike:
      (json['you_may_also_like'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
  otherBrands:
      (json['other_brands'] as List<dynamic>?)
          ?.map((e) => OtherBrand.fromJson(e as Map<String, dynamic>))
          .toList(),
  recentlyViewedProducts:
      (json['recently_viewed_products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
  cacheTime:
      json['cache_time'] == null
          ? null
          : DateTime.parse(json['cache_time'] as String),
);

Map<String, dynamic> _$$ProductDetailResponseImplToJson(
  _$ProductDetailResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'sku': instance.sku,
  'slug': instance.slug,
  'type_id': instance.typeId,
  'name': instance.name,
  'prod_offer_price': instance.prodOfferPrice,
  'best_price': instance.bestPrice,
  'free_delivery': instance.freeDelivery,
  'category_ids': instance.categoryIds,
  'meta_title': instance.metaTitle,
  'meta_keywords': instance.metaKeywords,
  'meta_description': instance.metaDescription,
  'images': instance.images,
  'youtube_videos': instance.youtubeVideos,
  'is_wishlisted': instance.isWishlisted,
  'is_eligible_for_review': instance.isEligibleForReview,
  'share_url': instance.shareUrl,
  'regular_price': instance.regularPrice,
  'spacial_price': instance.spacialPrice,
  'discount': instance.discount,
  'stock_available': instance.stockAvailable,
  'express_delivery': instance.expressDelivery,
  'coming_soon': instance.comingSoon,
  'club_points': instance.clubPoints,
  'brand_id': instance.brandId,
  'brand': instance.brand,
  'sold_by_vendor_url_key': instance.soldByVendorUrlKey,
  'sold_by': instance.soldBy,
  'offers': instance.offers,
  'warranty': instance.warranty,
  'emi': instance.emi,
  'varient': instance.varient,
  'variant_matrix': instance.variantMatrix,
  'extra_options': instance.extraOptions,
  'buys_togather': instance.buysTogather,
  'product_details': instance.productDetails,
  'more_information': instance.moreInformation,
  'rating_summary_value': instance.ratingSummaryValue,
  'rating_summary': instance.ratingSummary,
  'reviews_count': instance.reviewsCount,
  'detailed_ratings': instance.detailedRatings,
  'detailed_summary': instance.detailedSummary,
  'all_review_images': instance.allReviewImages,
  'reviews_collection': instance.reviewsCollection,
  'similar_products': instance.similarProducts,
  'you_may_also_like': instance.youMayAlsoLike,
  'other_brands': instance.otherBrands,
  'recently_viewed_products': instance.recentlyViewedProducts,
  'cache_time': instance.cacheTime?.toIso8601String(),
};

_$YoutubeVideoImpl _$$YoutubeVideoImplFromJson(Map<String, dynamic> json) =>
    _$YoutubeVideoImpl(
      url: json['url'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$YoutubeVideoImplToJson(_$YoutubeVideoImpl instance) =>
    <String, dynamic>{'url': instance.url, 'title': instance.title};

_$DetailedRatingImpl _$$DetailedRatingImplFromJson(Map<String, dynamic> json) =>
    _$DetailedRatingImpl(
      rating: json['rating'] as String?,
      avgValue: (json['avg_value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DetailedRatingImplToJson(
  _$DetailedRatingImpl instance,
) => <String, dynamic>{
  'rating': instance.rating,
  'avg_value': instance.avgValue,
};

_$ExtraOptionImpl _$$ExtraOptionImplFromJson(Map<String, dynamic> json) =>
    _$ExtraOptionImpl(
      productSku: json['product_sku'] as String?,
      optionId: (json['option_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      type: json['type'] as String?,
      sortOrder: (json['sort_order'] as num?)?.toInt(),
      isRequire: json['is_require'] as bool?,
      maxCharacters: (json['max_characters'] as num?)?.toInt(),
      imageSizeX: (json['image_size_x'] as num?)?.toInt(),
      imageSizeY: (json['image_size_y'] as num?)?.toInt(),
      values:
          (json['values'] as List<dynamic>?)
              ?.map((e) => Value.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$ExtraOptionImplToJson(_$ExtraOptionImpl instance) =>
    <String, dynamic>{
      'product_sku': instance.productSku,
      'option_id': instance.optionId,
      'title': instance.title,
      'type': instance.type,
      'sort_order': instance.sortOrder,
      'is_require': instance.isRequire,
      'max_characters': instance.maxCharacters,
      'image_size_x': instance.imageSizeX,
      'image_size_y': instance.imageSizeY,
      'values': instance.values,
    };

_$ValueImpl _$$ValueImplFromJson(Map<String, dynamic> json) => _$ValueImpl(
  title: json['title'] as String?,
  sortOrder: (json['sort_order'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toInt(),
  priceType: json['price_type'] as String?,
  optionTypeId: (json['option_type_id'] as num?)?.toInt(),
  details: json['details'] as String?,
);

Map<String, dynamic> _$$ValueImplToJson(_$ValueImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'sort_order': instance.sortOrder,
      'price': instance.price,
      'price_type': instance.priceType,
      'option_type_id': instance.optionTypeId,
      'details': instance.details,
    };

_$MoreInformationImpl _$$MoreInformationImplFromJson(
  Map<String, dynamic> json,
) => _$MoreInformationImpl(
  groupLabel: json['group_label'] as String?,
  attrList:
      (json['attr_list'] as List<dynamic>?)
          ?.map((e) => AttrList.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$MoreInformationImplToJson(
  _$MoreInformationImpl instance,
) => <String, dynamic>{
  'group_label': instance.groupLabel,
  'attr_list': instance.attrList,
};

_$AttrListImpl _$$AttrListImplFromJson(Map<String, dynamic> json) =>
    _$AttrListImpl(
      label: json['label'] as String?,
      value: json['value'] as String?,
      iconUrl: json['icon_url'] as String?,
      icon: json['icon'] as String?,
      isFeatured:
          json['is_featured'] == null
              ? false
              : _boolFromJson(json['is_featured']),
    );

Map<String, dynamic> _$$AttrListImplToJson(_$AttrListImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'icon_url': instance.iconUrl,
      'icon': instance.icon,
      'is_featured': instance.isFeatured,
    };

_$OtherBrandImpl _$$OtherBrandImplFromJson(Map<String, dynamic> json) =>
    _$OtherBrandImpl(
      id: json['id'] as String?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      isSpecial: json['is_special'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$OtherBrandImplToJson(_$OtherBrandImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'is_special': instance.isSpecial,
      'icon': instance.icon,
    };

_$VarientImpl _$$VarientImplFromJson(Map<String, dynamic> json) =>
    _$VarientImpl(
      optionId: json['option_id'] as String?,
      optionName: json['option_name'] as String?,
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$VarientImplToJson(_$VarientImpl instance) =>
    <String, dynamic>{
      'option_id': instance.optionId,
      'option_name': instance.optionName,
      'options': instance.options,
    };

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
  optionValue: json['option_value'] as String?,
  optionText: json['option_text'] as String?,
  configurableProduct:
      json['configurable_product'] == null
          ? null
          : ConfigurableProduct.fromJson(
            json['configurable_product'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'option_value': instance.optionValue,
      'option_text': instance.optionText,
      'configurable_product': instance.configurableProduct,
    };

_$ConfigurableProductImpl _$$ConfigurableProductImplFromJson(
  Map<String, dynamic> json,
) => _$ConfigurableProductImpl(
  id: (json['id'] as num?)?.toInt(),
  stockAvailable: json['stock_available'] as bool?,
  productPrice: (json['product_price'] as num?)?.toInt(),
  productSpecialPrice: (json['product_specialPrice'] as num?)?.toInt(),
  productDiscount: (json['product_discount'] as num?)?.toInt(),
  emi: (json['emi'] as num?)?.toDouble(),
  clubPoints: (json['club_points'] as num?)?.toDouble(),
  productImages:
      (json['product_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
);

Map<String, dynamic> _$$ConfigurableProductImplToJson(
  _$ConfigurableProductImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'stock_available': instance.stockAvailable,
  'product_price': instance.productPrice,
  'product_specialPrice': instance.productSpecialPrice,
  'product_discount': instance.productDiscount,
  'emi': instance.emi,
  'club_points': instance.clubPoints,
  'product_images': instance.productImages,
};

_$VariantMatrixResponseImpl _$$VariantMatrixResponseImplFromJson(
  Map<String, dynamic> json,
) => _$VariantMatrixResponseImpl(
  attributes:
      (json['attributes'] as List<dynamic>?)
          ?.map(
            (e) => VariantMatrixAttribute.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => VariantMatrixProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
  tree:
      (json['tree'] as List<dynamic>?)
          ?.map((e) => VariantMatrixNode.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$VariantMatrixResponseImplToJson(
  _$VariantMatrixResponseImpl instance,
) => <String, dynamic>{
  'attributes': instance.attributes,
  'products': instance.products,
  'tree': instance.tree,
};

_$VariantMatrixAttributeImpl _$$VariantMatrixAttributeImplFromJson(
  Map<String, dynamic> json,
) => _$VariantMatrixAttributeImpl(
  optionId: _toStringSafe(json['option_id']),
  optionName: _toStringSafe(json['option_name']),
  attributeCode: _toStringSafe(json['attribute_code']),
  options:
      (json['options'] as List<dynamic>?)
          ?.map(
            (e) => VariantMatrixAttributeOption.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
);

Map<String, dynamic> _$$VariantMatrixAttributeImplToJson(
  _$VariantMatrixAttributeImpl instance,
) => <String, dynamic>{
  'option_id': instance.optionId,
  'option_name': instance.optionName,
  'attribute_code': instance.attributeCode,
  'options': instance.options,
};

_$VariantMatrixAttributeOptionImpl _$$VariantMatrixAttributeOptionImplFromJson(
  Map<String, dynamic> json,
) => _$VariantMatrixAttributeOptionImpl(
  optionValue: _toStringSafe(json['option_value']),
  optionText: _toStringSafe(json['option_text']),
);

Map<String, dynamic> _$$VariantMatrixAttributeOptionImplToJson(
  _$VariantMatrixAttributeOptionImpl instance,
) => <String, dynamic>{
  'option_value': instance.optionValue,
  'option_text': instance.optionText,
};

_$VariantMatrixProductImpl _$$VariantMatrixProductImplFromJson(
  Map<String, dynamic> json,
) => _$VariantMatrixProductImpl(
  id: (json['id'] as num?)?.toInt(),
  stockAvailable: json['stock_available'] as bool?,
  productPrice: (json['product_price'] as num?)?.toInt(),
  productSpecialPrice: (json['product_specialPrice'] as num?)?.toInt(),
  productDiscount: (json['product_discount'] as num?)?.toInt(),
  emi: (json['emi'] as num?)?.toDouble(),
  clubPoints: (json['club_points'] as num?)?.toDouble(),
  productImages:
      (json['product_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  sku: _toStringSafe(json['sku']),
  variantName: _toStringSafe(json['variant_name']),
  selectedOptions:
      (json['selected_options'] as List<dynamic>?)
          ?.map(
            (e) =>
                VariantMatrixSelectedOption.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  isEnabled: json['is_enabled'] as bool?,
  salable: json['salable'] as bool?,
);

Map<String, dynamic> _$$VariantMatrixProductImplToJson(
  _$VariantMatrixProductImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'stock_available': instance.stockAvailable,
  'product_price': instance.productPrice,
  'product_specialPrice': instance.productSpecialPrice,
  'product_discount': instance.productDiscount,
  'emi': instance.emi,
  'club_points': instance.clubPoints,
  'product_images': instance.productImages,
  'sku': instance.sku,
  'variant_name': instance.variantName,
  'selected_options': instance.selectedOptions,
  'is_enabled': instance.isEnabled,
  'salable': instance.salable,
};

_$VariantMatrixSelectedOptionImpl _$$VariantMatrixSelectedOptionImplFromJson(
  Map<String, dynamic> json,
) => _$VariantMatrixSelectedOptionImpl(
  optionId: _toStringSafe(json['option_id']),
  optionName: _toStringSafe(json['option_name']),
  attributeCode: _toStringSafe(json['attribute_code']),
  optionValue: _toStringSafe(json['option_value']),
  optionText: _toStringSafe(json['option_text']),
);

Map<String, dynamic> _$$VariantMatrixSelectedOptionImplToJson(
  _$VariantMatrixSelectedOptionImpl instance,
) => <String, dynamic>{
  'option_id': instance.optionId,
  'option_name': instance.optionName,
  'attribute_code': instance.attributeCode,
  'option_value': instance.optionValue,
  'option_text': instance.optionText,
};

_$VariantMatrixNodeImpl _$$VariantMatrixNodeImplFromJson(
  Map<String, dynamic> json,
) => _$VariantMatrixNodeImpl(
  optionValue: _toStringSafe(json['option_value']),
  optionText: _toStringSafe(json['option_text']),
  salable: json['salable'] as bool?,
  children:
      (json['children'] as List<dynamic>?)
          ?.map((e) => VariantMatrixNode.fromJson(e as Map<String, dynamic>))
          .toList(),
  product:
      json['product'] == null
          ? null
          : VariantMatrixProduct.fromJson(
            json['product'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$$VariantMatrixNodeImplToJson(
  _$VariantMatrixNodeImpl instance,
) => <String, dynamic>{
  'option_value': instance.optionValue,
  'option_text': instance.optionText,
  'salable': instance.salable,
  'children': instance.children,
  'product': instance.product,
};

_$BuysTogatherImpl _$$BuysTogatherImplFromJson(Map<String, dynamic> json) =>
    _$BuysTogatherImpl(
      id: json['id'] as String?,
      sku: json['sku'] as String?,
      slug: json['slug'] as String?,
      typeId: json['type_id'] as String?,
      expressDelivery: json['express_delivery'] as String?,
      productName: json['product_name'] as String?,
      stockAvailable: json['stock_available'] as bool?,
      productPrice: (json['product_price'] as num?)?.toInt(),
      productSpecialPrice: (json['product_specialPrice'] as num?)?.toInt(),
      productDiscount: (json['product_discount'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      ratingCount: (json['rating_count'] as num?)?.toInt(),
      productImg: json['product_img'] as String?,
    );

Map<String, dynamic> _$$BuysTogatherImplToJson(_$BuysTogatherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'slug': instance.slug,
      'type_id': instance.typeId,
      'express_delivery': instance.expressDelivery,
      'product_name': instance.productName,
      'stock_available': instance.stockAvailable,
      'product_price': instance.productPrice,
      'product_specialPrice': instance.productSpecialPrice,
      'product_discount': instance.productDiscount,
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
      'product_img': instance.productImg,
    };
