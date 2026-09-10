import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';

class MockInternetBloc extends MockBloc<InternetEvent, InternetState>
    implements InternetBloc {}

void main() {
  late MockInternetBloc mockInternetBloc;

  setUp(() {
    mockInternetBloc = MockInternetBloc();
    if (getIt.isRegistered<InternetBloc>()) {
      getIt.unregister<InternetBloc>();
    }
    getIt.registerSingleton<InternetBloc>(mockInternetBloc);
  });

  tearDown(() {
    if (getIt.isRegistered<InternetBloc>()) {
      getIt.unregister<InternetBloc>();
    }
  });

  group('ConnectivityUtils - Strict Offline Confirmation', () {
    test('When InternetBloc is connected, isOffline is false', () {
      when(() => mockInternetBloc.state)
          .thenReturn(const InternetState.connected('Back Online'));

      expect(ConnectivityUtils.isOffline(), isFalse);
    });

    test(
        'When InternetBloc is connected, isNoInternet is strictly false even for socket/connection errors',
        () {
      when(() => mockInternetBloc.state)
          .thenReturn(const InternetState.connected('Back Online'));

      // Raw socket exceptions that occurred during phone lock or network hiccup:
      expect(
        ConnectivityUtils.isNoInternet(
          'SocketException: OS Error: Software caused connection abort, errno = 53',
        ),
        isFalse,
      );

      expect(
        ConnectivityUtils.isNoInternet(
          'Network error (DioExceptionType.connectionError): Connection refused',
        ),
        isFalse,
      );

      expect(
        ConnectivityUtils.isNoInternet(
          'connectiontimeout: 5000ms exceeded',
        ),
        isFalse,
      );

      expect(
        ConnectivityUtils.isNoInternet(
          const AppErrorEntity(
            message: 'Network error (DioExceptionType.connectionError)',
            isConnectivity: true,
          ),
        ),
        isFalse,
      );
    });

    test('When InternetBloc is disconnected, isOffline and isNoInternet are true', () {
      when(() => mockInternetBloc.state)
          .thenReturn(const InternetState.disconnected('No Internet Connection'));

      expect(ConnectivityUtils.isOffline(), isTrue);
      expect(ConnectivityUtils.isNoInternet(null), isTrue);
      expect(ConnectivityUtils.isNoInternet('Any error'), isTrue);
      expect(
        ConnectivityUtils.isNoInternet(
          const AppErrorEntity(message: 'Something went wrong'),
        ),
        isTrue,
      );
    });

    test('When InternetBloc is in initial state, isOffline is false', () {
      when(() => mockInternetBloc.state)
          .thenReturn(const InternetState.initial());

      expect(ConnectivityUtils.isOffline(), isFalse);
      expect(
        ConnectivityUtils.isNoInternet('SocketException: OS Error'),
        isFalse,
      );
    });
  });
}
