import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';

class ConnectivityUtils {
  ConnectivityUtils._();

  static InternetState? _getInternetState([BuildContext? context]) {
    try {
      if (context != null) {
        return context.read<InternetBloc>().state;
      } else if (getIt.isRegistered<InternetBloc>()) {
        return getIt<InternetBloc>().state;
      }
    } catch (_) {}
    return null;
  }

  /// Returns true ONLY if the app has strictly confirmed that there is no internet connection.
  static bool isOffline([BuildContext? context]) {
    final state = _getInternetState(context);
    return state?.maybeWhen(
      disconnected: (_) => true,
      orElse: () => false,
    ) ?? false;
  }

  /// Determines whether an error, message, or current context indicates an offline failure.
  /// When InternetBloc is active, only a strictly confirmed disconnected state triggers offline.
  /// If InternetBloc is unavailable, falls back to analyzing the error message.
  static bool isNoInternet(dynamic error, [BuildContext? context]) {
    final state = _getInternetState(context);
    if (state != null) {
      return state.maybeWhen(
        disconnected: (_) => true,
        orElse: () => false,
      );
    }

    if (error is AppErrorEntity && error.isConnectivity) {
      return true;
    }
    if (error is AppErrorEntity && isConnectivityFailure(error.message)) {
      return true;
    }
    if (error is String && isConnectivityFailure(error)) {
      return true;
    }
    return false;
  }
}

