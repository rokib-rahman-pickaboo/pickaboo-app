import 'package:pickaboo/data/model/ticket/ticket_issue_type_model.dart';
import 'package:pickaboo/data/model/ticket/ticket_order_model.dart';

class TicketOrderInfoResponse {
  final List<TicketOrderModel> orders;
  final List<TicketIssueTypeModel> issueTypes;

  const TicketOrderInfoResponse({
    this.orders = const [],
    this.issueTypes = const [],
  });
}
