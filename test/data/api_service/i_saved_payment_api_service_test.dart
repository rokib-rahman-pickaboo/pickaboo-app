import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/i_saved_payment_api_service.dart';
import 'package:pickaboo/data/model/payment/saved_payment_model.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockDio extends Mock implements Dio {}

void main() {
  late ISavedPaymentApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = ISavedPaymentApiService(mockDio);
  });

  group('ISavedPaymentApiService Performance Tests', () {
    test('getSavedPayments performance', () async {
      // Arrange
      const customerId = '123';
      final responseData = [
        {
          "agreement_id": "1",
          "customer_id": "123",
          "method_code": "bkash",
          "status": "active",
        },
      ];

      when(
        () =>
            mockDio.get(any(), queryParameters: any(named: 'queryParameters')),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 40));
        return Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure(
        'API: getSavedPayments',
        () {
          return apiService.getSavedPayments(customerId);
        },
      );

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r, isA<List<SavedPaymentModel>>());
        expect(r.length, 1);
      });
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
