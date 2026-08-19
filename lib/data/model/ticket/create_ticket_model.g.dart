// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateTicketModelImpl _$$CreateTicketModelImplFromJson(
  Map<String, dynamic> json,
) => _$CreateTicketModelImpl(
  subject: json['subject'] as String,
  body: json['body'] as String,
  orderId: json['order_id'] as String?,
  issueType: json['issue_type'] as String?,
);

Map<String, dynamic> _$$CreateTicketModelImplToJson(
  _$CreateTicketModelImpl instance,
) => <String, dynamic>{
  'subject': instance.subject,
  'body': instance.body,
  if (instance.orderId case final value?) 'order_id': value,
  if (instance.issueType case final value?) 'issue_type': value,
};
