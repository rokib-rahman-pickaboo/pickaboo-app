import 'package:pickaboo/data/model/common/category/category.dart';
import 'package:pickaboo/data/model/common/slider/slider.dart';
import 'package:pickaboo/data/model/home_content_response/home_content_response.dart';
import 'package:pickaboo/data/mapper/product_list_mapper/product_list_mapper.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart'
    as entity;

extension HomeContentResponseMapper on HomeContentResponse {
  entity.HomeContentEntity toEntity() {
    return entity.HomeContentEntity(
      categoryList: categoryList?.map((e) => e.toEntity()).toList() ?? const [],
      mainSlider: mainSlider?.map((e) => e.toEntity()).toList() ?? const [],
      commonLinkSlider:
          commonLinkSlider?.map((e) => e.toEntity()).toList() ?? const [],
      categorySlider:
          categorySlider?.map((e) => e.toEntity()).toList() ?? const [],
      categoryProducts:
          categoryProducts?.map((e) => e.toEntity()).toList() ?? const [],
      justForYou:
          justForYou?.toEntity() ??
          const entity.JustForYouEntity(total: 0, list: []),
    );
  }
}

extension CategoryListResponseMapper on Category {
  entity.CategoryListEntity toEntity() => entity.CategoryListEntity(
    id: id ?? '',
    slug: slug ?? '',
    name: name ?? '',
    isSpecial: _parseBool(isSpecial),
    icon: icon ?? '',
  );
}

extension CategoryProductResponseMapper on CategoryProduct {
  entity.CategoryProductEntity toEntity() => entity.CategoryProductEntity(
    categoryId: categoryId ?? '',
    categorySlug: categorySlug ?? '',
    categoryName: categoryName ?? '',
    isHome: _parseBool(isHome),
    isTodaysSpecial: _parseBool(isTodaysSpecial),
    isLaunchingSoon: _parseBool(isLaunchingSoon),
    isBrand: _parseBool(isBrand),
    isFeatured: _parseBool(isFeatured),
    isBanner: _parseBool(isBanner),
    homeBlockBg: homeBlockBg ?? '',
    isFlashHourCat: _parseBool(isFlashHourCat),
    flashHrStartDateTime: flashHrStartDateTime,
    flashHrEndDateTime: flashHrEndDateTime,
    background: background ?? '',
    image: image ?? '',
    isSpecial: _parseBool(isSpecial),
    products: products?.map((e) => e.toDomain()).toList() ?? const [],
  );
}


extension CategorySliderResponseMapper on CategorySlider {
  entity.CategorySliderEntity toEntity() => entity.CategorySliderEntity(
    name: name ?? '',
    alias: alias ?? '',
    status: status ?? '',
    backgroundColor: backgroundColor ?? '',
    linkTitleColor: linkTitleColor ?? '',
    slides: slidesData?.map((e) => e.toEntity()).toList() ?? const [],
  );
}

extension SliderResponseMapper on Slider {
  entity.SliderEntity toEntity() => entity.SliderEntity(
    id: slideId ?? '',
    sliderId: sliderId ?? '',
    storeId: storeId ?? '',
    title: title ?? '',
    mobileSlug: mobileSlug ?? '',
    isSpecialCat: _parseBool(isSpecialCat),
    image: imageUrl ?? image ?? '',
    mobileImage: mobileImageUrl ?? mobileImage ?? '',
    imagePosition: imagePosition ?? '',
    link: link ?? '',
    linkType: linktype ?? '',
    order: order ?? '',
    status: status ?? '',
    urlKey: urlKey ?? '',
    name: name ?? '',
    alias: alias ?? '',
    delay: delay ?? '',
    autoplay: autoplay ?? '',
    transition: transition ?? '',
    pagination: pagination ?? '',
    arrows: arrows ?? '',
    retinaImageSize: retinaImageSize ?? '',
    retinaMobileImageSize: retinaMobileImageSize ?? '',
  );
}

extension JustForYouResponseMapper on JustForYou {
  entity.JustForYouEntity toEntity() => entity.JustForYouEntity(
    total: total ?? 0,
    list: list?.map((e) => e.toDomain()).toList() ?? const [],
  );
}

bool _parseBool(String? value) {
  return value == '1' || value?.toLowerCase() == 'true';
}
