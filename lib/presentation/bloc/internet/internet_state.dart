part of 'internet_bloc.dart';

@freezed
class InternetState with _$InternetState {
  const factory InternetState.initial() = _Initial;
  const factory InternetState.connected(String message) = _Connected;
  const factory InternetState.disconnected(String message) = _Disconnected;
}
