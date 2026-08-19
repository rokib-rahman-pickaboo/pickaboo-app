import 'package:pickaboo/data/model/card_bin_status_response/card_bin_status_response.dart';
import 'package:pickaboo/domain/entity/card_bin_status/card_bin_status_entity.dart';

extension CardBinStatusMapper on CardBinStatusResponse {
  CardBinStatusEntity toEntity() {
    return CardBinStatusEntity(
      success: success ?? false,
      message: message ?? '',
      isActive: isActive ?? false,
      statusCode: statusCode ?? 0,
    );
  }
}
