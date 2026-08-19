import 'package:pickaboo/data/model/brand_products_response/brand_products_response.dart';
import 'package:pickaboo/data/model/common/category/category.dart';
import 'package:pickaboo/data/model/common/filter/filter.dart';
import 'package:pickaboo/data/model/common/product/product.dart';
import 'package:pickaboo/data/model/common/slider/slider.dart';
import 'package:pickaboo/domain/entity/brand_products/brand_products_entity.dart'
    as entity;

import 'package:pickaboo/domain/entity/common/product/product_entity.dart'
    as entity;

extension BrandProductsResponseMapper on BrandProductsResponse {
  entity.BrandProductsEntity toDomain() {
    return entity.BrandProductsEntity(
      brandId: brandId ?? 0,
      brandSlug: brandSlug ?? '',
      brandName: brandName ?? '',
      metaTitle: metaTitle ?? '',
      metaKeywords: metaKeywords ?? '',
      metaDescription: metaDescription ?? '',
      image: image ?? '',
      mobileImage: mobileImage ?? '',
      banners: banner?.map((e) => e.toDomainBanner()).toList() ?? const [],
      filters: filterData?.map((e) => e.toDomainBanner()).toList() ?? const [],
      featuredProductTotal: featuredProductTotal ?? 0,
      totalBrandProds: totalBrandProds ?? 0,
      products: brandProds?.map((e) => e.toDomain()).toList() ?? const [],
      featuredProducts:
          featuredProducts?.map((e) => e.toDomain()).toList() ?? const [],
      featuredCategories:
          featuredCategory?.map((e) => e.toDomain()).toList() ?? const [],
      brands: brands?.map((e) => e.toDomain()).toList() ?? const [],
      sortOptions: sortData?.map((e) => e.toDomain()).toList() ?? const [],
      filterableAttributes:
          filterableAttributes?.map((e) => e.toDomain()).toList() ?? const [],
      appliedFilters:
          appliedFilters?.map((e) => e.toDomain()).toList() ?? const [],
      brandDescription: brandDiscription ?? '',
      cacheTime: cacheTime,
    );
  }
}

extension BrandAppliedFilterMapper on BrandAppliedFilter {
  entity.BrandAppliedFilterEntity toDomain() {
    return entity.BrandAppliedFilterEntity(
      code: code ?? '',
      label: label ?? '',
      value: value ?? '',
      valueLabel: valueLabel ?? '',
    );
  }
}

extension BrandFeaturedCategoryMapper on BrandFeaturedCategory {
  entity.BrandFeaturedCategoryEntity toDomain() {
    return entity.BrandFeaturedCategoryEntity(
      categoryId: categoryId ?? 0,
      categoryName: categoryName ?? '',
      slug: slug ?? '',
      products: products?.map((e) => e.toDomain()).toList() ?? const [],
    );
  }
}

extension BrandSliderMapper on Slider {
  entity.BrandBannerEntity toDomainBanner() {
    return entity.BrandBannerEntity(
      id: slideId ?? '',
      title: title ?? '',
      mobileSlug: mobileSlug ?? '',
      image: image ?? '',
      mobileImage: mobileImage ?? '',
      imagePosition: imagePosition ?? '',
      link: link ?? '',
      linkType: linktype ?? '',
      order: order ?? '',
      status: status ?? '',
      urlKey: urlKey,
      name: name,
      mobileImageUrl: mobileImageUrl ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}

extension ProductBrandMapper on Product {
  entity.ProductEntity toDomain() {
    return entity.ProductEntity(
      id: id ?? '',
      expressDelivery: _parseBool(expressDelivery),
      productName: productName ?? '',
      sku: sku ?? '',
      slug: slug ?? '',
      typeId: typeId ?? '',
      stockAvailable: stockAvailable ?? true,
      freeDelivery: _parseBool(freeDelivery ?? '0'),
      productPrice: productPrice ?? 0,
      productSpecialPrice: productSpecialPrice ?? 0,
      productDiscount: productDiscount ?? 0,
      offers: offers ?? '',
      rating: rating ?? 0.0,
      clubPoint: clubPoint ?? 0.0,
      ratingCount: ratingCount ?? 0,
      productImg: productImg ?? '',
      emiAvailable: emiAvailable ?? false,
      comingSoon: comingSoon ?? false,
      isAd: isAd ?? false,
      attributes: attributes?.map((e) => entity.ProductAttributeEntity(
        code: e.code ?? '',
        label: e.label ?? '',
        value: e.value ?? '',
      )).toList() ?? const [],
    );
  }
}

extension BrandItemMapper on Category {
  entity.BrandItemEntity toDomain() {
    return entity.BrandItemEntity(
      id: id ?? '',
      name: name ?? '',
      isSpecial: _parseBool(isSpecial),
      icon: icon ?? '',
    );
  }
}

extension BrandSortOptionMapper on SortOption {
  entity.SortOptionEntity toDomain() {
    return entity.SortOptionEntity(title: title ?? '', value: value ?? '');
  }
}

extension BrandFilterAttributeMapper on FilterAttribute {
  entity.FilterAttributeEntity toDomain() {
    return entity.FilterAttributeEntity(
      filterName: filterName ?? '',
      filterCode: filterCode ?? '',
      items: items?.map((e) => e.toDomain()).toList() ?? const [],
      specialForPhone: specialForPhone ?? false,
    );
  }
}

extension BrandFilterItemMapper on FilterItem {
  entity.FilterItemEntity toDomain() {
    return entity.FilterItemEntity(
      label: label ?? '',
      value: value ?? '',
      count: count ?? 0,
    );
  }
}

bool _parseBool(String? value) =>
    value == '1' || value?.toLowerCase() == 'true';
