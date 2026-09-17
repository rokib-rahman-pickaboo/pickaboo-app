import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/category_question_helper.dart';
import 'package:pickaboo/presentation/ui/widgets/common/list_product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/filters/question_filter_widget.dart';
import 'package:pickaboo/presentation/bloc/special_category_products_bloc/special_category_products_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// ============================================================================
/// 📦 INTERLEAVED SPECIAL CATEGORY PRODUCT RESULTS
///
/// Interleaving Schedule:
///   2 Products + Q1 + 4 Products + Q2 + 8 Products + Q3 + Remaining Products
///
/// Dynamic Shifting:
///   - If user answers Q1, data is filtered, and Q2 shifts to Q1's place.
/// ============================================================================
class SpecialCategoryProductResults extends StatefulWidget {
  final bool isGridView;
  final String? categorySlug;
  final String? categoryName;
  final void Function(ProductEntity)? onProductSelected;

  const SpecialCategoryProductResults({
    super.key,
    this.isGridView = true,
    this.categorySlug,
    this.categoryName,
    this.onProductSelected,
  });

  @override
  State<SpecialCategoryProductResults> createState() =>
      _SpecialCategoryProductResultsState();
}

class _SpecialCategoryProductResultsState
    extends State<SpecialCategoryProductResults> {
  List<Widget> _rows = const [];
  List<List<ProductEntity>>? _lastPages;
  bool? _lastIsGridView;
  int? _lastColumns;
  Map<String, List<String>>? _lastFilters;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _lastPages = null;
  }

  void _handleProductTap(BuildContext context, ProductEntity product) {
    if (widget.onProductSelected != null && context.useTwoPane) {
      widget.onProductSelected!(product);
    } else {
      context.goToProductDetail(
        product.id.toString(),
        slug: product.slug,
        productName: product.productName,
        product: product,
      );
    }
  }

  List<FilterAttributeEntity> _extractQuestionAttributes(
    List<FilterAttributeEntity> attributes,
    String? fallbackSlug,
  ) {
    return CategoryQuestionHelper.extractQuestions(
      attributes: attributes,
      categorySlug: widget.categorySlug ?? fallbackSlug,
      categoryName: widget.categoryName,
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialCategoryProductsBloc, SpecialCategoryProductsState>(
      buildWhen: (previous, current) =>
          !identical(previous.pagingState.pages, current.pagingState.pages) ||
          previous.pagingState.isLoading != current.pagingState.isLoading ||
          previous.pagingState.error != current.pagingState.error ||
          previous.pagingState.hasNextPage != current.pagingState.hasNextPage ||
          previous.currentFilters != current.currentFilters ||
          !identical(previous.facetAttributes, current.facetAttributes),
      builder: (context, state) {
        final pagingState = state.pagingState;

        final hasItems =
            pagingState.pages?.any((page) => page.isNotEmpty) ?? false;
        if (!hasItems && !pagingState.isLoading) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }

        if (widget.isGridView) {
          return _buildGridView(state, context);
        } else {
          return _buildListView(state, context);
        }
      },
    );
  }

  Widget _buildGridView(
    SpecialCategoryProductsState state,
    BuildContext context,
  ) {
    final paging = state.pagingState;
    final columns = gridColumnsFor(context);

    if (!identical(paging.pages, _lastPages) ||
        _lastIsGridView != widget.isGridView ||
        _lastColumns != columns ||
        !identical(state.currentFilters, _lastFilters)) {
      _rows = _buildInterleavedRows(context, paging.pages, columns, state);
      _lastPages = paging.pages;
      _lastIsGridView = widget.isGridView;
      _lastColumns = columns;
      _lastFilters = state.currentFilters;
    }

    final rows = _rows;
    final hasItems = rows.isNotEmpty;

    return SliverMainAxisGroup(
      slivers: [
        // ── Interleaved Product Rows & Questions ──
        SliverPadding(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.sameGroupItemSpacing.h,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index == rows.length - 1) {
                _maybeFetchNextPage(context, state);
              }
              return rows[index];
            }, childCount: rows.length),
          ),
        ),

        if (paging.isLoading && hasItems)
          AppLoader.sliver(),

        if (paging.error != null && hasItems && !paging.isLoading)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
              child: Center(
                child: Text(
                  "Couldn't load more items",
                  style: AppTypography.bodyTiny.copyWith(color: AppColors.muted),
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// Builds rows with dynamic API filter interleaving schedule:
  /// 2 Products -> Q1 -> 4 Products -> Q2 -> 8 Products -> Q3 -> Remaining Products
  List<Widget> _buildInterleavedRows(
    BuildContext context,
    List<List<ProductEntity>>? pages,
    int columns,
    SpecialCategoryProductsState state,
  ) {
    final allItems = pages?.expand((page) => page).toList() ?? const [];
    if (allItems.isEmpty) return const [];

    final allQuestions =
        _extractQuestionAttributes(state.facetAttributes, state.categorySlug);
    // ========================================================================
    // 🛑 NOTE: Filter out already-answered questions AND any questions that
    // have <= 1 option (e.g. price with single range "30 - 922990"),
    // because a question with only 1 option cannot offer a meaningful choice.
    // This rule must always be maintained in future updates.
    // ========================================================================
    final unansweredQuestions = allQuestions
        .where((q) => q.items.length > 1 && !(state.currentFilters?.containsKey(q.filterCode) ?? false))
        .toList();

    // 2 Products -> Q1, + 4 Products (6) -> Q2, + 8 Products (14) -> Q3
    const insertionThresholds = [2, 6, 14];

    final rows = <Widget>[];
    int currentInsertedQuestions = 0;

    for (int start = 0; start < allItems.length; start += columns) {
      final end = (start + columns) < allItems.length
          ? start + columns
          : allItems.length;
      final rowItems = allItems.sublist(start, end);

      rows.add(
        Padding(
          key: ValueKey('spec_row_${rowItems.first.id}'),
          padding: EdgeInsets.only(
            left: AppSpacing.sameGroupItemSpacing.w,
            right: AppSpacing.sameGroupItemSpacing.w,
            bottom: AppSpacing.sameGroupItemSpacing.h,
          ),
          child: RepaintBoundary(
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < columns; i++) ...[
                    if (i > 0) SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
                    Expanded(
                      child: i < rowItems.length
                          ? ProductView(
                              product: rowItems[i],
                              onTap: (p) => _handleProductTap(context, p),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );

      final productsSoFar = end;
      // Check if we passed the next question insertion threshold
      if (currentInsertedQuestions < insertionThresholds.length &&
          currentInsertedQuestions < unansweredQuestions.length) {
        final targetThreshold = insertionThresholds[currentInsertedQuestions];
        if (productsSoFar >= targetThreshold && start < targetThreshold) {
          final rawFilter = unansweredQuestions[currentInsertedQuestions];
          final allLoadedProducts =
              state.pagingState.pages?.expand((page) => page).toList() ?? [];
          final filter = CategoryQuestionHelper.pruneQuestionOptions(
            question: rawFilter,
            currentProducts: allLoadedProducts,
            currentServerAttributes: state.categoryData?.filterableAttributes,
          );

          // NOTE: Skip question if it has <= 1 option
          if (filter.items.length > 1) {
            rows.add(
              Padding(
                key: ValueKey('spec_question_filter_${filter.filterCode}'),
                padding: EdgeInsets.only(bottom: AppSpacing.sameGroupItemSpacing.h),
                child: QuestionFilterWidget(
                  questionTitle: _formatQuestionTitle(filter),
                  options: filter.items.map((i) => i.label).toList(),
                  selectedOption: null,
                  onOptionSelected: (opt) {
                    if (opt != null) {
                      final match =
                          filter.items.firstWhereOrNull((i) => i.label == opt);
                      if (match != null) {
                        final updatedFilters = Map<String, List<String>>.from(
                          state.currentFilters ?? {},
                        );
                        updatedFilters[filter.filterCode] = [
                          match.value.toString(),
                        ];
                        context.read<SpecialCategoryProductsBloc>().add(
                          SpecialCategoryProductsEvent.applyFilters(
                            categorySlug:
                                widget.categorySlug ?? state.categorySlug,
                            filters: updatedFilters,
                          ),
                        );
                      }
                    }
                  },
                  isSecondary: true,
                ),
              ),
            );
          }
          currentInsertedQuestions++;
        }
      }
    }

    return rows;
  }

  void _maybeFetchNextPage(
    BuildContext context,
    SpecialCategoryProductsState state,
  ) {
    final paging = state.pagingState;
    if (!paging.hasNextPage || paging.isLoading) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SpecialCategoryProductsBloc>().add(
        SpecialCategoryProductsEvent.getProducts(
          categorySlug: widget.categorySlug ?? state.categorySlug,
        ),
      );
    });
  }

  Widget _buildListView(
    SpecialCategoryProductsState state,
    BuildContext context,
  ) {
    final allQuestions =
        _extractQuestionAttributes(state.facetAttributes, state.categorySlug);
    // ========================================================================
    // 🛑 NOTE: Filter out already-answered questions AND any questions that
    // have <= 1 option (e.g. price with single range "30 - 922990"),
    // because a question with only 1 option cannot offer a meaningful choice.
    // This rule must always be maintained in future updates.
    // ========================================================================
    final unansweredQuestions = allQuestions
        .where((q) => q.items.length > 1 && !(state.currentFilters?.containsKey(q.filterCode) ?? false))
        .toList();

    const insertionThresholds = [2, 6, 14];
    final allItems =
        state.pagingState.pages?.expand((p) => p).toList() ?? const [];

    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.sameGroupItemSpacing.h,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          if (index == allItems.length - 1) {
            _maybeFetchNextPage(context, state);
          }

          final product = allItems[index];
          final productNumber = index + 1;

          // Check if dynamic question should follow this product
          Widget? questionWidget;
          for (int qIdx = 0; qIdx < insertionThresholds.length; qIdx++) {
            if (productNumber == insertionThresholds[qIdx] &&
                qIdx < unansweredQuestions.length) {
              final rawFilter = unansweredQuestions[qIdx];
              final filter = CategoryQuestionHelper.pruneQuestionOptions(
                question: rawFilter,
                currentProducts: allItems,
                currentServerAttributes: state.categoryData?.filterableAttributes,
              );

              // NOTE: Skip question if it has <= 1 option
              if (filter.items.length > 1) {
                questionWidget = Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.h,
                  ),
                  child: QuestionFilterWidget(
                    questionTitle: _formatQuestionTitle(filter),
                    options: filter.items.map((i) => i.label).toList(),
                    selectedOption: null,
                    onOptionSelected: (opt) {
                      if (opt != null) {
                        final match =
                            filter.items.firstWhereOrNull((i) => i.label == opt);
                        if (match != null) {
                          final updatedFilters = Map<String, List<String>>.from(
                            state.currentFilters ?? {},
                          );
                          updatedFilters[filter.filterCode] = [
                            match.value.toString(),
                          ];
                          context.read<SpecialCategoryProductsBloc>().add(
                            SpecialCategoryProductsEvent.applyFilters(
                              categorySlug:
                                  widget.categorySlug ?? state.categorySlug,
                              filters: updatedFilters,
                            ),
                          );
                        }
                      }
                    },
                    isSecondary: true,
                  ),
                );
              }
              break;
            }
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListProductView(
                product: product,
                onTap: (prod) => _handleProductTap(context, prod),
              ),
              if (questionWidget != null) questionWidget,
            ],
          );
        }, childCount: allItems.length),
      ),
    );
  }
}
