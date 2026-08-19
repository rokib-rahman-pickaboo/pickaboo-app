import 'package:pickaboo/data/model/homepage_offers/homepage_offers_response.dart';
import 'package:pickaboo/domain/entity/homepage_offers/homepage_offers_entity.dart'
    as entity;

extension HomepageOffersResponseMapper on HomepageOffersResponse {
  entity.HomepageOffersEntity toEntity() => entity.HomepageOffersEntity(
        menus: items?.map((e) => e.toEntity()).toList() ?? const [],
      );
}

extension HomepageOfferMenuResponseMapper on HomepageOfferMenuResponse {
  entity.HomepageOfferMenuEntity toEntity() => entity.HomepageOfferMenuEntity(
        entityId: entityId ?? 0,
        menuName: menuName ?? '',
        category: category?.toEntity() ??
            const entity.OfferCategoryEntity(id: 0, name: '', slug: ''),
        banners: banners ?? const [],
        subsections: subsections?.map((e) => e.toEntity()).toList() ?? const [],
      );
}

extension OfferCategoryResponseMapper on OfferCategoryResponse {
  entity.OfferCategoryEntity toEntity() => entity.OfferCategoryEntity(
        id: id ?? 0,
        name: name ?? '',
        slug: slug ?? '',
      );
}

extension OfferSubsectionResponseMapper on OfferSubsectionResponse {
  entity.OfferSubsectionEntity toEntity() => entity.OfferSubsectionEntity(
        sectionType: sectionType ?? '',
        title: title ?? '',
        status: status ?? 0,
        seeMoreLink: seeMoreLink ?? '',
        seeMoreLinkType: seeMoreLinkType ?? '',
        items: items?.map((e) => e.toEntity()).toList() ?? const [],
      );
}

extension OfferItemResponseMapper on OfferItemResponse {
  entity.OfferItemEntity toEntity() => entity.OfferItemEntity(
        entityId: entityId ?? 0,
        itemType: itemType ?? '',
        itemId: itemId ?? 0,
        link: link ?? '',
        name: name ?? '',
        imageUrl: imageUrl ?? '',
        discountType: discountType ?? '',
        discountValue: discountValue ?? 0,
        maxDiscount: maxDiscount ?? 0,
        discountFilter: discountFilter?.toEntity() ??
            const entity.OfferDiscountFilterEntity(
              type: '',
              value: 0,
              maxDiscount: 0,
              url: '',
            ),
        sortOrder: sortOrder ?? 0,
      );
}

extension OfferDiscountFilterResponseMapper on OfferDiscountFilterResponse {
  entity.OfferDiscountFilterEntity toEntity() =>
      entity.OfferDiscountFilterEntity(
        type: type ?? '',
        value: value ?? 0,
        maxDiscount: maxDiscount ?? 0,
        url: url ?? '',
      );
}
