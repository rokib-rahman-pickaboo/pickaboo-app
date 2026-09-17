import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/core/cache/category_facet_cache.dart';
import 'package:pickaboo/core/cache/category_preload_cache.dart';
import 'package:pickaboo/core/cache/special_category_filter_store.dart';
import 'package:pickaboo/data/local_data_source/home_content_local_data_source.dart';
import 'package:pickaboo/data/mapper/home_content_mapper/home_content_mapper.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/secondary_home_widget.dart';

part 'special_category_products_event.dart';
part 'special_category_products_state.dart';
part 'special_category_products_bloc.freezed.dart';

@injectable
class SpecialCategoryProductsBloc
    extends Bloc<SpecialCategoryProductsEvent, SpecialCategoryProductsState> {
  final ProductRepository repository;
  final AnalyticsService _analytics;
  final SpecialCategoryFilterStore _filterStore;
  final CategoryFacetCache _facetCache;
  final CategoryPreloadCache _preloadCache;

  static const String _facetNamespace = 'spec';

  static const int _prodLimit = 6;
  static const int _featProdLimit = 16;

  String? _currentSort;
  Map<String, List<String>>? _currentFilters;

  bool _hydrated = false;
  bool _isFetchingNetwork = false;
  bool _isRefreshing = false;

  String? _categorySlug;

  String _storeKey(String eventCategoryId) {
    if (eventCategoryId.isNotEmpty) _categorySlug ??= eventCategoryId;
    return _categorySlug ?? eventCategoryId;
  }

  SpecialCategoryProductsBloc(
    this.repository,
    this._analytics,
    this._filterStore,
    this._facetCache, [
    CategoryPreloadCache? preloadCache,
  ])  : _preloadCache = preloadCache ?? CategoryPreloadCache.instance,
        super(
          SpecialCategoryProductsState(
            categorySlug: "",
            pagingState: PagingState(),
          ),
        ) {
    on<_GetProducts>(_onGetProducts);
    on<_Refresh>(_onRefresh);
    on<_ApplyFilters>(_onApplyFilters);
    on<_ApplySort>(_onApplySort);
  }

  List<String> _facetKeys(String eventCategorySlug) {
    final key = _storeKey(eventCategorySlug);
    return key.isEmpty ? const [] : ['$_facetNamespace:$key'];
  }

  bool _facetsRestored = false;

  void _restoreFacets(
    String categorySlug,
    Emitter<SpecialCategoryProductsState> emit,
  ) {
    if (_facetsRestored) return;
    _facetsRestored = true;

    if (state.categoryData != null) return;

    final cached = _facetCache.read(_facetKeys(categorySlug));
    if (cached != null && cached.isNotEmpty) {
      _baselineFacets = cached;
      emit(state.copyWith(cachedFacets: cached));
      return;
    }

    final preloaded = _readPreloadedData(categorySlug);
    if (preloaded != null &&
        (preloaded.filterAttributes.isNotEmpty ||
            preloaded.sortOptions.isNotEmpty)) {
      final facets = CategoryFacets(
        attributes: preloaded.filterAttributes,
        sortOptions: preloaded.sortOptions,
        fetchedAt: preloaded.cachedAt,
      );
      _baselineFacets = facets;
      emit(state.copyWith(cachedFacets: facets));
    }
  }

  CategoryPreloadData? _readPreloadedData(String categorySlug) {
    final keys = <String>{
      categorySlug,
      'spec:$categorySlug',
      if (_categorySlug != null) _categorySlug!,
      if (_categorySlug != null) 'spec:$_categorySlug',
      ..._facetKeys(categorySlug),
    };
    return _preloadCache.read(keys);
  }

  Future<List<ProductEntity>?> _getInitialCachedProducts(
      String categorySlug) async {
    final preloaded = _readPreloadedData(categorySlug);
    if (preloaded != null && preloaded.products.isNotEmpty) {
      return preloaded.products;
    }

    final secondaryCached = SecondaryHomeWidget.getCachedProducts(categorySlug);
    if (secondaryCached != null && secondaryCached.isNotEmpty) {
      return secondaryCached;
    }

    try {
      if (getIt.isRegistered<HomeContentLocalDataSource>()) {
        final localDataSource = getIt<HomeContentLocalDataSource>();
        final homeResponse = await localDataSource.getHomeContentIfValid() ??
            await localDataSource.getHomeContentStale();
        if (homeResponse != null) {
          final homeEntity = homeResponse.toEntity();
          final feedItem = homeEntity.categoryProducts.firstWhereOrNull(
            (item) =>
                item.categorySlug == categorySlug ||
                item.categoryId == categorySlug ||
                item.categoryName.toLowerCase() == categorySlug.toLowerCase(),
          );
          if (feedItem != null && feedItem.products.isNotEmpty) {
            return feedItem.products;
          }
        }
      }
    } catch (_) {}

    return null;
  }

  CategoryFacets? _baselineFacets;

  void _captureBaseline(
    CategoryProductsEntity response,
    String categorySlug, {
    required bool requestWasNarrowed,
  }) {
    if (response.filterableAttributes.isEmpty && response.sortOptions.isEmpty) {
      return;
    }

    if (requestWasNarrowed) {
      _baselineFacets ??= CategoryFacets(
        attributes: response.filterableAttributes,
        sortOptions: response.sortOptions,
        fetchedAt: DateTime.now(),
      );
      return;
    }

    _baselineFacets = CategoryFacets(
      attributes: response.filterableAttributes,
      sortOptions: response.sortOptions,
      fetchedAt: DateTime.now(),
    );

    _facetCache.save(
      {
        ..._facetKeys(categorySlug),
        if (response.categorySlug.isNotEmpty)
          '$_facetNamespace:${response.categorySlug}',
      },
      attributes: response.filterableAttributes,
      sortOptions: response.sortOptions,
    );
  }

  void _hydrateFromStore(
      String categorySlug, Emitter<SpecialCategoryProductsState> emit) {
    if (_hydrated) return;
    _hydrated = true;

    final saved = _filterStore.read(_storeKey(categorySlug));
    if (saved == null || saved.isEmpty) return;

    _currentFilters = saved.filters.isEmpty
        ? null
        : {
            for (final entry in saved.filters.entries)
              entry.key: List<String>.from(entry.value),
          };
    _currentSort = saved.sort;

    emit(
      state.copyWith(
        currentFilters: _currentFilters,
        currentSort: _currentSort,
      ),
    );
  }

  Future<void> _onGetProducts(
    _GetProducts event,
    Emitter<SpecialCategoryProductsState> emit,
  ) async {
    _hydrateFromStore(event.categorySlug, emit);
    _restoreFacets(event.categorySlug, emit);

    final currentState = state.pagingState;
    final int nextPageKey = (currentState.keys?.last ?? 0) + 1;

    if (currentState.isLoading ||
        _isFetchingNetwork ||
        !currentState.hasNextPage) {
      return;
    }

    final bool isFirstPage = nextPageKey == 1;
    final bool hasNoFiltersOrSort =
        _currentFilters == null && _currentSort == null;
    final bool shouldHydrateFromCache = isFirstPage &&
        hasNoFiltersOrSort &&
        !_isRefreshing &&
        (currentState.pages == null || currentState.pages!.isEmpty);

    PagingState<int, ProductEntity> activeState = currentState;

    if (shouldHydrateFromCache) {
      final cachedProducts = await _getInitialCachedProducts(event.categorySlug);
      if (cachedProducts != null && cachedProducts.isNotEmpty) {
        final page1 = cachedProducts.take(_prodLimit).toList();
        activeState = currentState.copyWith(
          isLoading: false,
          hasNextPage: true,
          pages: [page1],
          keys: [1],
        );
        emit(
          state.copyWith(
            categorySlug: event.categorySlug.isNotEmpty
                ? event.categorySlug
                : state.categorySlug,
            pagingState: activeState,
          ),
        );
      }
    }

    if (activeState.pages == null ||
        activeState.pages!.isEmpty ||
        !isFirstPage) {
      activeState = activeState.copyWith(isLoading: true);
      emit(
        state.copyWith(
          categorySlug: event.categorySlug.isNotEmpty
              ? event.categorySlug
              : state.categorySlug,
          pagingState: activeState,
        ),
      );
    }

    _isFetchingNetwork = true;
    try {
      final requestSort = _currentSort;
      final requestFilters = _currentFilters;
      final requestWasNarrowed = requestFilters != null;

      final result = await repository.getSpecialCategoryProducts(
        categorySlug: event.categorySlug,
        currentPage: nextPageKey,
        prodLimit: _prodLimit,
        featProdLimit: _featProdLimit,
        sort: requestSort,
        filters: requestFilters,
      );

      result.fold(
        (error) {
          if (state.pagingState.pages?.isNotEmpty ?? false) {
            emit(
              state.copyWith(
                pagingState: state.pagingState.copyWith(isLoading: false),
              ),
            );
          } else {
            emit(
              state.copyWith(
                pagingState:
                    currentState.copyWith(isLoading: false, error: error),
              ),
            );
          }
        },
        (response) {
          final newItems = response.products;
          final bool isLastPage = newItems.isEmpty;

          if (isFirstPage) {
            _captureBaseline(
              response,
              event.categorySlug,
              requestWasNarrowed: requestWasNarrowed,
            );
            if (newItems.isNotEmpty) {
              _preloadCache.save(
                {
                  ..._facetKeys(event.categorySlug),
                  event.categorySlug,
                  if (response.categorySlug.isNotEmpty) response.categorySlug,
                  if (response.categorySlug.isNotEmpty)
                    '$_facetNamespace:${response.categorySlug}',
                },
                products: newItems,
                filterAttributes: response.filterableAttributes,
                sortOptions: response.sortOptions,
                banners: response.banners,
              );
            }
          }

          final categoryData = isFirstPage
              ? _withStableFacets(response)
              : state.categoryData;

          if (isFirstPage) {
            _analytics.logViewCategory(
              categoryId: event.categorySlug,
              categoryName: response.categoryName,
            );
          }

          final currentPages = state.pagingState.pages;
          final currentKeys = state.pagingState.keys;

          List<List<ProductEntity>> updatedPages;
          List<int> updatedKeys;

          if (isFirstPage &&
              currentPages != null &&
              currentPages.isNotEmpty) {
            updatedPages = List<List<ProductEntity>>.from(currentPages);
            updatedPages[0] = newItems.isNotEmpty ? newItems : updatedPages[0];
            updatedKeys = currentKeys ?? [1];
          } else {
            updatedPages = [...currentPages ?? [], newItems];
            updatedKeys = [...currentKeys ?? [], nextPageKey];
          }

          emit(
            state.copyWith(
              categoryData: categoryData,
              pagingState: state.pagingState.copyWith(
                isLoading: false,
                hasNextPage: !isLastPage,
                pages: updatedPages,
                keys: updatedKeys,
              ),
            ),
          );
        },
      );
    } finally {
      _isFetchingNetwork = false;
      _isRefreshing = false;
    }
  }

  CategoryProductsEntity _withStableFacets(CategoryProductsEntity next) {
    final baseline = _baselineFacets;
    if (baseline == null || baseline.isEmpty) return next;

    final baselineCodes =
        baseline.attributes.map((e) => e.filterCode).toSet();

    final merged = <FilterAttributeEntity>[
      ...baseline.attributes,
      for (final attr in next.filterableAttributes)
        if (!baselineCodes.contains(attr.filterCode)) attr,
    ];

    return CategoryProductsEntity(
      categoryId: next.categoryId,
      categorySlug: next.categorySlug,
      categoryName: next.categoryName,
      metaTitle: next.metaTitle,
      metaKeywords: next.metaKeywords,
      metaDescription: next.metaDescription,
      image: next.image,
      mobileImage: next.mobileImage,
      banners: next.banners,
      filters: next.filters,
      featuredProductTotal: next.featuredProductTotal,
      totalCatProds: next.totalCatProds,
      products: next.products,
      featuredProducts: next.featuredProducts,
      featuredCategories: next.featuredCategories,
      brands: next.brands,
      sortOptions: baseline.sortOptions.isNotEmpty
          ? baseline.sortOptions
          : next.sortOptions,
      filterableAttributes: merged,
      appliedFilters: next.appliedFilters,
      categoryDescription: next.categoryDescription,
      cacheTime: next.cacheTime,
    );
  }

  Future<void> _onRefresh(
    _Refresh event,
    Emitter<SpecialCategoryProductsState> emit,
  ) async {
    _hydrated = true;
    _isRefreshing = true;
    _preloadCache.clear(event.categorySlug);
    emit(
      state.copyWith(
        pagingState: PagingState(),
        categoryData: state.categoryData,
        currentFilters: _currentFilters,
        currentSort: _currentSort,
      ),
    );
    add(
      SpecialCategoryProductsEvent.getProducts(categorySlug: event.categorySlug),
    );
  }

  Future<void> _onApplyFilters(
    _ApplyFilters event,
    Emitter<SpecialCategoryProductsState> emit,
  ) async {
    final filters = <String, List<String>>{
      for (final entry in event.filters.entries)
        if (entry.value.isNotEmpty) entry.key: List<String>.from(entry.value),
    };

    _hydrated = true;
    _currentFilters = filters.isEmpty ? null : filters;
    _filterStore.save(_storeKey(event.categorySlug), filters: filters);

    emit(
      state.copyWith(
        pagingState: PagingState(),
        categoryData: state.categoryData,
        currentFilters: _currentFilters,
      ),
    );
    add(SpecialCategoryProductsEvent.getProducts(categorySlug: event.categorySlug));
  }

  Future<void> _onApplySort(
    _ApplySort event,
    Emitter<SpecialCategoryProductsState> emit,
  ) async {
    _hydrated = true;
    _currentSort = event.sortValue;
    _filterStore.save(_storeKey(event.categorySlug), sort: event.sortValue);

    emit(
      state.copyWith(
        pagingState: PagingState(),
        categoryData: state.categoryData,
        currentSort: _currentSort,
      ),
    );
    add(SpecialCategoryProductsEvent.getProducts(categorySlug: event.categorySlug));
  }
}
