part of 'ticket_bloc.dart';

@freezed
class TicketEvent with _$TicketEvent {
  const factory TicketEvent.getTickets({@Default(false) bool forceRefresh}) =
      _GetTicketsEvent;
  const factory TicketEvent.getTicketDetails(String ticketId) =
      _GetTicketDetailsEvent;
  const factory TicketEvent.createTicket(CreateTicketModel ticketData) =
      _CreateTicketEvent;
  const factory TicketEvent.replyTicket(
    String ticketId,
    String message, {
    List<File>? attachments,
  }) = _ReplyTicketEvent;
  const factory TicketEvent.closeTicket(String ticketId) = _CloseTicketEvent;
  const factory TicketEvent.getTicketOrders() = _GetTicketOrdersEvent;
  const factory TicketEvent.clearMessage() = _ClearMessageEvent;
}
