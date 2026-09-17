// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:badges/badges.dart' as badges;

class DraggableCompareButton extends StatefulWidget {
  final VoidCallback onTap;
  final int badgeCount;

  const DraggableCompareButton({
    super.key,
    required this.onTap,
    this.badgeCount = 0,
  });

  @override
  State<DraggableCompareButton> createState() => _DraggableCompareButtonState();
}

class _DraggableCompareButtonState extends State<DraggableCompareButton> {
  double _x = 16;
  double _y = 200;
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      _x = MediaQuery.of(context).size.width - 50.w;
      _y = 380.h;
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonContent = Container(
      width: 50.w,
      height: 50.w,
      decoration: const BoxDecoration(
        color: AppColors.pickabooBlue,
        borderRadius: AppRadius.buttonRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.compared,
            width: 18.w,
            height: 18.w,
            colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
          SizedBox(height: 2.h),
          Text(
            'Compare',
            style: AppTypography.bodyTiny,
          ),
        ],
      ),
    );

    if (widget.badgeCount > 0) {
      buttonContent = badges.Badge(
        showBadge: widget.badgeCount > 0,
        badgeContent: Text(
          '${widget.badgeCount}',
          style: AppTypography.bodyTiny.copyWith(color: AppColors.pickabooBlue),
        ),
        position: badges.BadgePosition.topEnd(top: -4, end: -4),
        badgeAnimation: const badges.BadgeAnimation.fade(),
        badgeStyle: const badges.BadgeStyle(
          badgeColor: AppColors.white,
          elevation: 0,
        ),
        child: buttonContent,
      );
    }

    return Positioned(
      left: _x,
      top: _y,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _x += details.delta.dx;
            _y += details.delta.dy;
          });
        },
        onTap: widget.onTap,
        child: buttonContent,
      ),
    );
  }
}
