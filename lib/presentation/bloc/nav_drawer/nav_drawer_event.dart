part of 'nav_drawer_bloc.dart';

@freezed
class NavDrawerEvent with _$NavDrawerEvent {
  const factory NavDrawerEvent.openDrawer() = _OpenDrawer;
  const factory NavDrawerEvent.closeDrawer() = _CloseDrawer;
  const factory NavDrawerEvent.toggleDrawer() = _ToggleDrawer;
  const factory NavDrawerEvent.drawerChanged({required bool isOpen}) =
      _DrawerChanged;
}
