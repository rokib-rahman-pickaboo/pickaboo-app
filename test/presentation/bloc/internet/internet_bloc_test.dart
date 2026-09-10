import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late InternetBloc bloc;

  setUp(() {
    bloc = InternetBloc();
  });

  tearDown(() async {
    await bloc.close();
  });

  group('InternetBloc - Lifecycle and Confirmation Rules', () {
    test('onConnected emits connected state', () async {
      bloc.add(const InternetEvent.onConnected());
      await expectLater(
        bloc.stream,
        emits(const InternetState.connected('Back Online')),
      );
    });

    test(
        'confirmedDisconnected is BLOCKED when app is in background (paused/inactive)',
        () async {
      // Put bloc into connected state first
      bloc.add(const InternetEvent.onConnected());
      await pumpEventQueue();

      // Simulate device lock / app paused
      bloc.didChangeAppLifecycleState(AppLifecycleState.paused);
      await pumpEventQueue();

      // Attempt to dispatch confirmedDisconnected while locked
      bloc.add(const InternetEvent.confirmedDisconnected());
      await pumpEventQueue();

      // Verify that state did NOT transition to disconnected!
      expect(bloc.state, const InternetState.connected('Back Online'));
    });

    test(
        'confirmedDisconnected is BLOCKED when app is in inactive transition',
        () async {
      bloc.add(const InternetEvent.onConnected());
      await pumpEventQueue();

      bloc.didChangeAppLifecycleState(AppLifecycleState.inactive);
      await pumpEventQueue();

      bloc.add(const InternetEvent.confirmedDisconnected());
      await pumpEventQueue();

      expect(bloc.state, const InternetState.connected('Back Online'));
    });

    test(
        'confirmedDisconnected is BLOCKED during the resume grace period',
        () async {
      bloc.add(const InternetEvent.onConnected());
      await pumpEventQueue();

      // User unlocks phone -> AppLifecycleState.resumed
      bloc.didChangeAppLifecycleState(AppLifecycleState.resumed);
      await pumpEventQueue();

      // While radios are waking up in the 5s grace window, try to disconnect
      bloc.add(const InternetEvent.confirmedDisconnected());
      await pumpEventQueue();

      // Verify still connected
      expect(bloc.state, const InternetState.connected('Back Online'));
    });

    test(
        'onNotConnected does NOT immediately emit disconnected',
        () async {
      bloc.add(const InternetEvent.onConnected());
      await pumpEventQueue();

      // Simulate network error reporting onNotConnected
      bloc.add(const InternetEvent.onNotConnected());
      await pumpEventQueue();

      // Must NOT immediately emit disconnected! (Strict confirmation required)
      expect(bloc.state, const InternetState.connected('Back Online'));
    });
  });
}
