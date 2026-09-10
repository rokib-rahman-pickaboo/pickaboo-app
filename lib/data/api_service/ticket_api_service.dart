import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/ticket/create_ticket_model.dart';
import 'package:pickaboo/data/model/ticket/ticket_order_info_response.dart';
import 'package:pickaboo/data/model/ticket/ticket_response/ticket_response.dart';
import 'package:pickaboo/data/model/ticket/ticket_detail_response/ticket_detail_response.dart';

abstract class TicketApiService {
  Future<Either<ErrorResponse, List<TicketResponse>>> getTickets();
  Future<Either<ErrorResponse, TicketDetailResponse>> getTicketDetails(
    String id,
  );
  Future<Either<ErrorResponse, bool>> createTicket(CreateTicketModel data);
  Future<Either<ErrorResponse, bool>> replyToTicket(
    String id,
    String message, {
    List<File>? attachments,
  });
  Future<Either<ErrorResponse, bool>> closeTicket(String id);
  Future<Either<ErrorResponse, TicketOrderInfoResponse>> getTicketOrders();
}
