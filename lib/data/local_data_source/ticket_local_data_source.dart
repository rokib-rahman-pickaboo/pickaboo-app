import 'package:pickaboo/data/model/ticket/ticket_response/ticket_response.dart';

abstract class TicketLocalDataSource {
  Future<List<TicketResponse>?> getTicketsIfValid();
  Future<void> insertTickets(List<TicketResponse> tickets);
  Future<void> clearTickets();
}
