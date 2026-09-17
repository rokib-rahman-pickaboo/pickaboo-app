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
import 'package:pickaboo/presentation/ui/widgets/wish_list_page/wishlist_item_card.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  String? _addingSku;

  @override
  void initState() {
    super.initState();
    context.read<WishlistBloc>().add(const WishlistEvent.started());
  }

  void _addToCart(WishlistEntity item) {
    if (_addingSku != null) return;

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

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: AppColors.pageBg,
      appBar: PickabooAppBar(
        title: "Wishlist",
        actions: [
          BlocBuilder<WishlistBloc, WishlistState>(
            builder: (context, state) {
              int count = 0;
              state.maybeWhen(
                loaded: (items) => count = items.length,
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
        child: BlocConsumer<WishlistBloc, WishlistState>(
        listener: (context, state) {
          state.maybeWhen(
            actionSuccess: (message) {
              SnackBarUtils.showPositive(context, message);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const AppLoader.fullPage(),
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
            loaded: (items) {
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
                          onRemove: () {
                            context.read<WishlistBloc>().add(
                              WishlistEvent.removeFromWishlist(item.productId),
                            );
                          },
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
            orElse: () => const SizedBox.shrink(),
          );
        },
        ),
      ),
    ),
    );
  }
}
