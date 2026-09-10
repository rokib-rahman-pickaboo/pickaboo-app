import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/model/ticket/ticket_issue_type_model.dart';
import 'package:pickaboo/data/model/ticket/ticket_order_info_response.dart';
import 'package:pickaboo/data/model/ticket/ticket_response/ticket_response.dart';
import 'package:pickaboo/data/model/ticket/ticket_detail_response/ticket_detail_response.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import 'package:pickaboo/data/model/ticket/ticket_order_model.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_issue_type_entity.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_order_entity.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_order_info_entity.dart';

@lazySingleton
class TicketMapper {
  TicketEntity mapTicketResponseToEntity(TicketResponse response) {
    return TicketEntity(
      ticketId: response.ticketId ?? '',
      ticketCode: response.ticketCode ?? '',
      subject: response.subject ?? '',
      issueType: response.issueType ?? '',
      status: response.status ?? '',
      department: response.department ?? '',
      lastReplyAt: response.lastReplyAt,
      lastReplyName: response.lastReplyName ?? '',
    );
  }

  TicketDetailEntity mapTicketDetailResponseToEntity(
    TicketDetailResponse response,
  ) {
    return TicketDetailEntity(
      ticketId: response.ticketId ?? '',
      ticketCode: response.ticketCode ?? '',
      subject: response.subject ?? '',
      issueType: response.issueType ?? '',
      status: response.status ?? '',
      priority: response.priority ?? '',
      orderId: response.orderId,
      orderIncrementId: response.orderIncrementId,
      orderGrandTotal: response.orderGrandTotal,
      orderStatus: response.orderStatus,
      orderCreatedAt: response.orderCreatedAt,
      lastReplyAt: response.lastReplyAt,
      lastReplyName: response.lastReplyName,
      messages: response.messages != null
          ? response.messages!
              .map((e) => mapTicketMessageResponseToEntity(e))
              .toList()
          : [],
    );
  }

  TicketMessageEntity mapTicketMessageResponseToEntity(Message message) {
    return TicketMessageEntity(
      messageId: message.messageId ?? '',
      replyer: message.replyer ?? '',
      body: message.body ?? '',
      createdAt: message.createdAt,
      attachments: message.attachment != null
          ? message.attachment!
              .map((e) => mapTicketAttachmentResponseToEntity(e))
              .toList()
          : [],
    );
  }

  TicketAttachmentEntity mapTicketAttachmentResponseToEntity(
    Attachment attachment,
  ) {
    return TicketAttachmentEntity(
      fileName: attachment.fileName ?? '',
      fileType: attachment.fileType ?? '',
      path: attachment.path ?? '',
    );
  }

  TicketOrderEntity mapTicketOrderModelToEntity(TicketOrderModel model) {
    return TicketOrderEntity(
      orderId: model.orderId ?? '',
      incrementId: model.incrementId ?? '',
      orderNumber: model.incrementId,
      createdAt: model.createdAt ?? '',
      status: model.status ?? '',
      grandTotal: model.grandTotal ?? 0.0,
    );
  }

  TicketIssueTypeEntity mapTicketIssueTypeModelToEntity(
    TicketIssueTypeModel model,
  ) {
    return TicketIssueTypeEntity(
      id: model.id,
      name: model.name,
    );
  }

  TicketOrderInfoEntity mapTicketOrderInfoResponseToEntity(
    TicketOrderInfoResponse response,
  ) {
    return TicketOrderInfoEntity(
      orders: response.orders.map(mapTicketOrderModelToEntity).toList(),
      issueTypes:
          response.issueTypes.map(mapTicketIssueTypeModelToEntity).toList(),
    );
  }
}
