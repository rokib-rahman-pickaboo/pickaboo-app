import 'package:pickaboo/data/model/category_products_response/category_products_response.dart';
import 'package:pickaboo/data/model/common/category/category.dart';
import 'package:pickaboo/data/model/common/filter/filter.dart';
import 'package:pickaboo/data/model/common/product/product.dart';
import 'package:pickaboo/data/model/common/slider/slider.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart'
    as entity;

import 'package:pickaboo/domain/entity/common/product/product_entity.dart'
    as entity;

extension CategoryProductsResponseMapper on CategoryProductsResponse {
  entity.CategoryProductsEntity toDomain() {
    return entity.CategoryProductsEntity(
      categoryId: categoryId ?? 0,
      categorySlug: categorySlug ?? '',
      categoryName: categoryName ?? '',
      metaTitle: metaTitle ?? '',
      metaKeywords: metaKeywords ?? '',
      metaDescription: metaDescription ?? '',
      image: image ?? '',
      mobileImage: mobileImage ?? '',
      banners: banner?.map((e) => e.toDomainBanner()).toList() ?? const [],
      filters: filterData?.map((e) => e.toDomainBanner()).toList() ?? const [],
      featuredProductTotal: featuredProductTotal ?? 0,
      totalCatProds: totalCatProds ?? 0,
      products: catProds?.map((e) => e.toDomain()).toList() ?? const [],
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
      categoryDescription: categoryDiscription ?? '',
      cacheTime: cacheTime,
    );
  }
}

extension AppliedFilterMapper on AppliedFilter {
  entity.AppliedFilterEntity toDomain() {
    return entity.AppliedFilterEntity(
      code: code ?? '',
      label: label ?? '',
      value: value ?? '',
      valueLabel: valueLabel ?? '',
    );
  }
}

extension FeaturedCategoryMapper on FeaturedCategory {
  entity.FeaturedCategoryEntity toDomain() {
    return entity.FeaturedCategoryEntity(
      categoryId: categoryId ?? 0,
      categoryName: categoryName ?? '',
      slug: slug ?? '',
      products: products?.map((e) => e.toDomain()).toList() ?? const [],
    );
  }
}

extension SliderMapper on Slider {
  entity.CategoryBannerEntity toDomainBanner() {
    return entity.CategoryBannerEntity(
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

extension ProductCategoryMapper on Product {
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

extension CategoryBrandMapper on Category {
  entity.CategoryBrandEntity toDomain() {
    return entity.CategoryBrandEntity(
      id: id ?? '',
      name: name ?? '',
      isSpecial: _parseBool(isSpecial),
      icon: icon ?? '',
    );
  }
}

extension SortOptionMapper on SortOption {
  entity.SortOptionEntity toDomain() {
    return entity.SortOptionEntity(title: title ?? '', value: value ?? '');
  }
}

extension FilterAttributeMapper on FilterAttribute {
  entity.FilterAttributeEntity toDomain() {
    return entity.FilterAttributeEntity(
      filterName: filterName ?? '',
      filterCode: filterCode ?? '',
      items: items?.map((e) => e.toDomain()).toList() ?? const [],
      specialForPhone: specialForPhone ?? false,
    );
  }
}

extension FilterItemMapper on FilterItem {
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
