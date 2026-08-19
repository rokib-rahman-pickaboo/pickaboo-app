import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';

extension ErrorResponseMapper on ErrorResponse {
  AppErrorEntity toEntity() {
    final raw = message?.trim();
    return AppErrorEntity(
      message: raw?.isNotEmpty == true ? raw! : 'Something went wrong',
      isRecoverable: success != true,
      isConnectivity: isConnectivityFailure(raw),
    );
  }
}

/// The api services build their transport failures as
/// `"Network error (DioExceptionType.connectionError): …"`, so connectivity is
/// only recoverable from the message text — there is no status code to read.
bool isConnectivityFailure(String? message) {
  if (message == null) return false;
  final m = message.toLowerCase();
  return m.contains('socketexception') ||
      m.contains('failed host lookup') ||
      m.contains('connectionerror') ||
      m.contains('connectiontimeout') ||
      m.contains('receivetimeout') ||
      m.contains('sendtimeout') ||
      m.contains('network is unreachable') ||
      m.contains('no address associated with hostname');
}
