import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/domain/entity/brand_products/brand_products_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/core/cache/category_filter_store.dart';
import 'package:pickaboo/core/cache/category_facet_cache.dart';

part 'brand_products_event.dart';
part 'brand_products_state.dart';
part 'brand_products_bloc.freezed.dart';

@injectable
class BrandProductsBloc extends Bloc<BrandProductsEvent, BrandProductsState> {
  final ProductRepository repository;
  final AnalyticsService _analytics;
  final CategoryFilterStore _filterStore;
  final CategoryFacetCache _facetCache;

  static const String _facetNamespace = 'brand';

  static const int _prodLimit = 6;

  String? _currentSort;
  Map<String, List<String>>? _currentFilters;

  bool _hydrated = false;

  String? _brandKey;

  String _storeKey(String eventBrandKey) {
    if (eventBrandKey.isNotEmpty) _brandKey ??= eventBrandKey;
    return '$_facetNamespace:${_brandKey ?? eventBrandKey}';
  }

  BrandProductsBloc(
    this.repository,
    this._analytics,
    this._filterStore,
    this._facetCache,
  ) : super(BrandProductsState(pagingState: PagingState())) {
    on<_GetProducts>(_onGetProducts);
    on<_Refresh>(_onRefresh);
    on<_ApplyFilters>(_onApplyFilters);
    on<_ApplySort>(_onApplySort);
  }

  List<String> _facetKeys(String eventBrandKey) {
    if (eventBrandKey.isNotEmpty) _brandKey ??= eventBrandKey;
    final key = _brandKey ?? eventBrandKey;
    return key.isEmpty ? const [] : ['$_facetNamespace:$key'];
  }

  bool _facetsRestored = false;

  void _hydrateFromStore(String brandKey, Emitter<BrandProductsState> emit) {
    if (_hydrated) return;
    _hydrated = true;

    final saved = _filterStore.read(_storeKey(brandKey));
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

  void _restoreFacets(String brandKey, Emitter<BrandProductsState> emit) {
    if (_facetsRestored) return;
    _facetsRestored = true;

    if (state.brandData != null) return;

    final cached = _facetCache.read(_facetKeys(brandKey));
    if (cached == null || cached.isEmpty) return;

    _baselineFacets = cached;
    emit(state.copyWith(cachedFacets: cached));
  }

  CategoryFacets? _baselineFacets;

  void _captureBaseline(
    BrandProductsEntity response,
    String brandKey, {
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
        ..._facetKeys(brandKey),
        if (response.brandId != 0) '$_facetNamespace:${response.brandId}',
        if (response.brandSlug.isNotEmpty)
          '$_facetNamespace:${response.brandSlug}',
      },
      attributes: response.filterableAttributes,
      sortOptions: response.sortOptions,
    );
  }

  Future<void> _onGetProducts(
    _GetProducts event,
    Emitter<BrandProductsState> emit,
  ) async {
    _hydrateFromStore(event.brandKey, emit);
    _restoreFacets(event.brandKey, emit);

    final currentState = state.pagingState;
    final int nextPageKey = (currentState.keys?.last ?? 0) + 1;

    if (currentState.isLoading || !currentState.hasNextPage) {
      return;
    }

    emit(
      state.copyWith(
        brandKey: event.brandKey.isNotEmpty ? event.brandKey : state.brandKey,
        pagingState: currentState.copyWith(isLoading: true),
      ),
    );

    final requestSort = _currentSort;
    final requestFilters = _currentFilters;

    final requestWasNarrowed = requestFilters != null;

    final result = await repository.getBrandProducts(
      brandKey: event.brandKey,
      currentPage: nextPageKey,
      prodLimit: _prodLimit,
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
            event.brandKey,
            requestWasNarrowed: requestWasNarrowed,
          );
        }

        final brandData = nextPageKey == 1
            ? _withStableFacets(response)
            : state.brandData;

        if (nextPageKey == 1) {
          _analytics.logViewCategory(
            categoryId: response.brandId != 0
                ? response.brandId.toString()
                : event.brandKey,
            categoryName: response.brandName,
          );
        }

        emit(
          state.copyWith(
            brandData: brandData,
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

  BrandProductsEntity _withStableFacets(BrandProductsEntity next) {
    final baseline = _baselineFacets;
    if (baseline == null || baseline.isEmpty) return next;

    final baselineCodes =
        baseline.attributes.map((e) => e.filterCode).toSet();

    final merged = <FilterAttributeEntity>[
      ...baseline.attributes,
      for (final attr in next.filterableAttributes)
        if (!baselineCodes.contains(attr.filterCode)) attr,
    ];

    return BrandProductsEntity(
      brandId: next.brandId,
      brandSlug: next.brandSlug,
      brandName: next.brandName,
      metaTitle: next.metaTitle,
      metaKeywords: next.metaKeywords,
      metaDescription: next.metaDescription,
      image: next.image,
      mobileImage: next.mobileImage,
      banners: next.banners,
      filters: next.filters,
      featuredProductTotal: next.featuredProductTotal,
      totalBrandProds: next.totalBrandProds,
      products: next.products,
      featuredProducts: next.featuredProducts,
      featuredCategories: next.featuredCategories,
      brands: next.brands,
      sortOptions: baseline.sortOptions.isNotEmpty
          ? baseline.sortOptions
          : next.sortOptions,
      filterableAttributes: merged,
      appliedFilters: next.appliedFilters,
      brandDescription: next.brandDescription,
      cacheTime: next.cacheTime,
    );
  }

  Future<void> _onRefresh(
    _Refresh event,
    Emitter<BrandProductsState> emit,
  ) async {
    _hydrated = true;
    emit(
      state.copyWith(
        pagingState: PagingState(),
        brandData: state.brandData,
        currentFilters: _currentFilters,
        currentSort: _currentSort,
      ),
    );
    add(
      BrandProductsEvent.getProducts(brandKey: event.brandKey),
    );
  }

  Future<void> _onApplyFilters(
    _ApplyFilters event,
    Emitter<BrandProductsState> emit,
  ) async {
    final filters = <String, List<String>>{
      for (final entry in event.filters.entries)
        if (entry.value.isNotEmpty) entry.key: List<String>.from(entry.value),
    };

    _hydrated = true;
    _currentFilters = filters.isEmpty ? null : filters;
    _filterStore.save(_storeKey(event.brandKey), filters: filters);

    emit(
      state.copyWith(
        pagingState: PagingState(),
        brandData: state.brandData,
        currentFilters: _currentFilters,
      ),
    );
    add(BrandProductsEvent.getProducts(brandKey: event.brandKey));
  }

  Future<void> _onApplySort(
    _ApplySort event,
    Emitter<BrandProductsState> emit,
  ) async {
    _hydrated = true;
    _currentSort = event.sortValue;
    _filterStore.save(_storeKey(event.brandKey), sort: event.sortValue);

    emit(
      state.copyWith(
        pagingState: PagingState(),
        brandData: state.brandData,
        currentSort: _currentSort,
      ),
    );
    add(BrandProductsEvent.getProducts(brandKey: event.brandKey));
  }
}
