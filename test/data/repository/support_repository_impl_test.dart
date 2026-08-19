import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/support_api_service.dart';
import 'package:pickaboo/data/repository/support_repository_impl.dart';
import 'package:pickaboo/data/model/support_category_response/support_category_response.dart';
import 'package:pickaboo/data/model/support_article_response/support_article_response.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockSupportApiService extends Mock implements SupportApiService {}

void main() {
  late SupportRepositoryImpl repository;
  late MockSupportApiService mockApiService;

  setUp(() {
    mockApiService = MockSupportApiService();
    repository = SupportRepositoryImpl(mockApiService);
  });

  group('SupportRepositoryImpl Performance Tests', () {
    test('getAllSupportCategories performance', () async {
      // Arrange
      final response = [
        const SupportCategoryResponse(categoryId: '1', name: 'FAQ'),
      ];

      when(() => mockApiService.getAllSupportCategories()).thenAnswer((
        _,
      ) async {
        await Future.delayed(const Duration(milliseconds: 40));
        return Right(response);
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure(
        'getAllSupportCategories',
        () {
          return repository.getAllSupportCategories();
        },
      );

      // Assert
      expect(result.isRight(), true);
      verify(() => mockApiService.getAllSupportCategories()).called(1);
    });

    test('getSupportArticle performance', () async {
      // Arrange
      const categoryId = '1';
      final response = [
        const SupportArticleResponse(
          articleId: '101',
          name: 'How to return?',
          text: '...',
        ),
      ];

      when(
        () => mockApiService.getSupportArticle(categoryId: categoryId),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 60));
        return Right(response);
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('getSupportArticle', () {
        return repository.getSupportArticle(categoryId: categoryId);
      });

      // Assert
      expect(result.isRight(), true);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
