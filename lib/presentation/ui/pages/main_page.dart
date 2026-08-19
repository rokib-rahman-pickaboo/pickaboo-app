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
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/ui/nav_drawer/nav_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

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

  void navRoute(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final useRail = context.isTablet;
    return PopScope(
      canPop: widget.navigationShell.currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        widget.navigationShell.goBranch(0);
      },
      child: Scaffold(
        key: _scaffoldKey,
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
        bottomNavigationBar: useRail ? null : _buildBottomNavBar(context),
      ),
    );
  }

  static const List<({String asset, String label})> _navItems = [
    (asset: "assets/new/svg/home_icon.svg", label: 'Home'),
    (asset: "assets/new/svg/discover_icon.svg", label: 'Discover'),
    (asset: "assets/new/svg/support_icon.svg", label: 'Support'),
    (asset: "assets/new/svg/profile_icon.svg", label: 'Profile'),
  ];

  Widget _navIcon(String asset, {bool selected = false}) {
    return SvgPicture.asset(
      asset,
      width: 24.w,
      height: 24.h,
      fit: BoxFit.fill,
      colorFilter: selected
          ? ColorFilter.mode(context.colors.button, BlendMode.srcIn)
          : null,
    );
  }

  Widget _buildNavigationRail(BuildContext context) {
    return SafeArea(
      child: NavigationRail(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: navRoute,
        labelType: NavigationRailLabelType.all,
        backgroundColor: context.colors.white,
        indicatorColor: context.colors.white,
        selectedLabelTextStyle: context.textStyle.bottomNavActive.withColor(
          context.colors.button,
        ),
        unselectedLabelTextStyle: context.textStyle.bottomNavInactive.withColor(
          context.colors.text,
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

  Widget _buildBottomNavBar(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        NavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          labelPadding: EdgeInsets.zero,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return context.textStyle.bottomNavActive.withColor(
                context.colors.button,
              );
            }
            return context.textStyle.bottomNavInactive.withColor(
              context.colors.text,
            );
          }),
          height: 60.h,
          destinations: [
            for (final item in _navItems)
              NavigationDestination(
                icon: _navIcon(item.asset),
                selectedIcon: _navIcon(item.asset, selected: true),
                label: item.label,
              ),
          ],
          onDestinationSelected: navRoute,
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          top: 0,
          left:
              MediaQuery.of(context).size.width /
              4 *
              widget.navigationShell.currentIndex,
          child: Container(
            width: MediaQuery.of(context).size.width / 5.5,
            height: 2.h,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: context.colors.button,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _deepLinkSubscription?.cancel();
    _navDrawerBloc.unregisterScaffold();
    super.dispose();
  }
}
