import 'package:pickaboo/data/model/card_bin_verify_response/card_bin_verify_response.dart';
import 'package:pickaboo/domain/entity/card_bin_verify/card_bin_verify_entity.dart';

extension CardBinVerifyResponseMapper on CardBinVerifyResponse {
  CardBinVerifyEntity toEntity() {
    return CardBinVerifyEntity(
      success: success ?? false,
      message: message ?? '',
      couponCode: couponCode ?? '',
      discountAmount: discountAmount ?? 0,
      ruleName: ruleName ?? '',
      isApplied: isApplied ?? false,
      binNumber: binNumber ?? '',
      cardType: cardType ?? '',
      bankName: bankName ?? '',
      paymentMethod: paymentMethod ?? '',
      statusCode: statusCode ?? 0,
    );
  }
}
