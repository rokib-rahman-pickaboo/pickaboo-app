// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketOrderModelImpl _$$TicketOrderModelImplFromJson(
  Map<String, dynamic> json,
) => _$TicketOrderModelImpl(
  orderId: json['order_id'] as String?,
  incrementId: json['increment_id'] as String?,
  createdAt: json['created_at'] as String?,
  status: json['status'] as String?,
  grandTotal: (json['grand_total'] as num?)?.toDouble(),
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
