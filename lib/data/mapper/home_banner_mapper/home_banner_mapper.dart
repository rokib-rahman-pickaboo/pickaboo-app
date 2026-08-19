import 'package:pickaboo/data/model/home_banner_response/home_banner_response.dart';
import 'package:pickaboo/domain/entity/home_banner/home_banner_entity.dart';

bool _parseFlag(String? value) {
  if (value == null) return false;
  final v = value.trim().toLowerCase();
  return v == 'yes' || v == '1' || v == 'true';
}

extension HomeBannerResponseMapper on HomeBannerResponse {
  HomeBannerEntity toEntity() {
    return HomeBannerEntity(
      entityId: entityId ?? 0,
      title: title ?? '',
      image: image ?? '',
      imageUrl: imageUrl ?? '',
      responsiveImage: responsiveImage ?? '',
      responsiveImageUrl: responsiveImageUrl ?? '',
      link: link ?? '',
      linkType: linkType ?? '',
      linkValue: linkValue ?? '',
      resolvedLink: resolvedLink ?? '',
      isActive: _parseFlag(isActive),
      identifier: identifier ?? '',
      categoryId: categoryId ?? 0,
      isCategory: _parseFlag(isCategory),
      sortOrder: sortOrder ?? 0,
      columnCount: columnCount ?? 0,
      imagePosition: imagePosition ?? '',
      forHomepage: _parseFlag(forHomepage),
      category: category?.toEntity(),
    );
  }
}

extension HomeBannerCategoryResponseMapper on HomeBannerCategory {
  HomeBannerCategoryEntity toEntity() {
    return HomeBannerCategoryEntity(
      id: id ?? 0,
      name: name ?? '',
      slug: slug ?? '',
    );
  }
}
