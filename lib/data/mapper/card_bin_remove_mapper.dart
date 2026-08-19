import 'package:pickaboo/data/model/card_bin_remove_response/card_bin_remove_response.dart';
import 'package:pickaboo/domain/entity/card_bin_remove/card_bin_remove_entity.dart';

extension CardBinRemoveMapper on CardBinRemoveResponse {
  CardBinRemoveEntity toEntity() {
    return CardBinRemoveEntity(
      success: success ?? false,
      message: message ?? '',
      previousCoupon: previousCoupon ?? '',
      statusCode: statusCode ?? 0,
    );
  }
}
