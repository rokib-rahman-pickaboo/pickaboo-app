import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_order_model.freezed.dart';
part 'ticket_order_model.g.dart';

@freezed
class TicketOrderModel with _$TicketOrderModel {
  const factory TicketOrderModel({
    @JsonKey(name: "order_id") String? orderId,
    @JsonKey(name: "increment_id") String? incrementId,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "grand_total") double? grandTotal,
  }) = _TicketOrderModel;

  factory TicketOrderModel.fromJson(Map<String, dynamic> json) =>
      _$TicketOrderModelFromJson(json);
}
