import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';

const double _iconButtonSize = 42;
const double _searchHeight = 44;
const double _topGap = 0;
const double _rowToSearchGap = 8;
const double _bottomGap = 6;

class SearchAppBar extends StatelessWidget {
  final int cartCount;
  final VoidCallback onMenuTap;

  const SearchAppBar({
    super.key,
    required this.cartCount,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final double rowHeight = _iconButtonSize.w;
    final double toolbarHeight =
        _topGap.h + rowHeight + _rowToSearchGap.h + _searchHeight.h + _bottomGap.h;

    return SliverAppBar(
      backgroundColor: colors.white,
      surfaceTintColor: colors.white,
      elevation: 0,
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        bottom: false,
        child: Container(
          color: colors.white,
          padding: EdgeInsets.fromLTRB(8.w, _topGap.h, 8.w, _bottomGap.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  AppBarButton(
                    onPressed: onMenuTap,
                    iconPath: 'assets/new/svg/drawer_icon.svg',
                    width: 24.w,
                    height: 18.h,
                    iconColor: colors.primary,
                  ),

                  SizedBox(width: 16.w),

                  SvgPicture.asset(
                    'assets/new/svg/pickaboo_icon.svg',
                    width: 81.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),

                  const Spacer(),

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
                ],
              ),
              SizedBox(height: _rowToSearchGap.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: SizedBox(
                  height: _searchHeight.h,
                  child: TextFormField(
                  readOnly: true,
                  textAlignVertical: TextAlignVertical.center,
                  onTap: () {
                    context.push(Routes.search);
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Search for Products, Brands and More',
                    hintStyle: context.textStyle.inputText.copyWith(
                      color: colors.gray.withValues(alpha: 0.6),
                    ),
                    filled: true,
                    fillColor: colors.whiteSmoke,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 40.w,
                      minHeight: 40.h,
                    ),
                    suffixIcon: Container(
                      margin: EdgeInsets.all(6.w),
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: colors.button,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: SvgPicture.asset(
                        'assets/new/svg/search_icon.svg',
                        width: 14.w,
                        height: 14.h,
                        fit: BoxFit.fitWidth,
                        colorFilter: ColorFilter.mode(
                          colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 44.w,
                      minHeight: 20.h,
                    ),
                  ),
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
