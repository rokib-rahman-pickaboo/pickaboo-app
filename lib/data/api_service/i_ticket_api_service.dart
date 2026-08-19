import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/api_service/ticket_api_service.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/ticket/create_ticket_model.dart';
import 'package:pickaboo/data/model/ticket/ticket_order_model.dart';
import 'package:pickaboo/data/model/ticket/ticket_response/ticket_response.dart';
import 'package:pickaboo/data/model/ticket/ticket_detail_response/ticket_detail_response.dart';

@LazySingleton(as: TicketApiService)
class ITicketApiService extends TicketApiService {
  final Dio _client;

  ITicketApiService(this._client);

  Map<String, dynamic> _sanitizeJsonStrings(Map<String, dynamic> json) {
    final sanitized = <String, dynamic>{};
    json.forEach((key, value) {
      if (value is int || value is num) {
        sanitized[key] = value.toString();
      } else {
        sanitized[key] = value;
      }
    });
    return sanitized;
  }

  @override
  Future<Either<ErrorResponse, List<TicketResponse>>> getTickets() async {
    try {
      final response = await _client.get(ApiEndpoints.ticketListUrl);

      if (response.data is List) {
        final list = (response.data as List).map((e) {
          final map = e as Map<String, dynamic>;
          return TicketResponse.fromJson(_sanitizeJsonStrings(map));
        }).toList();
        return right(list);
      }
      return right([]);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, TicketDetailResponse>> getTicketDetails(
    String id,
  ) async {
    try {
      final response = await _client.get(
        ApiEndpoints.ticketDetailsUrl,
        queryParameters: {'ticket_id': id},
      );

      if (kDebugMode) {
        print("ticket_details -> ${jsonEncode(response.data)}");
      }

      if (response.data is List && (response.data as List).isNotEmpty) {
        final map = response.data[0] as Map<String, dynamic>;
        return right(TicketDetailResponse.fromJson(_sanitizeJsonStrings(map)));
      } else if (response.data is Map<String, dynamic>) {
        final map = response.data as Map<String, dynamic>;
        return right(TicketDetailResponse.fromJson(_sanitizeJsonStrings(map)));
      } else {
        return left(const ErrorResponse(message: 'Ticket details not found'));
      }
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> createTicket(
    CreateTicketModel data,
  ) async {
    try {
      final Map<String, dynamic> formDataMap = data.toJson();
      formDataMap.removeWhere((key, value) => value == null);

      if (data.attachments != null) {
        for (int i = 0; i < data.attachments!.length; i++) {
          final file = data.attachments![i];
          String fileName = file.path.split('/').last;
          formDataMap['files[$i]'] = await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          );
        }
      }

      final formData = FormData.fromMap(formDataMap);

      final response = await _client.post(
        ApiEndpoints.createTicketUrl,
        data: formData,
      );

      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(const ErrorResponse(message: 'Failed to create ticket'));
      }
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> replyToTicket(
    String id,
    String message, {
    List<File>? attachments,
  }) async {
    try {
      final Map<String, dynamic> formDataMap = {
        'ticket_id': id,
        'body': message,
      };

      if (attachments != null) {
        for (int i = 0; i < attachments.length; i++) {
          final file = attachments[i];
          String fileName = file.path.split('/').last;
          formDataMap['files[$i]'] = await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          );
        }
      }

      if (kDebugMode) {
        print(
          "reply_ticket_request -> id: $id, body: $message, attachments: ${attachments?.length ?? 0}",
        );
      }

      final formData = FormData.fromMap(formDataMap);

      final response = await _client.post(
        ApiEndpoints.ticketReplyUrl,
        data: formData,
      );

      if (kDebugMode) {
        print("reply_ticket_response -> ${jsonEncode(response.data)}");
      }

      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(const ErrorResponse(message: 'Failed to reply'));
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("reply_ticket_error -> ${e.message}");
        print("reply_ticket_error_response -> ${jsonEncode(e.response?.data)}");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> closeTicket(String id) async {
    try {
      if (kDebugMode) {
        print("close_ticket_request -> ticket_id: $id");
      }
      final response = await _client.post(
        ApiEndpoints.ticketCloseUrl,
        data: {'ticket_id': id},
      );

      if (kDebugMode) {
        print("close_ticket_response -> ${jsonEncode(response.data)}");
      }

      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(const ErrorResponse(message: 'Failed to close ticket'));
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("close_ticket_error -> ${e.message}");
        print("close_ticket_error_response -> ${jsonEncode(e.response?.data)}");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, List<TicketOrderModel>>>
  getTicketOrders() async {
    try {
      final response = await _client.get(ApiEndpoints.ticketOrderInfoUrl);

      if (response.data is List) {
        final list = (response.data as List)
            .map((e) => TicketOrderModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(list);
      }
      return right([]);
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  ErrorResponse checkErrorResponse(DioException err) {
    if (err.type == DioExceptionType.badResponse) {
      final errorData = err.response?.data;
      if (errorData is Map<String, dynamic>) {
        return ErrorResponse.fromJson(errorData);
      }
    }
    return const ErrorResponse(message: 'Something went wrong');
  }
}
