import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> get onStatusChange;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _checker;
  NetworkInfoImpl(this._checker);

  @override
  Future<bool> get isConnected => _checker.hasConnection;

  @override
  Stream<InternetConnectionStatus> get onStatusChange =>
      _checker.onStatusChange;
}
