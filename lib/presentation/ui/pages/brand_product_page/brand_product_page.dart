import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/brand_products/brand_products_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/brand_products_bloc/brand_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_flash_sale_bloc/product_flash_sale_bloc.dart';
import 'package:pickaboo/presentation/bloc/recommended_products_bloc/recommended_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/related_products_bloc/related_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/bloc/emi_bloc/emi_bloc.dart';
import 'package:pickaboo/presentation/bloc/cms_content_bloc/cms_content_bloc.dart';
import 'package:pickaboo/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:pickaboo/presentation/bloc/delivery_charge_bloc/delivery_charge_bloc.dart';
import 'package:pickaboo/presentation/bloc/place_picker_bloc/place_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/promo_bloc/promo_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/product_detail_page.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/brand_product_page/brand_filter_button.dart';
import 'package:pickaboo/presentation/ui/pages/brand_product_page/bottom_sheet/brand_filter_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/brand_product_page/brand_product_results.dart';
import 'package:pickaboo/presentation/ui/widgets/brand_product_page/brand_filter_chips.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';

class BrandProductPage extends StatefulWidget {
  final String? brandId;

  final String? brandSlug;

  final String brandName;

  const BrandProductPage({
    super.key,
    this.brandId,
    this.brandSlug,
    required this.brandName,
  }) : assert(
         brandId != null || brandSlug != null,
         'BrandProductPage needs a brandId or a brandSlug',
       );

  String get brandKey {
    final slug = brandSlug?.trim() ?? '';
    if (slug.isNotEmpty) return slug;
    return brandId?.trim() ?? '';
  }

  @override
  State<BrandProductPage> createState() => _BrandProductPageState();
}

class _BrandProductPageState extends State<BrandProductPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isGridView = true;

  ProductEntity? _selectedProduct;

  @override
  void initState() {
    super.initState();
    BrandFilterButton.getSavedViewMode().then((isGrid) {
      if (mounted && isGrid != _isGridView) {
        setState(() {
          _isGridView = isGrid;
        });
      }
    });
    final bloc = context.read<BrandProductsBloc>();
    final hasLoaded = bloc.state.pagingState.pages?.isNotEmpty ?? false;
    if (!hasLoaded && !bloc.state.pagingState.isLoading) {
      bloc.add(BrandProductsEvent.getProducts(brandKey: widget.brandKey));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _isLoggedIn(BuildContext context) => context
      .read<AuthBloc>()
      .state
      .maybeWhen(authenticated: (token, user) => true, orElse: () => false);

  static bool _hasItems(BrandProductsState state) =>
      state.pagingState.pages?.any((page) => page.isNotEmpty) ?? false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: BlocBuilder<BrandProductsBloc, BrandProductsState>(
          builder: (context, state) {
            return Text(
              (state.brandData?.brandName ?? widget.brandName).removeHtmlTags,
            );
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
          AppBarButton(
            onPressed: () {
              if (_isLoggedIn(context)) {
                context.push(Routes.wishlist);
              } else {
                context.push(Routes.login);
              }
            },
            iconPath: 'assets/new/svg/favorite_icon.svg',
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
      body: _wrapTwoPane(
        context,
        RefreshIndicator(
          onRefresh: () async {
            context.read<BrandProductsBloc>().add(
              BrandProductsEvent.refresh(brandKey: widget.brandKey),
            );
          },
          child: SafeArea(
            top: false,
            child: BlocBuilder<BrandProductsBloc, BrandProductsState>(
              buildWhen: (previous, current) =>
              !identical(previous.brandData, current.brandData) ||
                  !identical(previous.cachedFacets, current.cachedFacets) ||
                  previous.currentSort != current.currentSort ||
                  previous.currentFilters != current.currentFilters ||
                  previous.pagingState.isLoading !=
                      current.pagingState.isLoading ||
                  previous.pagingState.error != current.pagingState.error ||
                  (previous.pagingState.pages == null) !=
                      (current.pagingState.pages == null) ||
                  _hasItems(previous) != _hasItems(current),
              builder: (context, state) {
                final facetAttributes = state.facetAttributes;
                final facetSortOptions = state.facetSortOptions;
                final hasFacets = state.hasFacets;
                final hasProducts = _hasItems(state);
                final activeFilterCount =
                    state.currentFilters?.values.fold<int>(
                      0,
                          (sum, values) => sum + values.length,
                    ) ??
                        0;
                final hasActiveFilters = activeFilterCount > 0;

                if (!hasFacets &&
                    (state.pagingState.isLoading ||
                        state.pagingState.pages == null)) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: colors.primary,
                      strokeWidth: 2.w,
                    ),
                  );
                }

                if (state.pagingState.error != null &&
                    !hasProducts &&
                    !hasFacets) {
                  return AppErrorView(
                    type: AppErrorType.generic,
                    title: "Couldn't load products",
                    message:
                    'Something went wrong while loading this page. '
                        'Please try again in a moment.',
                    retryLabel: 'Try Again',
                    onRetry: () {
                      context.read<BrandProductsBloc>().add(
                        BrandProductsEvent.refresh(
                          brandKey: widget.brandKey,
                        ),
                      );
                    },
                  );
                }

                return CustomScrollView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    ...facetAttributes
                          .where((attr) => attr.specialForPhone)
                          .map(
                            (attr) => SliverToBoxAdapter(
                          child: BrandFilterChips(
                            attribute: attr,
                            currentFilters:
                            state.currentFilters ?? const {},
                            brandKey: widget.brandKey,
                          ),
                        ),
                      ),

                    if (hasFacets)
                      SliverToBoxAdapter(
                        child: BrandFilterButton(
                          sortOptions: facetSortOptions,
                          activeFilterCount: activeFilterCount,
                          activeSortLabel: _activeSortLabel(
                            facetSortOptions,
                            state.currentSort,
                          ),
                          onSortSelected: (sortValue) {
                            context.read<BrandProductsBloc>().add(
                              BrandProductsEvent.applySort(
                                brandKey: widget.brandKey,
                                sortValue: sortValue,
                              ),
                            );
                          },
                          onFilterTap: () {
                            if (facetAttributes.isNotEmpty) {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                useSafeArea: true,
                                backgroundColor: colors.black.withValues(
                                  alpha: 0.0,
                                ),
                                builder: (_) => BrandFilterBottomSheet(
                                  filterableAttributes: facetAttributes,
                                  initialFilters: state.currentFilters,
                                  onApply: (filters) {
                                    context.read<BrandProductsBloc>().add(
                                      BrandProductsEvent.applyFilters(
                                        brandKey: widget.brandKey,
                                        filters: filters,
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                          onViewModeChanged: (isGridView) {
                            setState(() {
                              _isGridView = isGridView;
                            });
                          },
                        ),
                      ),

                    BrandProductResults(
                      isGridView: _isGridView,
                      onProductSelected: (p) =>
                          setState(() => _selectedProduct = p),
                    ),

                    if (!hasProducts &&
                        state.pagingState.error != null)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 32.h),
                          child: AppErrorView(
                            type: AppErrorType.generic,
                            title: "Couldn't load products",
                            message:
                            'Something went wrong while loading these '
                                'products. Please try again in a moment.',
                            retryLabel: 'Try Again',
                            onRetry: () {
                              context.read<BrandProductsBloc>().add(
                                BrandProductsEvent.refresh(
                                  brandKey: widget.brandKey,
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                    if (!hasProducts &&
                        state.pagingState.error == null &&
                        (state.pagingState.isLoading ||
                            state.pagingState.pages == null))
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 48.h),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: colors.primary,
                              strokeWidth: 2.w,
                            ),
                          ),
                        ),
                      ),

                    if (!hasProducts &&
                        state.pagingState.error == null &&
                        !state.pagingState.isLoading &&
                        state.pagingState.pages != null)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 48.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.inventory_2_outlined,
                                size: 64.sp,
                                color: colors.gray,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                hasActiveFilters
                                    ? 'No products match your filters'
                                    : 'No products found',
                                textAlign: TextAlign.center,
                                style: context.textStyle.bodyLarge
                                    .withColor(colors.text),
                              ),
                              if (hasActiveFilters) ...[
                                SizedBox(height: 8.h),
                                Text(
                                  'Try removing a filter to see more.',
                                  textAlign: TextAlign.center,
                                  style: context.textStyle.bodySmall
                                      .withColor(colors.gray),
                                ),
                                SizedBox(height: 16.h),
                                OutlinedButton(
                                  onPressed: () {
                                    context
                                        .read<BrandProductsBloc>()
                                        .add(
                                      BrandProductsEvent.applyFilters(
                                        brandKey: widget.brandKey,
                                        filters: const {},
                                      ),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: colors.primary,
                                    side: BorderSide(color: colors.primary),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8.r,
                                      ),
                                    ),
                                  ),
                                  child: const Text('Clear all filters'),
                                ),
                              ],
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
      ),
    );
  }

  String? _activeSortLabel(List<SortOptionEntity> options, String? value) {
    if (value == null || value.isEmpty) return null;
    for (final option in options) {
      if (option.value == value) return option.title;
    }
    return null;
  }

  Widget _wrapTwoPane(BuildContext context, Widget list) {
    if (!context.useTwoPane) return list;
    return Row(
      children: [
        SizedBox(width: 360, child: list),
        const VerticalDivider(width: 1, thickness: 1),
        Expanded(child: _buildDetailPane(context)),
      ],
    );
  }

  Widget _buildDetailPane(BuildContext context) {
    final product = _selectedProduct;
    if (product == null) {
      return Center(
        child: Text(
          'Select a product to see its details',
          style: context.textStyle.bodyMedium.copyWith(
            color: context.colors.gray,
          ),
        ),
      );
    }
    return MultiBlocProvider(
      key: ValueKey(product.id),
      providers: [
        BlocProvider(create: (_) => getIt<ProductDetailBloc>()),
        BlocProvider(create: (_) => getIt<ProductFlashSaleBloc>()),
        BlocProvider(create: (_) => getIt<RecommendedProductsBloc>()),
        BlocProvider(create: (_) => getIt<RelatedProductsBloc>()),
        BlocProvider(create: (_) => getIt<ReviewBloc>()),
        BlocProvider(create: (_) => getIt<EmiBloc>()),
        BlocProvider(create: (_) => getIt<CmsContentBloc>()),
        BlocProvider(create: (_) => getIt<WishlistBloc>()),
        BlocProvider(create: (_) => getIt<DeliveryChargeBloc>()),
        BlocProvider(create: (_) => getIt<PlacePickerBloc>()),
        BlocProvider(create: (_) => getIt<PromoBloc>()),
      ],
      child: ProductDetailsPage(
        productId: product.id.toString(),
        slug: product.slug,
        productName: product.productName,
        embedded: true,
      ),
    );
  }
}
