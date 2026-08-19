import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pickaboo/data/network_info/network_info.dart';

@module
abstract class ConnectionModule {
  @lazySingleton
  InternetConnectionChecker get connectionChecker =>
      InternetConnectionChecker();

  @LazySingleton(as: NetworkInfo)
  NetworkInfoImpl get networkInfo => NetworkInfoImpl(connectionChecker);
}
