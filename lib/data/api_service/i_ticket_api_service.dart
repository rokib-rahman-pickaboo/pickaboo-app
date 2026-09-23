import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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

      // Support both subject/title and issue_type/department_id for backend compatibility
      if (formDataMap.containsKey('subject') && !formDataMap.containsKey('title')) {
        formDataMap['title'] = formDataMap['subject'];
      }
      if (formDataMap.containsKey('issue_type') && !formDataMap.containsKey('department_id')) {
        formDataMap['department_id'] = formDataMap['issue_type'];
      }

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

      final formData = FormData.fromMap(formDataMap);

      final response = await _client.post(
        ApiEndpoints.ticketReplyUrl,
        data: formData,
      );

      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(const ErrorResponse(message: 'Failed to reply'));
      }
    } on DioException catch (e) {
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

      dynamic rawData = response.data;
      if (rawData is String) {
        try {
          rawData = jsonDecode(rawData);
        } catch (_) {}
      }

      final List<TicketOrderModel> orders = [];
      final List<TicketIssueTypeModel> issueTypes = [];

      bool isOrderMap(Map map) {
        return map.containsKey('order_id') ||
            map.containsKey('order_number') ||
            map.containsKey('increment_id') ||
            map.containsKey('entity_id') ||
            map.containsKey('grand_total') ||
            map.containsKey('grandtotal') ||
            (map.containsKey('status') && !map.containsKey('department_id'));
      }

      bool isIssueMap(Map map) {
        return map.containsKey('department_id') ||
            map.containsKey('department_name') ||
            map.containsKey('issue_type') ||
            map.containsKey('issue_id') ||
            (!isOrderMap(map) &&
                (map.containsKey('name') ||
                    map.containsKey('title') ||
                    map.containsKey('label')));
      }

      void processList(List list) {
        for (final item in list) {
          if (item is List) {
            processList(item);
          } else if (item is Map) {
            final map = Map<String, dynamic>.from(item);
            if (isOrderMap(map)) {
              orders.add(TicketOrderModel.fromJson(map));
            } else if (isIssueMap(map)) {
              issueTypes.add(TicketIssueTypeModel.fromJson(map));
            }
          }
        }
      }

      if (rawData is List) {
        processList(rawData);
      } else if (rawData is Map) {
        final dataMap = Map<String, dynamic>.from(rawData);

        final innerData =
            dataMap['data'] ?? dataMap['result'] ?? dataMap['response'];
        if (innerData is List) {
          processList(innerData);
        } else if (innerData is Map) {
          dataMap.addAll(Map<String, dynamic>.from(innerData));
        }

        final ordersRaw = dataMap['orders'] ??
            dataMap['items'] ??
            dataMap['orderinfo'] ??
            dataMap['order_info'] ??
            dataMap['order_list'];
        if (ordersRaw is List) {
          for (final item in ordersRaw.whereType<Map>()) {
            orders.add(
              TicketOrderModel.fromJson(Map<String, dynamic>.from(item)),
            );
          }
        }

        final issuesRaw = dataMap['departments'] ??
            dataMap['issue_types'] ??
            dataMap['department'] ??
            dataMap['issues'] ??
            dataMap['categories'];
        if (issuesRaw is List) {
          for (final item in issuesRaw.whereType<Map>()) {
            issueTypes.add(
              TicketIssueTypeModel.fromJson(Map<String, dynamic>.from(item)),
            );
          }
        }

        if (orders.isEmpty && issueTypes.isEmpty) {
          for (final value in dataMap.values) {
            if (value is List) {
              processList(value);
            }
          }
        }
      }

      // Deduplicate orders
      final seenOrderIds = <String>{};
      final uniqueOrders = <TicketOrderModel>[];
      for (final o in orders) {
        final id = o.orderId ?? o.incrementId;
        if (id != null && id.isNotEmpty) {
          if (!seenOrderIds.contains(id)) {
            seenOrderIds.add(id);
            uniqueOrders.add(o);
          }
        } else {
          uniqueOrders.add(o);
        }
      }

      // Deduplicate issue types
      final seenIssueIds = <String>{};
      final uniqueIssues = <TicketIssueTypeModel>[];
      for (final it in issueTypes) {
        final key = '${it.id}_${it.name}';
        if (!seenIssueIds.contains(key) && !seenIssueIds.contains(it.name)) {
          seenIssueIds.add(key);
          seenIssueIds.add(it.name);
          uniqueIssues.add(it);
        }
      }

      return right(
        TicketOrderInfoResponse(
          orders: uniqueOrders,
          issueTypes: uniqueIssues,
        ),
      );
    } on DioException catch (e) {
      return left(checkErrorResponse(e));
    } catch (e) {
      return left(ErrorResponse(message: e.toString()));
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
