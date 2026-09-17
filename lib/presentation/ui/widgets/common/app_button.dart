import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

// ============================================================================
// 🔘 CANONICAL APP BUTTON
// Standardized touch targets, loading states, and typography tokens.
// No raw ElevatedButton / OutlinedButton boilerplate needed.
// ============================================================================

enum AppButtonType {
  primary,
  secondary,
  outline,
  ghost,
  danger,
}

enum AppButtonSize {
  sm,
  md,
  lg,
}

class AppButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final bool isFullWidth;
  final bool shrinkWrap;
  final AppButtonType type;
  final AppButtonSize size;
  final Widget? icon;
  final Widget? iconRight;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = true,
    this.shrinkWrap = false,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.md,
    this.icon,
    this.iconRight,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
  }) : assert(text != null || child != null, 'Either text or child must be provided.');

  /// Primary button constructor with Pickaboo blue background and white text
  const AppButton.primary({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = true,
    this.shrinkWrap = false,
    this.size = AppButtonSize.md,
    this.icon,
    this.iconRight,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
  })  : type = AppButtonType.primary,
        assert(text != null || child != null, 'Either text or child must be provided.');

  /// Secondary / outlined button with Pickaboo blue border and text
  const AppButton.secondary({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = true,
    this.shrinkWrap = false,
    this.size = AppButtonSize.md,
    this.icon,
    this.iconRight,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
  })  : type = AppButtonType.secondary,
        assert(text != null || child != null, 'Either text or child must be provided.');

  /// Outline button with muted/border color
  const AppButton.outline({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = true,
    this.shrinkWrap = false,
    this.size = AppButtonSize.md,
    this.icon,
    this.iconRight,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
  })  : type = AppButtonType.outline,
        assert(text != null || child != null, 'Either text or child must be provided.');

  /// Ghost / text button with zero background and zero elevation
  const AppButton.ghost({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = false,
    this.shrinkWrap = false,
    this.size = AppButtonSize.md,
    this.icon,
    this.iconRight,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
  })  : type = AppButtonType.ghost,
        assert(text != null || child != null, 'Either text or child must be provided.');

  /// Danger / destructive action button
  const AppButton.danger({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = true,
    this.shrinkWrap = false,
    this.size = AppButtonSize.md,
    this.icon,
    this.iconRight,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
  })  : type = AppButtonType.danger,
        assert(text != null || child != null, 'Either text or child must be provided.');

  /// Content-width / auto-sized button (takes only the width needed for full text and icon)
  const AppButton.fitted({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.size = AppButtonSize.md,
    this.type = AppButtonType.primary,
    this.icon,
    this.iconRight,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
  })  : isFullWidth = false,
        shrinkWrap = false,
        width = null,
        assert(text != null || child != null, 'Either text or child must be provided.');

  double _resolveHeight() {
    if (height != null) return height!;
    switch (size) {
      case AppButtonSize.sm:
        return 36.h;
      case AppButtonSize.md:
        return 48.h;
      case AppButtonSize.lg:
        return 54.h;
    }
  }

  Color _resolveBgColor() {
    if (backgroundColor != null) return backgroundColor!;
    if (isDisabled) return AppColors.border;
    switch (type) {
      case AppButtonType.primary:
        return AppColors.pickabooBlue;
      case AppButtonType.secondary:
      case AppButtonType.outline:
      case AppButtonType.ghost:
        return AppColors.transparent;
      case AppButtonType.danger:
        return AppColors.red;
    }
  }

  Color _resolveTextColor() {
    if (textColor != null) return textColor!;
    if (isDisabled) return AppColors.mutedLight;
    switch (type) {
      case AppButtonType.primary:
      case AppButtonType.danger:
        return AppColors.white;
      case AppButtonType.secondary:
        return AppColors.pickabooBlue;
      case AppButtonType.outline:
        return AppColors.navy;
      case AppButtonType.ghost:
        return AppColors.pickabooBlue;
    }
  }

  BorderSide? _resolveBorderSide() {
    if (borderColor != null) {
      return BorderSide(color: borderColor!, width: 1.2);
    }
    if (isDisabled) {
      return null;
    }
    switch (type) {
      case AppButtonType.secondary:
        return const BorderSide(color: AppColors.pickabooBlue, width: 1.2);
      case AppButtonType.outline:
        return const BorderSide(color: AppColors.border, width: 1.0);
      case AppButtonType.primary:
      case AppButtonType.ghost:
      case AppButtonType.danger:
        return null;
    }
  }

  TextStyle _resolveTextStyle() {
    if (textStyle != null) return textStyle!;
    final color = _resolveTextColor();
    switch (size) {
      case AppButtonSize.sm:
        return AppTypography.bodySmall.bold().withColor(color);
      case AppButtonSize.md:
      case AppButtonSize.lg:
        return AppTypography.button.withColor(color);
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = shrinkWrap ? height : _resolveHeight();
    final effectiveBg = _resolveBgColor();
    final effectiveBorderSide = _resolveBorderSide();
    final effectiveRadius = borderRadius ?? AppRadius.cardRadius;
    final effectiveTextStyle = _resolveTextStyle();
    final isClickable = !isLoading && !isDisabled && onPressed != null;

    final bool hasExplicitWidth = width != null;
    final bool shouldExpandWidth = isFullWidth && !shrinkWrap;

    Widget content;
    if (isLoading) {
      final loaderColor = (type == AppButtonType.primary || type == AppButtonType.danger)
          ? AppColors.white
          : AppColors.pickabooBlue;
      content = AppLoader.button(color: loaderColor);
    } else if (child != null) {
      content = child!;
    } else {
      final iconGap = shrinkWrap ? 4.w : 8.w;
      final textWidget = Text(
        text ?? '',
        style: effectiveTextStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        softWrap: false,
      );

      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            SizedBox(width: iconGap),
          ],
          if (shouldExpandWidth || hasExplicitWidth)
            Flexible(child: textWidget)
          else
            textWidget,
          if (iconRight != null) ...[
            SizedBox(width: iconGap),
            iconRight!,
          ],
        ],
      );
    }

    final effectivePadding = padding ?? (shrinkWrap ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 16.w));

    Widget buttonContent = content;
    if (shouldExpandWidth || hasExplicitWidth) {
      buttonContent = Center(child: content);
    }

    Widget button = Material(
      color: effectiveBg,
      shape: RoundedRectangleBorder(
        borderRadius: effectiveRadius,
        side: effectiveBorderSide ?? BorderSide.none,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: isClickable ? onPressed : null,
        child: Padding(
          padding: effectivePadding,
          child: buttonContent,
        ),
      ),
    );

    final double? targetWidth = isFullWidth ? (width ?? double.infinity) : width;

    if (effectiveHeight != null || targetWidth != null) {
      button = SizedBox(
        height: effectiveHeight,
        width: targetWidth,
        child: button,
      );
    }

    return button;
  }
}
