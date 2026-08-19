import 'package:pickaboo/domain/entity/banner/banner_entity.dart';

class HomeBannerCategoryEntity {
  final int id;
  final String name;
  final String slug;

  const HomeBannerCategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
  });
}

class HomeBannerEntity {
  final int entityId;
  final String title;
  final String image;
  final String imageUrl;
  final String responsiveImage;
  final String responsiveImageUrl;

  final String link;
  final String linkType;
  final String linkValue;
  final String resolvedLink;

  final bool isActive;
  final String identifier;
  final int categoryId;
  final bool isCategory;
  final int sortOrder;
  final int columnCount;
  final String imagePosition;
  final bool forHomepage;
  final HomeBannerCategoryEntity? category;

  const HomeBannerEntity({
    required this.entityId,
    required this.title,
    required this.image,
    required this.imageUrl,
    required this.responsiveImage,
    required this.responsiveImageUrl,
    required this.link,
    required this.linkType,
    required this.linkValue,
    required this.resolvedLink,
    required this.isActive,
    required this.identifier,
    required this.categoryId,
    required this.isCategory,
    required this.sortOrder,
    required this.columnCount,
    required this.imagePosition,
    required this.forHomepage,
    this.category,
  });

  bool get linksToCategory => isCategory;

  String get displayImage => imageUrl.isNotEmpty ? imageUrl : image;

  String get displayResponsiveImage => responsiveImageUrl.isNotEmpty
      ? responsiveImageUrl
      : (responsiveImage.isNotEmpty ? responsiveImage : displayImage);

  BannerEntity toBannerEntity() {
    return BannerEntity(
      entityId: entityId,
      title: title,
      image: image,
      imageUrl: imageUrl,
      responsiveImage: responsiveImage,
      responsiveImageUrl: responsiveImageUrl,
      isActive: isActive ? 1 : 0,
      identifier: identifier,
      categoryId: categoryId,
      isCategory: isCategory ? 1 : 0,
      sortOrder: sortOrder,
      columnCount: columnCount,
      imagePosition: imagePosition,
      forHomepage: forHomepage ? 1 : 0,
      link: link.isNotEmpty ? link : resolvedLink,
      linkType: linkType.isEmpty ? null : linkType,
      linkValue: linkValue,
      resolvedLink: resolvedLink,
      category: category == null
          ? null
          : BannerCategoryEntity(
              id: category!.id,
              name: category!.name,
              slug: category!.slug,
            ),
    );
  }
}
