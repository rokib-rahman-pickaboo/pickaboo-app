// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketDetailResponseImpl _$$TicketDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TicketDetailResponseImpl(
  ticketId: json['ticket_id'] as String?,
  ticketCode: json['ticket_code'] as String?,
  orderId: json['order_id'] as String?,
  orderIncrementId: json['order_increment_id'] as String?,
  orderCreatedAt: json['order_created_at'] as String?,
  orderGrandTotal: json['order_grand_total'] as String?,
  orderStatus: json['order_status'] as String?,
  subject: json['subject'] as String?,
  issueType: json['issue_type'] as String?,
  lastReplyName: json['last_reply_name'] as String?,
  lastReplyAt: json['last_reply_at'] as String?,
  status: json['status'] as String?,
  priority: json['priority'] as String?,
  messages:
      (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$TicketDetailResponseImplToJson(
  _$TicketDetailResponseImpl instance,
) => <String, dynamic>{
  'ticket_id': instance.ticketId,
  'ticket_code': instance.ticketCode,
  'order_id': instance.orderId,
  'order_increment_id': instance.orderIncrementId,
  'order_created_at': instance.orderCreatedAt,
  'order_grand_total': instance.orderGrandTotal,
  'order_status': instance.orderStatus,
  'subject': instance.subject,
  'issue_type': instance.issueType,
  'last_reply_name': instance.lastReplyName,
  'last_reply_at': instance.lastReplyAt,
  'status': instance.status,
  'priority': instance.priority,
  'messages': instance.messages,
};

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      messageId: json['message_id'] as String?,
      replyer: json['replyer'] as String?,
      createdAt: json['created_at'] as String?,
      body: json['body'] as String?,
      attachment:
          (json['attachment'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'message_id': instance.messageId,
      'replyer': instance.replyer,
      'created_at': instance.createdAt,
      'body': instance.body,
      'attachment': instance.attachment,
    };

_$AttachmentImpl _$$AttachmentImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentImpl(
      fileName: json['file_name'] as String?,
      fileType: json['file_type'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$$AttachmentImplToJson(_$AttachmentImpl instance) =>
    <String, dynamic>{
      'file_name': instance.fileName,
      'file_type': instance.fileType,
      'path': instance.path,
    };
