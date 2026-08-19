import 'package:pickaboo/data/model/category_banner_response/category_banner_response.dart';
import 'package:pickaboo/domain/entity/category_banner/category_banner_entity.dart';

bool _parseFlag(String? value) {
  if (value == null) return false;
  final v = value.trim().toLowerCase();
  return v == 'yes' || v == '1' || v == 'true';
}

extension CategoryBannerResponseMapper on CategoryBannerResponse {
  CategoryBannerEntity toEntity() {
    return CategoryBannerEntity(
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

extension CategoryBannerCategoryResponseMapper on CategoryBannerCategory {
  CategoryBannerCategoryEntity toEntity() {
    return CategoryBannerCategoryEntity(
      id: id ?? 0,
      name: name ?? '',
      slug: slug ?? '',
    );
  }
}
