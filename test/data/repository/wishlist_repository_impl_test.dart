import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/wishlist_api_service.dart';
import 'package:pickaboo/data/repository/wishlist_repository_impl.dart';
import 'package:pickaboo/data/model/wishlist_response/wishlist_response.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockWishlistApiService extends Mock implements WishlistApiService {}

void main() {
  late WishlistRepositoryImpl repository;
  late MockWishlistApiService mockApiService;

  setUp(() {
    mockApiService = MockWishlistApiService();
    repository = WishlistRepositoryImpl(mockApiService);
  });

  group('WishlistRepositoryImpl Performance Tests', () {
    test('getWishlist performance', () async {
      // Arrange
      final response = [
        WishlistResponse(wishlistItemId: '1', productName: 'Phone'),
      ];

      when(() => mockApiService.getWishlist()).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 40));
        return Right(response);
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('getWishlist', () {
        return repository.getWishlist();
      });

      // Assert
      expect(result.isRight(), true);
      verify(() => mockApiService.getWishlist()).called(1);
    });

    test('addToWishlist performance', () async {
      // Arrange
      const productId = "123";

      when(() => mockApiService.addToWishlist(productId)).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 30));
        return const Right(true);
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('addToWishlist', () {
        return repository.addToWishlist(productId);
      });

      // Assert
      expect(result.isRight(), true);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
