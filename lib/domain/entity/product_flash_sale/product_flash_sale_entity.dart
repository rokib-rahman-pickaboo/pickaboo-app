class ProductFlashSaleEntity {
  final bool inFlashSale;
  final FlashSaleDetailEntity? flashSale;

  const ProductFlashSaleEntity({
    required this.inFlashSale,
    this.flashSale,
  });
}

class FlashSaleDetailEntity {
  final int saleId;
  final String title;
  final String slug;
  final DateTime? startTime;
  final DateTime? endTime;
  final String shortDescription;
  final String description;
  final bool isUpcoming;
  final String bannerImageUrl;
  final String bannerMobileImageUrl;
  final String bannerLinkType;
  final String bannerLinkValue;

  const FlashSaleDetailEntity({
    required this.saleId,
    required this.title,
    required this.slug,
    this.startTime,
    this.endTime,
    this.shortDescription = '',
    this.description = '',
    this.isUpcoming = false,
    this.bannerImageUrl = '',
    this.bannerMobileImageUrl = '',
    this.bannerLinkType = '',
    this.bannerLinkValue = '',
  });

  String get effectiveBannerImageUrl =>
      bannerMobileImageUrl.isNotEmpty ? bannerMobileImageUrl : bannerImageUrl;

  bool get hasBanner => effectiveBannerImageUrl.isNotEmpty;

  bool get isLive {
    if (isUpcoming) return false;
    final now = DateTime.now();
    if (startTime != null && now.isBefore(startTime!)) return false;
    if (endTime != null && now.isAfter(endTime!)) return false;
    return true;
  }
}
