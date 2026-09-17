// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/data/services/push_notification_service.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/nav_drawer/nav_drawer_bloc.dart';
import 'package:pickaboo/presentation/navigation/deep_link_handler.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/nav_drawer/nav_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  /// Global notifier allowing uncached offline views to hide the bottom nav bar.
  static final ValueNotifier<bool> hideBottomNav = ValueNotifier<bool>(false);

  /// Tab history tracking to allow natural back-navigation across bottom bar tabs.
  static final List<int> tabHistory = [0];
  static void Function(int index)? switchTab;

  /// Handles popping back:
  /// 1. If screen can pop (nested route pushed on top), pop it.
  /// 2. If user navigated through tabs, pop back to the previous tab.
  /// 3. Otherwise, go to Home (tab 0).
  static void popTab(BuildContext context) {
    MainPage.hideBottomNav.value = false;
    final router = GoRouter.maybeOf(context);
    if (router != null && router.canPop()) {
      router.pop();
      return;
    }
    final nav = Navigator.maybeOf(context);
    if (nav != null && nav.canPop()) {
      nav.pop();
      return;
    }
    if (tabHistory.length > 1) {
      tabHistory.removeLast();
      final previousTab = tabHistory.last;
      if (switchTab != null) {
        switchTab!(previousTab);
      } else {
        context.go(Routes.home);
      }
    } else {
      if (switchTab != null) {
        switchTab!(0);
      } else {
        context.go(Routes.home);
      }
    }
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  StreamSubscription? _deepLinkSubscription;
  late NavDrawerBloc _navDrawerBloc;

  @override
  void initState() {
    super.initState();

    MainPage.tabHistory.clear();
    MainPage.tabHistory.add(widget.navigationShell.currentIndex);
    MainPage.switchTab = (index) => navRoute(index, recordHistory: false);

    _navDrawerBloc = context.read<NavDrawerBloc>();

    context.read<CartBloc>().add(const CartEvent.initializeSession());

    _navDrawerBloc.registerScaffold(_scaffoldKey);

    _deepLinkSubscription = getIt<PushNotificationService>().deepLinkStream
        .listen((link) {
          if (kDebugMode) {
            print('🔔 [MainPage] DeepLink Received: $link');
          }
          if (mounted) {
            getIt<DeepLinkHandler>().handleDeepLink(link, GoRouter.of(context));
          }
        });
  }

  @override
  void didUpdateWidget(covariant MainPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newIndex = widget.navigationShell.currentIndex;
    if (newIndex != oldWidget.navigationShell.currentIndex) {
      if (MainPage.tabHistory.isEmpty || MainPage.tabHistory.last != newIndex) {
        MainPage.tabHistory.add(newIndex);
      }
    }
  }

  void navRoute(int index, {bool recordHistory = true}) {
    MainPage.hideBottomNav.value = false;
    if (recordHistory) {
      if (MainPage.tabHistory.isEmpty || MainPage.tabHistory.last != index) {
        MainPage.tabHistory.add(index);
      }
    }
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final useRail = context.isTablet;
    return PopScope(
      canPop: widget.navigationShell.currentIndex == 0 && MainPage.tabHistory.length <= 1,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        MainPage.popTab(context);
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: MainPage.hideBottomNav,
        builder: (context, hideNav, _) {
          return Scaffold(
            key: _scaffoldKey,
            extendBody: true,
            drawer: const NavDrawer(),
            onDrawerChanged: (isOpened) {
              context.read<NavDrawerBloc>().add(
                NavDrawerEvent.drawerChanged(isOpen: isOpened),
              );
            },
            body: useRail
                ? Row(
                    children: [
                      _buildNavigationRail(context),
                      const VerticalDivider(width: 1, thickness: 1),
                      Expanded(child: widget.navigationShell),
                    ],
                  )
                : widget.navigationShell,
            bottomNavigationBar:
                (useRail || hideNav) ? null : _buildBottomNavBar(context),
          );
        },
      ),
    );
  }

  static const List<({String asset, String label})> _navItems = [
    (asset: AppAssets.navHome, label: AppStrings.navHome),
    (asset: AppAssets.navDiscover, label: AppStrings.navDiscover),
    (asset: AppAssets.navSupport, label: AppStrings.navSupport),
    (asset: AppAssets.navProfile, label: AppStrings.navProfile),
  ];

  Widget _navIcon(String asset, {bool selected = false}) {
    return SvgPicture.asset(
      asset,
      width: 24.w,
      height: 24.h,
      fit: BoxFit.fill,
      colorFilter: selected
          ? const ColorFilter.mode(AppColors.pickabooBlue, BlendMode.srcIn)
          : null,
    );
  }

  Widget _buildNavigationRail(BuildContext context) {
    return SafeArea(
      child: NavigationRail(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: navRoute,
        labelType: NavigationRailLabelType.all,
        backgroundColor: AppColors.white,
        indicatorColor: AppColors.white,
        selectedLabelTextStyle: AppTypography.bodyTiny.bold().blue.withColor(
          AppColors.pickabooBlue,
        ),
        unselectedLabelTextStyle: AppTypography.bodyTiny.medium().withColor(
          AppColors.muted,
        ),
        destinations: [
          for (final item in _navItems)
            NavigationRailDestination(
              icon: _navIcon(item.asset),
              selectedIcon: _navIcon(item.asset, selected: true),
              label: Text(item.label),
            ),
        ],
      ),
    );
  }

  // ============================================================================
  // 🧭 Floating Capsule Bottom Navigation Bar from New UI Application
  // ============================================================================
  Widget _buildBottomNavBar(BuildContext context) {
    final currentIndex = widget.navigationShell.currentIndex;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 10.h),
          child: SizedBox(
            height: 64.h,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // ── 1. Floating Capsule Bar Container ──
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(26.r),
                      border: Border.all(color: AppColors.border, width: 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.navy.withValues(alpha: 0.08),
                          blurRadius: 18.r,
                          spreadRadius: 0,
                          offset: Offset(0, 6.h),
                        ),
                        BoxShadow(
                          color: AppColors.navy.withValues(alpha: 0.03),
                          blurRadius: 4.r,
                          offset: Offset(0, 2.h),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: _buildTabItem(
                            index: 0,
                            isSelected: currentIndex == 0,
                            icon: Icons.home_outlined,
                            activeIcon: Icons.home_rounded,
                            label: AppStrings.navHome,
                            onTap: () => navRoute(0),
                          ),
                        ),
                        Expanded(
                          child: _buildTabItem(
                            index: 1,
                            isSelected: currentIndex == 1,
                            icon: Icons.grid_view_outlined,
                            activeIcon: Icons.grid_view_rounded,
                            label: AppStrings.navDiscover,
                            onTap: () => navRoute(1),
                          ),
                        ),
                        SizedBox(width: 56.w), // Spacing for Center Raised Diamond Cart
                        Expanded(
                          child: _buildTabItem(
                            index: 2,
                            isSelected: currentIndex == 2,
                            icon: Icons.headset_mic_outlined,
                            activeIcon: Icons.headset_mic_rounded,
                            label: AppStrings.navSupport,
                            onTap: () => navRoute(2),
                          ),
                        ),
                        Expanded(
                          child: _buildTabItem(
                            index: 3,
                            isSelected: currentIndex == 3,
                            icon: Icons.person_outline_rounded,
                            activeIcon: Icons.person_rounded,
                            label: AppStrings.navProfile,
                            onTap: () => navRoute(3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── 2. Center Floating Raised Diamond Cart Button ──
                Positioned(
                  left: 0,
                  right: 0,
                  top: -14.h,
                  child: Center(
                    child: GestureDetector(
                      onTap: () => context.push(Routes.cart),
                      behavior: HitTestBehavior.opaque,
                      child: _buildDiamondCartButton(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // ── 3. Solid Safe Area Under System Navigation Buttons ──
        if (bottomInset > 0)
          Container(
            height: bottomInset,
            color: AppColors.pageBg,
          ),
      ],
    );
  }

  /// Center Floating Raised Cart Button (Rotated Diamond Shape with Live CartBloc Badge)
  Widget _buildDiamondCartButton() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, cartState) {
        final cartCount = cartState.maybeWhen(
          loaded: (cart) => cart.itemsCount,
          itemAdded: (cart, _) => cart.itemsCount,
          couponApplied: (cart, _) => cart.itemsCount,
          rewardPointsApplied: (cart, _) => cart.itemsCount,
          operationInProgress: (cart, _) => cart.itemsCount,
          orElse: () => 0,
        );

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.rotate(
              angle: 0.785398, // 45 degrees
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.r),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.border,
                    width: 1.2.w,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.navy.withValues(alpha: 0.08),
                      blurRadius: 8.r,
                      offset: Offset(0, 3.h),
                    ),
                  ],
                ),
                child: Transform.rotate(
                  angle: -0.785398, // Keep content upright
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: AppColors.navy,
                        size: 22.sp,
                      ),
                      // Live Cart Count Badge
                      if (cartCount > 0)
                        Positioned(
                          top: -2.h,
                          right: -2.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 2.h,
                            ),
                            constraints: BoxConstraints(
                              minWidth: 16.w,
                              minHeight: 16.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.pickabooBlue,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.white,
                                width: 1.5.w,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '$cartCount',
                                style: AppTypography.button,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'Cart',
              style: AppTypography.bodyTiny.medium(),
            ),
          ],
        );
      },
    );
  }

  /// Clean Labeled Tab Item (Pickaboo Blue when selected, Slate when inactive)
  Widget _buildTabItem({
    required int index,
    required bool isSelected,
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required VoidCallback onTap,
  }) {
    final color =
        isSelected ? AppColors.pickabooBlue : AppColors.muted;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.08 : 1.0,
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              child: Icon(
                isSelected ? activeIcon : icon,
                size: 22.sp,
                color: color,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              label,
              style: isSelected
                  ? AppTypography.bodyTiny.bold().blue
                  : AppTypography.bodyTiny.medium(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    MainPage.switchTab = null;
    _deepLinkSubscription?.cancel();
    _navDrawerBloc.unregisterScaffold();
    super.dispose();
  }
}
