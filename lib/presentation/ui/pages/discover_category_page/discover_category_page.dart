import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_banner_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_subsection_item_entity.dart';
import 'package:pickaboo/presentation/bloc/discover_category_bloc/discover_category_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/category_sidebar.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/subcategory_section.dart';

class DiscoverCategoryPage extends StatefulWidget {
  const DiscoverCategoryPage({super.key});

  @override
  State<DiscoverCategoryPage> createState() => _DiscoverCategoryPageState();
}

class _DiscoverCategoryPageState extends State<DiscoverCategoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<DiscoverCategoryBloc>().add(
      const DiscoverCategoryEvent.getDiscoverCategories(),
    );
  }

  Future<void> _onRefresh() async {
    context.read<DiscoverCategoryBloc>().add(const DiscoverCategoryEvent.refresh());

    await Future.delayed(const Duration(milliseconds: 500));
  }

  void _navigateToCategory(DiscoverCategoryEntity category) {
    context.pushToCategoryProduct(
      categoryId: category.category.id.toString(),
      categoryName: category.category.name,
    );
  }

  void _handleItemTap(DiscoverSubsectionItemEntity item) {
    context.handleBannerTap(
      linkType: item.linkType,
      link: item.linkValue.isNotEmpty ? item.linkValue : item.link,
      categoryName: item.name,
    );
  }

  void _handleBannerTap(DiscoverCategoryBannerEntity banner) {
    context.handleBannerTap(
      linkType: banner.linkType,
      link: banner.linkValue.isNotEmpty ? banner.linkValue : banner.link,
    );
  }

  void _handleCategoryTap(DiscoverCategoryEntity category, int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          context.go(Routes.home);
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: AppBarButton(
            iconPath: 'assets/new/svg/back_nav_icon.svg',
            width: 7.w,
            height: 14.h,
            onPressed: () => context.go(Routes.home),
            iconColor: colors.text,
          ),
          title: const Text('All Categories'),
          actions: [
            AppBarButton(
              onPressed: () => context.push(Routes.search),
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
                  onPressed: () => context.push(Routes.cart),
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
        body: BlocConsumer<DiscoverCategoryBloc, DiscoverCategoryState>(
          listener: (context, state) {
            if (state.status == DiscoverCategoryStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error?.message ?? 'Failed to load categories',
                  ),
                  backgroundColor: colors.salmon,
                  action: SnackBarAction(
                    label: 'Retry',
                    textColor: colors.white,
                    onPressed: () {
                      context.read<DiscoverCategoryBloc>().add(
                        const DiscoverCategoryEvent.getDiscoverCategories(),
                      );
                    },
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: _onRefresh,
              color: colors.primary,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    child: _buildContent(state, colors, textStyles),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(
    DiscoverCategoryState state,
    AppColors colors,
    AppTextStyles textStyles,
  ) {
    if (state.status == DiscoverCategoryStatus.loading) {
      return Center(child: CircularProgressIndicator(color: colors.primary));
    }

    if (state.status == DiscoverCategoryStatus.empty) {
      return AppErrorView(
        type: AppErrorType.empty,
        title: 'No categories available',
        onRetry: () => context.read<DiscoverCategoryBloc>().add(
          const DiscoverCategoryEvent.getDiscoverCategories(),
        ),
      );
    }

    if (state.status == DiscoverCategoryStatus.error) {
      return AppErrorView(
        type: AppErrorType.generic,
        title: "Couldn't load categories",
        message: 'Something went wrong while loading this page. '
            'Please try again in a moment.',
        onRetry: () => context.read<DiscoverCategoryBloc>().add(
          const DiscoverCategoryEvent.getDiscoverCategories(),
        ),
      );
    }

    if (state.status == DiscoverCategoryStatus.success &&
        state.discoverCategories != null) {
      final categories = state.discoverCategories!;

      if (_selectedCategoryIndex >= categories.length) {
        _selectedCategoryIndex = 0;
      }

      return Row(
        children: [
          CategorySidebar(
            categories: categories,
            selectedIndex: _selectedCategoryIndex,
            onCategoryTap: _handleCategoryTap,
          ),

          Expanded(
            child: SubcategorySection(
              selectedCategory: categories.isNotEmpty
                  ? categories[_selectedCategoryIndex]
                  : null,
              onSubcategoryTap: _navigateToCategory,
              onItemTap: _handleItemTap,
              onBannerTap: _handleBannerTap,
              onViewAllTap: () {
                if (categories.isNotEmpty) {
                  _navigateToCategory(categories[_selectedCategoryIndex]);
                }
              },
            ),
          ),
        ],
      );
    }

    return Center(child: CircularProgressIndicator(color: colors.primary));
  }
}
