import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/i_notification_api_service.dart';
import 'package:pickaboo/domain/entity/notification_entity/notification_entity.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockDio extends Mock implements Dio {}

void main() {
  late INotificationApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = INotificationApiService(mockDio);
  });

  group('INotificationApiService Performance Tests', () {
    test('getNotificationList performance', () async {
      // Arrange
      final responseData = [
        {
          "notification_id": 1,
          "title": "Test Title",
          "message": "Test Message",
          "tag": 123,
          "is_fetched": 1,
          "is_clicked": 0,
        },
      ];

      when(() => mockDio.get(any())).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 50));
        return Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure(
        'API: getNotificationList',
        () {
          return apiService.getNotificationList();
        },
      );

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r, isA<List<NotificationEntity>>());
        expect(r.length, 1);
        expect(r.first.title, 'Test Title');
      });
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
