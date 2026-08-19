import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/search/search_facet_entity.dart';
import 'package:pickaboo/domain/entity/search/search_result_entity.dart';
import 'package:pickaboo/domain/repository/search_repository.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;
  final AnalyticsService _analytics;

  String _currentQuery = '';
  String? _currentCategoryId;
  Map<String, String>? _currentFilters;
  String? _sortBy;
  String? _sortOrder;
  static const int _pageSize = 10;

  static const int _minQueryLength = 2;

  SearchBloc(this.repository, this._analytics)
    : super(SearchState(pagingState: PagingState())) {
    on<_SearchSubmitted>(_onSearchSubmitted);
    on<_SearchQueryChanged>(_onSearchQueryChanged);
    on<_SearchLoadMore>(_onSearchLoadMore);
    on<_SearchFilterApplied>(_onSearchFilterApplied);
    on<_SearchSortApplied>(_onSearchSortApplied);
    on<_SearchCleared>(_onSearchCleared);
    on<_SearchRefresh>(_onSearchRefresh);
  }

  Future<void> _onSearchQueryChanged(
    _SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query;

    _currentQuery = query;

    if (query.trim().length <= _minQueryLength) {
      emit(state.copyWith(suggestions: const [], pagingState: PagingState()));
      return;
    }

    emit(
      state.copyWith(pagingState: state.pagingState.copyWith(isLoading: true)),
    );

    final result = await repository.search(
      query: query,
      startIndex: 0,
      maxResults: _pageSize,
      filters: _currentFilters,
      sortBy: _sortBy,
      sortOrder: _sortOrder,
    );

    result.fold(
      (error) => emit(
        state.copyWith(
          suggestions: const [],
          pagingState: state.pagingState.copyWith(
            isLoading: false,
            error: error,
          ),
        ),
      ),
      (response) {
        final newItems = response.products;
        final bool isLastPage = newItems.length < _pageSize;

        final suggestions = response.suggestions.isNotEmpty
            ? response.suggestions
            : response.products.map((p) => p.productName).take(5).toList();

        emit(
          state.copyWith(
            suggestions: suggestions,
            correctedQuery: response.correctedQuery,
            facets: response.facets,
            categories: response.categories,
            pagingState: state.pagingState.copyWith(
              isLoading: false,
              hasNextPage: !isLastPage,
              pages: [newItems],
              keys: [0],
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSearchSubmitted(
    _SearchSubmitted event,
    Emitter<SearchState> emit,
  ) async {
    _currentQuery = event.query;
    _currentCategoryId = event.categoryId;

    _analytics.logSearch(searchString: _currentQuery);

    debugPrint('🔎 [SEARCH_BLOC] Search submitted');
    debugPrint('🔎 [SEARCH_BLOC] Query: $_currentQuery');
    debugPrint('🔎 [SEARCH_BLOC] Category: $_currentCategoryId');
    debugPrint('🔎 [SEARCH_BLOC] Filters: $_currentFilters');
    debugPrint('🔎 [SEARCH_BLOC] Sort: $_sortBy $_sortOrder');

    emit(
      SearchState(
        pagingState: PagingState(),
        correctedQuery: null,
        facets: const [],
        suggestions: const [],
      ),
    );

    emit(
      state.copyWith(pagingState: state.pagingState.copyWith(isLoading: true)),
    );

    debugPrint('🔎 [SEARCH_BLOC] Calling repository.search...');
    final result = await repository.search(
      query: _currentQuery,
      categoryId: _currentCategoryId,
      startIndex: 0,
      maxResults: _pageSize,
      filters: _currentFilters,
      sortBy: _sortBy,
      sortOrder: _sortOrder,
    );

    result.fold(
      (error) => emit(
        state.copyWith(
          pagingState: state.pagingState.copyWith(
            isLoading: false,
            error: error,
          ),
        ),
      ),
      (response) {
        final newItems = response.products;
        final bool isLastPage = newItems.length < _pageSize;

        debugPrint(
          '🔎 [SEARCH_BLOC] Search response received: ${newItems.length} items',
        );

        emit(
          state.copyWith(
            pagingState: state.pagingState.copyWith(
              isLoading: false,
              hasNextPage: !isLastPage,
              pages: [newItems],
              keys: [0],
            ),
            correctedQuery: response.correctedQuery,
            facets: response.facets,
            suggestions: response.suggestions,
            categories: response.categories,
          ),
        );
      },
    );
  }

  Future<void> _onSearchLoadMore(
    _SearchLoadMore event,
    Emitter<SearchState> emit,
  ) async {
    final currentState = state.pagingState;
    final int nextPageKey = (currentState.keys?.last ?? -1) + 1;

    if (currentState.isLoading || !currentState.hasNextPage) {
      return;
    }

    emit(state.copyWith(pagingState: currentState.copyWith(isLoading: true)));

    final result = await repository.search(
      query: _currentQuery,
      categoryId: _currentCategoryId,
      startIndex: nextPageKey * _pageSize,
      maxResults: _pageSize,
      filters: _currentFilters,
      sortBy: _sortBy,
      sortOrder: _sortOrder,
    );

    result.fold(
      (error) => emit(
        state.copyWith(
          pagingState: currentState.copyWith(isLoading: false, error: error),
        ),
      ),
      (response) {
        final newItems = response.products;
        final bool isLastPage = newItems.length < _pageSize;

        emit(
          state.copyWith(
            pagingState: currentState.copyWith(
              isLoading: false,
              hasNextPage: !isLastPage,
              pages: [...currentState.pages ?? [], newItems],
              keys: [...currentState.keys ?? [], nextPageKey],
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSearchFilterApplied(
    _SearchFilterApplied event,
    Emitter<SearchState> emit,
  ) async {
    debugPrint('🔎 [SEARCH_BLOC] Filter applied event received');
    debugPrint('🔎 [SEARCH_BLOC] New filters: ${event.filters}');
    debugPrint('🔎 [SEARCH_BLOC] Current query: $_currentQuery');
    debugPrint('🔎 [SEARCH_BLOC] Current category: $_currentCategoryId');

    _currentFilters = event.filters;

    debugPrint('🔎 [SEARCH_BLOC] Triggering new search with filters...');
    add(
      SearchEvent.searchSubmitted(
        query: _currentQuery,
        categoryId: _currentCategoryId,
      ),
    );
  }

  Future<void> _onSearchSortApplied(
    _SearchSortApplied event,
    Emitter<SearchState> emit,
  ) async {
    _sortBy = event.sortBy;
    _sortOrder = event.sortOrder;
    add(
      SearchEvent.searchSubmitted(
        query: _currentQuery,
        categoryId: _currentCategoryId,
      ),
    );
  }

  void _onSearchCleared(_SearchCleared event, Emitter<SearchState> emit) {
    _currentQuery = '';
    _currentCategoryId = null;
    _currentFilters = null;
    _sortBy = null;
    _sortOrder = null;
    emit(SearchState(pagingState: PagingState()));
  }

  Future<void> _onSearchRefresh(
    _SearchRefresh event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchState(pagingState: PagingState()));
    if (_currentQuery.isNotEmpty) {
      add(
        SearchEvent.searchSubmitted(
          query: _currentQuery,
          categoryId: _currentCategoryId,
        ),
      );
    }
  }
}
