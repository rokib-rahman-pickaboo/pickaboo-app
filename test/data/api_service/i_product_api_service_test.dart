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

    test('getProductDetail parses string avg_value and numeric strings without throwing', () async {
      final mockData = <String, dynamic>{
        'id': '122070',
        'name': 'Haier 43 Inch HQLED 4K Google TV (43P7PRO)',
        'sku': 'H43P7PRHRB',
        'slug': 'haier-43-hqled-4k-google-tv-43p7pro',
        'regular_price': '58900',
        'spacial_price': '44990',
        'discount': '24',
        'rating_summary_value': '5.0',
        'rating_summary': '100',
        'reviews_count': '2',
        'detailed_ratings': [
          {'rating': 'Price', 'avg_value': '5.0'},
          {'rating': 'Value', 'avg_value': '4.9'},
        ],
      };

      when(
        () => mockDio.get(
          ApiEndpoints.productDetailUrl(productId: '122070'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ApiEndpoints.productDetailUrl(productId: '122070')),
        data: mockData,
        statusCode: 200,
      ));

      final result = await apiService.getProductDetail(productId: '122070');
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Should not fail: ${l.message}'),
        (r) {
          expect(r.id, 122070);
          expect(r.regularPrice, 58900);
          expect(r.spacialPrice, 44990);
          expect(r.detailedRatings?.length, 2);
          expect(r.detailedRatings?[0].avgValue, 5.0);
          expect(r.detailedRatings?[1].avgValue, 4.9);
        },
      );
    });

    test('getProductReviews parses string avg_value and string reviewer_rating without throwing', () async {
      final mockData = <String, dynamic>{
        'total_reviews': '2',
        'average_rating': '4.95',
        'detailed_ratings': [
          {'rating': 'Quality', 'avg_value': '5.0'},
        ],
        'reviews': [
          {
            'review_id': 87017,
            'reviewer_rating': '5.0',
            'reviewer_name': 'Test User',
          }
        ],
      };

      when(
        () => mockDio.get(
          ApiEndpoints.productReviewsUrl(productId: '122070'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ApiEndpoints.productReviewsUrl(productId: '122070')),
        data: mockData,
        statusCode: 200,
      ));

      final result = await apiService.getProductReviews(productId: '122070', page: 1, pageSize: 10);
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Should not fail: ${l.message}'),
        (r) {
          expect(r.averageRating, 4.95);
          expect(r.detailedRatings?[0].avgValue, 5.0);
          expect(r.reviews?[0].reviewerRating, 5.0);
        },
      );
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
