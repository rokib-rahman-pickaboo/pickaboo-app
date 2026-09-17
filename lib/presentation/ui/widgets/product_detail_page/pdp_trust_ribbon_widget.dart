import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';

class RibbonBadgeItem {
  final IconData icon;
  final String label;
  final String? boldSuffix;
  final Color? iconColor;

  const RibbonBadgeItem({
    required this.icon,
    required this.label,
    this.boldSuffix,
    this.iconColor,
  });
}

/// 2. TOP TRUST RIBBON STRIP
/// Multi-item Smart Flipper:
/// - Combines short badges together (e.g. "100% Authentic | Easy Return")
/// - Smoothly auto-scrolls long text (e.g. full warranty) without any overflow
/// - Cycles smoothly between grouped pages every 3.5 seconds
class PdpTrustRibbonWidget extends StatefulWidget {
  final ProductDetailEntity product;

  const PdpTrustRibbonWidget({
    super.key,
    required this.product,
  });

  @override
  State<PdpTrustRibbonWidget> createState() => _PdpTrustRibbonWidgetState();
}

class _PdpTrustRibbonWidgetState extends State<PdpTrustRibbonWidget> {
  Timer? _timer;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _scheduleNextPage();
  }

  bool _isPageLong(List<RibbonBadgeItem> page) {
    return page.any((badge) => badge.label.length > 25);
  }

  void _scheduleNextPage() {
    _timer?.cancel();
    final pages = _buildPages();
    if (pages.length <= 1) return;

    final safeIndex = _currentPageIndex % pages.length;
    final currentBadges = pages[safeIndex];

    // Standard duration: 3500ms. Big/scrolling duration: 7000ms (double time!)
    final int delayMs = _isPageLong(currentBadges) ? 7000 : 3500;

    _timer = Timer(Duration(milliseconds: delayMs), () {
      if (!mounted) return;
      setState(() {
        _currentPageIndex = (_currentPageIndex + 1) % pages.length;
      });
      _scheduleNextPage();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  List<List<RibbonBadgeItem>> _buildPages() {
    final pages = <List<RibbonBadgeItem>>[];

    // ── Authentic & Easy Return (Grouped together) ──
    pages.add([
      const RibbonBadgeItem(
        icon: Icons.verified_user_outlined,
        label: '100% Authentic',
      ),
      const RibbonBadgeItem(
        icon: Icons.replay_rounded,
        label: 'Easy Return',
      ),
    ]);

    return pages;
  }

  @override
  Widget build(BuildContext context) {
    final pages = _buildPages();

    if (pages.isEmpty) return const SizedBox.shrink();

    final safeIndex = _currentPageIndex % pages.length;
    final currentBadges = pages[safeIndex];

    return Container(
      width: double.infinity,
      height: 36.h,
      color: AppColors.surfaceBlue,
      alignment: Alignment.center,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          final inAnimation = Tween<Offset>(
            begin: const Offset(0.0, 0.7),
            end: Offset.zero,
          ).animate(animation);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: inAnimation,
              child: child,
            ),
          );
        },
        child: _RibbonPageWidget(
          key: ValueKey<int>(safeIndex),
          badges: currentBadges,
        ),
      ),
    );
  }
}

class _RibbonPageWidget extends StatefulWidget {
  final List<RibbonBadgeItem> badges;

  const _RibbonPageWidget({
    super.key,
    required this.badges,
  });

  @override
  State<_RibbonPageWidget> createState() => _RibbonPageWidgetState();
}

class _RibbonPageWidgetState extends State<_RibbonPageWidget> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) return;
      final maxScroll = _scrollController.position.maxScrollExtent;
      if (maxScroll > 0) {
        _scrollTimer = Timer(const Duration(milliseconds: 600), () {
          if (!mounted || !_scrollController.hasClients) return;
          _scrollController.animateTo(
            maxScroll,
            duration: Duration(milliseconds: (maxScroll * 40).clamp(2000, 4500).toInt()),
            curve: Curves.easeInOut,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.sameGroupItemSpacing.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.badges.length; i++) ...[
              if (i > 0)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    '|',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.muted.withValues(alpha: 0.5),
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.badges[i].icon,
                    size: 15.sp,
                    color: widget.badges[i].iconColor ?? AppColors.pickabooBlue,
                  ),
                  SizedBox(width: 4.w),
                  if (widget.badges[i].boldSuffix != null &&
                      widget.badges[i].boldSuffix!.isNotEmpty) ...[
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.badges[i].label,
                            style: AppTypography.bodyTiny.copyWith(
                              fontSize: 11.5.sp,
                            ),
                          ),
                          TextSpan(
                            text: widget.badges[i].boldSuffix,
                            style: AppTypography.bodyTiny.bold().navy.copyWith(
                              fontSize: 11.5.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Text(
                      widget.badges[i].label,
                      style: AppTypography.titleSmall.copyWith(
                        fontSize: 11.5.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.navy,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
