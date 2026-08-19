import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/i_cart_api_service.dart';
import 'package:pickaboo/data/model/cart/cart_response/cart_response.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockDio extends Mock implements Dio {}

void main() {
  late ICartApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = ICartApiService(mockDio);
  });

  group('ICartApiService Performance Tests', () {
    test('getBasicCart performance', () async {
      // Arrange
      final responseData = {"id": 1, "is_active": true, "items": []};

      when(() => mockDio.get(any())).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 70));
        return Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('API: getBasicCart', () {
        return apiService.getBasicCart();
      });

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r, isA<CartResponse>());
        expect(r.id, 1);
      });
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
