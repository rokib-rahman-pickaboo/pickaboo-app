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
import 'package:pickaboo/data/model/ticket/ticket_issue_type_model.dart';
import 'package:pickaboo/data/model/ticket/ticket_order_info_response.dart';
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
        options: Options(
          headers: {
            Headers.contentLengthHeader: formData.length,
          },
        ),
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
        options: Options(
          headers: {
            Headers.contentLengthHeader: formData.length,
          },
        ),
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
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> closeTicket(String id) async {
    try {
      final response = await _client.post(
        ApiEndpoints.ticketCloseUrl,
        data: {'ticket_id': id},
      );

      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(const ErrorResponse(message: 'Failed to close ticket'));
      }
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, TicketOrderInfoResponse>>
  getTicketOrders() async {
    try {
      final response = await _client.get(ApiEndpoints.ticketOrderInfoUrl);

      if (kDebugMode) {
        print("ticket_orderinfo_response -> ${jsonEncode(response.data)}");
      }

      if (response.data is List) {
        final outerList = response.data as List;
        List<TicketOrderModel> orders = [];
        List<TicketIssueTypeModel> issueTypes = [];

        if (outerList.isNotEmpty && outerList.first is List) {
          // 2D Array format: [ [orders...], [departments...] ]
          final ordersRaw = outerList[0] as List;
          orders = ordersRaw
              .whereType<Map<String, dynamic>>()
              .map((e) => TicketOrderModel.fromJson(_sanitizeJsonStrings(e)))
              .toList();

          if (outerList.length > 1 && outerList[1] is List) {
            final issuesRaw = outerList[1] as List;
            issueTypes = issuesRaw
                .whereType<Map<String, dynamic>>()
                .map((e) =>
                    TicketIssueTypeModel.fromJson(_sanitizeJsonStrings(e)))
                .toList();
          }
        } else {
          // Fallback: 1D Array format
          orders = outerList
              .whereType<Map<String, dynamic>>()
              .map((e) => TicketOrderModel.fromJson(_sanitizeJsonStrings(e)))
              .toList();
        }

        return right(
          TicketOrderInfoResponse(
            orders: orders,
            issueTypes: issueTypes,
          ),
        );
      }
      return right(const TicketOrderInfoResponse());
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  ErrorResponse checkErrorResponse(DioException err) {
    if (err.type == DioExceptionType.badResponse) {
      if (err.response?.statusCode == 413) {
        return const ErrorResponse(
          message:
              'Attachments are too large for the server. Please reduce the file size.',
        );
      }
      final errorData = err.response?.data;
      if (errorData is Map<String, dynamic>) {
        return ErrorResponse.fromJson(errorData);
      }
    }
    final errorMsg = err.message?.toLowerCase() ?? '';
    final errStr = err.error?.toString().toLowerCase() ?? '';
    if (err.error is SocketException ||
        errorMsg.contains('broken pipe') ||
        errorMsg.contains('connection reset') ||
        errStr.contains('broken pipe') ||
        errStr.contains('connection reset')) {
      return const ErrorResponse(
        message:
            'Upload failed: Server closed the connection. Attachments may exceed the server size limit.',
      );
    }
    return const ErrorResponse(message: 'Something went wrong');
  }
}
