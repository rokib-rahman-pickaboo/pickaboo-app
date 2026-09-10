import 'package:pickaboo/core/constants/app_strings.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';

import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';

extension ErrorResponseMapper on ErrorResponse {
  AppErrorEntity toEntity() {
    final raw = ApiErrorParser.sanitize(message);
    final isConn = isConnectivityFailure(raw);
    if (isConn) {
      try {
        if (getIt.isRegistered<InternetBloc>()) {
          getIt<InternetBloc>().add(const InternetEvent.onNotConnected());
        }
      } catch (_) {}
    }
    return AppErrorEntity(
      message: raw.isNotEmpty ? raw : AppStrings.somethingWentWrong,
      isRecoverable: success != true,
      isConnectivity: isConn,
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
      m.contains('no internet') ||
      m.contains('network error') ||
      m.contains('clientexception') ||
      m.contains('connection refused') ||
      m.contains('connection reset') ||
      m.contains('offline') ||
      m.contains('no address associated with hostname');
}
