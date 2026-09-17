import 'package:pickaboo/data/model/product_detail_response/product_detail_response.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/data/model/common/product/product.dart';
import 'package:pickaboo/data/model/common/product/product_attribute.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

extension ProductDetailEntityReverseMapper on ProductDetailEntity {
  ProductDetailResponse toResponse() {
    return ProductDetailResponse(
      id: id,
      sku: sku,
      slug: slug,
      typeId: typeId,
      name: name,
      prodOfferPrice: prodOfferPrice,
      bestPrice: bestPrice,
      freeDelivery: freeDelivery,
      categoryIds: categoryIds,
      metaTitle: metaTitle,
      metaKeywords: metaKeywords,
      metaDescription: metaDescription,
      images: images,
      isWishlisted: isWishlisted,
      shareUrl: shareUrl,
      regularPrice: regularPrice,
      spacialPrice: spacialPrice,
      discount: discount,
      stockAvailable: stockAvailable,
      expressDelivery: expressDelivery,
      comingSoon: comingSoon,
      clubPoints: clubPoints,
      brandId: brandId,
      brand: brand,
      soldByVendorUrlKey: soldByVendorUrlKey,
      soldBy: soldBy,
      offers: offers,
      warranty: warranty,
      emi: emi,
      varient: varient.map((e) => e.toResponse()).toList(),
      extraOptions: extraOptions.map((e) => e.toResponse()).toList(),
      buysTogather: buysTogather.map((e) => e.toResponse()).toList(),
      productDetails: productDetails,
      moreInformation: moreInformation.map((e) => e.toResponse()).toList(),
      ratingSummaryValue: ratingSummaryValue,
      ratingSummary: ratingSummary,
      reviewsCount: reviewsCount,
      detailedRatings: detailedRatings.map((e) => e.toResponse()).toList(),
      detailedSummary: detailedSummary,
      allReviewImages: allReviewImages,
      reviewsCollection: [],
      similarProducts: similarProducts.map((p) => p.toResponse()).toList(),
      youMayAlsoLike: youMayAlsoLike.map((p) => p.toResponse()).toList(),
      otherBrands: otherBrands.map((p) => p.toResponse()).toList(),
      recentlyViewedProducts: recentlyViewedProducts.map((p) => p.toResponse()).toList(),
      cacheTime: cacheTime,
      isEligibleForReview: isEligibleForReview,
    );
  }
}

extension DetailedRatingEntityMapper on DetailedRatingEntity {
  DetailedRating toResponse() {
    return DetailedRating(
      rating: rating,
      avgValue: avgValue,
    );
  }
}

extension MoreInformationEntityMapper on MoreInformationEntity {
  MoreInformation toResponse() {
    return MoreInformation(
      groupLabel: groupLabel,
      attrList: attrList.map((e) => e.toResponse()).toList(),
    );
  }
}

extension AttrListEntityMapper on AttrListEntity {
  AttrList toResponse() {
    return AttrList(
      label: label,
      value: value,
      iconUrl: iconUrl,
      icon: icon,
      isFeatured: isFeatured,
    );
  }
}

extension VariantEntityMapper on VariantEntity {
  Varient toResponse() {
    return Varient(
      optionId: optionId,
      optionName: optionName,
      options: options.map((o) => o.toResponse()).toList(),
    );
  }
}

extension VariantOptionEntityMapper on VariantOptionEntity {
  Option toResponse() {
    return Option(
      optionValue: optionValue,
      optionText: optionText,
      configurableProduct: configurableProduct?.toResponse(),
    );
  }
}

extension ConfigurableProductEntityMapper on ConfigurableProductEntity {
  ConfigurableProduct toResponse() {
    return ConfigurableProduct(
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
}

extension ExtraOptionEntityMapper on ExtraOptionEntity {
  ExtraOption toResponse() {
    return ExtraOption(
      productSku: productSku,
      optionId: optionId,
      title: title,
      type: type,
      sortOrder: sortOrder,
      isRequire: isRequire,
      maxCharacters: maxCharacters,
      imageSizeX: imageSizeX,
      imageSizeY: imageSizeY,
      values: values.map((v) => v.toResponse()).toList(),
    );
  }
}

extension ExtraOptionValueEntityMapper on ExtraOptionValueEntity {
  Value toResponse() {
    return Value(
      title: title,
      price: price,
      sortOrder: sortOrder,
      priceType: priceType,
      optionTypeId: optionTypeId,
      details: details,
    );
  }
}

extension BuyTogetherEntityMapper on BuyTogetherEntity {
  BuysTogather toResponse() {
    return BuysTogather(
      id: id,
      sku: sku,
      slug: slug,
      typeId: typeId,
      expressDelivery: expressDelivery,
      productName: name,
      stockAvailable: stockAvailable,
      productPrice: price,
      productSpecialPrice: specialPrice,
      productDiscount: discount,
      rating: rating,
      ratingCount: ratingCount,
      productImg: image,
    );
  }
}

extension OtherBrandEntityMapper on OtherBrandEntity {
  OtherBrand toResponse() {
    return OtherBrand(
      id: id,
      slug: slug,
      name: name,
      isSpecial: isSpecial,
      icon: icon,
    );
  }
}

extension ProductEntityMapper on ProductEntity {
  Product toResponse() {
    return Product(
      id: id,
      expressDelivery: expressDelivery ? '1' : '0',
      productName: productName,
      sku: sku,
      slug: slug,
      typeId: typeId,
      stockAvailable: stockAvailable,
      freeDelivery: freeDelivery ? '1' : '0',
      productPrice: productPrice,
      productSpecialPrice: productSpecialPrice,
      productDiscount: productDiscount,
      offers: offers,
      rating: rating,
      clubPoint: clubPoint,
      ratingCount: ratingCount,
      productImg: productImg,
      emiAvailable: emiAvailable,
      comingSoon: comingSoon,
      isAd: isAd,
      attributes: attributes.map((e) => ProductAttribute(
        code: e.code,
        label: e.label,
        value: e.value,
      )).toList(),
    );
  }
}
