import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/bloc/seller_products_bloc/seller_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';

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
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: BlocBuilder<SellerProductsBloc, SellerProductsState>(
          builder: (context, state) {
            return Text(state.sellerData?.vendorName ?? widget.sellerName);
          },
        ),
        actions: [
          AppBarButton(
            onPressed: () {
              context.push(Routes.search);
            },
            iconPath: 'assets/new/svg/search_icon.svg',
            width: 22.w,
            height: 20.h,
            iconColor: colors.primary,
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

              return AppBarButton(
                onPressed: () {
                  context.push(Routes.cart);
                },
                iconPath: 'assets/new/svg/cart_icon.svg',
                width: 22.w,
                height: 20.h,
                iconColor: colors.primary,
                showBadge: cartCount > 0,
                badgeCount: cartCount,
              );
            },
          ),
          SizedBox(width: 8.w),
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
                return Center(
                  child: CircularProgressIndicator(
                    color: colors.primary,
                    strokeWidth: 2.w,
                  ),
                );
              }

              if (state.pagingState.error != null && allProducts.isEmpty) {
                return AppErrorView(
                  type: AppErrorType.generic,
                  title: "Couldn't load products",
                  message:
                      'Something went wrong while loading these products. '
                      'Please try again in a moment.',
                  retryLabel: 'Try Again',
                  onRetry: () {
                    context.read<SellerProductsBloc>().add(
                      SellerProductsEvent.refresh(shopUrl: widget.shopUrl),
                    );
                  },
                );
              }

              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: _buildSellerHeader(colors, textStyle, sellerData),
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
                                color: colors.textMedium,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),

                  _buildProductsGrid(state, colors, context),

                  if (allProducts.isEmpty && !state.pagingState.isLoading)
                    SliverFillRemaining(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.inventory_2_outlined,
                              size: 64.sp,
                              color: colors.gray,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'No products found',
                              style: context.textStyle.bodyLarge.withColor(
                                colors.text,
                              ),
                            ),
                          ],
                        ),
                      ),
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
    AppColors colors,
    AppTextStyles textStyle,
    dynamic sellerData,
  ) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.05),
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
              color: colors.whiteSmoke,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: colors.borderColor.withValues(alpha: 0.5),
              ),
            ),
            child: widget.sellerLogo != null && widget.sellerLogo!.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CachedNetworkImage(
                      imageUrl: widget.sellerLogo!,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: colors.primary,
                          strokeWidth: 2,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.store, color: colors.gray, size: 32.sp),
                    ),
                  )
                : Icon(Icons.store, color: colors.primary, size: 32.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sellerData?.vendorName ?? widget.sellerName,
                  style: textStyle.bodyLargeBold.copyWith(color: colors.text),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (sellerData != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    '${sellerData.totalCount} products available',
                    style: textStyle.bodySmall.copyWith(
                      color: colors.textMedium,
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
          firstPageErrorIndicatorBuilder: (context) => _buildErrorState(),
          newPageErrorIndicatorBuilder: (context) => const SizedBox(),
          firstPageProgressIndicatorBuilder: (context) =>
              Center(child: CircularProgressIndicator(color: colors.primary)),
          newPageProgressIndicatorBuilder: (context) => Padding(
            padding: EdgeInsets.all(16.w),
            child: Center(
              child: CircularProgressIndicator(color: colors.primary),
            ),
          ),
          noItemsFoundIndicatorBuilder: (context) =>
              _buildEmptyState("No products found", colors),
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
    return AppErrorView(
      type: AppErrorType.generic,
      title: "Couldn't load products",
      message: 'Something went wrong while loading these products. '
          'Please try again in a moment.',
      retryLabel: 'Try Again',
      onRetry: () {
        context.read<SellerProductsBloc>().add(
          SellerProductsEvent.refresh(shopUrl: widget.shopUrl),
        );
      },
    );
  }

  Widget _buildEmptyState(String message, AppColors colors) {
    final textStyle = context.textStyle;
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag_outlined, size: 64.sp, color: colors.gray),
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
