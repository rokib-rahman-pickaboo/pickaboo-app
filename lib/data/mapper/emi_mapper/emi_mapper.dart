import 'package:pickaboo/data/model/emi_response/emi_response.dart';
import 'package:pickaboo/domain/entity/emi/emi_entity.dart';

extension EmiResponseMapper on EmiResponse {
  EmiEntity toEntity() {
    return EmiEntity(
      bankName: name ?? '',
      bankIcon: icon ?? '',
      tenureOptions: emiTenures?.map((t) => t.toEntity()).toList() ?? [],
    );
  }
}

extension EmiTenureMapper on EmiTenure {
  EmiTenureEntity toEntity() {
    return EmiTenureEntity(
      tenure: tenure ?? 0,
      price: price ?? '',
      convenienceFee: convenienceFee ?? '',
      conveniencePrice: conveniencePrice ?? '',
      monthlyPayable: monthlyPayable ?? '',
      total: total ?? '',
    );
  }
}
