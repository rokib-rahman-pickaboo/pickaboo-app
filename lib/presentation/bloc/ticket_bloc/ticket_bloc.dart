import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_order_entity.dart';
import 'package:pickaboo/domain/repository/ticket_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/model/ticket/create_ticket_model.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';
part 'ticket_bloc.freezed.dart';

@injectable
class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final TicketRepository _repository;

  TicketBloc(this._repository) : super(const TicketState()) {
    on<TicketEvent>((event, emit) async {
      await event.map(
        getTickets: (e) => _onGetTickets(emit, forceRefresh: e.forceRefresh),
        getTicketDetails: (e) => _onGetTicketDetails(e.ticketId, emit),
        createTicket: (e) => _onCreateTicket(e, emit),
        replyTicket: (e) => _onReplyTicket(e, emit),
        closeTicket: (e) => _onCloseTicket(e.ticketId, emit),
        getTicketOrders: (e) => _onGetTicketOrders(emit),
        clearMessage: (e) async => emit(state.copyWith(successMessage: null)),
      );
    });
  }

  Future<void> _onGetTickets(
    Emitter<TicketState> emit, {
    bool forceRefresh = false,
  }) async {
    emit(state.copyWith(status: TicketStatus.loading, successMessage: null));
    final result = await _repository.getTickets(forceRefresh: forceRefresh);
    result.fold(
      (error) => emit(state.copyWith(status: TicketStatus.error, error: error)),
      (tickets) =>
          emit(state.copyWith(status: TicketStatus.success, tickets: tickets)),
    );
  }

  Future<void> _onGetTicketDetails(
    String ticketId,
    Emitter<TicketState> emit,
  ) async {
    emit(state.copyWith(status: TicketStatus.loading, successMessage: null));
    final result = await _repository.getTicketDetails(ticketId);
    result.fold(
      (error) {
        emit(state.copyWith(status: TicketStatus.error, error: error));
      },
      (ticket) {
        if (ticket != null) {
          emit(
            state.copyWith(status: TicketStatus.success, ticketDetails: ticket),
          );
        } else {
          emit(
            state.copyWith(
              status: TicketStatus.error,
              error: const AppErrorEntity(message: 'Ticket details not found'),
            ),
          );
        }
      },
    );
  }

  Future<void> _onCreateTicket(
    _CreateTicketEvent event,
    Emitter<TicketState> emit,
  ) async {
    emit(state.copyWith(status: TicketStatus.loading));
    final result = await _repository.createTicket(event.ticketData);
    result.fold(
      (error) => emit(state.copyWith(status: TicketStatus.error, error: error)),
      (success) {
        emit(
          state.copyWith(
            status: TicketStatus.success,
            successMessage: 'Ticket created successfully',
          ),
        );
        add(const TicketEvent.getTickets());
      },
    );
  }

  Future<void> _onReplyTicket(
    _ReplyTicketEvent event,
    Emitter<TicketState> emit,
  ) async {
    emit(state.copyWith(status: TicketStatus.loading));
    final result = await _repository.replyToTicket(
      event.ticketId,
      event.message,
      attachments: event.attachments,
    );
    result.fold(
      (error) => emit(state.copyWith(status: TicketStatus.error, error: error)),
      (success) {
        emit(
          state.copyWith(
            status: TicketStatus.success,
            successMessage: 'Reply posted successfully',
          ),
        );
        add(TicketEvent.getTicketDetails(event.ticketId));
      },
    );
  }

  Future<void> _onCloseTicket(
    String ticketId,
    Emitter<TicketState> emit,
  ) async {
    emit(state.copyWith(status: TicketStatus.loading));
    final result = await _repository.closeTicket(ticketId);
    result.fold(
      (error) => emit(state.copyWith(status: TicketStatus.error, error: error)),
      (success) {
        emit(
          state.copyWith(
            status: TicketStatus.success,
            successMessage: 'Ticket closed successfully',
          ),
        );
        add(const TicketEvent.getTickets());
      },
    );
  }

  Future<void> _onGetTicketOrders(Emitter<TicketState> emit) async {
    emit(state.copyWith(status: TicketStatus.loading));
    final result = await _repository.getTicketOrders();
    result.fold(
      (error) => emit(state.copyWith(status: TicketStatus.error, error: error)),
      (orders) =>
          emit(state.copyWith(status: TicketStatus.success, orders: orders)),
    );
  }
}
