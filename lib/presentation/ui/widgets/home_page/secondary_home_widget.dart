import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/cache/category_facet_cache.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/data/local_data_source/home_content_local_data_source.dart';
import 'package:pickaboo/data/mapper/home_content_mapper/home_content_mapper.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:pickaboo/core/utils/category_question_helper.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_section_header.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/filters/active_filter_chips_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/filters/child_category_chips_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/filters/question_filter_widget.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/pages/no_internet_page/no_internet_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class _CategoryCacheData {
  final List<ProductEntity> products;
  final List<SliderEntity> banners;
  final List<FilterAttributeEntity> filterAttributes;

  _CategoryCacheData({
    required this.products,
    required this.banners,
    required this.filterAttributes,
  });
}

/// ============================================================================
/// 🏠 SECONDARY HOME WIDGET (Category Tab Feeds)
///
/// Layout Specification:
/// - Top Part: Child category chips from /rest/V1/all-categories
/// - Unfiltered Mode:
///     Q1 + Top Featured Offer Header + 4 Products + Q2 + 8 Products + Q3 + 8 Products + View All Button
/// - Filtered Mode (when user answers any question):
///     Active answers chips row + Clear All button
///     Next unanswered question (Q2 or Q3) shifts into the question slot
///     Top Header and Bottom View All button are removed
///     All filtered matching products displayed in a continuous grid
/// ============================================================================
class SecondaryHomeWidget extends StatefulWidget {
  final CategoryListEntity category;
  final VoidCallback onViewAll;

  const SecondaryHomeWidget({
    super.key,
    required this.category,
    required this.onViewAll,
  });

  /// Proactively pre-warms a category in the background during idle time
  static Future<void> prewarm(CategoryListEntity category) async {
    final cacheKey = category.id.isNotEmpty
        ? category.id
        : (category.slug.isNotEmpty ? category.slug : category.name);
    if (_SecondaryHomeWidgetState._cache.containsKey(cacheKey)) return;

    try {
      final repo = getIt<ProductRepository>();
      final key = category.id.isNotEmpty
          ? category.id
          : (category.slug.isNotEmpty ? category.slug : category.name);

      final result = category.isSpecial
          ? await repo.getSpecialCategoryProducts(
              categorySlug: category.slug,
              currentPage: 1,
              prodLimit: 20,
              featProdLimit: 20,
            )
          : await repo.getCategoryProducts(
              categoryKey: key,
              prodLimit: 20,
              currentPage: 1,
              featProdLimit: 20,
            );

      result.fold((_) {}, (categoryData) {
        final rawProducts = categoryData.products.isNotEmpty
            ? categoryData.products
            : categoryData.featuredProducts;
        final max20 = rawProducts.take(20).toList();

        final validAttributes = _SecondaryHomeWidgetState._extractQuestionAttributes(
          categoryData.filterableAttributes,
          categoryId: category.id,
          categorySlug: category.slug,
          categoryName: category.name,
        );

        _SecondaryHomeWidgetState._cache[cacheKey] = _CategoryCacheData(
          products: max20,
          banners: [],
          filterAttributes: validAttributes,
        );
      });
    } catch (_) {}
  }

  @override
  State<SecondaryHomeWidget> createState() => _SecondaryHomeWidgetState();
}

class _SecondaryHomeWidgetState extends State<SecondaryHomeWidget> {
  static final Map<String, _CategoryCacheData> _cache = {};

  bool _isLoading = false;
  String? _errorMessage;

  List<ProductEntity> _products = [];
  List<FilterAttributeEntity> _filterAttributes = [];
  List<FilterAttributeEntity> _rawFilterAttributes = [];
  List<FilterAttributeEntity> _filteredServerAttributes = [];

  // Active filter selections: filterCode -> FilterItemEntity
  final Map<String, FilterItemEntity> _activeAnswers = {};

  @override
  void initState() {
    super.initState();
    _loadCategoryData();
  }

  @override
  void didUpdateWidget(covariant SecondaryHomeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category.id != widget.category.id ||
        oldWidget.category.name != widget.category.name ||
        oldWidget.category.slug != widget.category.slug) {
      _activeAnswers.clear();
      _filteredServerAttributes.clear();
      _products = [];
      _filterAttributes = [];
      _rawFilterAttributes = [];
      _loadCategoryData();
    }
  }

  Future<void> _loadCategoryData({bool forceRefresh = false}) async {
    final cacheKey = widget.category.id.isNotEmpty
        ? widget.category.id
        : (widget.category.slug.isNotEmpty ? widget.category.slug : widget.category.name);

    // ── 1. Check in-memory fast cache ──
    if (!forceRefresh && _cache.containsKey(cacheKey)) {
      final cached = _cache[cacheKey]!;
      setState(() {
        _products = cached.products;
        _filterAttributes = cached.filterAttributes;
        _rawFilterAttributes = cached.filterAttributes;
        _filteredServerAttributes = [];
        _isLoading = false;
        _errorMessage = null;
      });
      return;
    }

    // Reset current products so old category data is never displayed
    setState(() {
      _products = [];
      _filterAttributes = [];
      _rawFilterAttributes = [];
      _filteredServerAttributes = [];
      _isLoading = true;
      _errorMessage = null;
    });

    // ── 2. Pre-populate from existing cached HomeContent in Hive DB (Instant Render) ──
    bool hasLocalData = false;
    try {
      final homeDs = getIt<HomeContentLocalDataSource>();
      final homeResponse = await homeDs.getHomeContentIfValid() ??
          await homeDs.getHomeContentStale();

      if (homeResponse != null) {
        final homeEntity = homeResponse.toEntity();
        final matchedCategory = homeEntity.categoryProducts.firstWhere(
          (cp) =>
              (widget.category.id.isNotEmpty && cp.categoryId.isNotEmpty && cp.categoryId == widget.category.id) ||
              (widget.category.slug.isNotEmpty && cp.categorySlug.isNotEmpty && cp.categorySlug.toLowerCase() == widget.category.slug.toLowerCase()) ||
              (widget.category.name.isNotEmpty && cp.categoryName.isNotEmpty &&
                  cp.categoryName.toLowerCase().trim() == widget.category.name.toLowerCase().trim()),
          orElse: () => const CategoryProductEntity(
            categoryId: '',
            categorySlug: '',
            categoryName: '',
            isHome: false,
            isTodaysSpecial: false,
            isLaunchingSoon: false,
            isBrand: false,
            isFeatured: false,
            isBanner: false,
            homeBlockBg: '',
            isFlashHourCat: false,
            background: '',
            image: '',
            isSpecial: false,
            products: [],
          ),
        );

        if (matchedCategory.products.isNotEmpty) {
          final localProducts = matchedCategory.products.take(20).toList();

          final facetCache = getIt<CategoryFacetCache>();
          final cachedFacets = facetCache.read([
            'cat:$cacheKey',
            'cat:${widget.category.slug}',
            'cat:${widget.category.name}',
            'spec:${widget.category.slug}',
            'spec:$cacheKey',
            'spec:${widget.category.name}',
            cacheKey,
            widget.category.slug,
            widget.category.name,
          ]);
          final localAttributes = cachedFacets?.attributes ?? [];

          setState(() {
            _products = localProducts;
            _filterAttributes = _extractQuestionAttributes(
              localAttributes,
              categoryId: widget.category.id,
              categorySlug: widget.category.slug,
              categoryName: widget.category.name,
            );
            _rawFilterAttributes = localAttributes;
            _filteredServerAttributes = [];
            _isLoading = false;
            _errorMessage = null;
          });
          hasLocalData = true;
        }
      }
    } catch (e) {
      debugPrint('Local category pre-population note: $e');
    }

    // If zero local data was available anywhere, display loader
    if (!hasLocalData) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
    }

    // ── 3. Silent / Active Network Fetch ──
    try {
      final repo = getIt<ProductRepository>();
      final key = widget.category.id.isNotEmpty
          ? widget.category.id
          : (widget.category.slug.isNotEmpty ? widget.category.slug : widget.category.name);

      final result = widget.category.isSpecial
          ? await repo.getSpecialCategoryProducts(
              categorySlug: widget.category.slug,
              currentPage: 1,
              prodLimit: 20,
              featProdLimit: 20,
            )
          : await repo.getCategoryProducts(
              categoryKey: key,
              prodLimit: 20,
              currentPage: 1,
              featProdLimit: 20,
            );

      if (!mounted) return;

      result.fold(
        (error) {
          if (!hasLocalData) {
            setState(() {
              _isLoading = false;
              _errorMessage = error.message;
              _products = [];
              _filterAttributes = [];
              _rawFilterAttributes = [];
              _filteredServerAttributes = [];
            });
          }
        },
        (categoryData) {
          final rawProducts = categoryData.products.isNotEmpty
              ? categoryData.products
              : categoryData.featuredProducts;
          final max20 = rawProducts.take(20).toList();

          final bannerSliders = categoryData.banners.map((b) {
            return SliderEntity(
              id: b.id,
              sliderId: b.id,
              storeId: '1',
              title: b.title,
              mobileSlug: b.mobileSlug,
              isSpecialCat: false,
              image: b.image.isNotEmpty ? b.image : b.imageUrl,
              mobileImage:
                  b.mobileImage.isNotEmpty ? b.mobileImage : b.mobileImageUrl,
              imagePosition: b.imagePosition,
              link: b.link,
              linkType: b.linkType,
              order: b.order,
              status: b.status,
              urlKey: b.urlKey ?? '',
              name: b.name ?? '',
              alias: '',
              delay: '3000',
              autoplay: '1',
              transition: 'slide',
              pagination: '1',
              arrows: '0',
              retinaImageSize: '',
              retinaMobileImageSize: '',
            );
          }).toList();

          final validAttributes = _extractQuestionAttributes(
            categoryData.filterableAttributes,
            categoryId: widget.category.id,
            categorySlug: widget.category.slug,
            categoryName: widget.category.name,
          );

          // Save facets into in-memory facet cache
          getIt<CategoryFacetCache>().save(
            [cacheKey, widget.category.slug, widget.category.name],
            attributes: validAttributes,
            sortOptions: categoryData.sortOptions,
          );

          // Save into in-memory category cache
          _cache[cacheKey] = _CategoryCacheData(
            products: max20,
            banners: bannerSliders,
            filterAttributes: validAttributes,
          );

          setState(() {
            _isLoading = false;
            _products = max20;
            _filterAttributes = validAttributes;
            _rawFilterAttributes = categoryData.filterableAttributes;
            _filteredServerAttributes = [];
            _errorMessage = null;
          });
        },
      );
    } catch (e) {
      if (!mounted) return;
      if (!hasLocalData) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString();
          _products = [];
          _filterAttributes = [];
          _rawFilterAttributes = [];
          _filteredServerAttributes = [];
        });
      }
    }
  }

  void _onAnswerQuestion(FilterAttributeEntity attr, String optionLabel) {
    final item = attr.items.firstWhereOrNull((i) => i.label == optionLabel);
    if (item != null) {
      setState(() {
        _activeAnswers[attr.filterCode] = item;
      });
      _fetchFilteredProducts();
    }
  }

  void _onRemoveFilter(String filterCode) {
    setState(() {
      _activeAnswers.remove(filterCode);
    });
    if (_activeAnswers.isEmpty) {
      _filteredServerAttributes = [];
      _loadCategoryData(forceRefresh: false);
    } else {
      _fetchFilteredProducts();
    }
  }

  void _onClearAllFilters() {
    setState(() {
      _activeAnswers.clear();
      _filteredServerAttributes = [];
    });
    _loadCategoryData(forceRefresh: false);
  }

  Future<void> _fetchFilteredProducts() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final repo = getIt<ProductRepository>();
      final key = widget.category.id.isNotEmpty
          ? widget.category.id
          : (widget.category.slug.isNotEmpty ? widget.category.slug : widget.category.name);

      final filtersMap = {
        for (final entry in _activeAnswers.entries)
          entry.key: [entry.value.value.toString()]
      };

      final result = widget.category.isSpecial
          ? await repo.getSpecialCategoryProducts(
              categorySlug: widget.category.slug,
              currentPage: 1,
              prodLimit: 100,
              featProdLimit: 100,
              filters: filtersMap,
            )
          : await repo.getCategoryProducts(
              categoryKey: key,
              prodLimit: 100,
              currentPage: 1,
              featProdLimit: 100,
              filters: filtersMap,
            );

      if (!mounted) return;

      result.fold(
        (error) {
          setState(() {
            _isLoading = false;
            _errorMessage = error.message;
            _products = [];
          });
        },
        (categoryData) {
          final allFilteredProds = categoryData.products.isNotEmpty
              ? categoryData.products
              : categoryData.featuredProducts;

          setState(() {
            _isLoading = false;
            _products = allFilteredProds;
            if (categoryData.filterableAttributes.isNotEmpty) {
              _filteredServerAttributes = categoryData.filterableAttributes;
            }
            _errorMessage = null;
          });
        },
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
        _products = [];
      });
    }
  }

  static List<FilterAttributeEntity> _extractQuestionAttributes(
    List<FilterAttributeEntity> attributes, {
    String? categoryId,
    String? categorySlug,
    String? categoryName,
  }) {
    return CategoryQuestionHelper.extractQuestions(
      attributes: attributes,
      categoryId: categoryId,
      categorySlug: categorySlug,
      categoryName: categoryName,
      maxQuestions: 3,
    );
  }

  String _formatQuestionTitle(FilterAttributeEntity attr) {
    final code = attr.filterCode.toLowerCase();
    if (code == 'price') {
      return 'Which budget are you looking for?';
    }
    return 'Choose your preferred ${attr.filterName}';
  }

  String _findAttributeName(String filterCode) {
    final match = _rawFilterAttributes.firstWhereOrNull((a) => a.filterCode == filterCode) ??
        _filterAttributes.firstWhereOrNull((a) => a.filterCode == filterCode);
    return match?.filterName ?? filterCode;
  }

  Widget _buildProductGridSliver(List<ProductEntity> items) {
    if (items.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
    final columns = gridColumnsFor(context);
    final rowCount = (items.length / columns).ceil();

    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, rowIndex) {
            final start = rowIndex * columns;
            final end = (start + columns) < items.length ? start + columns : items.length;
            final rowItems = items.sublist(start, end);

            return Padding(
              padding: EdgeInsets.only(
                bottom: AppSpacing.sameGroupItemSpacing.h,
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < columns; i++) ...[
                      if (i > 0)
                        SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
                      Expanded(
                        child: i < rowItems.length
                            ? ProductView(
                                product: rowItems[i],
                                onTap: (p) => context.goToProductDetail(
                                  p.id.toString(),
                                  slug: p.slug,
                                  productName: p.productName,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
          childCount: rowCount,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _products.isEmpty) {
      return AppLoader.sliver(
        padding: EdgeInsets.symmetric(vertical: 40.h),
      );
    }

    final allPrioritizedQuestions = CategoryQuestionHelper.extractQuestions(
      attributes: _rawFilterAttributes.isNotEmpty ? _rawFilterAttributes : _filterAttributes,
      categoryId: widget.category.id,
      categorySlug: widget.category.slug,
      categoryName: widget.category.name,
      maxQuestions: 3,
    );

    final unansweredQuestions = allPrioritizedQuestions
        .where((q) => !_activeAnswers.containsKey(q.filterCode))
        .toList();

    final isFilteredMode = _activeAnswers.isNotEmpty;
    final activeFiltersMap = {
      for (final e in _activeAnswers.entries)
        e.key: '${_findAttributeName(e.key)}: ${e.value.label}'
    };

    return SliverMainAxisGroup(
      slivers: [
        // ── 1. Child Categories Chips (UPPERCASE from /rest/V1/all-categories) ──
        BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, catState) {
            final rootCategories =
                catState.categories ?? const <CategoryEntity>[];
            CategoryEntity? matchedCategory;
            for (final c in rootCategories) {
              if ((widget.category.id.isNotEmpty && c.id.isNotEmpty && c.id == widget.category.id) ||
                  (widget.category.slug.isNotEmpty && c.slug.isNotEmpty && c.slug.toLowerCase() == widget.category.slug.toLowerCase()) ||
                  (widget.category.name.isNotEmpty && c.name.isNotEmpty &&
                      c.name.toLowerCase().trim() == widget.category.name.toLowerCase().trim())) {
                matchedCategory = c;
                break;
              }
            }
            final children = matchedCategory?.children ?? const <CategoryEntity>[];
            if (children.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());

            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  top: AppSpacing.groupToGroupSpacing.h / 2,
                  bottom: AppSpacing.sameGroupItemSpacing.h,
                ),
                child: ChildCategoryChipsWidget(
                  childCategories: children,
                  onChildSelected: (child) {
                    context.pushToCategoryProduct(
                      categoryId: child.id,
                      categoryName: child.name,
                      categorySlug: child.slug,
                    );
                  },
                ),
              ),
            );
          },
        ),

        // ── ACTIVE FILTER CHIPS (Displayed when any question answered) ──
        if (isFilteredMode)
          SliverToBoxAdapter(
            child: ActiveFilterChipsBar(
              activeFilters: activeFiltersMap,
              onRemoveFilter: _onRemoveFilter,
              onClearAll: _onClearAllFilters,
            ),
          ),

        if (_products.isEmpty && !_isLoading && _errorMessage != null) ...[
          NoInternetPage.sliver(
            type: ConnectivityUtils.isNoInternet(_errorMessage, context)
                ? AppErrorType.noInternet
                : AppErrorType.server,
            message: ConnectivityUtils.isNoInternet(_errorMessage, context)
                ? null
                : _errorMessage,
            onRetry: () => _loadCategoryData(forceRefresh: true),
          ),
        ] else if (isFilteredMode) ...[
          // ── NEXT UNANSWERED QUESTION (Shifts into the question slot with pruned options) ──
          if (unansweredQuestions.isNotEmpty)
            SliverToBoxAdapter(
              child: Builder(
                builder: (context) {
                  final nextQuestion = CategoryQuestionHelper.pruneQuestionOptions(
                    question: unansweredQuestions.first,
                    currentProducts: _products,
                    currentServerAttributes: _filteredServerAttributes,
                  );

                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: AppSpacing.sameGroupItemSpacing.h,
                    ),
                    child: QuestionFilterWidget(
                      questionTitle: _formatQuestionTitle(nextQuestion),
                      options: nextQuestion.items.map((i) => i.label).toList(),
                      selectedOption: null,
                      onOptionSelected: (opt) {
                        if (opt != null) _onAnswerQuestion(nextQuestion, opt);
                      },
                    ),
                  );
                },
              ),
            ),

          // ── ALL FILTERED PRODUCTS (Continuous grid) ──
          if (_products.isNotEmpty) ...[
            _buildProductGridSliver(_products),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 90.h + MediaQuery.paddingOf(context).bottom,
              ),
            ),
          ] else if (!_isLoading)
            AppEmptyView.sliver(
              icon: Icons.search_off_rounded,
              title: 'No Matching Products',
              subtitle: _errorMessage != null
                  ? "Couldn't load products for ${widget.category.name}"
                  : 'No products match your selected filters in ${widget.category.name}',
              primaryButtonText: 'Reset All Filters',
              primaryButtonIcon: Icons.refresh_rounded,
              onPrimaryAction: _onClearAllFilters,
              isCompact: true,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
            ),
        ] else ...[
          // ── UNFILTERED DEFAULT MODE ──
          if (_products.isEmpty && !_isLoading)
            AppEmptyView.sliver(
              icon: Icons.inventory_2_outlined,
              title: 'No Products in ${widget.category.name}',
              subtitle: _errorMessage != null
                  ? "Couldn't load products for ${widget.category.name}. Please try again later."
                  : 'There are currently no products available in ${widget.category.name}. Check back soon or explore other categories!',
              primaryButtonText: 'Explore Categories',
              primaryButtonIcon: Icons.explore_outlined,
              onPrimaryAction: widget.onViewAll,
              isCompact: true,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 64.h),
            )
          else ...[
            // Q1 (if available)
            if (unansweredQuestions.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: AppSpacing.sameGroupItemSpacing.h,
                  ),
                  child: QuestionFilterWidget(
                    questionTitle: _formatQuestionTitle(unansweredQuestions[0]),
                    options: unansweredQuestions[0].items.map((i) => i.label).toList(),
                    selectedOption: null,
                    onOptionSelected: (opt) {
                      if (opt != null) _onAnswerQuestion(unansweredQuestions[0], opt);
                    },
                  ),
                ),
              ),

            // Top Title - View All >
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: AppSpacing.sameGroupItemSpacing.h,
                ),
                child: AppSectionHeader(
                  title: 'Top Featured ${widget.category.name} Offers',
                  onViewAll: widget.onViewAll,
                ),
              ),
            ),

            // ── 1. First 4 Products ──
            if (_products.take(4).isNotEmpty)
              _buildProductGridSliver(_products.take(4).toList()),

            // ── 2. Q2 (if available) ──
            if (unansweredQuestions.length > 1)
              SliverToBoxAdapter(
                child: Builder(
                  builder: (context) {
                    final q2 = CategoryQuestionHelper.pruneQuestionOptions(
                      question: unansweredQuestions[1],
                      currentProducts: _products,
                      currentServerAttributes: _filteredServerAttributes,
                    );

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSpacing.sameGroupItemSpacing.h,
                      ),
                      child: QuestionFilterWidget(
                        questionTitle: _formatQuestionTitle(q2),
                        options: q2.items.map((i) => i.label).toList(),
                        selectedOption: null,
                        onOptionSelected: (opt) {
                          if (opt != null) _onAnswerQuestion(q2, opt);
                        },
                        isSecondary: true,
                      ),
                    );
                  },
                ),
              ),

            // ── 3. Next 8 Products (Products 5-12) ──
            if (_products.skip(4).take(8).isNotEmpty)
              _buildProductGridSliver(_products.skip(4).take(8).toList()),

            // ── 4. Q3 (if available) ──
            if (unansweredQuestions.length > 2)
              SliverToBoxAdapter(
                child: Builder(
                  builder: (context) {
                    final q3 = CategoryQuestionHelper.pruneQuestionOptions(
                      question: unansweredQuestions[2],
                      currentProducts: _products,
                      currentServerAttributes: _filteredServerAttributes,
                    );

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSpacing.sameGroupItemSpacing.h,
                      ),
                      child: QuestionFilterWidget(
                        questionTitle: _formatQuestionTitle(q3),
                        options: q3.items.map((i) => i.label).toList(),
                        selectedOption: null,
                        onOptionSelected: (opt) {
                          if (opt != null) _onAnswerQuestion(q3, opt);
                        },
                        isSecondary: true,
                      ),
                    );
                  },
                ),
              ),

            // ── 5. Remaining 8 Products (Products 13-20) ──
            if (_products.skip(12).take(8).isNotEmpty)
              _buildProductGridSliver(_products.skip(12).take(8).toList()),

            // Bottom View All Button
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.sameGroupItemSpacing.w,
                  AppSpacing.groupToGroupSpacing.h,
                  AppSpacing.sameGroupItemSpacing.w,
                  200.h,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: widget.onViewAll,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pickabooBlue,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'VIEW ALL ${widget.category.name.toUpperCase()}',
                      style: AppTypography.buttonPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ],
    );
  }
}
