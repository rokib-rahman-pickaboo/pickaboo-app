import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/review/review_entity.dart';

class ProductDetailEntity {
  final int id;
  final String sku;
  final String slug;
  final String typeId;
  final String name;
  final int prodOfferPrice;
  final int bestPrice;
  final int freeDelivery;
  final List<String> categoryIds;
  final String metaTitle;
  final String metaKeywords;
  final String metaDescription;
  final List<String> images;
  final List<YoutubeVideoEntity> youtubeVideos;
  final bool isWishlisted;
  final String shareUrl;
  final int regularPrice;
  final int spacialPrice;
  final int discount;
  final bool stockAvailable;
  final int expressDelivery;
  final bool comingSoon;
  final double clubPoints;
  final String brandId;
  final String brand;
  final String soldByVendorUrlKey;
  final String soldBy;
  final String offers;
  final String warranty;
  final double emi;
  final List<VariantEntity> varient;

  final VariantMatrixEntity variantMatrix;
  final List<ExtraOptionEntity> extraOptions;
  final List<BuyTogetherEntity> buysTogather;
  final String productDetails;
  final List<MoreInformationEntity> moreInformation;
  final double ratingSummaryValue;
  final int ratingSummary;
  final int reviewsCount;
  final List<DetailedRatingEntity> detailedRatings;
  final List<int> detailedSummary;
  final List<String> allReviewImages;
  final List<ReviewEntity> reviewsCollection;
  final List<ProductEntity> similarProducts;
  final List<ProductEntity> youMayAlsoLike;
  final List<OtherBrandEntity> otherBrands;
  final List<ProductEntity> recentlyViewedProducts;
  final DateTime cacheTime;
  final bool isEligibleForReview;
  final bool isPartial;

  const ProductDetailEntity({
    required this.id,
    required this.sku,
    required this.slug,
    required this.typeId,
    required this.name,
    required this.prodOfferPrice,
    required this.bestPrice,
    required this.freeDelivery,
    required this.categoryIds,
    required this.metaTitle,
    required this.metaKeywords,
    required this.metaDescription,
    required this.images,
    this.youtubeVideos = const [],
    required this.isWishlisted,
    required this.shareUrl,
    required this.regularPrice,
    required this.spacialPrice,
    required this.discount,
    required this.stockAvailable,
    required this.expressDelivery,
    required this.comingSoon,
    required this.clubPoints,
    required this.brandId,
    required this.brand,
    required this.soldByVendorUrlKey,
    required this.soldBy,
    required this.offers,
    required this.warranty,
    required this.emi,
    required this.varient,
    this.variantMatrix = const VariantMatrixEntity(),
    required this.extraOptions,
    required this.buysTogather,
    required this.productDetails,
    required this.moreInformation,
    required this.ratingSummaryValue,
    required this.ratingSummary,
    required this.reviewsCount,
    required this.detailedRatings,
    required this.detailedSummary,
    required this.allReviewImages,
    required this.reviewsCollection,
    required this.similarProducts,
    required this.youMayAlsoLike,
    required this.otherBrands,
    required this.recentlyViewedProducts,
    required this.cacheTime,
    required this.isEligibleForReview,
    this.isPartial = false,
  });

  /// Instant Frame 0 hydration from a lightweight [ProductEntity] card/feed model.
  factory ProductDetailEntity.fromProductEntity(ProductEntity p) {
    final intId = int.tryParse(p.id) ?? 0;
    return ProductDetailEntity(
      id: intId,
      sku: p.sku,
      slug: p.slug,
      typeId: p.typeId,
      name: p.productName,
      prodOfferPrice: 0,
      bestPrice: 0,
      freeDelivery: p.freeDelivery ? 1 : 0,
      categoryIds: const [],
      metaTitle: p.productName,
      metaKeywords: '',
      metaDescription: '',
      images: p.productImg.isNotEmpty ? [p.productImg] : const [],
      youtubeVideos: const [],
      isWishlisted: false,
      shareUrl: 'https://www.pickaboo.com/product/${p.slug}',
      regularPrice: p.productPrice,
      spacialPrice: p.productSpecialPrice,
      discount: p.productDiscount,
      stockAvailable: p.stockAvailable,
      expressDelivery: p.expressDelivery ? 1 : 0,
      comingSoon: p.comingSoon,
      clubPoints: p.clubPoint,
      brandId: '',
      brand: '',
      soldByVendorUrlKey: '',
      soldBy: '',
      offers: '',
      warranty: '',
      emi: 0,
      varient: const [],
      variantMatrix: const VariantMatrixEntity(),
      extraOptions: const [],
      buysTogather: const [],
      productDetails: '',
      moreInformation: p.attributes.isNotEmpty
          ? [
              MoreInformationEntity(
                groupLabel: 'Overview',
                attrList: p.attributes
                    .map((a) => AttrListEntity(
                          label: a.label,
                          value: a.value,
                          isFeatured: true,
                        ))
                    .toList(),
              )
            ]
          : const [],
      ratingSummaryValue: p.rating,
      ratingSummary: (p.rating * 20).toInt(),
      reviewsCount: p.ratingCount,
      detailedRatings: const [],
      detailedSummary: const [0, 0, 0, 0, 0],
      allReviewImages: const [],
      reviewsCollection: const [],
      similarProducts: const [],
      youMayAlsoLike: const [],
      otherBrands: const [],
      recentlyViewedProducts: const [],
      cacheTime: DateTime.now(),
      isEligibleForReview: false,
      isPartial: true,
    );
  }

  List<VariantEntity> get variantGroups {
    final rawGroups =
        variantMatrix.isNotEmpty ? variantMatrix.toVariantGroups() : varient;
    return rawGroups
        .map((group) {
          final inStockOptions = group.options.where((opt) {
            if (opt.configurableProduct != null) {
              return opt.configurableProduct!.stockAvailable;
            }
            return true;
          }).toList();
          return VariantEntity(
            optionId: group.optionId,
            optionName: group.optionName,
            options: inStockOptions,
          );
        })
        .where((group) => group.options.isNotEmpty)
        .toList();
  }

  bool get hasVariants => variantGroups.isNotEmpty;

  /// Extracts all featured attributes (isFeatured == true) across all groups for "At a glance" / Key Highlights.
  List<AttrListEntity> get featuredHighlights {
    final List<AttrListEntity> highlights = [];
    for (final group in moreInformation) {
      for (final attr in group.attrList) {
        if (attr.isFeatured) {
          highlights.add(attr);
        }
      }
    }
    return highlights;
  }

  /// Whether the product has any featured attributes to display in the Key Highlights card.
  bool get hasKeyHighlights => featuredHighlights.isNotEmpty;

  /// Returns all specification groups that have at least one attribute.
  List<MoreInformationEntity> get specificationGroups {
    return moreInformation.where((group) => group.attrList.isNotEmpty).toList();
  }
}

class DetailedRatingEntity {
  final String rating;
  final double avgValue;

  const DetailedRatingEntity({required this.rating, required this.avgValue});
}

class MoreInformationEntity {
  final String groupLabel;
  final List<AttrListEntity> attrList;

  const MoreInformationEntity({
    required this.groupLabel,
    required this.attrList,
  });
}

class AttrListEntity {
  final String label;
  final String value;
  final String iconUrl;
  final String icon;
  final bool isFeatured;

  const AttrListEntity({
    required this.label,
    required this.value,
    this.iconUrl = '',
    this.icon = '',
    this.isFeatured = false,
  });
}

class YoutubeVideoEntity {
  final String url;
  final String title;

  const YoutubeVideoEntity({required this.url, required this.title});
}

class VariantMatrixEntity {
  final List<VariantMatrixAttributeEntity> attributes;
  final List<VariantMatrixProductEntity> products;
  final List<VariantMatrixNodeEntity> tree;

  const VariantMatrixEntity({
    this.attributes = const [],
    this.products = const [],
    this.tree = const [],
  });

  bool get isNotEmpty => attributes.isNotEmpty && salableProducts.isNotEmpty;
  bool get isEmpty => !isNotEmpty;

  List<VariantMatrixProductEntity> get salableProducts =>
      products.where((p) => p.salable && p.stockAvailable).toList(growable: false);

  Set<String> selectableValues(String optionId, Map<String, String> selected) {
    final others = Map<String, String>.from(selected)..remove(optionId);
    final values = <String>{};
    for (final product in salableProducts) {
      if (!product.matches(others)) continue;
      final value = product.valueFor(optionId);
      if (value != null) values.add(value);
    }
    return values;
  }

  VariantMatrixProductEntity? productFor(Map<String, String> selected) {
    if (selected.length < attributes.length) return null;
    for (final product in salableProducts) {
      if (product.matches(selected)) return product;
    }
    return null;
  }

  VariantMatrixProductEntity? representative(String optionId, String value) {
    for (final product in salableProducts) {
      if (product.valueFor(optionId) == value) return product;
    }
    return null;
  }

  List<VariantEntity> toVariantGroups() {
    return attributes
        .map(
          (attr) => VariantEntity(
            optionId: attr.optionId,
            optionName: attr.optionName,
            options: attr.options
                .where((opt) => representative(attr.optionId, opt.optionValue) != null)
                .map(
                  (opt) => VariantOptionEntity(
                    optionValue: opt.optionValue,
                    optionText: opt.optionText,
                    configurableProduct: representative(
                      attr.optionId,
                      opt.optionValue,
                    )?.toConfigurableProduct(),
                  ),
                )
                .toList(),
          ),
        )
        .where((attr) => attr.options.isNotEmpty)
        .toList();
  }
}

class VariantMatrixAttributeEntity {
  final String optionId;
  final String optionName;
  final String attributeCode;
  final List<VariantMatrixOptionEntity> options;

  const VariantMatrixAttributeEntity({
    required this.optionId,
    required this.optionName,
    required this.attributeCode,
    required this.options,
  });
}

class VariantMatrixOptionEntity {
  final String optionValue;
  final String optionText;

  const VariantMatrixOptionEntity({
    required this.optionValue,
    required this.optionText,
  });
}

class VariantMatrixProductEntity {
  final int id;
  final bool stockAvailable;
  final int productPrice;
  final int productSpecialPrice;
  final int productDiscount;
  final double emi;
  final double clubPoints;
  final List<String> productImages;
  final String sku;
  final String variantName;
  final List<VariantMatrixSelectedOptionEntity> selectedOptions;
  final bool isEnabled;
  final bool salable;

  const VariantMatrixProductEntity({
    required this.id,
    required this.stockAvailable,
    required this.productPrice,
    required this.productSpecialPrice,
    required this.productDiscount,
    required this.emi,
    required this.clubPoints,
    required this.productImages,
    required this.sku,
    required this.variantName,
    required this.selectedOptions,
    required this.isEnabled,
    required this.salable,
  });

  String? valueFor(String optionId) {
    for (final option in selectedOptions) {
      if (option.optionId == optionId) return option.optionValue;
    }
    return null;
  }

  bool matches(Map<String, String> selection) {
    for (final entry in selection.entries) {
      if (valueFor(entry.key) != entry.value) return false;
    }
    return true;
  }

  ConfigurableProductEntity toConfigurableProduct() => ConfigurableProductEntity(
    id: id,
    stockAvailable: stockAvailable,
    productPrice: productPrice,
    productSpecialPrice: productSpecialPrice,
    productDiscount: productDiscount,
    emi: emi,
    clubPoints: clubPoints,
    productImages: productImages,
  );
}

class VariantMatrixSelectedOptionEntity {
  final String optionId;
  final String optionName;
  final String attributeCode;
  final String optionValue;
  final String optionText;

  const VariantMatrixSelectedOptionEntity({
    required this.optionId,
    required this.optionName,
    required this.attributeCode,
    required this.optionValue,
    required this.optionText,
  });
}

class VariantMatrixNodeEntity {
  final String optionValue;
  final String optionText;
  final bool salable;
  final List<VariantMatrixNodeEntity> children;
  final VariantMatrixProductEntity? product;

  const VariantMatrixNodeEntity({
    required this.optionValue,
    required this.optionText,
    required this.salable,
    this.children = const [],
    this.product,
  });
}

class VariantEntity {
  final String optionId;
  final String optionName;
  final List<VariantOptionEntity> options;

  const VariantEntity({
    required this.optionId,
    required this.optionName,
    required this.options,
  });
}

class VariantOptionEntity {
  final String optionValue;
  final String optionText;
  final ConfigurableProductEntity? configurableProduct;

  const VariantOptionEntity({
    required this.optionValue,
    required this.optionText,
    this.configurableProduct,
  });
}

class ConfigurableProductEntity {
  final int id;
  final bool stockAvailable;
  final int productPrice;
  final int productSpecialPrice;
  final int productDiscount;
  final double emi;
  final double clubPoints;
  final List<String> productImages;

  const ConfigurableProductEntity({
    required this.id,
    required this.stockAvailable,
    required this.productPrice,
    required this.productSpecialPrice,
    required this.productDiscount,
    required this.emi,
    required this.clubPoints,
    required this.productImages,
  });
}

class ExtraOptionEntity {
  final String productSku;
  final int optionId;
  final String title;
  final String type;
  final int sortOrder;
  final bool isRequire;
  final int? maxCharacters;
  final int? imageSizeX;
  final int? imageSizeY;
  final List<ExtraOptionValueEntity> values;

  const ExtraOptionEntity({
    required this.productSku,
    required this.optionId,
    required this.title,
    required this.type,
    required this.sortOrder,
    required this.isRequire,
    this.maxCharacters,
    this.imageSizeX,
    this.imageSizeY,
    required this.values,
  });
}

class ExtraOptionValueEntity {
  final String title;
  final int price;
  final int sortOrder;
  final String priceType;
  final int optionTypeId;
  final String details;

  const ExtraOptionValueEntity({
    required this.title,
    required this.price,
    required this.sortOrder,
    required this.priceType,
    required this.optionTypeId,
    required this.details,
  });
}

class BuyTogetherEntity {
  final String id;
  final String sku;
  final String slug;
  final String typeId;
  final String expressDelivery;
  final String name;
  final bool stockAvailable;
  final int price;
  final int specialPrice;
  final int discount;
  final double rating;
  final int ratingCount;
  final String image;

  const BuyTogetherEntity({
    required this.id,
    required this.sku,
    required this.slug,
    required this.typeId,
    required this.expressDelivery,
    required this.name,
    required this.stockAvailable,
    required this.price,
    required this.specialPrice,
    required this.discount,
    required this.rating,
    required this.ratingCount,
    required this.image,
  });
}

class OtherBrandEntity {
  final String id;
  final String slug;
  final String name;
  final String isSpecial;
  final String icon;

  const OtherBrandEntity({
    required this.id,
    required this.slug,
    required this.name,
    required this.isSpecial,
    required this.icon,
  });
}
