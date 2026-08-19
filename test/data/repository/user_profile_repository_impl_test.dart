import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/user_profile_api_service.dart';
import 'package:pickaboo/data/local_data_source/user_profile_local_data_source.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/data/repository/user_profile_repository_impl.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import 'package:pickaboo/data/services/recaptcha_service.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockUserProfileApiService extends Mock implements UserProfileApiService {}

class MockUserProfileLocalDataSource extends Mock
    implements UserProfileLocalDataSource {}

class MockAuthCacheManager extends Mock implements AuthCacheManager {}

class MockRecaptchaService extends Mock implements RecaptchaService {}

// Fakes
class FakeUserResponse extends Fake implements UserResponse {}

void main() {
  late UserProfileRepositoryImpl repository;
  late MockUserProfileApiService mockApiService;
  late MockUserProfileLocalDataSource mockLocalDataSource;
  late MockAuthCacheManager mockAuthCacheManager;
  late MockRecaptchaService mockRecaptchaService;

  setUpAll(() {
    registerFallbackValue(FakeUserResponse());
  });

  setUp(() {
    mockApiService = MockUserProfileApiService();
    mockLocalDataSource = MockUserProfileLocalDataSource();
    mockAuthCacheManager = MockAuthCacheManager();
    mockRecaptchaService = MockRecaptchaService();
    when(() => mockRecaptchaService.executeAction(any()))
        .thenAnswer((_) async => 'test-recaptcha-token');

    repository = UserProfileRepositoryImpl(
      mockApiService,
      mockAuthCacheManager,
      mockLocalDataSource,
      mockRecaptchaService,
    );
  });

  group('UserProfileRepositoryImpl Performance Tests', () {
    test('getProfile (Cache Hit) performance', () async {
      // Arrange
      const token = 'token';
      const response = UserResponse(
        id: 1,
        email: 'test@test.com',
        firstname: 'Test',
        lastname: 'User',
      );

      when(
        () => mockAuthCacheManager.getToken(),
      ).thenAnswer((_) async => token);

      when(
        () => mockLocalDataSource.getUserProfileIfValid(),
      ).thenAnswer((_) async => response);

      // Act & Measure
      final result = await PerformanceMonitor.measure('getProfile (Cache)', () {
        return repository.getProfile();
      });

      // Assert
      expect(result.isRight(), true);
      verify(() => mockLocalDataSource.getUserProfileIfValid()).called(1);
      verifyNever(() => mockApiService.getUserProfile());
    });

    test('getProfile (API Hit) performance', () async {
      // Arrange
      const token = 'token';
      const response = UserResponse(
        id: 2,
        email: 'api@test.com',
        firstname: 'API',
        lastname: 'User',
      );

      when(
        () => mockAuthCacheManager.getToken(),
      ).thenAnswer((_) async => token);

      when(
        () => mockLocalDataSource.getUserProfileIfValid(),
      ).thenAnswer((_) async => null); // Cache miss

      when(() => mockApiService.getUserProfile()).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 80));
        return Right(response);
      });

      when(
        () => mockLocalDataSource.insertUserProfile(any()),
      ).thenAnswer((_) async => {});

      when(
        () => mockAuthCacheManager.setUserId(userId: any(named: 'userId')),
      ).thenAnswer((_) async => {});

      // Act & Measure
      final result = await PerformanceMonitor.measure('getProfile (API)', () {
        return repository.getProfile();
      });

      // Assert
      expect(result.isRight(), true);
      verify(() => mockApiService.getUserProfile()).called(1);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
