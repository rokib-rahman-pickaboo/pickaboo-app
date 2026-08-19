import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';

class BannerCategoryEntity {
  final int id;
  final String name;
  final String slug;

  const BannerCategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
  });
}

class BannerTapTarget {
  final String linkType;
  final String link;

  final String? name;

  final String? targetUrl;

  const BannerTapTarget({
    required this.linkType,
    required this.link,
    this.name,
    this.targetUrl,
  });
}

class BannerEntity {
  final int entityId;
  final String title;
  final String image;
  final String imageUrl;
  final String responsiveImage;
  final String responsiveImageUrl;
  final int isActive;
  final String identifier;
  final int categoryId;
  final int isCategory;
  final int sortOrder;
  final int columnCount;
  final String imagePosition;
  final int forHomepage;
  final String link;
  final String? linkType;

  final String linkValue;

  final String resolvedLink;

  final BannerCategoryEntity? category;

  const BannerEntity({
    required this.entityId,
    required this.title,
    required this.image,
    required this.imageUrl,
    required this.responsiveImage,
    required this.responsiveImageUrl,
    required this.isActive,
    required this.identifier,
    required this.categoryId,
    required this.isCategory,
    required this.sortOrder,
    required this.columnCount,
    required this.imagePosition,
    required this.forHomepage,
    required this.link,
    this.linkType,
    this.linkValue = '',
    this.resolvedLink = '',
    this.category,
  });

  bool get linksToCategory => isCategory == 1;

  String? get _titleOrNull => title.isNotEmpty ? title : null;

  String? _categoryName(String resolvedId) {
    final embeddedId = (category?.id ?? categoryId).toString();
    final name = category?.name ?? '';
    if (name.isNotEmpty && embeddedId == resolvedId) return name;
    return _titleOrNull;
  }

  BannerTapTarget get tapTarget {
    final type = (linkType ?? '').trim().toLowerCase();

    switch (type) {
      case '':
        break;

      case 'category':
        final id = linkValue.isNotEmpty
            ? linkValue
            : (category?.id ?? categoryId).toString();
        return BannerTapTarget(
          linkType: 'category',
          link: id,
          name: _categoryName(id),
        );

      case 'special_category':
        final slug = linkValue.isNotEmpty ? linkValue : (category?.slug ?? '');
        return BannerTapTarget(
          linkType: 'special_category',
          link: slug,
          name: _categoryName(slug),
        );

      case 'product':
        return BannerTapTarget(
          linkType: 'product',
          link: linkValue.isNotEmpty ? linkValue : link,
          name: _titleOrNull,
        );

      case 'custom':
      case 'external':
        final url = resolvedLink.isNotEmpty
            ? resolvedLink
            : (linkValue.isNotEmpty ? linkValue : link);
        return BannerTapTarget(
          linkType: 'external',
          link: url,
          name: _titleOrNull,
          targetUrl: url,
        );

      default:
        return BannerTapTarget(
          linkType: type,
          link: linkValue.isNotEmpty ? linkValue : link,
          name: _titleOrNull,
          targetUrl: resolvedLink.isNotEmpty ? resolvedLink : null,
        );
    }

    if (linksToCategory) {
      final id = (category?.id ?? categoryId).toString();
      return BannerTapTarget(
        linkType: 'category',
        link: id,
        name: _categoryName(id),
      );
    }

    return BannerTapTarget(
      linkType: 'product',
      link: link,
      name: _titleOrNull,
    );
  }

  SliderEntity toSliderEntity() {
    final target = tapTarget;
    return SliderEntity(
      id: entityId.toString(),
      sliderId: "",
      storeId: "0",
      title: title,
      mobileSlug: "",
      isSpecialCat: false,
      image: imageUrl.isNotEmpty ? imageUrl : image,
      mobileImage: responsiveImageUrl.isNotEmpty
          ? responsiveImageUrl
          : (responsiveImage.isNotEmpty ? responsiveImage : imageUrl.isNotEmpty ? imageUrl : image),
      imagePosition: imagePosition.isNotEmpty ? imagePosition : "full",
      link: target.link,
      linkType: target.linkType,
      order: sortOrder.toString(),
      status: isActive.toString(),
      urlKey: identifier,
      name: title,
      alias: "",
      delay: "3000",
      autoplay: "1",
      transition: "slide",
      pagination: "1",
      arrows: "1",
      retinaImageSize: "1920",
      retinaMobileImageSize: "768",
    );
  }
}
