import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/data/api_service/auth_api_service.dart';
import 'package:pickaboo/data/model/auth/login_request/login_request.dart';
import 'package:pickaboo/data/model/customer_status_response/customer_status_response.dart';
import 'package:pickaboo/data/repository/auth_repository_impl.dart';
import 'package:pickaboo/data/services/recaptcha_service.dart';
import 'package:pickaboo/domain/entity/customer_status/customer_status_entity.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockAuthApiService extends Mock implements AuthApiService {}

class MockAuthCacheManager extends Mock implements AuthCacheManager {}

class MockRecaptchaService extends Mock implements RecaptchaService {}

// Fakes
class FakeLoginRequest extends Fake implements LoginRequest {}

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthApiService mockApiService;
  late MockAuthCacheManager mockCacheManager;
  late MockRecaptchaService mockRecaptchaService;

  setUpAll(() {
    registerFallbackValue(FakeLoginRequest());
  });

  setUp(() {
    mockApiService = MockAuthApiService();
    mockCacheManager = MockAuthCacheManager();
    mockRecaptchaService = MockRecaptchaService();
    when(() => mockRecaptchaService.executeAction(any()))
        .thenAnswer((_) async => 'test-recaptcha-token');
    repository = AuthRepositoryImpl(
      mockApiService,
      mockCacheManager,
      mockRecaptchaService,
    );
  });

  group('AuthRepositoryImpl Performance Tests', () {
    test('checkCustomer performance', () async {
      // Arrange
      const phone = '01700000000';
      const response = CustomerStatusResponse(
        status: 'success',
        message: 'User exists',
        httpCode: 200,
      );

      when(() => mockApiService.checkCustomer(phone: phone)).thenAnswer((
        _,
      ) async {
        // Simulate network delay
        await Future.delayed(const Duration(milliseconds: 50));
        return const Right(response);
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('checkCustomer', () {
        return repository.checkCustomer(phone: phone);
      });

      // Assert
      expect(result.isRight(), true);
      verify(() => mockApiService.checkCustomer(phone: phone)).called(1);
    });

    test('login performance', () async {
      // Arrange
      const mobile = '01700000000';
      const password = 'password123';
      const token = 'fake_jwt_token';

      when(() => mockApiService.login(any())).thenAnswer((_) async {
        // Simulate network delay
        await Future.delayed(const Duration(milliseconds: 100));
        return const Right(token);
      });

      when(
        () => mockCacheManager.setToken(token: token),
      ).thenAnswer((_) async => {});

      // Act & Measure
      final result = await PerformanceMonitor.measure('login', () {
        return repository.login(mobile: mobile, password: password);
      });

      // Assert
      expect(result.isRight(), true);
      verify(() => mockCacheManager.setToken(token: token)).called(1);
    });
  });

  group('AuthRepositoryImpl Functional Tests', () {
    test(
      'should return CustomerStatusEntity when checkCustomer is successful',
      () async {
        // Arrange
        const phone = '01700000000';
        const response = CustomerStatusResponse(
          status: 'success',
          message: 'Found',
          httpCode: 200,
        );

        when(
          () => mockApiService.checkCustomer(phone: phone),
        ).thenAnswer((_) async => const Right(response));

        // Act
        final result = await repository.checkCustomer(phone: phone);

        // Assert
        expect(result.isRight(), true);
        result.fold((l) => fail('Should not return left'), (r) {
          expect(r, isA<CustomerStatusEntity>());
          expect(r.exists, true);
          expect(r.message, 'Found');
        });
      },
    );

    test('should save token when login is successful', () async {
      // Arrange
      const mobile = '01700000000';
      const password = 'pass';
      const token = 'new_token';

      when(
        () => mockApiService.login(any()),
      ).thenAnswer((_) async => const Right(token));

      when(
        () => mockCacheManager.setToken(token: token),
      ).thenAnswer((_) async => {});

      // Act
      final result = await repository.login(mobile: mobile, password: password);

      // Assert
      expect(result.isRight(), true);
      verify(() => mockCacheManager.setToken(token: token)).called(1);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
