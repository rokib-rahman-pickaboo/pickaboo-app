import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/data/api_service/product_api_service.dart';
import 'package:pickaboo/data/local_data_source/category_local_data_source.dart';
import 'package:pickaboo/data/local_data_source/home_content_local_data_source.dart';
import 'package:pickaboo/data/local_data_source/product_detail_local_data_source.dart';
import 'package:pickaboo/data/model/category_response/category_response.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/product_reviews_response/product_reviews_response.dart';
import 'package:pickaboo/data/model/review_response/review_response.dart';
import 'package:pickaboo/data/repository/product_repository_impl.dart';

import '../../utils/performance_monitor.dart';


// Mocks
class MockProductApiService extends Mock implements ProductApiService {}

class MockCategoryLocalDataSource extends Mock
    implements CategoryLocalDataSource {}

class MockProductDetailLocalDataSource extends Mock
    implements ProductDetailLocalDataSource {}

class MockHomeContentLocalDataSource extends Mock
    implements HomeContentLocalDataSource {}

class MockAuthCacheManager extends Mock implements AuthCacheManager {}

void main() {
  late ProductRepositoryImpl repository;
  late MockProductApiService mockApiService;
  late MockCategoryLocalDataSource mockCategoryDataSource;
  late MockProductDetailLocalDataSource mockProductDetailLocalDataSource;
  late MockHomeContentLocalDataSource mockHomeContentLocalDataSource;

  setUp(() {
    mockApiService = MockProductApiService();
    mockCategoryDataSource = MockCategoryLocalDataSource();
    mockProductDetailLocalDataSource = MockProductDetailLocalDataSource();
    mockHomeContentLocalDataSource = MockHomeContentLocalDataSource();

    repository = ProductRepositoryImpl(
      mockApiService,
      mockCategoryDataSource,
      mockProductDetailLocalDataSource,
      mockHomeContentLocalDataSource,
    );
  });

  group('ProductRepositoryImpl Performance Tests', () {
    test('getAllCategories (Cache Hit) performance', () async {
      // Arrange
      final cachedCategories = [
        const CategoryResponse(id: '1', name: 'Cache Cat 1'),
      ];

      when(
        () => mockCategoryDataSource.getCategoriesIfValid(),
      ).thenAnswer((_) async => cachedCategories);

      // Act & Measure
      final result = await PerformanceMonitor.measure(
        'getAllCategories (Cache)',
        () {
          return repository.getAllCategories();
        },
      );

      // Assert
      expect(result.isRight(), true);
      verify(() => mockCategoryDataSource.getCategoriesIfValid()).called(1);
      verifyNever(() => mockApiService.getAllCategories());
    });

    test('getAllCategories (API Hit) performance', () async {
      // Arrange
      final apiCategories = [
        const CategoryResponse(id: '2', name: 'API Cat 1'),
      ];

      when(
        () => mockCategoryDataSource.getCategoriesIfValid(),
      ).thenAnswer((_) async => null); // Cache miss

      when(() => mockApiService.getAllCategories()).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 50));
        return Right(apiCategories);
      });

      when(
        () => mockCategoryDataSource.insertCategories(any()),
      ).thenAnswer((_) async => {});

      // Act & Measure
      final result = await PerformanceMonitor.measure(
        'getAllCategories (API)',
        () {
          return repository.getAllCategories();
        },
      );

      // Assert
      expect(result.isRight(), true);
      verify(() => mockApiService.getAllCategories()).called(1);
    });
  });

  group('getProductReviews vote merge', () {
    const tReviewsResponse = ProductReviewsResponse(
      totalReviews: 1,
      averageRating: 4.7,
      currentPage: 1,
      pageSize: 10,
      totalPages: 1,
      reviews: [
        ProductReviewItemResponse(
          reviewId: 57,
          reviewerName: 'Niaj',
          reviewerRating: 4.7,
          title: 'Great',
          detail: 'Good headphones',
        ),
      ],
    );

    void stubReviews() {
      when(
        () => mockApiService.getProductReviews(
          productId: any(named: 'productId'),
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
        ),
      ).thenAnswer((_) async => const Right(tReviewsResponse));
    }

    test('merges vote counts into the reviews page', () async {
      stubReviews();
      when(
        () => mockApiService.getProductReviewVotes(
          productId: any(named: 'productId'),
          customerId: any(named: 'customerId'),
        ),
      ).thenAnswer(
        (_) async => const Right([
          ReviewResponse(
            reviewId: '57',
            likeCount: 9,
            dislikesCount: 2,
            doLike: true,
          ),
        ]),
      );

      final result = await repository.getProductReviews(
        productId: '79013',
        page: 1,
        pageSize: 10,
        customerId: 42,
      );

      final reviews = result.getOrElse(() => throw StateError('expected Right'));
      expect(reviews.reviews.single.likeCount, 9);
      expect(reviews.reviews.single.dislikesCount, 2);
      expect(reviews.reviews.single.doLike, isTrue);

      // customerId must reach the votes call — it is what resolves do_like.
      verify(
        () => mockApiService.getProductReviewVotes(
          productId: '79013',
          customerId: 42,
        ),
      ).called(1);
    });

    test('still returns reviews when the votes call fails', () async {
      stubReviews();
      when(
        () => mockApiService.getProductReviewVotes(
          productId: any(named: 'productId'),
          customerId: any(named: 'customerId'),
        ),
      ).thenAnswer(
        (_) async => const Left(ErrorResponse(message: 'votes unavailable')),
      );

      final result = await repository.getProductReviews(
        productId: '79013',
        page: 1,
        pageSize: 10,
      );

      expect(result.isRight(), isTrue);
      final reviews = result.getOrElse(() => throw StateError('expected Right'));
      expect(reviews.reviews.single.likeCount, 0);
      expect(reviews.reviews.single.doLike, isFalse);
    });

    test('propagates a failure of the reviews call itself', () async {
      when(
        () => mockApiService.getProductReviews(
          productId: any(named: 'productId'),
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
        ),
      ).thenAnswer(
        (_) async => const Left(ErrorResponse(message: 'reviews down')),
      );
      when(
        () => mockApiService.getProductReviewVotes(
          productId: any(named: 'productId'),
          customerId: any(named: 'customerId'),
        ),
      ).thenAnswer((_) async => const Right([]));

      final result = await repository.getProductReviews(
        productId: '79013',
        page: 1,
        pageSize: 10,
      );

      expect(result.isLeft(), isTrue);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
