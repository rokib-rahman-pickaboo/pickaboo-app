import 'package:pickaboo/data/model/banner_response/banner_response.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';

int _parseFlagToInt(String? value) {
  if (value == null) return 0;
  final v = value.trim().toLowerCase();
  if (v == 'yes' || v == '1' || v == 'true') return 1;
  return 0;
}

extension BannerResponseMapper on BannerResponse {
  BannerEntity toEntity() {
    return BannerEntity(
      entityId: entityId ?? 0,
      title: title ?? '',
      image: image ?? '',
      imageUrl: imageUrl ?? '',
      responsiveImage: responsiveImage ?? '',
      responsiveImageUrl: responsiveImageUrl ?? '',
      isActive: _parseFlagToInt(isActive),
      identifier: identifier ?? '',
      categoryId: categoryId ?? 0,
      isCategory: _parseFlagToInt(isCategory),
      sortOrder: sortOrder ?? 0,
      columnCount: columnCount ?? 0,
      imagePosition: imagePosition ?? '',
      forHomepage: _parseFlagToInt(forHomepage),
      link: (link?.isNotEmpty ?? false) ? link! : (resolvedLink ?? ''),
      linkType: linkType,
      linkValue: linkValue ?? '',
      resolvedLink: resolvedLink ?? '',
      category: category?.toEntity(),
    );
  }
}

extension BannerCategoryResponseMapper on Category {
  BannerCategoryEntity toEntity() {
    return BannerCategoryEntity(
      id: id ?? 0,
      name: name ?? '',
      slug: slug ?? '',
    );
  }
}
