class HomepageOffersEntity {
  final List<HomepageOfferMenuEntity> menus;

  const HomepageOffersEntity({required this.menus});

  HomepageOffersEntity copyWith({List<HomepageOfferMenuEntity>? menus}) =>
      HomepageOffersEntity(menus: menus ?? this.menus);
}

class HomepageOfferMenuEntity {
  final int entityId;
  final String menuName;
  final OfferCategoryEntity category;
  final List<dynamic> banners;
  final List<OfferSubsectionEntity> subsections;

  const HomepageOfferMenuEntity({
    required this.entityId,
    required this.menuName,
    required this.category,
    required this.banners,
    required this.subsections,
  });

  HomepageOfferMenuEntity copyWith({
    int? entityId,
    String? menuName,
    OfferCategoryEntity? category,
    List<dynamic>? banners,
    List<OfferSubsectionEntity>? subsections,
  }) =>
      HomepageOfferMenuEntity(
        entityId: entityId ?? this.entityId,
        menuName: menuName ?? this.menuName,
        category: category ?? this.category,
        banners: banners ?? this.banners,
        subsections: subsections ?? this.subsections,
      );
}

class OfferCategoryEntity {
  final int id;
  final String name;
  final String slug;

  const OfferCategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
  });

  OfferCategoryEntity copyWith({int? id, String? name, String? slug}) =>
      OfferCategoryEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
      );
}

class OfferSubsectionEntity {
  final String sectionType;
  final String title;
  final int status;
  final String seeMoreLink;
  final String seeMoreLinkType;
  final List<OfferItemEntity> items;

  const OfferSubsectionEntity({
    required this.sectionType,
    required this.title,
    required this.status,
    required this.seeMoreLink,
    required this.seeMoreLinkType,
    required this.items,
  });

  OfferSubsectionEntity copyWith({
    String? sectionType,
    String? title,
    int? status,
    String? seeMoreLink,
    String? seeMoreLinkType,
    List<OfferItemEntity>? items,
  }) =>
      OfferSubsectionEntity(
        sectionType: sectionType ?? this.sectionType,
        title: title ?? this.title,
        status: status ?? this.status,
        seeMoreLink: seeMoreLink ?? this.seeMoreLink,
        seeMoreLinkType: seeMoreLinkType ?? this.seeMoreLinkType,
        items: items ?? this.items,
      );
}

class OfferItemEntity {
  final int entityId;
  final String itemType;
  final int itemId;
  final String link;
  final String name;
  final String imageUrl;
  final String discountType;
  final num discountValue;
  final num maxDiscount;
  final OfferDiscountFilterEntity discountFilter;
  final int sortOrder;

  const OfferItemEntity({
    required this.entityId,
    required this.itemType,
    required this.itemId,
    required this.link,
    required this.name,
    required this.imageUrl,
    required this.discountType,
    required this.discountValue,
    required this.maxDiscount,
    required this.discountFilter,
    required this.sortOrder,
  });

  OfferItemEntity copyWith({
    int? entityId,
    String? itemType,
    int? itemId,
    String? link,
    String? name,
    String? imageUrl,
    String? discountType,
    num? discountValue,
    num? maxDiscount,
    OfferDiscountFilterEntity? discountFilter,
    int? sortOrder,
  }) =>
      OfferItemEntity(
        entityId: entityId ?? this.entityId,
        itemType: itemType ?? this.itemType,
        itemId: itemId ?? this.itemId,
        link: link ?? this.link,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        discountType: discountType ?? this.discountType,
        discountValue: discountValue ?? this.discountValue,
        maxDiscount: maxDiscount ?? this.maxDiscount,
        discountFilter: discountFilter ?? this.discountFilter,
        sortOrder: sortOrder ?? this.sortOrder,
      );
}

class OfferDiscountFilterEntity {
  final String type;
  final num value;
  final num maxDiscount;
  final String url;

  const OfferDiscountFilterEntity({
    required this.type,
    required this.value,
    required this.maxDiscount,
    required this.url,
  });

  OfferDiscountFilterEntity copyWith({
    String? type,
    num? value,
    num? maxDiscount,
    String? url,
  }) =>
      OfferDiscountFilterEntity(
        type: type ?? this.type,
        value: value ?? this.value,
        maxDiscount: maxDiscount ?? this.maxDiscount,
        url: url ?? this.url,
      );
}
