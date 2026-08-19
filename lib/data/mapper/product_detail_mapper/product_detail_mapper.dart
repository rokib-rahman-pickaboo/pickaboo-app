import 'package:pickaboo/data/mapper/product_detail_mapper/review_mapper.dart';
import 'package:pickaboo/data/mapper/product_list_mapper/product_list_mapper.dart';
import 'package:pickaboo/data/model/product_detail_response/product_detail_response.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';

extension ProductDetailResponseMapper on ProductDetailResponse {
  ProductDetailEntity toEntity() {
    return ProductDetailEntity(
      id: id ?? 0,
      sku: sku ?? '',
      slug: slug ?? '',
      typeId: typeId ?? '',
      name: name ?? '',
      prodOfferPrice: prodOfferPrice ?? 0,
      bestPrice: bestPrice ?? 0,
      freeDelivery: freeDelivery ?? 0,
      categoryIds: categoryIds ?? [],
      metaTitle: metaTitle ?? '',
      metaKeywords: metaKeywords ?? '',
      metaDescription: metaDescription ?? '',
      images: images ?? [],
      youtubeVideos: youtubeVideos?.map((e) => e.toEntity()).toList() ?? [],
      isWishlisted: isWishlisted ?? false,
      shareUrl: shareUrl ?? '',
      regularPrice: regularPrice ?? 0,
      spacialPrice: spacialPrice ?? 0,
      discount: discount ?? 0,
      stockAvailable: stockAvailable ?? false,
      expressDelivery: expressDelivery ?? 0,
      comingSoon: comingSoon ?? false,
      clubPoints: clubPoints ?? 0.0,
      brandId: brandId ?? '',
      brand: brand ?? '',
      soldByVendorUrlKey: soldByVendorUrlKey ?? '',
      soldBy: soldBy ?? '',
      offers: offers ?? '',
      warranty: warranty ?? '',
      emi: emi ?? 0.0,
      varient: varient?.map((e) => e.toEntity()).toList() ?? [],
      variantMatrix:
          variantMatrix?.toEntity() ?? const VariantMatrixEntity(),
      extraOptions: extraOptions?.map((e) => e.toEntity()).toList() ?? [],
      buysTogather: buysTogather?.map((e) => e.toEntity()).toList() ?? [],
      productDetails: productDetails ?? '',
      moreInformation: moreInformation?.map((e) => e.toEntity()).toList() ?? [],
      ratingSummaryValue: ratingSummaryValue ?? 0.0,
      ratingSummary: ratingSummary ?? 0,
      reviewsCount: reviewsCount ?? 0,
      detailedRatings: detailedRatings?.map((e) => e.toEntity()).toList() ?? [],
      detailedSummary: detailedSummary ?? [],
      allReviewImages: allReviewImages ?? [],
      reviewsCollection:
          reviewsCollection?.map((e) => e.toEntity()).toList() ?? [],
      similarProducts: similarProducts?.map((p) => p.toDomain()).toList() ?? [],
      youMayAlsoLike: youMayAlsoLike?.map((p) => p.toDomain()).toList() ?? [],
      otherBrands: otherBrands?.map((p) => p.toEntity()).toList() ?? [],
      recentlyViewedProducts:
          recentlyViewedProducts?.map((p) => p.toDomain()).toList() ?? [],
      cacheTime: cacheTime ?? DateTime.now(),
      isEligibleForReview: isEligibleForReview ?? false,
    );
  }
}

extension DetailedRatingMapper on DetailedRating {
  DetailedRatingEntity toEntity() {
    return DetailedRatingEntity(
      rating: rating ?? '',
      avgValue: (avgValue ?? 0).toDouble(),
    );
  }
}

extension MoreInformationMapper on MoreInformation {
  MoreInformationEntity toEntity() {
    return MoreInformationEntity(
      groupLabel: groupLabel ?? '',
      attrList: attrList?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension AttrListMapper on AttrList {
  AttrListEntity toEntity() {
    return AttrListEntity(
      label: label ?? '',
      value: value ?? '',
      iconUrl: iconUrl ?? '',
      icon: icon ?? '',
    );
  }
}

extension YoutubeVideoMapper on YoutubeVideo {
  YoutubeVideoEntity toEntity() {
    return YoutubeVideoEntity(
      url: url ?? '',
      title: title ?? '',
    );
  }
}

extension VarientMapper on Varient {
  VariantEntity toEntity() {
    return VariantEntity(
      optionId: optionId ?? '',
      optionName: optionName ?? '',
      options: options?.map((o) => o.toEntity()).toList() ?? [],
    );
  }
}

extension OptionMapper on Option {
  VariantOptionEntity toEntity() {
    return VariantOptionEntity(
      optionValue: optionValue ?? '',
      optionText: optionText ?? '',
      configurableProduct: configurableProduct?.toEntity(),
    );
  }
}

extension ConfigurableProductMapper on ConfigurableProduct {
  ConfigurableProductEntity toEntity() {
    return ConfigurableProductEntity(
      id: id ?? 0,
      stockAvailable: stockAvailable ?? false,
      productPrice: productPrice ?? 0,
      productSpecialPrice: productSpecialPrice ?? 0,
      productDiscount: productDiscount ?? 0,
      emi: emi ?? 0.0,
      clubPoints: clubPoints ?? 0.0,
      productImages: productImages ?? [],
    );
  }
}

extension ExtraOptionMapper on ExtraOption {
  ExtraOptionEntity toEntity() {
    return ExtraOptionEntity(
      productSku: productSku ?? '',
      optionId: optionId ?? 0,
      title: title ?? '',
      type: type ?? '',
      sortOrder: sortOrder ?? 0,
      isRequire: isRequire ?? false,
      maxCharacters: maxCharacters,
      imageSizeX: imageSizeX,
      imageSizeY: imageSizeY,
      values: values?.map((v) => v.toEntity()).toList() ?? [],
    );
  }
}

extension ExtraOptionValueMapper on Value {
  ExtraOptionValueEntity toEntity() {
    return ExtraOptionValueEntity(
      title: title ?? '',
      price: price ?? 0,
      sortOrder: sortOrder ?? 0,
      priceType: priceType ?? '',
      optionTypeId: optionTypeId ?? 0,
      details: details ?? '',
    );
  }
}

extension BuyTogetherMapper on BuysTogather {
  BuyTogetherEntity toEntity() {
    return BuyTogetherEntity(
      id: id ?? '',
      sku: sku ?? '',
      slug: slug ?? '',
      typeId: typeId ?? '',
      expressDelivery: expressDelivery ?? '',
      name: productName ?? '',
      stockAvailable: stockAvailable ?? false,
      price: productPrice ?? 0,
      specialPrice: productSpecialPrice ?? 0,
      discount: productDiscount ?? 0,
      rating: rating ?? 0.0,
      ratingCount: ratingCount ?? 0,
      image: productImg ?? '',
    );
  }
}

extension OtherBrandMapper on OtherBrand {
  OtherBrandEntity toEntity() {
    return OtherBrandEntity(
      id: id ?? '',
      slug: slug ?? '',
      name: name ?? '',
      isSpecial: isSpecial ?? '',
      icon: icon ?? '',
    );
  }
}

extension VariantMatrixResponseMapper on VariantMatrixResponse {
  VariantMatrixEntity toEntity() {
    return VariantMatrixEntity(
      attributes: attributes?.map((e) => e.toEntity()).toList() ?? const [],
      products: products?.map((e) => e.toEntity()).toList() ?? const [],
      tree: tree?.map((e) => e.toEntity()).toList() ?? const [],
    );
  }
}

extension VariantMatrixAttributeMapper on VariantMatrixAttribute {
  VariantMatrixAttributeEntity toEntity() {
    return VariantMatrixAttributeEntity(
      optionId: optionId ?? '',
      optionName: optionName ?? '',
      attributeCode: attributeCode ?? '',
      options: options?.map((e) => e.toEntity()).toList() ?? const [],
    );
  }
}

extension VariantMatrixAttributeOptionMapper on VariantMatrixAttributeOption {
  VariantMatrixOptionEntity toEntity() {
    return VariantMatrixOptionEntity(
      optionValue: optionValue ?? '',
      optionText: optionText ?? '',
    );
  }
}

extension VariantMatrixProductMapper on VariantMatrixProduct {
  VariantMatrixProductEntity toEntity() {
    return VariantMatrixProductEntity(
      id: id ?? 0,
      stockAvailable: stockAvailable ?? false,
      productPrice: productPrice ?? 0,
      productSpecialPrice: productSpecialPrice ?? 0,
      productDiscount: productDiscount ?? 0,
      emi: emi ?? 0.0,
      clubPoints: clubPoints ?? 0.0,
      productImages: productImages ?? const [],
      sku: sku ?? '',
      variantName: variantName ?? '',
      selectedOptions:
          selectedOptions?.map((e) => e.toEntity()).toList() ?? const [],
      isEnabled: isEnabled ?? true,
      salable: salable ?? false,
    );
  }
}

extension VariantMatrixSelectedOptionMapper on VariantMatrixSelectedOption {
  VariantMatrixSelectedOptionEntity toEntity() {
    return VariantMatrixSelectedOptionEntity(
      optionId: optionId ?? '',
      optionName: optionName ?? '',
      attributeCode: attributeCode ?? '',
      optionValue: optionValue ?? '',
      optionText: optionText ?? '',
    );
  }
}

extension VariantMatrixNodeMapper on VariantMatrixNode {
  VariantMatrixNodeEntity toEntity() {
    return VariantMatrixNodeEntity(
      optionValue: optionValue ?? '',
      optionText: optionText ?? '',
      salable: salable ?? false,
      children: children?.map((e) => e.toEntity()).toList() ?? const [],
      product: product?.toEntity(),
    );
  }
}
