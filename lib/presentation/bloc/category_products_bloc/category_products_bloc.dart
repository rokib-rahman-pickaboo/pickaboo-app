import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/core/cache/category_filter_store.dart';
import 'package:pickaboo/core/cache/category_facet_cache.dart';

part 'category_products_event.dart';
part 'category_products_state.dart';
part 'category_products_bloc.freezed.dart';

@injectable
class CategoryProductsBloc
    extends Bloc<CategoryProductsEvent, CategoryProductsState> {
  final ProductRepository repository;
  final AnalyticsService _analytics;
  final CategoryFilterStore _filterStore;
  final CategoryFacetCache _facetCache;

  static const String _facetNamespace = 'cat';

  static const int _prodLimit = 6;
  static const int _featProdLimit = 16;

  String? _currentSort;
  Map<String, List<String>>? _currentFilters;

  bool _hydrated = false;

  String? _categoryKey;

  String _storeKey(String eventCategoryKey) {
    if (eventCategoryKey.isNotEmpty) _categoryKey ??= eventCategoryKey;
    return _categoryKey ?? eventCategoryKey;
  }

  CategoryProductsBloc(
    this.repository,
    this._analytics,
    this._filterStore,
    this._facetCache,
  ) : super(CategoryProductsState(pagingState: PagingState())) {
    on<_GetProducts>(_onGetProducts);
    on<_Refresh>(_onRefresh);
    on<_ApplyFilters>(_onApplyFilters);
    on<_ApplySort>(_onApplySort);
  }

  List<String> _facetKeys(String eventCategoryKey) {
    final key = _storeKey(eventCategoryKey);
    return key.isEmpty ? const [] : ['$_facetNamespace:$key'];
  }

  bool _facetsRestored = false;

  void _hydrateFromStore(
    String categoryKey,
    Emitter<CategoryProductsState> emit,
  ) {
    if (_hydrated) return;
    _hydrated = true;

    final saved = _filterStore.read(_storeKey(categoryKey));
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

  void _restoreFacets(String categoryKey, Emitter<CategoryProductsState> emit) {
    if (_facetsRestored) return;
    _facetsRestored = true;

    if (state.categoryData != null) return;

    final cached = _facetCache.read(_facetKeys(categoryKey));
    if (cached == null || cached.isEmpty) return;

    _baselineFacets = cached;
    emit(state.copyWith(cachedFacets: cached));
  }

  CategoryFacets? _baselineFacets;

  void _captureBaseline(
    CategoryProductsEntity response,
    String categoryKey, {
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
        ..._facetKeys(categoryKey),
        if (response.categoryId != 0) '$_facetNamespace:${response.categoryId}',
        if (response.categorySlug.isNotEmpty)
          '$_facetNamespace:${response.categorySlug}',
      },
      attributes: response.filterableAttributes,
      sortOptions: response.sortOptions,
    );
  }

  Future<void> _onGetProducts(
    _GetProducts event,
    Emitter<CategoryProductsState> emit,
  ) async {
    _hydrateFromStore(event.categoryKey, emit);
    _restoreFacets(event.categoryKey, emit);

    final currentState = state.pagingState;
    final int nextPageKey = (currentState.keys?.last ?? 0) + 1;

    if (currentState.isLoading || !currentState.hasNextPage) {
      return;
    }

    emit(
      state.copyWith(
        categoryKey: event.categoryKey.isNotEmpty
            ? event.categoryKey
            : state.categoryKey,
        pagingState: currentState.copyWith(isLoading: true),
      ),
    );

    final requestSort = _currentSort;
    final requestFilters = _currentFilters;

    final requestWasNarrowed = requestFilters != null;

    final result = await repository.getCategoryProducts(
      categoryKey: event.categoryKey,
      currentPage: nextPageKey,
      prodLimit: _prodLimit,
      featProdLimit: _featProdLimit,
      sort: requestSort,
      filters: requestFilters,
    );

    result.fold(
      (error) => emit(
        state.copyWith(
          pagingState: currentState.copyWith(isLoading: false, error: error),
        ),
      ),
      (response) {
        final newItems = response.products;
        final bool isLastPage = newItems.isEmpty;

        if (nextPageKey == 1) {
          _captureBaseline(
            response,
            event.categoryKey,
            requestWasNarrowed: requestWasNarrowed,
          );
        }

        final categoryData = nextPageKey == 1
            ? _withStableFacets(response)
            : state.categoryData;

        if (nextPageKey == 1) {
          _analytics.logViewCategory(
            categoryId: response.categoryId != 0
                ? response.categoryId.toString()
                : event.categoryKey,
            categoryName: response.categoryName,
          );
        }

        emit(
          state.copyWith(
            categoryData: categoryData,
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
    Emitter<CategoryProductsState> emit,
  ) async {
    _hydrated = true;
    emit(
      state.copyWith(
        pagingState: PagingState(),
        categoryData: state.categoryData,
        currentFilters: _currentFilters,
        currentSort: _currentSort,
      ),
    );
    add(
      CategoryProductsEvent.getProducts(categoryKey: event.categoryKey),
    );
  }

  Future<void> _onApplyFilters(
    _ApplyFilters event,
    Emitter<CategoryProductsState> emit,
  ) async {
    final filters = <String, List<String>>{
      for (final entry in event.filters.entries)
        if (entry.value.isNotEmpty) entry.key: List<String>.from(entry.value),
    };

    _hydrated = true;
    _currentFilters = filters.isEmpty ? null : filters;
    _filterStore.save(_storeKey(event.categoryKey), filters: filters);

    emit(
      state.copyWith(
        pagingState: PagingState(),
        categoryData: state.categoryData,
        currentFilters: _currentFilters,
      ),
    );
    add(CategoryProductsEvent.getProducts(categoryKey: event.categoryKey));
  }

  Future<void> _onApplySort(
    _ApplySort event,
    Emitter<CategoryProductsState> emit,
  ) async {
    _hydrated = true;
    _currentSort = event.sortValue;
    _filterStore.save(_storeKey(event.categoryKey), sort: event.sortValue);

    emit(
      state.copyWith(
        pagingState: PagingState(),
        categoryData: state.categoryData,
        currentSort: _currentSort,
      ),
    );
    add(CategoryProductsEvent.getProducts(categoryKey: event.categoryKey));
  }
}
