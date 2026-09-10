import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_order_model.freezed.dart';
part 'ticket_order_model.g.dart';

Object? _readIncrementId(Map json, String key) =>
    json['increment_id'] ?? json['order_number'];

String? _toString(dynamic value) => value?.toString();

@freezed
class TicketOrderModel with _$TicketOrderModel {
  const factory TicketOrderModel({
    @JsonKey(name: "order_id", fromJson: _toString) String? orderId,
    @JsonKey(
      name: "increment_id",
      readValue: _readIncrementId,
      fromJson: _toString,
    )
    String? incrementId,
    @JsonKey(name: "created_at", fromJson: _toString) String? createdAt,
    @JsonKey(name: "status", fromJson: _toString) String? status,
    @JsonKey(name: "grand_total") double? grandTotal,
  }) = _TicketOrderModel;

  factory TicketOrderModel.fromJson(Map<String, dynamic> json) =>
      _$TicketOrderModelFromJson(json);
}
