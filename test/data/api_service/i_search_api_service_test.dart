import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/i_search_api_service.dart';
import 'package:pickaboo/data/model/search_response/search_response.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockDio extends Mock implements Dio {}

// Fakes
class FakeUri extends Fake implements Uri {}

void main() {
  late ISearchApiService apiService;
  late MockDio mockDio;

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  setUp(() {
    mockDio = MockDio();
    apiService = ISearchApiService(mockDio);
  });

  group('ISearchApiService Performance Tests', () {
    test('search performance', () async {
      // Arrange
      const query = 'phone';
      final responseData = {"items": [], "totalItems": 0};

      when(
        () => mockDio.getUri(any(), options: any(named: 'options')),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 90));
        return Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('API: search', () {
        return apiService.search(query: query);
      });

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r, isA<SearchResponse>());
      });
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
