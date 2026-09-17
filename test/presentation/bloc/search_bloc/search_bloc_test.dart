import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/search/search_result_entity.dart';
import 'package:pickaboo/domain/repository/search_repository.dart';
import 'package:pickaboo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  late SearchBloc searchBloc;
  late MockSearchRepository mockSearchRepository;
  late MockAnalyticsService mockAnalytics;

  setUp(() {
    mockSearchRepository = MockSearchRepository();
    mockAnalytics = MockAnalyticsService();

    // Default mock behavior
    when(
      () => mockAnalytics.logEvent(
        name: any(named: 'name'),
        parameters: any(named: 'parameters'),
      ),
    ).thenAnswer((_) async {});

    searchBloc = SearchBloc(mockSearchRepository, mockAnalytics);
  });

  tearDown(() {
    searchBloc.close();
  });

  group('SearchBloc', () {
    const tQuery = 'iphone';
    final tProducts = [
      const ProductEntity(
        id: '1',
        productName: 'iPhone 13',
        sku: 'iphone-13',
        productPrice: 1000,
        slug: 'iphone-13',
        typeId: 'simple',
        expressDelivery: true,
        stockAvailable: true,
        freeDelivery: false,
        productSpecialPrice: 0,
        productDiscount: 0,
        offers: '',
        rating: 4.5,
        clubPoint: 10,
        ratingCount: 100,
        productImg: 'url',
        comingSoon: false, emiAvailable: false,
      ),
    ];
    final tSearchResult = SearchResultEntity(
      products: tProducts,
      suggestions: ['iPhone 13', 'iPhone 14'],
      correctedQuery: 'iphone',
      facets: [],
      totalItems: 1, // Corrected from totalCount
      categories: [], // Helper required field
    );

    test('initial state has empty PagingState', () {
      expect(searchBloc.state.pagingState.pages, isNull);
      expect(searchBloc.state.pagingState.error, isNull);
    });

    blocTest<SearchBloc, SearchState>(
      'emits [loading, loaded] when SearchQueryChanged is added and search succeeds',
      build: () {
        when(
          () => mockSearchRepository.search(
            query: tQuery,
            startIndex: 0,
            maxResults: 10,
          ),
        ).thenAnswer((_) async => Right(tSearchResult));
        return SearchBloc(mockSearchRepository, mockAnalytics);
      },
      act: (bloc) =>
          bloc.add(const SearchEvent.searchQueryChanged(query: tQuery)),
      verify: (_) {
        verify(
          () => mockSearchRepository.search(
            query: tQuery,
            startIndex: 0,
            maxResults: 10,
          ),
        ).called(1);
      },
      expect: () => [
        // Loading state
        isA<SearchState>().having(
          (s) => s.pagingState.isLoading,
          'isLoading',
          true,
        ),
        // Loaded state
        isA<SearchState>()
            .having((s) => s.pagingState.isLoading, 'isLoading', false)
            .having(
              (s) => s.suggestions,
              'suggestions',
              tSearchResult.suggestions,
            )
            .having((s) => s.pagingState.pages, 'pages', [tProducts]),
      ],
    );

    blocTest<SearchBloc, SearchState>(
      'emits [loading, error] when SearchQueryChanged is added and search fails',
      build: () {
        when(
          () => mockSearchRepository.search(
            query: tQuery,
            startIndex: 0,
            maxResults: 10,
          ),
        ).thenAnswer(
          (_) async => const Left(AppErrorEntity(message: 'Network Error')),
        );
        return SearchBloc(mockSearchRepository, mockAnalytics);
      },
      act: (bloc) =>
          bloc.add(const SearchEvent.searchQueryChanged(query: tQuery)),
      expect: () => [
        // Loading state
        isA<SearchState>().having(
          (s) => s.pagingState.isLoading,
          'isLoading',
          true,
        ),
        // Error state
        isA<SearchState>()
            .having((s) => s.pagingState.isLoading, 'isLoading', false)
            .having((s) => s.pagingState.error, 'error', isA<AppErrorEntity>()),
      ],
    );

    blocTest<SearchBloc, SearchState>(
      'clears results when query is short (<= 2 chars)',
      build: () {
        // The bloc registers its handler with a debounce transformer, so the
        // repository can still be reached during setup. Without a stub the
        // mock returns null where a Future is expected and the test throws
        // before the short-query branch is asserted.
        when(
          () => mockSearchRepository.search(
            query: any(named: 'query'),
            startIndex: any(named: 'startIndex'),
            maxResults: any(named: 'maxResults'),
          ),
        ).thenAnswer((_) async => Right(tSearchResult));
        return SearchBloc(mockSearchRepository, mockAnalytics);
      },
      act: (bloc) =>
          bloc.add(const SearchEvent.searchQueryChanged(query: 'i')),
      expect: () => [
        isA<SearchState>()
            .having((s) => s.suggestions, 'suggestions', isEmpty)
            .having((s) => s.pagingState.pages, 'pages', isNull),
      ],
    );
  });
}
