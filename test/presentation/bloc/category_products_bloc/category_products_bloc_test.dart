import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/core/cache/category_facet_cache.dart';
import 'package:pickaboo/core/cache/category_filter_store.dart';
import 'package:pickaboo/core/cache/category_preload_cache.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/presentation/bloc/category_products_bloc/category_products_bloc.dart';

class MockProductRepository extends Mock implements ProductRepository {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

class MockCategoryFilterStore extends Mock implements CategoryFilterStore {}

class MockCategoryFacetCache extends Mock implements CategoryFacetCache {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockProductRepository mockRepository;
  late MockAnalyticsService mockAnalytics;
  late MockCategoryFilterStore mockFilterStore;
  late MockCategoryFacetCache mockFacetCache;
  late CategoryPreloadCache preloadCache;

  const sampleProduct = ProductEntity(
    id: '1',
    expressDelivery: true,
    productName: 'Phone 1',
    sku: 'SKU1',
    slug: 'phone-1',
    typeId: 'simple',
    stockAvailable: true,
    freeDelivery: false,
    productPrice: 10000,
    productSpecialPrice: 9000,
    productDiscount: 10,
    offers: '',
    rating: 4.5,
    clubPoint: 10,
    ratingCount: 5,
    productImg: 'https://example.com/img.png',
    emiAvailable: true,
    comingSoon: false,
  );

  const sampleProduct2 = ProductEntity(
    id: '2',
    expressDelivery: true,
    productName: 'Phone 2',
    sku: 'SKU2',
    slug: 'phone-2',
    typeId: 'simple',
    stockAvailable: true,
    freeDelivery: false,
    productPrice: 12000,
    productSpecialPrice: 11000,
    productDiscount: 10,
    offers: '',
    rating: 4.0,
    clubPoint: 12,
    ratingCount: 3,
    productImg: 'https://example.com/img2.png',
    emiAvailable: true,
    comingSoon: false,
  );

  const mockCategoryData = CategoryProductsEntity(
    categoryId: 18,
    categorySlug: 'smartphones',
    categoryName: 'Smartphones',
    metaTitle: '',
    metaKeywords: '',
    metaDescription: '',
    image: '',
    mobileImage: '',
    banners: [],
    filters: [],
    featuredProductTotal: 0,
    totalCatProds: 2,
    products: [sampleProduct],
    featuredProducts: [],
    brands: [],
    sortOptions: [],
    filterableAttributes: [],
    categoryDescription: '',
  );

  setUp(() {
    mockRepository = MockProductRepository();
    mockAnalytics = MockAnalyticsService();
    mockFilterStore = MockCategoryFilterStore();
    mockFacetCache = MockCategoryFacetCache();
    preloadCache = CategoryPreloadCache();

    when(() => mockFilterStore.read(any())).thenReturn(null);
    when(() => mockFacetCache.read(any())).thenReturn(null);
    when(
      () => mockAnalytics.logViewCategory(
        categoryId: any(named: 'categoryId'),
        categoryName: any(named: 'categoryName'),
      ),
    ).thenAnswer((_) async {});
  });

  group('CategoryProductsBloc Cache Hydration', () {
    test('instantly emits Page 1 when products are cached in CategoryPreloadCache',
        () async {
      preloadCache.save(
        ['cat:18', '18', 'smartphones'],
        products: [sampleProduct],
      );

      when(
        () => mockRepository.getCategoryProducts(
          categoryKey: '18',
          currentPage: 1,
          prodLimit: any(named: 'prodLimit'),
          featProdLimit: any(named: 'featProdLimit'),
          sort: any(named: 'sort'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer((_) async => const Right(mockCategoryData));

      final bloc = CategoryProductsBloc(
        mockRepository,
        mockAnalytics,
        mockFilterStore,
        mockFacetCache,
        preloadCache,
      );

      final states = <CategoryProductsState>[];
      final sub = bloc.stream.listen(states.add);

      bloc.add(const CategoryProductsEvent.getProducts(categoryKey: '18'));

      await Future.delayed(const Duration(milliseconds: 50));

      expect(states.isNotEmpty, isTrue);
      final firstState = states.first;
      expect(firstState.pagingState.isLoading, isFalse);
      expect(firstState.pagingState.pages?.length, equals(1));
      expect(firstState.pagingState.pages?.first.first.id, equals('1'));
      expect(firstState.pagingState.keys, equals([1]));

      await sub.cancel();
      await bloc.close();
    });

    test('emits loading state when category has no cache', () async {
      when(
        () => mockRepository.getCategoryProducts(
          categoryKey: 'unknown',
          currentPage: 1,
          prodLimit: any(named: 'prodLimit'),
          featProdLimit: any(named: 'featProdLimit'),
          sort: any(named: 'sort'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer((_) async => const Right(mockCategoryData));

      final bloc = CategoryProductsBloc(
        mockRepository,
        mockAnalytics,
        mockFilterStore,
        mockFacetCache,
        preloadCache,
      );

      final states = <CategoryProductsState>[];
      final sub = bloc.stream.listen(states.add);

      bloc.add(const CategoryProductsEvent.getProducts(categoryKey: 'unknown'));

      await Future.delayed(const Duration(milliseconds: 50));

      expect(states.isNotEmpty, isTrue);
      expect(states.first.pagingState.isLoading, isTrue);

      await sub.cancel();
      await bloc.close();
    });

    test('appends Page 2 when scrolling past Page 1', () async {
      preloadCache.save(
        ['cat:18', '18'],
        products: [sampleProduct],
      );

      const page2CategoryData = CategoryProductsEntity(
        categoryId: 18,
        categorySlug: 'smartphones',
        categoryName: 'Smartphones',
        metaTitle: '',
        metaKeywords: '',
        metaDescription: '',
        image: '',
        mobileImage: '',
        banners: [],
        filters: [],
        featuredProductTotal: 0,
        totalCatProds: 2,
        products: [sampleProduct2],
        featuredProducts: [],
        brands: [],
        sortOptions: [],
        filterableAttributes: [],
        categoryDescription: '',
      );

      when(
        () => mockRepository.getCategoryProducts(
          categoryKey: '18',
          currentPage: 1,
          prodLimit: any(named: 'prodLimit'),
          featProdLimit: any(named: 'featProdLimit'),
          sort: any(named: 'sort'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer((_) async => const Right(mockCategoryData));

      when(
        () => mockRepository.getCategoryProducts(
          categoryKey: '18',
          currentPage: 2,
          prodLimit: any(named: 'prodLimit'),
          featProdLimit: any(named: 'featProdLimit'),
          sort: any(named: 'sort'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer((_) async => const Right(page2CategoryData));

      final bloc = CategoryProductsBloc(
        mockRepository,
        mockAnalytics,
        mockFilterStore,
        mockFacetCache,
        preloadCache,
      );

      bloc.add(const CategoryProductsEvent.getProducts(categoryKey: '18'));
      await Future.delayed(const Duration(milliseconds: 50));

      bloc.add(const CategoryProductsEvent.getProducts(categoryKey: '18'));
      await Future.delayed(const Duration(milliseconds: 50));

      final latestState = bloc.state;
      expect(latestState.pagingState.pages?.length, equals(2));
      expect(latestState.pagingState.pages?[0].first.id, equals('1'));
      expect(latestState.pagingState.pages?[1].first.id, equals('2'));
      expect(latestState.pagingState.keys, equals([1, 2]));

      await bloc.close();
    });
  });
}
