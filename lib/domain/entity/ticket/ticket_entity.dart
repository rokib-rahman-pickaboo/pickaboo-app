class TicketEntity {
  final String ticketId;
  final String ticketCode;
  final String subject;
  final String issueType;
  final String status;
  final String department;
  final String? lastReplyAt;
  final String lastReplyName;

  const TicketEntity({
    required this.ticketId,
    required this.ticketCode,
    required this.subject,
    required this.issueType,
    required this.status,
    required this.department,
    this.lastReplyAt,
    required this.lastReplyName,
  });
}

class TicketDetailEntity {
  final String ticketId;
  final String ticketCode;
  final String subject;
  final String issueType;
  final String status;
  final String priority;
  final String? orderId;
  final String? orderIncrementId;
  final String? orderGrandTotal;
  final String? orderStatus;
  final String? orderCreatedAt;
  final String? lastReplyAt;
  final String? lastReplyName;
  final List<TicketMessageEntity> messages;

  const TicketDetailEntity({
    required this.ticketId,
    required this.ticketCode,
    required this.subject,
    required this.issueType,
    required this.status,
    required this.priority,
    this.orderId,
    this.orderIncrementId,
    this.orderGrandTotal,
    this.orderStatus,
    this.orderCreatedAt,
    this.lastReplyAt,
    this.lastReplyName,
    required this.messages,
  });
}

class TicketMessageEntity {
  final String messageId;
  final String replyer;
  final String body;
  final String? createdAt;
  final List<TicketAttachmentEntity> attachments;

  const TicketMessageEntity({
    required this.messageId,
    required this.replyer,
    required this.body,
    this.createdAt,
    this.attachments = const [],
  });
}

class TicketAttachmentEntity {
  final String fileName;
  final String fileType;
  final String path;

  const TicketAttachmentEntity({
    required this.fileName,
    required this.fileType,
    required this.path,
  });
}
