import 'package:pickaboo/data/model/delivery_charge_response/delivery_charge_response.dart';
import 'package:pickaboo/domain/entity/delivery_charge/delivery_charge_entity.dart';

extension DeliveryChargeResponseMapper on DeliveryChargeResponse {
  DeliveryChargeEntity toEntity() {
    return DeliveryChargeEntity(
      productId: productId,
      sku: sku,
      slug: slug,
      name: name,
      qty: qty,
      insideCharge: insideCharge ?? 0,
      outsideCharge: outsideCharge ?? 0,
    );
  }
}
