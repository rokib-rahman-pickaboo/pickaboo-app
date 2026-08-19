import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/i_checkout_api_service.dart';
import 'package:pickaboo/data/model/checkout/shipping_method_model.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockDio extends Mock implements Dio {}

void main() {
  late ICheckoutApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    // ICheckoutApiService's constructor logs `_client.options.baseUrl` in debug
    // mode, so `options` must be stubbed before the service is built.
    when(() => mockDio.options).thenReturn(BaseOptions());
    apiService = ICheckoutApiService(mockDio);
  });

  group('ICheckoutApiService Performance Tests', () {
    test('estimateShippingMethods performance', () async {
      // Arrange
      final address = AddressEntity(
        id: 1,
        firstname: 'Test',
        lastname: 'User',
        email: 'test@example.com',
        telephone: '1234567890',
        customerId: 101,
        street: ['123 Test St'], // Added street which is required
      );

      final responseData = [
        {
          "carrier_code": "flatrate",
          "method_code": "flatrate",
          "carrier_title": "Flat Rate",
          "method_title": "Fixed",
          "amount": 50,
          "base_amount": 50,
          "available": true,
          "error_message": "",
          "price_excl_tax": 50,
          "price_incl_tax": 50,
        },
      ];

      when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer((
        _,
      ) async {
        await Future.delayed(const Duration(milliseconds: 60));
        return Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure(
        'API: estimateShippingMethods',
        () {
          return apiService.estimateShippingMethods(address: address);
        },
      );

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r, isA<List<ShippingMethodModel>>());
        expect(r.length, 1);
        expect(r.first.carrierCode, 'flatrate');
      });
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
