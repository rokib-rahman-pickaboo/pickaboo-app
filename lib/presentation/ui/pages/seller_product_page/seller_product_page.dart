// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/bloc/seller_products_bloc/seller_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_view.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/pages/no_internet_page/no_internet_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class SellerProductPage extends StatefulWidget {
  final String shopUrl;
  final String sellerName;
  final String? sellerLogo;

  const SellerProductPage({
    super.key,
    required this.shopUrl,
    required this.sellerName,
    this.sellerLogo,
  });

  @override
  State<SellerProductPage> createState() => _SellerProductPageState();
}

class _SellerProductPageState extends State<SellerProductPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<SellerProductsBloc>().add(
      SellerProductsEvent.getProducts(shopUrl: widget.shopUrl),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: PickabooAppBar(
        titleWidget: BlocBuilder<SellerProductsBloc, SellerProductsState>(
          builder: (context, state) {
            return Text(
              state.sellerData?.vendorName ?? widget.sellerName,
              style: AppTypography.pageTitle.copyWith(
                fontWeight: FontWeight.w900,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded, color: AppColors.navy, size: 22.sp),
            onPressed: () => context.push(Routes.search),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              final cartCount = cartState.maybeWhen(
                loaded: (cart) => cart.itemsCount,
                itemAdded: (cart, _) => cart.itemsCount,
                couponApplied: (cart, _) => cart.itemsCount,
                rewardPointsApplied: (cart, _) => cart.itemsCount,
                operationInProgress: (cart, _) => cart.itemsCount,
                orElse: () => 0,
              );

              return IconButton(
                icon: Badge(
                  isLabelVisible: cartCount > 0,
                  label: Text(
                    '$cartCount',
                    style: AppTypography.bodyTiny.bold().withColor(AppColors.white),
                  ),
                  backgroundColor: AppColors.pickabooBlue,
                  child: Icon(Icons.shopping_bag_outlined, color: AppColors.navy, size: 22.sp),
                ),
                onPressed: () => context.push(Routes.cart),
              );
            },
          ),
          SizedBox(width: 4.w),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<SellerProductsBloc>().add(
            SellerProductsEvent.refresh(shopUrl: widget.shopUrl),
          );
        },
        child: SafeArea(
          top: false,
          child: BlocBuilder<SellerProductsBloc, SellerProductsState>(
            builder: (context, state) {
              final sellerData = state.sellerData;
              final allProducts =
                  state.pagingState.pages?.expand((page) => page).toList() ??
                  [];

              if ((state.pagingState.pages?.isEmpty ?? true) &&
                  state.pagingState.isLoading) {
                return const AppLoader.fullPage();
              }

              if (state.pagingState.error != null && allProducts.isEmpty) {
                final isOffline = ConnectivityUtils.isNoInternet(
                  state.pagingState.error,
                  context,
                );
                return NoInternetPage(
                  type: isOffline
                      ? AppErrorType.noInternet
                      : AppErrorType.generic,
                  title: widget.sellerName,
                  message: isOffline
                      ? null
                      : 'Something went wrong while loading these products. '
                          'Please try again in a moment.',
                  onRetry: () {
                    context.read<SellerProductsBloc>().add(
                      SellerProductsEvent.refresh(shopUrl: widget.shopUrl),
                    );
                  },
                  onBack: Navigator.of(context).canPop()
                      ? () => Navigator.of(context).pop()
                      : null,
                );
              }

              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: _buildSellerHeader(textStyle, sellerData),
                  ),

                  if (sellerData != null)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${sellerData.totalCount} Products',
                              style: textStyle.bodyMedium.copyWith(
                                color: AppColors.muted,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),

                  _buildProductsGrid(state, context),

                  if (allProducts.isEmpty && !state.pagingState.isLoading)
                    AppEmptyView.sliver(
                      fillRemaining: true,
                      icon: Icons.inventory_2_outlined,
                      title: 'No Products Found',
                      subtitle: 'There are currently no products available from ${widget.sellerName}.',
                    ),

                  SliverToBoxAdapter(child: SizedBox(height: 24.h)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSellerHeader(
    AppTextStyles textStyle,
    dynamic sellerData,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: AppSpacing.groupToGroupSpacing.h,
      ),
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: AppColors.pageBg,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.5),
              ),
            ),
            child: widget.sellerLogo != null && widget.sellerLogo!.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CachedNetworkImage(
                      imageUrl: widget.sellerLogo!,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const AppLoader.inline(),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.store, color: AppColors.muted, size: 32.sp),
                    ),
                  )
                : Icon(Icons.store, color: AppColors.pickabooBlue, size: 32.sp),
          ),
          SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sellerData?.vendorName ?? widget.sellerName,
                  style: textStyle.bodyLargeBold.copyWith(color: AppColors.text),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (sellerData != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    '${sellerData.totalCount} products available',
                    style: textStyle.bodySmall.copyWith(
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsGrid(
    SellerProductsState state,
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
          firstPageErrorIndicatorBuilder: (context) => _buildErrorState(),
          newPageErrorIndicatorBuilder: (context) => const SizedBox(),
          firstPageProgressIndicatorBuilder: (context) =>
              const AppLoader.fullPage(),
          newPageProgressIndicatorBuilder: (context) =>
              const AppLoader.pagination(),
          noItemsFoundIndicatorBuilder: (context) =>
              _buildEmptyState("No products found"),
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
          context.read<SellerProductsBloc>().add(
            SellerProductsEvent.getProducts(shopUrl: widget.shopUrl),
          );
        },
      ),
    );
  }

  Widget _buildErrorState() {
    final isOffline = ConnectivityUtils.isOffline(context);
    return AppErrorView(
      type: isOffline ? AppErrorType.noInternet : AppErrorType.generic,
      title: isOffline ? 'No Internet Connection' : "Couldn't load products",
      message: isOffline
          ? 'Please check your network and try again.'
          : 'Something went wrong while loading these products. Please try again in a moment.',
      retryLabel: 'Try Again',
      onRetry: () {
        context.read<SellerProductsBloc>().add(
          SellerProductsEvent.refresh(shopUrl: widget.shopUrl),
        );
      },
    );
  }

  Widget _buildEmptyState(String message) {
    return AppEmptyView(
      icon: Icons.inventory_2_outlined,
      title: message,
      subtitle: 'There are currently no products available from ${widget.sellerName}.',
      isCompact: true,
      padding: EdgeInsets.all(24.w),
    );
  }
}
