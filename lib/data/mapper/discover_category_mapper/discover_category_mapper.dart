import 'package:pickaboo/data/model/discover_category_response/discover_category_response.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_info_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_banner_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_subsection_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_subsection_item_entity.dart';

extension DiscoverCategoryItemMapper on DiscoverCategoryItem {
  DiscoverCategoryEntity toEntity() {
    return DiscoverCategoryEntity(
      entityId: entityId ?? 0,
      menuName: menuName ?? '',
      logoUrl: logoUrl ?? '',
      category: category?.toEntity() ??
          const DiscoverCategoryInfoEntity(id: 0, name: '', slug: ''),
      banners: banners?.map((e) => e.toEntity()).toList() ?? const [],
      subsections: subsections?.map((e) => e.toEntity()).toList() ?? const [],
    );
  }
}

extension CategoryMapper on Category {
  DiscoverCategoryInfoEntity toEntity() {
    return DiscoverCategoryInfoEntity(
      id: id ?? 0,
      name: name ?? '',
      slug: slug ?? '',
    );
  }
}

extension BannerMapper on Banner {
  DiscoverCategoryBannerEntity toEntity() {
    return DiscoverCategoryBannerEntity(
      entityId: entityId ?? 0,
      imageUrl: imageUrl ?? '',
      linkType: linkType ?? '',
      linkValue: linkValue ?? '',
      link: link ?? '',
      sortOrder: sortOrder ?? 0,
    );
  }
}

extension SubsectionMapper on Subsection {
  DiscoverSubsectionEntity toEntity() {
    return DiscoverSubsectionEntity(
      sectionType: sectionType ?? '',
      title: title ?? '',
      status: status ?? 0,
      seeMoreLink: seeMoreLink?.toString() ?? '',
      seeMoreLinkType: seeMoreLinkType ?? '',
      seeMoreLinkValue: seeMoreLinkValue ?? '',
      items: items?.map((e) => e.toEntity()).toList() ?? const [],
    );
  }
}

extension SubsectionItemMapper on SubsectionItem {
  DiscoverSubsectionItemEntity toEntity() {
    return DiscoverSubsectionItemEntity(
      entityId: entityId ?? 0,
      itemType: itemType ?? '',
      itemId: itemId ?? 0,
      linkType: linkType ?? '',
      linkValue: linkValue ?? '',
      link: link ?? '',
      name: name ?? '',
      imageUrl: imageUrl ?? '',
      sortOrder: sortOrder ?? 0,
    );
  }
}
