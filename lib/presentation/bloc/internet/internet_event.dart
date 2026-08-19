part of 'internet_bloc.dart';

@freezed
class InternetEvent with _$InternetEvent {
  const factory InternetEvent.onConnected() = _OnConnected;
  const factory InternetEvent.onNotConnected() = _OnNotConnected;
}
