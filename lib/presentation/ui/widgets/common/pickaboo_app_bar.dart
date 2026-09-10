// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';

/// Universal Pickaboo Top App Bar for sub-pages and root tabs.
/// - If [shouldShowBack] is true: Title is centered ([centerTitle] = true).
/// - If [shouldShowBack] is false: Title is at starting ([centerTitle] = false).
/// Supports automatic scroll detection via [ScrollNotificationObserver]
/// to dynamically display a smooth hairline bottom divider when content scrolls beneath it.
class PickabooAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final String? subtitle;
  final VoidCallback? onBackTap;
  final bool? showBackButton;
  final Widget? leading;
  final List<Widget>? actions;
  final Color backgroundColor;
  final bool? showBottomDivider;
  final bool? centerTitle;
  final double? titleSpacing;

  const PickabooAppBar({
    super.key,
    this.title = '',
    this.titleWidget,
    this.subtitle,
    this.onBackTap,
    this.showBackButton,
    this.leading,
    this.actions,
    this.backgroundColor = AppColors.pageBg,
    this.showBottomDivider,
    this.centerTitle,
    this.titleSpacing,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 1.0.h);

  @override
  State<PickabooAppBar> createState() => _PickabooAppBarState();
}

class _PickabooAppBarState extends State<PickabooAppBar> {
  bool _isScrolledUnder = false;
  ScrollNotificationObserverState? _scrollNotificationObserver;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    super.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification ||
        notification is OverscrollNotification ||
        notification is UserScrollNotification) {
      final isScrolled = notification.metrics.pixels > 1.0;
      if (isScrolled != _isScrolledUnder) {
        setState(() {
          _isScrolledUnder = isScrolled;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = (parentRoute?.canPop ?? false) || Navigator.of(context).canPop();
    final bool shouldShowBack = widget.showBackButton ?? canPop;
    final bool shouldShowDivider =
        widget.showBottomDivider ?? _isScrolledUnder;

    final bool hasActions = widget.actions != null && widget.actions!.isNotEmpty;

    // If actions are present (e.g. search, wishlist, cart), title sits directly after the back button (not centered).
    // If no actions and back button is present, center title.
    final bool effectiveCenterTitle = widget.centerTitle ?? (!hasActions && shouldShowBack);

    final double? effectiveTitleSpacing = widget.titleSpacing ??
        (!effectiveCenterTitle && shouldShowBack ? 0 : (shouldShowBack ? null : 16.w));

    Widget? leadingWidget = widget.leading;
    if (leadingWidget == null && shouldShowBack) {
      leadingWidget = IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.navy,
          size: 18.sp,
        ),
        onPressed: widget.onBackTap ??
            () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                context.go(Routes.home);
              }
            },
      );
    }

    Widget? titleContent = widget.titleWidget;
    if (titleContent == null) {
      if (widget.subtitle != null && widget.subtitle!.isNotEmpty) {
        titleContent = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: effectiveCenterTitle
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: AppTypography.pageTitle.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              widget.subtitle!,
              style: AppTypography.bodyMuted,
            ),
          ],
        );
      } else {
        titleContent = Text(
          widget.title,
          style: AppTypography.pageTitle.copyWith(
            fontWeight: FontWeight.w900,
          ),
        );
      }
    }

    return AppBar(
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: effectiveTitleSpacing,
      leading: leadingWidget,
      title: titleContent,
      centerTitle: effectiveCenterTitle,
      actions: widget.actions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0.h),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 1.0.h,
          color: shouldShowDivider ? AppColors.border : Colors.transparent,
        ),
      ),
    );
  }
}
