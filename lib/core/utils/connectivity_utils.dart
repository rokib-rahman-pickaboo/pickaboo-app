import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';

class ConnectivityUtils {
  ConnectivityUtils._();

  /// Returns true ONLY if the app has strictly confirmed that there is no internet connection.
  static bool isOffline([BuildContext? context]) {
    try {
      InternetState? state;
      if (context != null) {
        state = context.read<InternetBloc>().state;
      } else if (getIt.isRegistered<InternetBloc>()) {
        state = getIt<InternetBloc>().state;
      }
      return state?.maybeWhen(
        disconnected: (_) => true,
        orElse: () => false,
      ) ?? false;
    } catch (_) {
      return false;
    }
  }

  /// Determines whether an error, message, or current context indicates an offline failure.
  /// Strictly follows the rule: only returns true after confirming no internet.
  static bool isNoInternet(dynamic error, [BuildContext? context]) {
    // Only return true when offline status has been confirmed by InternetBloc.
    // Transient socket aborts (e.g., during phone lock) or isolated request timeouts
    // must never trigger the "No Internet" UI while the device remains connected.
    return isOffline(context);
  }
}

