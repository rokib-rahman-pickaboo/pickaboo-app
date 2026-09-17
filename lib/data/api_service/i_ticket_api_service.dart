import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
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
      List<TicketOrderModel> orders = [];
      List<TicketIssueTypeModel> issueTypes = [];

      // 1. Try to fetch from Helpdesk orderinfo endpoint
      try {
        final response = await _client.get(ApiEndpoints.ticketOrderInfoUrl);

        if (kDebugMode) {
          print("ticket_orderinfo_response -> ${jsonEncode(response.data)}");
        }

        if (response.data is List) {
          final outerList = response.data as List;

          if (outerList.isNotEmpty && outerList.first is List) {
            // 2D Array format: [ [orders...], [departments...] ]
            final ordersRaw = outerList[0] as List;
            orders = ordersRaw
                .whereType<Map>()
                .map((e) => TicketOrderModel.fromJson(
                    _sanitizeJsonStrings(Map<String, dynamic>.from(e))))
                .toList();

            if (outerList.length > 1 && outerList[1] is List) {
              final issuesRaw = outerList[1] as List;
              issueTypes = issuesRaw
                  .whereType<Map>()
                  .map((e) => TicketIssueTypeModel.fromJson(
                      _sanitizeJsonStrings(Map<String, dynamic>.from(e))))
                  .toList();
            }
          } else {
            // Fallback: 1D Array format
            orders = outerList
                .whereType<Map>()
                .map((e) => TicketOrderModel.fromJson(
                    _sanitizeJsonStrings(Map<String, dynamic>.from(e))))
                .toList();
          }
        } else if (response.data is Map) {
          final dataMap = response.data as Map;
          if (dataMap['orders'] is List) {
            orders = (dataMap['orders'] as List)
                .whereType<Map>()
                .map((e) => TicketOrderModel.fromJson(
                    _sanitizeJsonStrings(Map<String, dynamic>.from(e))))
                .toList();
          }
          final issuesList = dataMap['issue_types'] ?? dataMap['departments'];
          if (issuesList is List) {
            issueTypes = issuesList
                .whereType<Map>()
                .map((e) => TicketIssueTypeModel.fromJson(
                    _sanitizeJsonStrings(Map<String, dynamic>.from(e))))
                .toList();
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print("Failed fetching ticketOrderInfoUrl: $e");
        }
      }

      // 2. ALWAYS query /rest/V1/orders/mine to ensure ANY placed order is in the list
      try {
        final mineOrdersResponse = await _client.get(
          ApiEndpoints.getOrderListUrl,
          queryParameters: {'limit': 50, 'current_page': 1},
        );

        if (mineOrdersResponse.data is Map) {
          final mineMap = mineOrdersResponse.data as Map;
          final items = mineMap['items'];
          if (items is List) {
            final existingIds = orders
                .map((o) => o.orderId ?? o.incrementId)
                .where((id) => id != null && id.isNotEmpty)
                .toSet();

            for (final item in items.whereType<Map>()) {
              final itemMap = Map<String, dynamic>.from(item);
              final orderId = itemMap['order_id']?.toString();
              final orderNumber = itemMap['order_number']?.toString() ??
                  itemMap['increment_id']?.toString() ??
                  orderId;

              // If this order is not already in the helpdesk list, add it
              if (orderId != null &&
                  !existingIds.contains(orderId) &&
                  (orderNumber == null || !existingIds.contains(orderNumber))) {
                final grandTotal = (itemMap['grandtotal'] as num?)?.toDouble() ??
                    (itemMap['grand_total'] as num?)?.toDouble();

                orders.add(
                  TicketOrderModel(
                    orderId: orderId,
                    incrementId: orderNumber,
                    createdAt: itemMap['created_at']?.toString(),
                    status: itemMap['status']?.toString(),
                    grandTotal: grandTotal,
                  ),
                );
                existingIds.add(orderId);
                if (orderNumber != null) existingIds.add(orderNumber);
              }
            }
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print("Failed fetching fallback orders from /orders/mine: $e");
        }
      }

      return right(
        TicketOrderInfoResponse(
          orders: orders,
          issueTypes: issueTypes,
        ),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    }
  }

  ErrorResponse checkErrorResponse(DioException err) {
    if (err.response?.statusCode == 413) {
      return const ErrorResponse(
        message:
            'Attachments are too large for the server. Please reduce the file size.',
      );
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
    return ApiErrorParser.parse(err);
  }
}
