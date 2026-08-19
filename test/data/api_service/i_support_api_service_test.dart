import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/i_support_api_service.dart';
import 'package:pickaboo/data/model/support_category_response/support_category_response.dart';
import 'package:pickaboo/data/model/support_article_response/support_article_response.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockDio extends Mock implements Dio {}

void main() {
  late ISupportApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = ISupportApiService(mockDio);
  });

  group('ISupportApiService Performance Tests', () {
    test('getAllSupportCategories performance', () async {
      // Arrange
      // API expects a list wrapped in another list
      final responseData = [
        [
          {"category_id": "1", "title": "FAQ", "identifier": "faq"},
        ],
      ];

      when(() => mockDio.get(any())).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 65));
        return Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure(
        'API: getAllSupportCategories',
        () {
          return apiService.getAllSupportCategories();
        },
      );

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r, isA<List<SupportCategoryResponse>>());
        expect(r.length, 1);
      });
    });

    test('getSupportArticle performance', () async {
      // Arrange
      final responseData = [
        {
          "article_id": "100",
          "title": "How to order?",
          "content": "Just click buy.",
        },
      ];

      when(() => mockDio.get(any())).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 55));
        return Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure(
        'API: getSupportArticle',
        () {
          return apiService.getSupportArticle(categoryId: "1");
        },
      );

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r, isA<List<SupportArticleResponse>>());
        expect(r.length, 1);
      });
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
