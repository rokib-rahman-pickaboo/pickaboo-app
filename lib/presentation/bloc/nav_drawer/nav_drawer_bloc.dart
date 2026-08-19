import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'nav_drawer_event.dart';
part 'nav_drawer_state.dart';
part 'nav_drawer_bloc.freezed.dart';

@injectable
class NavDrawerBloc extends Bloc<NavDrawerEvent, NavDrawerState> {
  GlobalKey<ScaffoldState>? _scaffoldKey;

  NavDrawerBloc() : super(const NavDrawerState.closed()) {
    on<NavDrawerEvent>((event, emit) {
      event.map(
        openDrawer: (_) {
          _scaffoldKey?.currentState?.openDrawer();
          emit(const NavDrawerState.opened());
        },
        closeDrawer: (_) {
          _scaffoldKey?.currentState?.closeDrawer();
          emit(const NavDrawerState.closed());
        },
        toggleDrawer: (_) {
          state.when(
            closed: () {
              _scaffoldKey?.currentState?.openDrawer();
              emit(const NavDrawerState.opened());
            },
            opened: () {
              _scaffoldKey?.currentState?.closeDrawer();
              emit(const NavDrawerState.closed());
            },
          );
        },
        drawerChanged: (e) {
          emit(
            e.isOpen
                ? const NavDrawerState.opened()
                : const NavDrawerState.closed(),
          );
        },
      );
    });
  }

  void registerScaffold(GlobalKey<ScaffoldState> key) {
    _scaffoldKey = key;
  }

  void unregisterScaffold() {
    _scaffoldKey = null;
  }
}
