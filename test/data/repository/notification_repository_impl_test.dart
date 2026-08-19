import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/notification_api_service.dart';
import 'package:pickaboo/data/repository/notification_repository_impl.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/domain/entity/notification_entity/notification_entity.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockNotificationApiService extends Mock
    implements NotificationApiService {}

class MockAuthCacheManager extends Mock implements AuthCacheManager {}

void main() {
  late NotificationRepositoryImpl repository;
  late MockNotificationApiService mockApiService;
  late MockAuthCacheManager mockCacheManager;

  setUp(() {
    mockApiService = MockNotificationApiService();
    mockCacheManager = MockAuthCacheManager();
    repository = NotificationRepositoryImpl(mockApiService, mockCacheManager);
  });

  group('NotificationRepositoryImpl Performance Tests', () {
    test('getNotificationList performance', () async {
      // Arrange
      const token = "token";
      final response = [
        const NotificationEntity(
          id: 1,
          title: 'Test',
          message: 'Message',
          isFetched: true,
          isClicked: false,
          tag: 123,
        ),
      ];

      when(() => mockCacheManager.getToken()).thenAnswer((_) async => token);

      when(() => mockApiService.getNotificationList()).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 55));
        return Right(response);
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure(
        'getNotificationList',
        () {
          return repository.getNotificationList();
        },
      );

      // Assert
      expect(result.isRight(), true);
      verify(() => mockApiService.getNotificationList()).called(1);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
