import 'package:pickaboo/data/model/checkout/checkout_emi_response.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';

extension CheckoutEmiResponseMapper on CheckoutEmiResponse {
  CheckoutEmiEntity toEntity() {
    return CheckoutEmiEntity(
      bankEmiData: bankEmiData?.map((e) => e.toEntity()).toList() ?? [],
      quoteShippingCost: quoteShippingCost ?? '0',
      quoteBillingCity: quoteBillingCity ?? '',
    );
  }
}

extension BankEmiDataModelMapper on BankEmiDataModel {
  BankEmiDataEntity toEntity() {
    return BankEmiDataEntity(
      name: name ?? '',
      paymentGateway: paymentGateway ?? '',
      emiTenures: emiTenures?.map((e) => e.toEntity()).toList() ?? [],
      cemiTenures: cemiTenures?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension EmiTenureDetailModelMapper on EmiTenureDetailModel {
  EmiTenureDetailEntity toEntity() {
    return EmiTenureDetailEntity(
      tenure: tenure ?? 0,
      price: price?.toString() ?? '0',
      convenienceFee: convenienceFee ?? '0',
      conveniencePrice: conveniencePrice ?? '0',
      cConvenienceFee: cConvenienceFee ?? '0',
      cConveniencePrice: cConveniencePrice ?? '0',
      monthlyPayable: monthlyPayable ?? '0',
      total: total ?? '0',
      isSelected: isSelected,
    );
  }
}

extension CemiTenureDetailModelMapper on CemiTenureDetailModel {
  CemiTenureDetailEntity toEntity() {
    return CemiTenureDetailEntity(
      tenure: tenure ?? 0,
      price: price?.toString() ?? '0',
      cConvenienceFee: cConvenienceFee ?? '0',
      cConveniencePrice: cConveniencePrice ?? '0',
      monthlyPayable: monthlyPayable ?? '0',
      total: total ?? '0',
      isSelected: isSelected,
    );
  }
}
