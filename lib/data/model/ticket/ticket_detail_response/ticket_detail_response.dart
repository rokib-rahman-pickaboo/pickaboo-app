import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_detail_response.freezed.dart';
part 'ticket_detail_response.g.dart';

@freezed
class TicketDetailResponse with _$TicketDetailResponse {
  const factory TicketDetailResponse({
    @JsonKey(name: "ticket_id") String? ticketId,
    @JsonKey(name: "ticket_code") String? ticketCode,
    @JsonKey(name: "order_id") String? orderId,
    @JsonKey(name: "order_increment_id") String? orderIncrementId,
    @JsonKey(name: "order_created_at") String? orderCreatedAt,
    @JsonKey(name: "order_grand_total") String? orderGrandTotal,
    @JsonKey(name: "order_status") String? orderStatus,
    @JsonKey(name: "subject") String? subject,
    @JsonKey(name: "issue_type") String? issueType,
    @JsonKey(name: "last_reply_name") String? lastReplyName,
    @JsonKey(name: "last_reply_at") String? lastReplyAt,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "priority") String? priority,
    @JsonKey(name: "messages") List<Message>? messages,
  }) = _TicketDetailResponse;

  factory TicketDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketDetailResponseFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    @JsonKey(name: "message_id") String? messageId,
    @JsonKey(name: "replyer") String? replyer,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "body") String? body,
    @JsonKey(name: "attachment") List<Attachment>? attachment,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    @JsonKey(name: "file_name") String? fileName,
    @JsonKey(name: "file_type") String? fileType,
    @JsonKey(name: "path") String? path,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}
