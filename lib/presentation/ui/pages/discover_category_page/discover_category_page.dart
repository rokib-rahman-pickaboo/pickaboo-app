// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_banner_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_subsection_item_entity.dart';
import 'package:pickaboo/presentation/bloc/discover_category_bloc/discover_category_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/main_page.dart';
import 'package:pickaboo/presentation/ui/pages/no_internet_page/no_internet_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
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

  @override
  void dispose() {
    MainPage.hideBottomNav.value = false;
    super.dispose();
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
    final textStyles = context.textStyle;

    return BlocListener<InternetBloc, InternetState>(
      listenWhen: (previous, current) =>
          previous.maybeWhen(disconnected: (_) => true, orElse: () => false) &&
          current.maybeWhen(connected: (_) => true, orElse: () => false),
      listener: (context, state) {
        context.read<DiscoverCategoryBloc>().add(
          const DiscoverCategoryEvent.getDiscoverCategories(),
        );
      },
      child: BlocBuilder<DiscoverCategoryBloc, DiscoverCategoryState>(
        builder: (context, state) {
          final isOfflineError = state.discoverCategories == null &&
              ConnectivityUtils.isOffline(context);

          final isGenericError = state.discoverCategories == null &&
              !isOfflineError &&
              state.status == DiscoverCategoryStatus.error;

          final hideNav = isOfflineError || isGenericError;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (MainPage.hideBottomNav.value != hideNav) {
              MainPage.hideBottomNav.value = hideNav;
            }
          });

          if (isOfflineError) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  MainPage.hideBottomNav.value = false;
                  context.go(Routes.home);
                }
              },
              child: NoInternetPage(
                showAppBar: true,
                title: AppStrings.allCategories,
                onBack: () {
                  MainPage.hideBottomNav.value = false;
                  context.go(Routes.home);
                },
                onRetry: () => context.read<DiscoverCategoryBloc>().add(
                  const DiscoverCategoryEvent.getDiscoverCategories(),
                ),
              ),
            );
          }

          if (isGenericError) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  MainPage.hideBottomNav.value = false;
                  context.go(Routes.home);
                }
              },
              child: Scaffold(
                key: _scaffoldKey,
                backgroundColor: AppColors.pageBg,
                appBar: PickabooAppBar(
                  title: AppStrings.allCategories,
                  showBackButton: true,
                  onBackTap: () {
                    MainPage.hideBottomNav.value = false;
                    context.go(Routes.home);
                  },
                ),
                body: SafeArea(
                  child: AppErrorView(
                    type: AppErrorType.generic,
                    title: "Couldn't load categories",
                    message: 'Please try again in a moment.',
                    retryLabel: 'Retry',
                    onRetry: () => context.read<DiscoverCategoryBloc>().add(
                      const DiscoverCategoryEvent.getDiscoverCategories(),
                    ),
                  ),
                ),
              ),
            );
          }

          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop) {
                MainPage.hideBottomNav.value = false;
                context.go(Routes.home);
              }
            },
            child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: AppColors.pageBg,
              appBar: PickabooAppBar(
                title: AppStrings.allCategories,
                onBackTap: () {
                  MainPage.hideBottomNav.value = false;
                  context.go(Routes.home);
                },
                actions: [
                  IconButton(
                    icon: Icon(Icons.search_rounded, color: AppColors.navy, size: 22.sp),
                    onPressed: () => context.push(Routes.search),
                  ),
                  SizedBox(width: 4.w),
                ],
              ),
              body: RefreshIndicator(
                onRefresh: _onRefresh,
                color: AppColors.pickabooBlue,
                child: _buildContent(state, textStyles),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(
    DiscoverCategoryState state,
    AppTextStyles textStyles,
  ) {
    if (state.status == DiscoverCategoryStatus.loading) {
      return const AppLoader.fullPage();
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
      final isOffline = ConnectivityUtils.isNoInternet(state.error, context);
      return AppErrorView(
        type: isOffline ? AppErrorType.noInternet : AppErrorType.generic,
        title: isOffline ? 'No Internet Connection' : "Couldn't load categories",
        message: isOffline
            ? null
            : 'Something went wrong while loading this page. Please try again in a moment.',
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
          Container(width: 1, color: AppColors.border),
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

    return const AppLoader.fullPage();
  }
}
