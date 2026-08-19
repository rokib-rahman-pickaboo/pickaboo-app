import 'package:pickaboo/data/model/product_flash_sale_response/product_flash_sale_response.dart';
import 'package:pickaboo/domain/entity/product_flash_sale/product_flash_sale_entity.dart';

extension ProductFlashSaleResponseMapper on ProductFlashSaleResponse {
  ProductFlashSaleEntity toEntity() {
    return ProductFlashSaleEntity(
      inFlashSale: inFlashSale ?? false,
      flashSale: flashSale?.toEntity(),
    );
  }
}

extension FlashSaleMapper on FlashSale {
  FlashSaleDetailEntity toEntity() {
    return FlashSaleDetailEntity(
      saleId: saleId ?? 0,
      title: title ?? '',
      slug: slug ?? '',
      startTime: startTime,
      endTime: endTime,
      shortDescription: shortDescription ?? '',
      description: description ?? '',
      isUpcoming: isUpcoming ?? false,
      bannerImageUrl: bannerImageUrl ?? '',
      bannerMobileImageUrl: bannerMobileImageUrl ?? '',
      bannerLinkType: bannerLinkType ?? '',
      bannerLinkValue: bannerLinkValue ?? '',
    );
  }
}
