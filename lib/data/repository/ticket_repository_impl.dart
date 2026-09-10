import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/ticket_api_service.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/data/mapper/ticket_mapper.dart';
import 'package:pickaboo/data/model/ticket/create_ticket_model.dart';
import 'package:pickaboo/data/local_data_source/ticket_local_data_source.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_order_info_entity.dart';
import 'package:pickaboo/domain/repository/ticket_repository.dart';

@LazySingleton(as: TicketRepository)
class TicketRepositoryImpl implements TicketRepository {
  final TicketApiService _apiService;
  final TicketMapper _mapper;
  final TicketLocalDataSource _localDataSource;

  TicketRepositoryImpl(this._apiService, this._mapper, this._localDataSource);

  @override
  Future<Either<AppErrorEntity, List<TicketEntity>>> getTickets({
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh) {
      final cachedTickets = await _localDataSource.getTicketsIfValid();
      if (cachedTickets != null) {
        final entities = cachedTickets
            .map((e) => _mapper.mapTicketResponseToEntity(e))
            .toList();
        return Right(entities);
      }
    }

    if (kDebugMode) {
      print('🌐 Fetching tickets from API');
    }

    final result = await _apiService.getTickets();
    return result.fold((error) => Left(error.toEntity()), (models) {
      _localDataSource.insertTickets(models);

      final entities = models
          .map((e) => _mapper.mapTicketResponseToEntity(e))
          .toList();
      return Right(entities);
    });
  }

  @override
  Future<Either<AppErrorEntity, TicketDetailEntity?>> getTicketDetails(
    String id,
  ) async {
    final result = await _apiService.getTicketDetails(id);
    return result.fold(
      (error) => Left(error.toEntity()),
      (model) => Right(_mapper.mapTicketDetailResponseToEntity(model)),
    );
  }

  @override
  Future<Either<AppErrorEntity, bool>> createTicket(
    CreateTicketModel data,
  ) async {
    final result = await _apiService.createTicket(data);
    return result.fold(
      (error) => Left(error.toEntity()),
      (success) => Right(success),
    );
  }

  @override
  Future<Either<AppErrorEntity, bool>> replyToTicket(
    String id,
    String message, {
    List<File>? attachments,
  }) async {
    final result = await _apiService.replyToTicket(
      id,
      message,
      attachments: attachments,
    );
    return result.fold(
      (error) => Left(error.toEntity()),
      (success) => Right(success),
    );
  }

  @override
  Future<Either<AppErrorEntity, bool>> closeTicket(String id) async {
    final result = await _apiService.closeTicket(id);
    return result.fold(
      (error) => Left(error.toEntity()),
      (success) => Right(success),
    );
  }

  @override
  Future<Either<AppErrorEntity, TicketOrderInfoEntity>>
  getTicketOrders() async {
    final result = await _apiService.getTicketOrders();
    return result.fold(
      (error) => Left(error.toEntity()),
      (response) => Right(_mapper.mapTicketOrderInfoResponseToEntity(response)),
    );
  }
}
