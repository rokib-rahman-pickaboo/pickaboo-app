import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class AppBarButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final double width;
  final double height;
  final Color iconColor;

  final bool showBadge;
  final int badgeCount;

  const AppBarButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.width,
    required this.height,
    required this.iconColor,
    this.showBadge = false,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final iconButton = IconButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(42.w, 42.w)),
        maximumSize: WidgetStatePropertyAll(Size(42.w, 42.w)),
        minimumSize: WidgetStatePropertyAll(Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: WidgetStatePropertyAll(EdgeInsets.all(8.w)),
      ),
      icon: SvgPicture.asset(
        iconPath,
        width: width,
        height: height,
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
    );

    if (!showBadge) return iconButton;

    return badges.Badge(
      showBadge: badgeCount > 0,
      badgeContent: Text(
        '$badgeCount',
        style: context.textStyle.badgeSmall.copyWith(color: context.colors.white),
      ),
      position: badges.BadgePosition.topEnd(top: -2, end: 0),
      badgeAnimation: const badges.BadgeAnimation.fade(),
      badgeStyle: badges.BadgeStyle(
        badgeColor: context.colors.primary,
        elevation: 0,
      ),
      child: iconButton,
    );
  }
}
