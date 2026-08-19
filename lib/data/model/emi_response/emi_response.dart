import 'package:freezed_annotation/freezed_annotation.dart';

part 'emi_response.freezed.dart';
part 'emi_response.g.dart';

@freezed
class EmiResponse with _$EmiResponse {
  const factory EmiResponse({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "icon") String? icon,
    @JsonKey(name: "emi_tenures") List<EmiTenure>? emiTenures,
  }) = _EmiResponse;

  factory EmiResponse.fromJson(Map<String, dynamic> json) =>
      _$EmiResponseFromJson(json);
}

@freezed
class EmiTenure with _$EmiTenure {
  const factory EmiTenure({
    @JsonKey(name: "tenure") int? tenure,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "convenience_fee") String? convenienceFee,
    @JsonKey(name: "convenience_price") String? conveniencePrice,
    @JsonKey(name: "monthly_payable") String? monthlyPayable,
    @JsonKey(name: "total") String? total,
  }) = _EmiTenure;

  factory EmiTenure.fromJson(Map<String, dynamic> json) =>
      _$EmiTenureFromJson(json);
}
