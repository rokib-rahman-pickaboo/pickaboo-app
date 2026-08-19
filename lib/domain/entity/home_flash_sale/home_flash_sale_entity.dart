import 'package:pickaboo/domain/entity/common/product/product_entity.dart';

class HomeFlashSaleEntity {
  final String saleId;
  final String title;
  final String slug;
  final String shortDescription;
  final String description;

  final String? titleColor;
  final String? subTitleColor;
  final String? descriptionColor;

  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime? displayStartTime;
  final bool isUpcoming;
  final List<FlashSaleBannerEntity> banners;
  final FlashSaleCategoryEntity category;

  const HomeFlashSaleEntity({
    required this.saleId,
    required this.title,
    required this.slug,
    required this.shortDescription,
    required this.description,
    this.titleColor,
    this.subTitleColor,
    this.descriptionColor,
    this.startTime,
    this.endTime,
    this.displayStartTime,
    this.isUpcoming = false,
    required this.banners,
    required this.category,
  });

  bool get isLive {
    if (isUpcoming) return false;
    final now = DateTime.now();
    if (startTime != null && now.isBefore(startTime!)) return false;
    if (endTime != null && now.isAfter(endTime!)) return false;
    return true;
  }

  bool get isVisible {
    final now = DateTime.now();
    if (endTime != null && now.isAfter(endTime!)) return false;
    if (displayStartTime != null) return !now.isBefore(displayStartTime!);
    return true;
  }
}

class FlashSaleBannerEntity {
  final String bannerId;
  final String image;
  final String imageUrl;
  final String mobileImage;
  final String mobileImageUrl;
  final String linkType;
  final String linkValue;
  final String sortOrder;

  const FlashSaleBannerEntity({
    required this.bannerId,
    required this.image,
    required this.imageUrl,
    this.mobileImage = '',
    this.mobileImageUrl = '',
    required this.linkType,
    required this.linkValue,
    required this.sortOrder,
  });
}

class FlashSaleCategoryEntity {
  final int categoryId;
  final String name;
  final String urlKey;
  final List<ProductEntity> products;

  const FlashSaleCategoryEntity({
    required this.categoryId,
    required this.name,
    required this.urlKey,
    required this.products,
  });
}
