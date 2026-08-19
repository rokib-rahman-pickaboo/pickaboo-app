import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/i_wishlist_api_service.dart';
import 'package:pickaboo/data/model/wishlist_response/wishlist_response.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockDio extends Mock implements Dio {}

void main() {
  late IWishlistApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = IWishlistApiService(mockDio);
  });

  group('IWishlistApiService Performance Tests', () {
    test('getWishlist performance', () async {
      // Arrange
      final responseData = [
        {
          "wishlist_item_id": "1",
          "wishlist_id": "10",
          "product_id": "100",
          "product_url_key": "test-product",
          "product_name": "Test Product",
          "product_type": "simple",
          "sku": "TEST-SKU",
          "store_id": "1",
          "added_at": "2023-01-01",
          "image": "image.jpg",
          "description": "Test Product",
          "varient": [],
          "sold_by": "Test Store",
          "regular_price": 1000,
          "special_price": 800,
          "discount": 20,
          "is_available": true,
          "share_url": "http://example.com/share",
        },
      ];

      when(() => mockDio.get(any())).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 60));
        return Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('API: getWishlist', () {
        return apiService.getWishlist();
      });

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r, isA<List<WishlistResponse>>());
        expect(r.length, 1);
        expect(r.first.productId, "100");
      });
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
