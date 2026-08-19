import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/search_api_service.dart';
import 'package:pickaboo/data/repository/search_repository_impl.dart';
import 'package:pickaboo/data/model/search_response/search_response.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockSearchApiService extends Mock implements SearchApiService {}

void main() {
  late SearchRepositoryImpl repository;
  late MockSearchApiService mockApiService;

  setUp(() {
    mockApiService = MockSearchApiService();
    repository = SearchRepositoryImpl(mockApiService);
  });

  group('SearchRepositoryImpl Performance Tests', () {
    test('search performance', () async {
      // Arrange
      const query = "phone";
      final response = const SearchResponse(items: [], totalItems: 0);

      when(
        () => mockApiService.search(
          query: any(named: 'query'),
          startIndex: any(named: 'startIndex'),
          maxResults: any(named: 'maxResults'),
          categoryId: any(named: 'categoryId'),
          filters: any(named: 'filters'),
          sortBy: any(named: 'sortBy'),
          sortOrder: any(named: 'sortOrder'),
        ),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 65));
        return Right(
          response,
        ); // Assuming response maps to entity without error
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('search', () {
        return repository.search(query: query);
      });

      // Assert
      expect(result.isRight(), true);
      verify(
        () =>
            mockApiService.search(query: query, startIndex: 0, maxResults: 10),
      ).called(1);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
