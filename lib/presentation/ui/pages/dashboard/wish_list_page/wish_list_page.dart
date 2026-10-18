import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/wishlist/wishlist_entity.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/wish_list_page/wish_list_skeleton.dart';
import 'package:pickaboo/presentation/ui/widgets/wish_list_page/wishlist_item_card.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  String? _addingSku;
  String? _removingProductId;
  List<WishlistEntity>? _cachedItems;

  @override
  void initState() {
    super.initState();
    context.read<WishlistBloc>().add(const WishlistEvent.started());
  }

  void _addToCart(WishlistEntity item) {
    if (_addingSku != null || _removingProductId != null) return;

    if (item.sku.isEmpty) {
      SnackBarUtils.showError(context, "This item can't be added right now");
      return;
    }

    setState(() => _addingSku = item.sku);
    context.read<CartBloc>().add(
      CartEvent.addItemSmart(
        sku: item.sku,
        qty: 1,
        productType: item.cartProductType,
      ),
    );
  }

  void _removeFromWishlist(WishlistEntity item) {
    if (_removingProductId != null || _addingSku != null) return;
    setState(() => _removingProductId = item.productId);
    context.read<WishlistBloc>().add(
      WishlistEvent.removeFromWishlist(item.productId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isBusy = _addingSku != null || _removingProductId != null;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(Routes.home);
        }
      },
      child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: PickabooAppBar(
        title: AppStrings.navWishlist,
        actions: [
          BlocBuilder<WishlistBloc, WishlistState>(
            builder: (context, state) {
              int count = _cachedItems?.length ?? 0;
              state.maybeWhen(
                loaded: (items) {
                  count = items.length;
                  _cachedItems = items;
                },
                orElse: () {},
              );

              return Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Text(
                    "($count)",
                    style: AppTypography.bodySmall.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocListener<CartBloc, CartState>(
        listenWhen: (_, __) => _addingSku != null,
        listener: (context, state) {
          state.maybeWhen(
            itemAdded: (cart, message) {
              setState(() => _addingSku = null);
              SnackBarUtils.showCartItemAdded(
                context,
                message: message.isNotEmpty ? message : 'Item added to cart',
              );
            },
            error: (error, lastCart) {
              setState(() => _addingSku = null);
              SnackBarUtils.showError(context, error.message);
            },
            orElse: () {},
          );
        },
        child: Column(
          children: [
            if (isBusy)
              const AppLoader.linear(),
            Expanded(
              child: AbsorbPointer(
                absorbing: isBusy,
                child: BlocConsumer<WishlistBloc, WishlistState>(
                  buildWhen: (previous, current) => current.maybeWhen(
                    actionSuccess: (_) => false,
                    orElse: () => true,
                  ),
                  listener: (context, state) {
                    state.maybeWhen(
                      actionSuccess: (message) {
                        if (_removingProductId != null) {
                          setState(() => _removingProductId = null);
                        }
                        SnackBarUtils.showPositive(context, message);
                      },
                      error: (message) {
                        if (_removingProductId != null) {
                          setState(() => _removingProductId = null);
                        }
                        SnackBarUtils.showError(context, message);
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    final items = state.maybeWhen(
                      loaded: (items) {
                        _cachedItems = items;
                        return items;
                      },
                      orElse: () => _cachedItems,
                    );

                    if (items == null) {
                      return state.maybeWhen(
                        loading: () => const WishListSkeleton(),
                        error: (message) {
                          final isOffline = ConnectivityUtils.isNoInternet(message, context);
                          return AppErrorView(
                            type: isOffline ? AppErrorType.noInternet : AppErrorType.generic,
                            title: isOffline ? 'No Internet Connection' : 'Unable to Load Wishlist',
                            message: isOffline ? null : message,
                            onRetry: () {
                              context.read<WishlistBloc>().add(
                                const WishlistEvent.started(),
                              );
                            },
                          );
                        },
                        orElse: () => const WishListSkeleton(),
                      );
                    }

                    if (items.isEmpty) {
                      return AppEmptyView.wishlist(
                        onStartShopping: () => context.go(Routes.home),
                      );
                    }

                    return CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.sameGroupItemSpacing.w,
                            vertical: AppSpacing.sameGroupItemSpacing.h,
                          ),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate((context, index) {
                              final item = items[index];
                              return WishlistItemCard(
                                item: item,
                                isAddingToCart: _addingSku == item.sku,
                                isRemoving: _removingProductId == item.productId,
                                onRemove: () => _removeFromWishlist(item),
                                onAddToCart: () => _addToCart(item),
                                onTap: () {
                                  context.goToProductDetail(
                                    item.productId,
                                    slug: item.productId,
                                    productName: item.name,
                                  );
                                },
                              );
                            }, childCount: items.length),
                          ),
                        ),
                      ],
                    );
                  },
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
