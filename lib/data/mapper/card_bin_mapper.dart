import 'package:pickaboo/data/model/card_bin_response/card_bin_response.dart';
import 'package:pickaboo/domain/entity/card_bin/card_bin_entity.dart';

extension CardBinResponseMapper on CardBinResponse {
  CardBinEntity toEntity() {
    return CardBinEntity(
      success: success ?? false,
      message: message ?? '',
      couponCode: couponCode ?? '',
      discountAmount: discountAmount ?? 0,
      ruleName: ruleName ?? '',
      statusCode: statusCode ?? 0,
    );
  }
}
