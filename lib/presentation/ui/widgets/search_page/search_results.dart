import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/list_product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';

class SearchResults extends StatelessWidget {
  final bool isGridView;

  final bool hasActiveFilters;

  final VoidCallback? onClearFilters;

  const SearchResults({
    super.key,
    this.isGridView = true,
    this.hasActiveFilters = false,
    this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final pagingState = state.pagingState;

        if (state.correctedQuery != null) {
          return SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: EdgeInsets.all(12.h),
                  color: colors.orange.withValues(alpha: 0.1),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: colors.orange,
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          'Did you mean "${state.correctedQuery}"?',
                          style: context.textStyle.bodyLarge.copyWith(
                            color: colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          );
        }

        if (pagingState.isLoading &&
            (pagingState.pages == null || pagingState.pages!.isEmpty)) {
          return SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(color: colors.primary),
            ),
          );
        }

        if (pagingState.error != null &&
            (pagingState.pages == null || pagingState.pages!.isEmpty)) {
          return SliverFillRemaining(
            child: _buildErrorState(context),
          );
        }

        if (pagingState.pages == null || pagingState.pages!.isEmpty) {
          return SliverFillRemaining(
            child: _buildEmptyState(
              "Start typing to search for products",
              colors,
              context,
            ),
          );
        }

        if (isGridView) {
          return _buildGridView(state, colors, context);
        } else {
          return _buildListView(state, colors, context);
        }
      },
    );
  }

  Widget _buildGridView(
    SearchState state,
    AppColors colors,
    BuildContext context,
  ) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: PagedSliverAlignedGrid<int, ProductEntity>(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        gridDelegateBuilder: (int childCount) {
          return SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridColumnsFor(context),
          );
        },
        builderDelegate: PagedChildBuilderDelegate<ProductEntity>(
          firstPageErrorIndicatorBuilder: (context) =>
              _buildErrorState(context),
          newPageErrorIndicatorBuilder: (context) => const SizedBox(),
          firstPageProgressIndicatorBuilder: (context) =>
              Center(child: CircularProgressIndicator(color: colors.primary)),
          noItemsFoundIndicatorBuilder: (context) =>
              _buildNoProductsState(colors, context),
          itemBuilder: (context, product, index) {
            return ProductView(
              product: product,
              onTap: (product) {
                context.goToProductDetail(
                product.id.toString(),
                slug: product.slug,
                productName: product.productName,
              );
              },
            );
          },
        ),
        state: state.pagingState,
        fetchNextPage: () {
          context.read<SearchBloc>().add(const SearchEvent.searchLoadMore());
        },
      ),
    );
  }

  Widget _buildListView(
    SearchState state,
    AppColors colors,
    BuildContext context,
  ) {
    return PagedSliverList<int, ProductEntity>(
      builderDelegate: PagedChildBuilderDelegate<ProductEntity>(
        firstPageErrorIndicatorBuilder: (context) =>
            _buildErrorState(context),
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
        noItemsFoundIndicatorBuilder: (context) =>
            _buildNoProductsState(colors, context),
        itemBuilder: (context, product, index) {
          return ListProductView(
            product: product,
            onTap: (product) {
              context.goToProductDetail(
                product.id.toString(),
                slug: product.slug,
                productName: product.productName,
              );
            },
          );
        },
      ),
      state: state.pagingState,
      fetchNextPage: () {
        context.read<SearchBloc>().add(const SearchEvent.searchLoadMore());
      },
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return AppErrorView(
      type: AppErrorType.generic,
      title: "Couldn't load results",
      message: 'Something went wrong while loading your search results. '
          'Please try again in a moment.',
      retryLabel: 'Try Again',
      onRetry: () {
        context.read<SearchBloc>().add(const SearchEvent.searchRefresh());
      },
    );
  }

  Widget _buildNoProductsState(AppColors colors, BuildContext context) {
    final textStyle = context.textStyle;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 64.sp, color: colors.gray),
          SizedBox(height: 16.h),
          Text(
            hasActiveFilters
                ? 'No products match your filters'
                : 'No products found',
            textAlign: TextAlign.center,
            style: textStyle.bodyLarge.withColor(colors.text),
          ),
          if (hasActiveFilters) ...[
            SizedBox(height: 8.h),
            Text(
              'Try removing a filter to see more.',
              textAlign: TextAlign.center,
              style: textStyle.bodySmall.withColor(colors.gray),
            ),
            SizedBox(height: 16.h),
            OutlinedButton(
              onPressed: onClearFilters,
              style: OutlinedButton.styleFrom(
                foregroundColor: colors.primary,
                side: BorderSide(color: colors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: const Text('Clear all filters'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyState(
    String message,
    AppColors colors,
    BuildContext context,
  ) {
    final textStyle = context.textStyle;
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64.sp, color: colors.gray),
          SizedBox(height: 16.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: textStyle.bodyLarge.copyWith(color: colors.gray),
          ),
        ],
      ),
    );
  }
}
