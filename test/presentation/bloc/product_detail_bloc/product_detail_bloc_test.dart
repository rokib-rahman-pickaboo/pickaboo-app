import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/slug_resolution/slug_resolution_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/presentation/bloc/product_detail_bloc/product_detail_bloc.dart';

// ── Mocks ─────────────────────────────────────────────────────────────────────

class MockProductRepository extends Mock implements ProductRepository {}

class MockAuthCacheManager extends Mock implements AuthCacheManager {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

// ── Helpers ───────────────────────────────────────────────────────────────────

/// Matcher: a ProductDetailState.error whose message equals [message].
/// Uses maybeWhen because ProductDetailState is a freezed sealed union —
/// there is no direct `.error` property on the base type.
Matcher isErrorState(String message) => predicate<ProductDetailState>(
  (s) => s.maybeWhen(
    error: (e) => e.message == message,
    orElse: () => false,
  ),
  'ProductDetailState.error(message: "$message")',
);

// ── Fake product ──────────────────────────────────────────────────────────────

ProductDetailEntity _makeProduct({int id = 42, String name = 'Test Product'}) =>
    ProductDetailEntity(
      id: id,
      sku: 'SKU-$id',
      slug: 'test-product',
      typeId: 'simple',
      name: name,
      prodOfferPrice: 0,
      bestPrice: 0,
      freeDelivery: 0,
      categoryIds: const [],
      metaTitle: '',
      metaKeywords: '',
      metaDescription: '',
      images: const [],
      isWishlisted: false,
      isEligibleForReview: true,
      shareUrl: '',
      regularPrice: 1000,
      spacialPrice: 900,
      discount: 10,
      stockAvailable: true,
      expressDelivery: 0,
      comingSoon: false,
      clubPoints: 0,
      brandId: '',
      brand: '',
      soldByVendorUrlKey: '',
      soldBy: '',
      offers: '',
      warranty: '',
      emi: 0,
      varient: const [],
      extraOptions: const [],
      buysTogather: const [],
      productDetails: '',
      moreInformation: const [],
      ratingSummaryValue: 0,
      ratingSummary: 0,
      reviewsCount: 0,
      detailedRatings: const [],
      detailedSummary: const [],
      allReviewImages: const [],
      reviewsCollection: const [],
      similarProducts: const [],
      youMayAlsoLike: const [],
      otherBrands: const [],
      recentlyViewedProducts: const [],
      cacheTime: DateTime(2024),
    );

// ── Constants ─────────────────────────────────────────────────────────────────

const _tNumericId = '1234';
const _tSlug = 'some-product-slug';
const _tCustomerId = 99;

/// Const so that identity-based equality works when the mock returns it
/// and the bloc re-emits it inside ProductDetailState.error.
const _tApiError = AppErrorEntity(message: 'Something went wrong');

// ── Tests ─────────────────────────────────────────────────────────────────────

void main() {
  late ProductDetailBloc bloc;
  late MockProductRepository mockRepository;
  late MockAuthCacheManager mockCache;
  late MockAnalyticsService mockAnalytics;

  setUp(() {
    mockRepository = MockProductRepository();
    mockCache = MockAuthCacheManager();
    mockAnalytics = MockAnalyticsService();

    when(
      () => mockRepository.getSavedProductDetail(
        productId: any(named: 'productId'),
      ),
    ).thenAnswer((_) async => const Right(null));

    when(
      () => mockAnalytics.logViewItem(
        id: any(named: 'id'),
        name: any(named: 'name'),
        price: any(named: 'price'),
      ),
    ).thenAnswer((_) async {});

    bloc = ProductDetailBloc(mockRepository, mockAnalytics, mockCache);
  });

  tearDown(() => bloc.close());

  // ── Stub helpers ───────────────────────────────────────────────────────────

  void stubUserId(String? raw) =>
      when(() => mockCache.getUserId()).thenAnswer((_) async => raw);

  void stubProductDetail({
    required String productId,
    required int? customerId,
    required Either<AppErrorEntity, ProductDetailEntity> result,
  }) {
    when(
      () => mockRepository.getProductDetail(
        productId: productId,
        customerId: customerId,
      ),
    ).thenAnswer((_) async => result);
  }

  void stubSlugResolution({
    required String slug,
    required Either<AppErrorEntity, SlugResolutionEntity> result,
  }) {
    when(
      () => mockRepository.resolveSlug(slug: slug, type: 'product'),
    ).thenAnswer((_) async => result);
  }

  // ── Initial state ──────────────────────────────────────────────────────────

  group('initial state', () {
    test('is ProductDetailState.initial()', () {
      expect(bloc.state, const ProductDetailState.initial());
    });
  });

  // ── ProductDetailEvent.load ────────────────────────────────────────────────

  group('ProductDetailEvent.load', () {
    late ProductDetailEntity tProduct;

    setUp(() => tProduct = _makeProduct());

    blocTest<ProductDetailBloc, ProductDetailState>(
      'emits [loading, loaded] — numeric ID, logged-in user, fires analytics',
      build: () {
        stubUserId(_tCustomerId.toString());
        stubProductDetail(
          productId: _tNumericId,
          customerId: _tCustomerId,
          result: right(tProduct),
        );
        return bloc;
      },
      act: (b) => b.add(const ProductDetailEvent.load(productId: _tNumericId)),
      expect: () => [
        const ProductDetailState.loading(),
        ProductDetailState.loaded(tProduct),
      ],
      verify: (_) {
        verify(
          () => mockRepository.getProductDetail(
            productId: _tNumericId,
            customerId: _tCustomerId,
          ),
        ).called(1);
        verify(
          () => mockAnalytics.logViewItem(
            id: tProduct.id.toString(),
            name: tProduct.name,
            price: tProduct.spacialPrice.toDouble(),
          ),
        ).called(1);
      },
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'emits [loading, loaded] — numeric ID, guest user (customerId=null)',
      build: () {
        stubUserId(null);
        stubProductDetail(
          productId: _tNumericId,
          customerId: null,
          result: right(tProduct),
        );
        return bloc;
      },
      act: (b) => b.add(const ProductDetailEvent.load(productId: _tNumericId)),
      expect: () => [
        const ProductDetailState.loading(),
        ProductDetailState.loaded(tProduct),
      ],
      verify: (_) {
        verify(
          () => mockRepository.getProductDetail(
            productId: _tNumericId,
            customerId: null,
          ),
        ).called(1);
      },
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'emits [loading, error] — repository returns error',
      build: () {
        stubUserId(null);
        stubProductDetail(
          productId: _tNumericId,
          customerId: null,
          result: left(_tApiError),
        );
        return bloc;
      },
      act: (b) => b.add(const ProductDetailEvent.load(productId: _tNumericId)),
      expect: () => [
        const ProductDetailState.loading(),
        const ProductDetailState.error(_tApiError),
      ],
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'emits [loading, error("Invalid product ID")] — empty productId, skips network',
      build: () => bloc,
      act: (b) => b.add(const ProductDetailEvent.load(productId: '')),
      expect: () => [
        const ProductDetailState.loading(),
        isErrorState('Invalid product ID'),
      ],
      verify: (_) {
        verifyNever(
          () => mockRepository.getProductDetail(
            productId: any(named: 'productId'),
            customerId: any(named: 'customerId'),
          ),
        );
        verifyNever(
          () => mockRepository.resolveSlug(
            slug: any(named: 'slug'),
            type: any(named: 'type'),
          ),
        );
      },
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'emits [loading, loaded] — slug resolves to numeric ID then fetches product',
      build: () {
        stubUserId(_tCustomerId.toString());
        stubSlugResolution(
          slug: _tSlug,
          result: right(
            const SlugResolutionEntity(id: _tNumericId, type: 'product'),
          ),
        );
        stubProductDetail(
          productId: _tNumericId,
          customerId: _tCustomerId,
          result: right(tProduct),
        );
        return bloc;
      },
      act: (b) => b.add(const ProductDetailEvent.load(productId: _tSlug)),
      expect: () => [
        const ProductDetailState.loading(),
        ProductDetailState.loaded(tProduct),
      ],
      verify: (_) {
        verify(
          () => mockRepository.resolveSlug(slug: _tSlug, type: 'product'),
        ).called(1);
        verify(
          () => mockRepository.getProductDetail(
            productId: _tNumericId,
            customerId: _tCustomerId,
          ),
        ).called(1);
      },
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'emits [loading, error("Could not resolve product link")] — slug fails, skips product fetch',
      build: () {
        stubUserId(null);
        stubSlugResolution(
          slug: _tSlug,
          result: left(const AppErrorEntity(message: 'Slug not found')),
        );
        return bloc;
      },
      act: (b) => b.add(const ProductDetailEvent.load(productId: _tSlug)),
      expect: () => [
        const ProductDetailState.loading(),
        isErrorState('Could not resolve product link'),
      ],
      verify: (_) {
        verifyNever(
          () => mockRepository.getProductDetail(
            productId: any(named: 'productId'),
            customerId: any(named: 'customerId'),
          ),
        );
      },
    );
  });

  // ── ProductDetailEvent.refresh ─────────────────────────────────────────────

  group('ProductDetailEvent.refresh', () {
    late ProductDetailEntity tProduct;
    late ProductDetailEntity tUpdatedProduct;

    setUp(() {
      tProduct = _makeProduct();
      tUpdatedProduct = _makeProduct(name: 'Updated Product');
    });

    blocTest<ProductDetailBloc, ProductDetailState>(
      'does NOT emit loading state — keeps existing UI visible',
      build: () {
        stubUserId(null);
        stubProductDetail(
          productId: _tNumericId,
          customerId: null,
          result: right(tProduct),
        );
        return bloc;
      },
      act: (b) =>
          b.add(const ProductDetailEvent.refresh(productId: _tNumericId)),
      expect: () => [
        // ProductDetailState.loading() intentionally absent
        ProductDetailState.loaded(tProduct),
      ],
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'emits [loaded(updated)] on successful refresh',
      build: () {
        stubUserId(_tCustomerId.toString());
        stubProductDetail(
          productId: _tNumericId,
          customerId: _tCustomerId,
          result: right(tUpdatedProduct),
        );
        return bloc;
      },
      act: (b) =>
          b.add(const ProductDetailEvent.refresh(productId: _tNumericId)),
      expect: () => [ProductDetailState.loaded(tUpdatedProduct)],
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'does NOT fire analytics on refresh',
      build: () {
        stubUserId(null);
        stubProductDetail(
          productId: _tNumericId,
          customerId: null,
          result: right(tProduct),
        );
        return bloc;
      },
      act: (b) =>
          b.add(const ProductDetailEvent.refresh(productId: _tNumericId)),
      verify: (_) {
        verifyNever(
          () => mockAnalytics.logViewItem(
            id: any(named: 'id'),
            name: any(named: 'name'),
            price: any(named: 'price'),
          ),
        );
      },
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'emits [error] when refresh API call fails',
      build: () {
        stubUserId(null);
        stubProductDetail(
          productId: _tNumericId,
          customerId: null,
          result: left(_tApiError),
        );
        return bloc;
      },
      act: (b) =>
          b.add(const ProductDetailEvent.refresh(productId: _tNumericId)),
      expect: () => [const ProductDetailState.error(_tApiError)],
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'resolves slug before fetching product on refresh',
      build: () {
        stubUserId(null);
        stubSlugResolution(
          slug: _tSlug,
          result: right(
            const SlugResolutionEntity(id: _tNumericId, type: 'product'),
          ),
        );
        stubProductDetail(
          productId: _tNumericId,
          customerId: null,
          result: right(tProduct),
        );
        return bloc;
      },
      act: (b) => b.add(const ProductDetailEvent.refresh(productId: _tSlug)),
      expect: () => [ProductDetailState.loaded(tProduct)],
      verify: (_) {
        verify(
          () => mockRepository.resolveSlug(slug: _tSlug, type: 'product'),
        ).called(1);
      },
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'emits [error("Could not resolve product link")] when slug fails on refresh',
      build: () {
        stubUserId(null);
        stubSlugResolution(
          slug: _tSlug,
          result: left(const AppErrorEntity(message: 'Slug not found')),
        );
        return bloc;
      },
      act: (b) => b.add(const ProductDetailEvent.refresh(productId: _tSlug)),
      expect: () => [isErrorState('Could not resolve product link')],
    );
  });

  // ── customerId cache parsing ───────────────────────────────────────────────

  group('customerId cache parsing (_getCustomerId)', () {
    late ProductDetailEntity tProduct;

    setUp(() => tProduct = _makeProduct());

    blocTest<ProductDetailBloc, ProductDetailState>(
      'passes parsed int when cache holds a valid numeric string "500"',
      build: () {
        stubUserId('500');
        stubProductDetail(
          productId: _tNumericId,
          customerId: 500,
          result: right(tProduct),
        );
        return bloc;
      },
      act: (b) => b.add(const ProductDetailEvent.load(productId: _tNumericId)),
      verify: (_) {
        verify(
          () => mockRepository.getProductDetail(
            productId: _tNumericId,
            customerId: 500,
          ),
        ).called(1);
      },
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'passes null when cache holds an empty string',
      build: () {
        stubUserId('');
        stubProductDetail(
          productId: _tNumericId,
          customerId: null,
          result: right(tProduct),
        );
        return bloc;
      },
      act: (b) => b.add(const ProductDetailEvent.load(productId: _tNumericId)),
      verify: (_) {
        verify(
          () => mockRepository.getProductDetail(
            productId: _tNumericId,
            customerId: null,
          ),
        ).called(1);
      },
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'passes null when cache holds a non-numeric string',
      build: () {
        stubUserId('not-a-number');
        stubProductDetail(
          productId: _tNumericId,
          customerId: null,
          result: right(tProduct),
        );
        return bloc;
      },
      act: (b) => b.add(const ProductDetailEvent.load(productId: _tNumericId)),
      verify: (_) {
        verify(
          () => mockRepository.getProductDetail(
            productId: _tNumericId,
            customerId: null,
          ),
        ).called(1);
      },
    );

    blocTest<ProductDetailBloc, ProductDetailState>(
      'emits [loaded(initialProduct), loaded(fullProduct)] when initialProduct is provided',
      build: () {
        stubUserId(null);
        stubProductDetail(
          productId: _tNumericId,
          customerId: null,
          result: right(tProduct),
        );
        return bloc;
      },
      act: (b) => b.add(ProductDetailEvent.load(
        productId: _tNumericId,
        initialProduct: const ProductEntity(
          id: _tNumericId,
          expressDelivery: false,
          productName: 'Preview Product',
          sku: 'SKU123',
          slug: 'preview-slug',
          typeId: 'simple',
          stockAvailable: true,
          freeDelivery: false,
          productPrice: 100,
          productSpecialPrice: 90,
          productDiscount: 10,
          offers: '',
          rating: 4.5,
          clubPoint: 10,
          ratingCount: 5,
          productImg: 'https://example.com/preview.jpg',
          emiAvailable: false,
          comingSoon: false,
        ),
      )),
      expect: () => [
        predicate<ProductDetailState>((state) {
          return state.maybeWhen(
            loaded: (p) => p.isPartial && p.name == 'Preview Product' && p.id == 1234,
            orElse: () => false,
          );
        }),
        ProductDetailState.loaded(tProduct),
      ],
    );
  });
}
