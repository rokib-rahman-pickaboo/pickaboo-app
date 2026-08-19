import 'package:pickaboo/data/model/promo_response/promo_response.dart';
import 'package:pickaboo/domain/entity/promo/promo_entity.dart';

extension PromoResponseMapper on PromoResponse {
  PromoEntity toEntity() {
    return PromoEntity(
      isEligible: isEligible ?? false,
      message: message ?? '',
      couponCode: couponCode ?? '',
    );
  }
}
