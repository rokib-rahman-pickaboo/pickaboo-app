import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/wishlist/wishlist_entity.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/wish_list_page/wishlist_item_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';

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
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: context.textStyle.appBarTitle,
        ),
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
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
                    style: textStyle.bodyLarge.withColor(colors.text),
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
              SnackBarUtils.showSuccess(context, message);
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Center(
              child: CircularProgressIndicator(
                color: colors.primary,
                strokeWidth: 2.w,
              ),
            ),
            error: (message) => Center(
              child: Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 64.sp,
                      color: colors.red,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: textStyle.bodyLarge.withColor(colors.text),
                    ),
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.button,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {
                        context.read<WishlistBloc>().add(
                          const WishlistEvent.started(),
                        );
                      },
                      child: Text(
                        "Retry",
                        style: textStyle.buttonMedium.withColor(colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            loaded: (items) {
              if (items.isEmpty) {
                return _buildEmptyState(colors, textStyle);
              }
              return CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
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
    );
  }

  Widget _buildEmptyState(AppColors colors, AppTextStyles textStyle) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: colors.backgroundGray,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colors.black.withValues(alpha: 0.05),
                    blurRadius: 10.r,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite_outline_rounded,
                size: 64.sp,
                color: colors.primary,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              "Your wishlist_response is empty",
              style: textStyle.headingMedium.withColor(colors.text),
            ),
            SizedBox(height: 8.h),
            Text(
              "Tap the heart icon on any product to save it for later.",
              textAlign: TextAlign.center,
              style: textStyle.bodyMedium.withColor(colors.gray),
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.button,
                  elevation: 2,
                  shadowColor: colors.button.withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  context.go(Routes.home);
                },
                child: Text(
                  "Continue Shopping",
                  style: textStyle.buttonLarge.withColor(colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
