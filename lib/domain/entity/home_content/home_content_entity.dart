
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

class HomeContentEntity {
  final List<CategoryListEntity> categoryList;
  final List<SliderEntity> mainSlider;
  final List<SliderEntity> commonLinkSlider;
  final List<CategorySliderEntity> categorySlider;
  final List<CategoryProductEntity> categoryProducts;
  final JustForYouEntity justForYou;

  const HomeContentEntity({
    required this.categoryList,
    required this.mainSlider,
    required this.commonLinkSlider,
    required this.categorySlider,
    required this.categoryProducts,
    required this.justForYou,
  });
}

class CategoryListEntity {
  final String id;
  final String slug;
  final String name;
  final bool isSpecial;
  final String icon;

  const CategoryListEntity({
    required this.id,
    required this.slug,
    required this.name,
    required this.isSpecial,
    required this.icon,
  });
}

class CategoryProductEntity {
  final String categoryId;
  final String categorySlug;
  final String categoryName;
  final bool isHome;
  final bool isTodaysSpecial;
  final bool isLaunchingSoon;
  final bool isBrand;
  final bool isFeatured;
  final bool isBanner;
  final String homeBlockBg;
  final bool isFlashHourCat;
  final DateTime? flashHrStartDateTime;
  final DateTime? flashHrEndDateTime;
  final String background;
  final String image;
  final bool isSpecial;
  final List<ProductEntity> products;

  const CategoryProductEntity({
    required this.categoryId,
    required this.categorySlug,
    required this.categoryName,
    required this.isHome,
    required this.isTodaysSpecial,
    required this.isLaunchingSoon,
    required this.isBrand,
    required this.isFeatured,
    required this.isBanner,
    required this.homeBlockBg,
    required this.isFlashHourCat,
    this.flashHrStartDateTime,
    this.flashHrEndDateTime,
    required this.background,
    required this.image,
    required this.isSpecial,
    required this.products,
  });
}


class CategorySliderEntity {
  final String name;
  final String alias;
  final String status;
  final String backgroundColor;
  final String linkTitleColor;
  final List<SliderEntity> slides;

  const CategorySliderEntity({
    required this.name,
    required this.alias,
    required this.status,
    required this.backgroundColor,
    required this.linkTitleColor,
    required this.slides,
  });
}

class SliderEntity {
  final String id;
  final String sliderId;
  final String storeId;
  final String title;
  final String mobileSlug;
  final bool isSpecialCat;
  final String image;
  final String mobileImage;
  final String imagePosition;
  final String link;
  final String linkType;
  final String order;
  final String status;
  final String urlKey;
  final String name;
  final String alias;
  final String delay;
  final String autoplay;
  final String transition;
  final String pagination;
  final String arrows;
  final String retinaImageSize;
  final String retinaMobileImageSize;

  const SliderEntity({
    required this.id,
    required this.sliderId,
    required this.storeId,
    required this.title,
    required this.mobileSlug,
    required this.isSpecialCat,
    required this.image,
    required this.mobileImage,
    required this.imagePosition,
    required this.link,
    required this.linkType,
    required this.order,
    required this.status,
    required this.urlKey,
    required this.name,
    required this.alias,
    required this.delay,
    required this.autoplay,
    required this.transition,
    required this.pagination,
    required this.arrows,
    required this.retinaImageSize,
    required this.retinaMobileImageSize,
  });
}

class JustForYouEntity {
  final int total;
  final List<ProductEntity> list;

  const JustForYouEntity({required this.total, required this.list});
}
