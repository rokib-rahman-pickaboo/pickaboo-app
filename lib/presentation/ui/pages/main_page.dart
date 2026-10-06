// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/data/services/push_notification_service.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/nav_drawer/nav_drawer_bloc.dart';
import 'package:pickaboo/presentation/navigation/deep_link_handler.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/nav_drawer/nav_drawer.dart';
import 'package:upgrader/upgrader.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  /// Global notifier allowing uncached offline views to hide the bottom nav bar.
  static final ValueNotifier<bool> hideBottomNav = ValueNotifier<bool>(false);

  /// Tab history tracking to allow natural back-navigation across bottom bar tabs.
  static final List<int> tabHistory = [0];
  static void Function(int index)? switchTab;

  /// Real-time scroll visibility for bottom navigation bar.
  static final ValueNotifier<bool> isScrollNavVisible = ValueNotifier<bool>(true);
  static Timer? _scrollPauseTimer;

  /// Reveals bottom bar immediately and cancels any pending hide/pause timers.
  static void showBottomNav() {
    _scrollPauseTimer?.cancel();
    _scrollPauseTimer = null;
    if (!isScrollNavVisible.value) {
      isScrollNavVisible.value = true;
    }
  }

  /// Standard settle delay: short enough to feel instant-but-smooth, long enough
  /// to avoid flicker between consecutive flings.
  static const Duration settleRevealDelay = Duration(milliseconds: 250);

  /// Schedules revealing the bottom nav bar once scrolling has settled for [delay].
  static void schedulePauseReveal({
    Duration delay = settleRevealDelay,
  }) {
    _scrollPauseTimer?.cancel();
    _scrollPauseTimer = Timer(delay, () {
      if (!isScrollNavVisible.value) {
        isScrollNavVisible.value = true;
      }
    });
  }

  /// Handles popping back:
  /// 1. If screen can pop (nested route pushed on top), pop it.
  /// 2. If user navigated through tabs, pop back to the previous tab.
  /// 3. Otherwise, go to Home (tab 0).
  static void popTab(BuildContext context) {
    MainPage.hideBottomNav.value = false;
    MainPage.showBottomNav();
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
  late final Upgrader _upgrader;

  @override
  void initState() {
    super.initState();
    _upgrader = Upgrader(
      durationUntilAlertAgain: const Duration(days: 1),
      debugLogging: kDebugMode,
    );

    MainPage.tabHistory.clear();
    MainPage.tabHistory.add(widget.navigationShell.currentIndex);
    MainPage.switchTab = (index) => navRoute(index, recordHistory: false);

    _navDrawerBloc = context.read<NavDrawerBloc>();

    context.read<CartBloc>().add(const CartEvent.initializeSession());

    _navDrawerBloc.registerScaffold(_scaffoldKey);

    _deepLinkSubscription = getIt<PushNotificationService>().deepLinkStream
        .listen((link) {
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
      MainPage.showBottomNav();
      if (MainPage.tabHistory.isEmpty || MainPage.tabHistory.last != newIndex) {
        MainPage.tabHistory.add(newIndex);
      }
    }
  }

  void navRoute(int index, {bool recordHistory = true}) {
    MainPage.hideBottomNav.value = false;
    MainPage.showBottomNav();
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
          return UpgradeAlert(
            upgrader: _upgrader,
            showIgnore: false,
            showLater: true,
            child: Scaffold(
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
                  : NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        // Ignore horizontal scrolls (e.g. carousels, category chips, question options)
                        if (notification.metrics.axis != Axis.vertical) {
                          return false;
                        }

                        // 1. Always reveal and stay visible near the top resting area
                        if (notification.metrics.pixels <= 50) {
                          MainPage.showBottomNav();
                          return false;
                        }

                        // 2. Overscroll at top (pulling down)
                        if (notification is OverscrollNotification &&
                            notification.overscroll < 0) {
                          MainPage.showBottomNav();
                          return false;
                        }

                        // 3. Stopped / Ended scrolling -> reveal after a short settle delay (250ms)
                        if (notification is ScrollEndNotification) {
                          if (notification.metrics.pixels <= 50) {
                            MainPage.showBottomNav();
                          } else {
                            MainPage.schedulePauseReveal();
                          }
                          return false;
                        }

                        // 4. User gesture drag direction changes
                        if (notification is UserScrollNotification) {
                          if (notification.direction == ScrollDirection.forward) {
                            // User dragged finger DOWN (scrolling UP towards top) -> Reveal immediately
                            MainPage.showBottomNav();
                          } else if (notification.direction == ScrollDirection.idle) {
                            // User released finger / stopped dragging
                            if (notification.metrics.pixels <= 50) {
                              MainPage.showBottomNav();
                            } else {
                              MainPage.schedulePauseReveal();
                            }
                          } else if (notification.direction == ScrollDirection.reverse &&
                                     notification.metrics.pixels > 60) {
                            // User dragged finger UP (scrolling DOWN towards bottom) -> Hide
                            MainPage._scrollPauseTimer?.cancel();
                            if (MainPage.isScrollNavVisible.value) {
                              MainPage.isScrollNavVisible.value = false;
                            }
                          }
                        }

                        // 5. Real-time scroll delta updates
                        if (notification is ScrollUpdateNotification) {
                          final delta = notification.scrollDelta ?? 0.0;
                          if (delta < -4) {
                            // Scrolling UP -> Reveal immediately
                            MainPage.showBottomNav();
                          } else if (delta > 6 && notification.metrics.pixels > 60) {
                            // Scrolling DOWN -> Hide bar & cancel pending pause reveal timer
                            MainPage._scrollPauseTimer?.cancel();
                            if (MainPage.isScrollNavVisible.value) {
                              MainPage.isScrollNavVisible.value = false;
                            }
                          }
                        }

                        return false;
                      },
                      child: widget.navigationShell,
                    ),
              bottomNavigationBar: (useRail || hideNav)
                  ? null
                  : ValueListenableBuilder<bool>(
                      valueListenable: MainPage.isScrollNavVisible,
                      builder: (context, isVisible, child) {
                        return AnimatedSlide(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,
                          offset: isVisible ? Offset.zero : const Offset(0, 1.5),
                          child: IgnorePointer(
                            ignoring: !isVisible,
                            child: child,
                          ),
                        );
                      },
                      child: _buildBottomNavBar(context),
                    ),
            ),
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
  // 🧭 Floating Bottom Navigation Bar (8px Radius & 8px Margins)
  // ============================================================================
  Widget _buildBottomNavBar(BuildContext context) {
    final currentIndex = widget.navigationShell.currentIndex;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 58.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // ── 1. Docked Bar Container (Flush Edge-to-Edge) ──
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border(
                      top: BorderSide(
                        color: AppColors.border,
                        width: 0.8.w,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 6.r,
                        spreadRadius: 0,
                        offset: Offset(0, -2.h),
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
                top: -22.h,
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

        // ── 3. Solid Safe Area Under System Navigation Buttons ──
        if (bottomInset > 0)
          Container(
            height: bottomInset,
            color: AppColors.white,
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
          orElse: () => context.read<CartBloc>().currentCartCount,
        );

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.rotate(
              angle: 0.785398, // 45 degrees
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                width: 45.6.w,
                height: 45.6.h,
                decoration: BoxDecoration(
                  borderRadius: AppRadius.k8,
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.border,
                    width: 1.2.w,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
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
                        size: 21.sp,
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
            SizedBox(height: 11.h),
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
      borderRadius: AppRadius.k4,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
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
            SizedBox(height: 2.h),
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
    MainPage._scrollPauseTimer?.cancel();
    MainPage.switchTab = null;
    _deepLinkSubscription?.cancel();
    _navDrawerBloc.unregisterScaffold();
    super.dispose();
  }
}
