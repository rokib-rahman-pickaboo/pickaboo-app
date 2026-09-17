import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

// ============================================================================
// 🃏 CANONICAL APP CARD & SURFACE WIDGET
// Standardized background, borders, soft depth shadows, and touch ripple.
// Eliminates raw Container(decoration: BoxDecoration(...)) boilerplate.
// ============================================================================

enum AppCardVariant {
  elevated,
  flat,
  outlined,
  tinted,
}

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;
  final bool hasShadow;
  final bool hasBorder;
  final double? width;
  final double? height;
  final Clip clipBehavior;
  final AppCardVariant variant;

  const AppCard({
    super.key,
    required this.child,
    this.padding = AppSpacing.cardPadding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius,
    this.onTap,
    this.boxShadow,
    this.hasShadow = true,
    this.hasBorder = true,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
    this.variant = AppCardVariant.elevated,
  });

  /// Flat card with border and zero drop shadow
  const AppCard.flat({
    super.key,
    required this.child,
    this.padding = AppSpacing.cardPadding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius,
    this.onTap,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
  })  : variant = AppCardVariant.flat,
        boxShadow = null,
        hasShadow = false,
        hasBorder = true;

  /// Outlined card with 1px border and transparent / white background
  const AppCard.outlined({
    super.key,
    required this.child,
    this.padding = AppSpacing.cardPadding,
    this.margin,
    this.backgroundColor = AppColors.transparent,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius,
    this.onTap,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
  })  : variant = AppCardVariant.outlined,
        boxShadow = null,
        hasShadow = false,
        hasBorder = true;

  /// Tinted surface (ideal for callouts, alert banners, trust badges)
  const AppCard.tinted({
    super.key,
    required this.child,
    this.padding = AppSpacing.cardPadding,
    this.margin,
    this.backgroundColor,
    this.borderColor = AppColors.transparent,
    this.borderWidth = 0.0,
    this.borderRadius,
    this.onTap,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
  })  : variant = AppCardVariant.tinted,
        boxShadow = null,
        hasShadow = false,
        hasBorder = false;

  Color _resolveBgColor() {
    if (backgroundColor != null) return backgroundColor!;
    switch (variant) {
      case AppCardVariant.elevated:
      case AppCardVariant.flat:
        return AppColors.white;
      case AppCardVariant.outlined:
        return AppColors.transparent;
      case AppCardVariant.tinted:
        return AppColors.surfaceBlue;
    }
  }

  Border? _resolveBorder() {
    if (!hasBorder) return null;
    final effectiveBorderColor = borderColor ?? AppColors.border;
    return Border.all(color: effectiveBorderColor, width: borderWidth);
  }

  List<BoxShadow>? _resolveBoxShadow() {
    if (boxShadow != null) return boxShadow;
    if (!hasShadow || variant != AppCardVariant.elevated) return null;
    return [
      BoxShadow(
        color: AppColors.navy.withValues(alpha: 0.02),
        blurRadius: 6.0,
        offset: const Offset(0, 2),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = borderRadius ?? AppRadius.cardRadius;
    final effectiveBg = _resolveBgColor();
    final effectiveBorder = _resolveBorder();
    final effectiveShadow = _resolveBoxShadow();

    Widget content = Padding(
      padding: padding ?? EdgeInsets.zero,
      child: child,
    );

    if (onTap != null) {
      content = Material(
        color: AppColors.transparent,
        borderRadius: effectiveRadius,
        clipBehavior: clipBehavior,
        child: InkWell(
          onTap: onTap,
          borderRadius: effectiveRadius is BorderRadius ? effectiveRadius : null,
          child: content,
        ),
      );
    }

    Widget card = Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: effectiveBg,
        borderRadius: effectiveRadius,
        border: effectiveBorder,
        boxShadow: effectiveShadow,
      ),
      clipBehavior: clipBehavior,
      child: content,
    );

    return card;
  }
}
