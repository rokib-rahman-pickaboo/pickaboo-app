// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketOrderModelImpl _$$TicketOrderModelImplFromJson(
  Map<String, dynamic> json,
) => _$TicketOrderModelImpl(
  orderId: _toString(_readOrderId(json, 'order_id')),
  incrementId: _toString(_readIncrementId(json, 'increment_id')),
  createdAt: _toString(_readCreatedAt(json, 'created_at')),
  status: _toString(_readStatus(json, 'status')),
  grandTotal: _toDouble(_readGrandTotal(json, 'grand_total')),
);

Map<String, dynamic> _$$TicketOrderModelImplToJson(
  _$TicketOrderModelImpl instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'increment_id': instance.incrementId,
  'created_at': instance.createdAt,
  'status': instance.status,
  'grand_total': instance.grandTotal,
};
