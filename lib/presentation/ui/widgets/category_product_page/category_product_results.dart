import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/list_product_view.dart';
import 'package:pickaboo/presentation/bloc/category_products_bloc/category_products_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/category_product_page/inline_filter.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';

class CategoryProductResults extends StatefulWidget {
  final bool isGridView;

  final void Function(ProductEntity)? onProductSelected;

  const CategoryProductResults({
    super.key,
    this.isGridView = true,
    this.onProductSelected,
  });

  @override
  State<CategoryProductResults> createState() => _CategoryProductResultsState();
}

class _CategoryProductResultsState extends State<CategoryProductResults> {
  List<Widget> _rows = const [];
  List<List<ProductEntity>>? _lastPages;
  bool? _lastIsGridView;
  int? _lastColumns;

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
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocBuilder<CategoryProductsBloc, CategoryProductsState>(
      buildWhen: (previous, current) =>
          !identical(previous.pagingState.pages, current.pagingState.pages) ||
          previous.pagingState.isLoading != current.pagingState.isLoading ||
          previous.pagingState.error != current.pagingState.error ||
          previous.pagingState.hasNextPage != current.pagingState.hasNextPage,
      builder: (context, state) {
        final pagingState = state.pagingState;

        final hasItems =
            pagingState.pages?.any((page) => page.isNotEmpty) ?? false;
        if (!hasItems) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }

        if (widget.isGridView) {
          return _buildGridView(state, colors, context);
        } else {
          return _buildListView(state, colors, context);
        }
      },
    );
  }

  static const int _chunkSize = 8;

  Widget _buildGridView(
    CategoryProductsState state,
    AppColors colors,
    BuildContext context,
  ) {
    final paging = state.pagingState;
    final columns = gridColumnsFor(context);

    if (!identical(paging.pages, _lastPages) ||
        _lastIsGridView != widget.isGridView ||
        _lastColumns != columns) {
      _rows = _buildRows(context, paging.pages, columns);
      _lastPages = paging.pages;
      _lastIsGridView = widget.isGridView;
      _lastColumns = columns;
    }

    final rows = _rows;
    final hasItems = rows.isNotEmpty;

    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Center(
                child: CircularProgressIndicator(color: colors.primary),
              ),
            ),
          ),

        if (paging.error != null && hasItems && !paging.isLoading)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Center(
                child: Text(
                  "Couldn't load more items",
                  style: context.textStyle.caption.copyWith(color: colors.gray),
                ),
              ),
            ),
          ),
      ],
    );
  }

  List<Widget> _buildRows(
    BuildContext context,
    List<List<ProductEntity>>? pages,
    int columns,
  ) {
    final items = pages?.expand((page) => page).toList() ?? const [];
    if (items.isEmpty) return const [];

    final rows = <Widget>[];

    for (int start = 0; start < items.length; start += columns) {
      final end = (start + columns) < items.length
          ? start + columns
          : items.length;
      final rowItems = items.sublist(start, end);

      rows.add(
        Padding(
          key: ValueKey('cat_row_${rowItems.first.id}'),
          padding: EdgeInsets.only(bottom: 12.h),
          child: RepaintBoundary(
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < columns; i++) ...[
                    if (i > 0) SizedBox(width: 12.w),
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
      if (productsSoFar % _chunkSize == 0 && productsSoFar < items.length) {
        final filterIndex = (productsSoFar ~/ _chunkSize) - 1;
        rows.add(
          Padding(
            key: ValueKey('cat_inline_filter_$filterIndex'),
            padding: EdgeInsets.only(bottom: 12.h),
            child: InlineFilter(filterIndex: filterIndex),
          ),
        );
      }
    }

    return rows;
  }

  void _maybeFetchNextPage(BuildContext context, CategoryProductsState state) {
    final paging = state.pagingState;
    if (!paging.hasNextPage || paging.isLoading) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryProductsBloc>().add(
        CategoryProductsEvent.getProducts(categoryKey: state.categoryKey),
      );
    });
  }

  Widget _buildListView(
    CategoryProductsState state,
    AppColors colors,
    BuildContext context,
  ) {
    return PagedSliverList<int, ProductEntity>(
      builderDelegate: PagedChildBuilderDelegate<ProductEntity>(
        firstPageErrorIndicatorBuilder: (context) =>
            _buildErrorState(context, state),
        newPageErrorIndicatorBuilder: (context) => Padding(
          padding: EdgeInsets.all(16.w),
          child: Center(
            child: Text(
              "Couldn't load more items",
              style: context.textStyle.caption.copyWith(color: colors.gray),
            ),
          ),
        ),
        firstPageProgressIndicatorBuilder: (context) =>
            Center(child: CircularProgressIndicator(color: colors.primary)),
        newPageProgressIndicatorBuilder: (context) => Padding(
          padding: EdgeInsets.all(16.w),
          child: Center(
            child: CircularProgressIndicator(color: colors.primary),
          ),
        ),
        noItemsFoundIndicatorBuilder: (context) => const SizedBox.shrink(),
        itemBuilder: (context, product, index) {
          if ((index + 1) % 8 == 0 && index > 0) {
            final filterIndex = ((index + 1) ~/ 8) - 1;
            return RepaintBoundary(
              child: Column(
                children: [
                  ListProductView(
                    product: product,
                    onTap: (product) => _handleProductTap(context, product),
                  ),
                  SizedBox(height: 8.h),
                  InlineFilter(filterIndex: filterIndex),
                ],
              ),
            );
          }
          return RepaintBoundary(
            child: ListProductView(
              product: product,
              onTap: (product) => _handleProductTap(context, product),
            ),
          );
        },
      ),
      state: state.pagingState,
      fetchNextPage: () {
        context.read<CategoryProductsBloc>().add(
          CategoryProductsEvent.getProducts(categoryKey: state.categoryKey),
        );
      },
    );
  }

  Widget _buildErrorState(BuildContext context, CategoryProductsState state) {
    return AppErrorView(
      type: AppErrorType.generic,
      title: "Couldn't load products",
      message:
          'Something went wrong while loading these products. '
          'Please try again in a moment.',
      retryLabel: 'Try Again',
      onRetry: () {
        context.read<CategoryProductsBloc>().add(
          CategoryProductsEvent.refresh(categoryKey: state.categoryKey),
        );
      },
    );
  }

}
