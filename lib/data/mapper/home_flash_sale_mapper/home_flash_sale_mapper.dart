import 'package:pickaboo/data/mapper/product_list_mapper/product_list_mapper.dart';
import 'package:pickaboo/data/model/home_flash_sale_response/home_flash_sale_response.dart';
import 'package:pickaboo/domain/entity/home_flash_sale/home_flash_sale_entity.dart';

extension HomeFlashSaleResponseMapper on HomeFlashSaleResponse {
  HomeFlashSaleEntity toEntity() {
    return HomeFlashSaleEntity(
      saleId: saleId ?? '',
      title: title ?? '',
      slug: slug ?? '',
      shortDescription: shortDescription ?? '',
      description: description ?? '',
      titleColor: titleColor,
      subTitleColor: subTitleColor,
      descriptionColor: descriptionColor,
      startTime: startTime,
      endTime: endTime,
      displayStartTime: displayStartTime,
      isUpcoming: isUpcoming ?? false,
      banners: banners?.map((b) => b.toEntity()).toList() ?? [],
      category: category?.toEntity() ??
          const FlashSaleCategoryEntity(
            categoryId: 0,
            name: '',
            urlKey: '',
            products: [],
          ),
    );
  }
}

extension BannerMapper on Banner {
  FlashSaleBannerEntity toEntity() {
    return FlashSaleBannerEntity(
      bannerId: bannerId ?? '',
      image: image ?? '',
      imageUrl: imageUrl ?? '',
      mobileImage: mobileImage ?? '',
      mobileImageUrl: mobileImageUrl ?? '',
      linkType: linkType ?? '',
      linkValue: linkValue ?? '',
      sortOrder: sortOrder ?? '',
    );
  }
}

extension CategoryMapper on Category {
  FlashSaleCategoryEntity toEntity() {
    return FlashSaleCategoryEntity(
      categoryId: categoryId ?? 0,
      name: name ?? '',
      urlKey: urlKey ?? '',
      products: products?.map((p) => p.toDomain()).toList() ?? [],
    );
  }
}
