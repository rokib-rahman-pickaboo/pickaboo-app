import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/saved_payment_api_service.dart';
import 'package:pickaboo/data/repository/saved_payment_repository_impl.dart';
import 'package:pickaboo/data/mapper/saved_payment_mapper.dart';
import 'package:pickaboo/domain/entity/payment/saved_payment_entity.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockSavedPaymentApiService extends Mock
    implements SavedPaymentApiService {}

class MockSavedPaymentMapper extends Mock implements SavedPaymentMapper {}

void main() {
  late SavedPaymentRepositoryImpl repository;
  late MockSavedPaymentApiService mockApiService;
  late MockSavedPaymentMapper mockMapper;

  setUp(() {
    mockApiService = MockSavedPaymentApiService();
    mockMapper = MockSavedPaymentMapper();
    repository = SavedPaymentRepositoryImpl(mockApiService, mockMapper);
  });

  group('SavedPaymentRepositoryImpl Performance Tests', () {
    test('getSavedPayments performance', () async {
      // Arrange
      const customerId = "101";
      final entityList = <SavedPaymentEntity>[];

      when(() => mockApiService.getSavedPayments(customerId)).thenAnswer((
        _,
      ) async {
        await Future.delayed(const Duration(milliseconds: 30));
        return Right([]);
      });

      when(() => mockMapper.toEntityList(any())).thenReturn(entityList);

      // Act & Measure
      final result = await PerformanceMonitor.measure('getSavedPayments', () {
        return repository.getSavedPayments(customerId);
      });

      // Assert
      expect(result.isRight(), true);
      verify(() => mockApiService.getSavedPayments(customerId)).called(1);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
