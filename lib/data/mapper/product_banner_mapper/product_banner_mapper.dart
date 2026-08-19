import 'package:pickaboo/data/model/product_banner_response/product_banner_response.dart';
import 'package:pickaboo/domain/entity/product_banner/product_banner_entity.dart';

extension ProductBannerResponseMapper on ProductBannerResponse {
  ProductBannerEntity toEntity() {
    return ProductBannerEntity(
      id: id ?? 0,
      title: title ?? '',
      image: image ?? '',
      link: link ?? '',
      sortOrder: sortOrder ?? 0,
    );
  }
}
