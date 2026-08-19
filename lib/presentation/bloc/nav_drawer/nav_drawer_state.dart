part of 'nav_drawer_bloc.dart';

@freezed
class NavDrawerState with _$NavDrawerState {
  const factory NavDrawerState.closed() = _Closed;
  const factory NavDrawerState.opened() = _Opened;
}
