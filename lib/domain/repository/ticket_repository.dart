import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/ticket/create_ticket_model.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_order_entity.dart';

abstract class TicketRepository {
  Future<Either<AppErrorEntity, List<TicketEntity>>> getTickets({
    bool forceRefresh = false,
  });
  Future<Either<AppErrorEntity, TicketDetailEntity?>> getTicketDetails(
    String id,
  );
  Future<Either<AppErrorEntity, bool>> createTicket(CreateTicketModel data);
  Future<Either<AppErrorEntity, bool>> replyToTicket(
    String id,
    String message, {
    List<File>? attachments,
  });
  Future<Either<AppErrorEntity, bool>> closeTicket(String id);
  Future<Either<AppErrorEntity, List<TicketOrderEntity>>> getTicketOrders();
}
