import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/list_product_view.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

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
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final pagingState = state.pagingState;

        final Widget resultsSliver = isGridView
            ? _buildGridView(state, context)
            : _buildListView(state, context);

        if (state.correctedQuery != null) {
          return SliverMainAxisGroup(
            slivers: [
              _buildCorrectedQueryBanner(context, state.correctedQuery!),
              resultsSliver,
            ],
          );
        }

        if (pagingState.isLoading &&
            (pagingState.pages == null || pagingState.pages!.isEmpty)) {
          return const SliverFillRemaining(
            child: AppLoader.fullPage(),
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
            child: _buildInitialSearchPrompt(context),
          );
        }

        if (isGridView) {
          return _buildGridView(state, context);
        } else {
          return _buildListView(state, context);
        }
      },
    );
  }

  Widget _buildGridView(
    SearchState state,
    BuildContext context,
  ) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: AppSpacing.sameGroupItemSpacing.h,
      ),
      sliver: PagedSliverAlignedGrid<int, ProductEntity>(
        mainAxisSpacing: AppSpacing.sameGroupItemSpacing.h,
        crossAxisSpacing: AppSpacing.sameGroupItemSpacing.w,
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
              const AppLoader.fullPage(),
          noItemsFoundIndicatorBuilder: (context) =>
              _buildNoProductsState(context),
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
    BuildContext context,
  ) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.sameGroupItemSpacing.h,
      ),
      sliver: PagedSliverList<int, ProductEntity>(
        builderDelegate: PagedChildBuilderDelegate<ProductEntity>(
          firstPageErrorIndicatorBuilder: (context) =>
              _buildErrorState(context),
          newPageErrorIndicatorBuilder: (context) => Padding(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Center(
              child: Text(
                "Couldn't load more items",
                style: context.textStyle.caption.copyWith(color: AppColors.muted),
              ),
            ),
          ),
          firstPageProgressIndicatorBuilder: (context) =>
              const AppLoader.fullPage(),
          newPageProgressIndicatorBuilder: (context) =>
              const AppLoader.pagination(),
          noItemsFoundIndicatorBuilder: (context) =>
              _buildNoProductsState(context),
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
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    final isOffline = ConnectivityUtils.isOffline(context);
    return AppErrorView(
      type: isOffline ? AppErrorType.noInternet : AppErrorType.generic,
      title: isOffline ? 'No Internet Connection' : "Couldn't load results",
      message: isOffline
          ? 'Please check your network and try again.'
          : 'Something went wrong while loading your search results. '
              'Please try again in a moment.',
      retryLabel: 'Try Again',
      onRetry: () {
        context.read<SearchBloc>().add(const SearchEvent.searchRefresh());
      },
    );
  }

  Widget _buildNoProductsState(BuildContext context) {
    return AppEmptyView.search(
      hasActiveFilters: hasActiveFilters,
      onClearFilters: onClearFilters,
      isCompact: true,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
    );
  }

  Widget _buildInitialSearchPrompt(BuildContext context) {
    return AppEmptyView.searchPrompt(
      isCompact: true,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
    );
  }

  Widget _buildCorrectedQueryBanner(
    BuildContext context,
    String correctedQuery,
  ) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          context.read<SearchBloc>().add(
                SearchEvent.searchSubmitted(query: correctedQuery),
              );
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppSpacing.sameGroupItemSpacing.w,
            vertical: 4.h,
          ),
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
            color: AppColors.orange.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.orange,
                size: 16.sp,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'Did you mean "$correctedQuery"?',
                  style: context.textStyle.bodyLarge.copyWith(
                    color: AppColors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
