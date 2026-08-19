import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/api_service/i_product_api_service.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockDio extends Mock implements Dio {}

void main() {
  late IProductApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = IProductApiService(mockDio);
  });

  group('IProductApiService Performance Tests', () {
    test('getHomeFeedContent performance', () async {
      // Arrange
      const limit = 5;
      final responseData = {
        "home": [],
      }; // Minimal valid mock for HomeContentResponse

      when(
        () => mockDio.get(
          ApiEndpoints.homeFeedContentUrl,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 90));
        return Response(
          requestOptions: RequestOptions(path: ApiEndpoints.homeFeedContentUrl),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure(
        'API: getHomeFeedContent',
        () {
          return apiService.getHomeFeedContent(productLimit: limit);
        },
      );

      // Assert
      expect(result.isRight(), true);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
