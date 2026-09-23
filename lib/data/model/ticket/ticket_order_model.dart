import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_order_model.freezed.dart';
part 'ticket_order_model.g.dart';

Object? _readOrderId(Map json, String key) =>
    json['order_id'] ?? json['entity_id'] ?? json['id'];

Object? _readIncrementId(Map json, String key) =>
    json['increment_id'] ??
    json['order_number'] ??
    json['order_id'] ??
    json['entity_id'] ??
    json['id'];

Object? _readGrandTotal(Map json, String key) =>
    json['grand_total'] ??
    json['grandtotal'] ??
    json['total'] ??
    json['base_grand_total'];

Object? _readCreatedAt(Map json, String key) =>
    json['created_at'] ??
    json['createdAt'] ??
    json['date'] ??
    json['order_date'];

Object? _readStatus(Map json, String key) =>
    json['status'] ?? json['state'] ?? json['order_status'];

String? _toString(dynamic value) => value?.toString();

double? _toDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

@freezed
class TicketOrderModel with _$TicketOrderModel {
  const factory TicketOrderModel({
    @JsonKey(
      name: "order_id",
      readValue: _readOrderId,
      fromJson: _toString,
    )
    String? orderId,
    @JsonKey(
      name: "increment_id",
      readValue: _readIncrementId,
      fromJson: _toString,
    )
    String? incrementId,
    @JsonKey(
      name: "created_at",
      readValue: _readCreatedAt,
      fromJson: _toString,
    )
    String? createdAt,
    @JsonKey(
      name: "status",
      readValue: _readStatus,
      fromJson: _toString,
    )
    String? status,
    @JsonKey(
      name: "grand_total",
      readValue: _readGrandTotal,
      fromJson: _toDouble,
    )
    double? grandTotal,
  }) = _TicketOrderModel;

  factory TicketOrderModel.fromJson(Map<String, dynamic> json) =>
      _$TicketOrderModelFromJson(json);
}
