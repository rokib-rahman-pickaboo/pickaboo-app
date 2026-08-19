part of 'ticket_bloc.dart';

enum TicketStatus { initial, loading, success, error }

@freezed
class TicketState with _$TicketState {
  const factory TicketState({
    @Default(TicketStatus.initial) TicketStatus status,
    AppErrorEntity? error,
    @Default([]) List<TicketEntity> tickets,
    TicketDetailEntity? ticketDetails,
    @Default([]) List<TicketOrderEntity> orders,
    String? successMessage,
  }) = _TicketState;
}
