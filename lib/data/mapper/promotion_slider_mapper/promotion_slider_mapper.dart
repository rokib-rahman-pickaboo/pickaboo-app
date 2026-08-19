import 'package:pickaboo/data/model/promotion_slider_response/promotion_slider_response.dart';
import 'package:pickaboo/domain/entity/promotion_slider/promotion_slider_entity.dart';

extension PromotionSliderResponseMapper on PromotionSliderResponse {
  PromotionSliderEntity toEntity() {
    return PromotionSliderEntity(
      slideId: slideId ?? '',
      sliderId: sliderId ?? '',
      storeId: storeId ?? '',
      title: title ?? '',
      mobileSlug: mobileSlug ?? '',
      targetUrl: targetUrl ?? '',
      linkTitleColor: linkTitleColor ?? '',
      backgroundColor: backgroundColor ?? '',
      categorySortData: categorySortData ?? '',
      isSpecialCat: isSpecialCat ?? '',
      subtitle: subtitle ?? '',
      content: content ?? '',
      contentColour: contentColour ?? '',
      image: image ?? '',
      mobileImage: mobileImage ?? '',
      imagePosition: imagePosition ?? '',
      backgroundColour: backgroundColour ?? '',
      link: link ?? '',
      linkType: linkType ?? '',
      order: order ?? '',
      paginationContent: paginationContent ?? '',
      activeFrom: activeFrom ?? '',
      activeTo: activeTo ?? '',
      status: status ?? '',
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      urlKey: urlKey ?? '',
      name: name ?? '',
      alias: alias ?? '',
      tagretUrl: tagretUrl ?? '',
      isCategoryStatus: isCategoryStatus ?? '',
      delay: delay ?? '',
      autoplay: autoplay ?? '',
      transition: transition ?? '',
      pagination: pagination ?? '',
      arrows: arrows ?? '',
      retinaImageSize: retinaImageSize ?? '',
      retinaMobileImageSize: retinaMobileImageSize ?? '',
      mobileImageUrl: mobileImageUrl ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}
