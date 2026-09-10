import 'package:pickaboo/domain/entity/ticket/ticket_issue_type_entity.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_order_entity.dart';

class TicketOrderInfoEntity {
  final List<TicketOrderEntity> orders;
  final List<TicketIssueTypeEntity> issueTypes;

  const TicketOrderInfoEntity({
    this.orders = const [],
    this.issueTypes = const [],
  });
}
