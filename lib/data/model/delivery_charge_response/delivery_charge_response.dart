import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_charge_response.freezed.dart';
part 'delivery_charge_response.g.dart';

@freezed
class DeliveryChargeResponse with _$DeliveryChargeResponse {
  const factory DeliveryChargeResponse({
    @JsonKey(name: "product_id")
    int? productId,
    @JsonKey(name: "sku")
    String? sku,
    @JsonKey(name: "slug")
    String? slug,
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "qty")
    int? qty,
    @JsonKey(name: "inside_charge")
    int? insideCharge,
    @JsonKey(name: "outside_charge")
    int? outsideCharge,
  }) = _DeliveryChargeResponse;

  factory DeliveryChargeResponse.fromJson(Map<String, dynamic> json) => _$DeliveryChargeResponseFromJson(json);
}

