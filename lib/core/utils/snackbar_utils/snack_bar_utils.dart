// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';

/// ─────────────────────────────────────────────────────────────
/// 🔔 PREMIUM FLOATING SNACKBAR NOTIFICATION TYPES
/// 3 primary types:
///   1. Regular / Informational (Pickaboo Blue brand accent)
///   2. Positive / Confirmation (Emerald Green accent)
///   3. Negative / Error (Rose Red accent)
/// Plus Warning for backward compatibility.
/// ─────────────────────────────────────────────────────────────
enum SnackBarType {
  /// 1. Regular / Informational (Brand Sky Blue indicator)
  regular,

  /// 2. Positive / Confirmation (Emerald Green indicator)
  positive,

  /// 3. Negative / Critical Alert (Rose Red indicator)
  negative,

  /// 4. Warning / Caution (Amber indicator)
  warning,
}

extension SnackBarTypeExtension on SnackBarType {
  Color get accentColor {
    switch (this) {
      case SnackBarType.regular:
        return AppColors.pickabooBlue;
      case SnackBarType.positive:
        return AppColors.green;
      case SnackBarType.negative:
        return AppColors.red;
      case SnackBarType.warning:
        return AppColors.amber;
    }
  }

  Color get surfaceColor {
    switch (this) {
      case SnackBarType.regular:
        return AppColors.surfaceBlue;
      case SnackBarType.positive:
        return AppColors.greenBg;
      case SnackBarType.negative:
        return AppColors.redBg;
      case SnackBarType.warning:
        return AppColors.amberBg;
    }
  }

  IconData get defaultIcon {
    switch (this) {
      case SnackBarType.regular:
        return Icons.info_outline_rounded;
      case SnackBarType.positive:
        return Icons.check_rounded;
      case SnackBarType.negative:
        return Icons.warning_amber_rounded;
      case SnackBarType.warning:
        return Icons.warning_amber_rounded;
    }
  }

  String get defaultTitle {
    switch (this) {
      case SnackBarType.regular:
        return AppStrings.notice;
      case SnackBarType.positive:
        return AppStrings.success;
      case SnackBarType.negative:
        return AppStrings.somethingWentWrong;
      case SnackBarType.warning:
        return AppStrings.warning;
    }
  }

  String? get defaultTag {
    switch (this) {
      case SnackBarType.regular:
        return 'INFO';
      case SnackBarType.positive:
        return 'SUCCESS';
      case SnackBarType.negative:
        return 'FAILED';
      case SnackBarType.warning:
        return 'ALERT';
    }
  }
}

/// Floating SnackBar vertical display position
enum SnackBarPosition { bottom, top }

/// Backward compatible alias
typedef ToastPosition = SnackBarPosition;

/// ─────────────────────────────────────────────────────────────
/// 🔔 PREMIUM FLOATING SNACKBAR UTILS
/// High-visibility white card with left colored indicator strip,
/// rounded square icon badge, bold title + status tag, sanitized
/// subtitle copy, optional action button, and close icon button.
/// ─────────────────────────────────────────────────────────────
class SnackBarUtils {
  static OverlayEntry? _currentEntry;
  static Timer? _dismissTimer;
  static String? _lastKey;
  static DateTime? _lastShownAt;
  static const _dedupeWindow = Duration(milliseconds: 1200);

  /// Default toast display duration (1 second)
  static const Duration defaultMsgDuration = Duration(seconds: 1);

  /// Dismiss currently visible floating snackbar
  static void dismiss() {
    _dismissTimer?.cancel();
    _dismissTimer = null;
    _currentEntry?.remove();
    _currentEntry = null;
  }

  // ===========================================================================
  // ── 1. REGULAR / INFORMATIONAL (BRAND BLUE) ────────────────────────────────
  // ===========================================================================
  static void showRegular(
    BuildContext context,
    String message, {
    String? title,
    String? tagText,
    IconData? icon,
    ToastPosition position = ToastPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = defaultMsgDuration,
  }) {
    show(
      context,
      message: message,
      title: title,
      tagText: tagText,
      type: SnackBarType.regular,
      icon: icon,
      position: position,
      actionLabel: actionLabel,
      onAction: onAction,
      duration: duration,
    );
  }

  // ===========================================================================
  // ── 2. POSITIVE / CONFIRMATION (EMERALD GREEN) ────────────────────────────
  // ===========================================================================
  static void showPositive(
    BuildContext context,
    String message, {
    String? title,
    String? tagText,
    IconData? icon,
    ToastPosition position = ToastPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = defaultMsgDuration,
  }) {
    show(
      context,
      message: message,
      title: title,
      tagText: tagText,
      type: SnackBarType.positive,
      icon: icon,
      position: position,
      actionLabel: actionLabel,
      onAction: onAction,
      duration: duration,
    );
  }

  // ===========================================================================
  // ── 3. NEGATIVE / CRITICAL ALERT (ROSE RED) ────────────────────────────────
  // ===========================================================================
  static void showNegative(
    BuildContext context,
    String message, {
    String? title,
    String? tagText,
    IconData? icon,
    ToastPosition position = ToastPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = defaultMsgDuration,
  }) {
    final cleanMessage = ApiErrorParser.sanitize(message);
    show(
      context,
      message: cleanMessage,
      title: title,
      tagText: tagText,
      type: SnackBarType.negative,
      icon: icon,
      position: position,
      actionLabel: actionLabel,
      onAction: onAction,
      duration: duration,
    );
  }

  // ===========================================================================
  // ── 4. UNIVERSAL DISPATCHER ────────────────────────────────────────────────
  // ===========================================================================
  static void show(
    BuildContext context, {
    required String message,
    String? title,
    String? tagText,
    SnackBarType type = SnackBarType.regular,
    IconData? icon,
    ToastPosition position = ToastPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = defaultMsgDuration,
  }) {
    final rawTitle = title ?? type.defaultTitle;
    final effectiveTitle = ApiErrorParser.isTechnicalOrServerCrash(rawTitle)
        ? type.defaultTitle
        : rawTitle;
    final effectiveTag = tagText ?? type.defaultTag;
    final effectiveIcon = icon ?? type.defaultIcon;
    final effectiveAccent = type.accentColor;
    final effectiveSurface = type.surfaceColor;

    final effectiveMessage = message.trim().isNotEmpty
        ? (type == SnackBarType.negative || ApiErrorParser.isTechnicalOrServerCrash(message)
            ? ApiErrorParser.sanitize(message)
            : message.trim())
        : (type == SnackBarType.positive
            ? AppStrings.operationSuccessful
            : AppStrings.somethingWentWrong);

    final key = '$effectiveTitle|$effectiveMessage|${position.name}';
    final now = DateTime.now();
    if (_lastKey == key &&
        _lastShownAt != null &&
        now.difference(_lastShownAt!) < _dedupeWindow) {
      return;
    }
    _lastKey = key;
    _lastShownAt = now;

    dismiss();

    final overlayState =
        Overlay.maybeOf(context, rootOverlay: true) ??
        Navigator.maybeOf(context, rootNavigator: true)?.overlay;

    if (overlayState == null) return;

    final entry = OverlayEntry(
      builder: (ctx) => _PremiumFloatingSnackBarWidget(
        title: effectiveTitle,
        tagText: effectiveTag,
        message: effectiveMessage,
        icon: effectiveIcon,
        type: type,
        accent: effectiveAccent,
        surface: effectiveSurface,
        duration: duration,
        position: position,
        actionLabel: actionLabel,
        onAction: onAction,
        onDismiss: dismiss,
      ),
    );

    _currentEntry = entry;
    overlayState.insert(entry);
  }

  // ===========================================================================
  // ── 5. BACKWARD COMPATIBLE CONVENIENCE HELPERS ────────────────────────────
  // ===========================================================================

  /// Alias for [showPositive]
  static void showSuccess(
    BuildContext context,
    String message, {
    ToastPosition position = ToastPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    String? tagText,
    Duration duration = defaultMsgDuration,
  }) =>
      showPositive(
        context,
        message,
        position: position,
        actionLabel: actionLabel,
        onAction: onAction,
        tagText: tagText,
        duration: duration,
      );

  /// Alias for [showNegative]
  static void showError(
    BuildContext context,
    String message, {
    ToastPosition position = ToastPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    String? tagText,
    Duration duration = defaultMsgDuration,
  }) =>
      showNegative(
        context,
        message,
        position: position,
        actionLabel: actionLabel,
        onAction: onAction,
        tagText: tagText,
        duration: duration,
      );

  /// Alias for [showRegular]
  static void showInfo(
    BuildContext context,
    String message, {
    ToastPosition position = ToastPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    String? tagText,
    Duration duration = defaultMsgDuration,
  }) =>
      showRegular(
        context,
        message,
        position: position,
        actionLabel: actionLabel,
        onAction: onAction,
        tagText: tagText,
        duration: duration,
      );

  /// Warning / Caution alert (Amber)
  static void showWarning(
    BuildContext context,
    String message, {
    ToastPosition position = ToastPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    String? tagText,
    Duration duration = defaultMsgDuration,
  }) =>
      show(
        context,
        message: message,
        type: SnackBarType.warning,
        position: position,
        actionLabel: actionLabel,
        onAction: onAction,
        tagText: tagText,
        duration: duration,
      );

  /// Specific Cart added notification with 'View Cart' CTA
  static void showCartItemAdded(
    BuildContext context, {
    String message = 'Item added to cart',
    String? itemName,
    int? itemCount,
    ToastPosition position = ToastPosition.bottom,
    Duration duration = defaultMsgDuration,
  }) {
    show(
      context,
      title: 'Added to Cart',
      tagText: itemCount != null ? '$itemCount ITEM${itemCount > 1 ? 'S' : ''}' : '1 ITEM',
      message: itemName ?? message,
      type: SnackBarType.regular,
      icon: Icons.shopping_bag_outlined,
      duration: duration,
      position: position,
      actionLabel: 'View Cart',
      onAction: () {
        dismiss();
        context.push(Routes.cart);
      },
    );
  }

  /// Specific Comparison added notification with 'Compare' CTA
  static void showComparisonAdded(
    BuildContext context, {
    String message = 'Added to comparison list',
    VoidCallback? onCompare,
    ToastPosition position = ToastPosition.bottom,
    Duration duration = defaultMsgDuration,
  }) {
    show(
      context,
      title: 'Comparison',
      tagText: 'ADDED',
      message: message,
      type: SnackBarType.regular,
      icon: Icons.compare_arrows_rounded,
      duration: duration,
      position: position,
      actionLabel: 'Compare',
      onAction: onCompare,
    );
  }
}

// ============================================================================
// ── 6. FLOATING SNACKBAR COMPONENT WIDGET ──────────────────────────────────
// ============================================================================
class _PremiumFloatingSnackBarWidget extends StatefulWidget {
  final String title;
  final String? tagText;
  final String message;
  final IconData icon;
  final SnackBarType type;
  final Color accent;
  final Color surface;
  final Duration duration;
  final ToastPosition position;
  final String? actionLabel;
  final VoidCallback? onAction;
  final VoidCallback onDismiss;

  const _PremiumFloatingSnackBarWidget({
    required this.title,
    this.tagText,
    required this.message,
    required this.icon,
    required this.type,
    required this.accent,
    required this.surface,
    required this.duration,
    required this.position,
    this.actionLabel,
    this.onAction,
    required this.onDismiss,
  });

  @override
  State<_PremiumFloatingSnackBarWidget> createState() =>
      _PremiumFloatingSnackBarWidgetState();
}

class _PremiumFloatingSnackBarWidgetState
    extends State<_PremiumFloatingSnackBarWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;
  Timer? _autoDismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
      reverseDuration: const Duration(milliseconds: 250),
    );

    final isTop = widget.position == ToastPosition.top;
    _slideAnimation = Tween<Offset>(
      begin: isTop ? const Offset(0, -0.6) : const Offset(0, 0.6),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ));

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    _controller.forward();

    _autoDismissTimer = Timer(widget.duration, _dismissSmoothly);
  }

  void _dismissSmoothly() {
    if (!mounted) return;
    _autoDismissTimer?.cancel();
    _controller.reverse().then((_) {
      if (mounted) {
        widget.onDismiss();
      }
    });
  }

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTop = widget.position == ToastPosition.top;
    final topPadding = isTop ? MediaQuery.paddingOf(context).top + 10.h : null;
    final bottomPadding = !isTop
        ? MediaQuery.paddingOf(context).bottom + 20.h
        : null;

    return Positioned(
      top: topPadding,
      bottom: bottomPadding,
      left: AppSpacing.sameGroupItemSpacing.w,
      right: AppSpacing.sameGroupItemSpacing.w,
      child: Material(
        type: MaterialType.transparency,
        child: SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (isTop && details.primaryDelta != null && details.primaryDelta! < -4) {
                  _dismissSmoothly();
                } else if (!isTop && details.primaryDelta != null && details.primaryDelta! > 4) {
                  _dismissSmoothly();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: widget.surface,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: widget.accent.withValues(alpha: 0.3),
                    width: 1.w,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.navy.withValues(alpha: 0.12),
                      blurRadius: 18.r,
                      offset: isTop ? Offset(0, 6.h) : Offset(0, -4.h),
                    ),
                    BoxShadow(
                      color: widget.accent.withValues(alpha: 0.15),
                      blurRadius: 10.r,
                      offset: isTop ? Offset(0, 2.h) : Offset(0, -2.h),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Left vertical colored accent bar (matching reference design)
                        Container(
                          width: 4.5.w,
                          color: widget.accent,
                        ),

                        // Main Card Content
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Rounded square icon badge (white for high contrast on light card)
                                Container(
                                  width: 38.w,
                                  height: 38.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                      color: widget.accent.withValues(alpha: 0.25),
                                      width: 1.w,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: widget.accent.withValues(alpha: 0.1),
                                        blurRadius: 4.r,
                                        offset: Offset(0, 1.h),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    widget.icon,
                                    size: 20.sp,
                                    color: widget.accent,
                                  ),
                                ),
                                SizedBox(width: 10.w),

                                // Title, Status Tag & Subtitle Message
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              widget.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTypography.titleSmall.copyWith(
                                                fontSize: 12.5.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.navy,
                                              ),
                                            ),
                                          ),
                                          if (widget.tagText != null &&
                                              widget.tagText!.isNotEmpty) ...[
                                            SizedBox(width: 6.w),
                                            Container(
                                              width: 4.w,
                                              height: 4.w,
                                              decoration: BoxDecoration(
                                                color: widget.accent,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            SizedBox(width: 6.w),
                                            Flexible(
                                              child: Text(
                                                widget.tagText!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTypography.brandTag.copyWith(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w800,
                                                  color: widget.accent,
                                                  letterSpacing: 0.4,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        widget.message,
                                        style: AppTypography.bodySmall.copyWith(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.text,
                                          height: 1.3,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),

                                // Optional Action Button (e.g. View Cart, Retry, Receipt)
                                if (widget.actionLabel != null &&
                                    widget.onAction != null) ...[
                                  SizedBox(width: 8.w),
                                  GestureDetector(
                                    onTap: () {
                                      widget.onAction?.call();
                                      _dismissSmoothly();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: widget.type == SnackBarType.negative
                                            ? AppColors.white
                                            : widget.accent,
                                        borderRadius: BorderRadius.circular(8.r),
                                        border: widget.type == SnackBarType.negative
                                            ? Border.all(
                                                color: widget.accent.withValues(alpha: 0.35),
                                                width: 1.w,
                                              )
                                            : null,
                                        boxShadow: [
                                          BoxShadow(
                                            color: (widget.type == SnackBarType.negative
                                                    ? widget.accent
                                                    : widget.accent)
                                                .withValues(alpha: 0.2),
                                            blurRadius: 4.r,
                                            offset: Offset(0, 1.5.h),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        widget.actionLabel!,
                                        style: AppTypography.button.copyWith(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w700,
                                          color: widget.type == SnackBarType.negative
                                              ? widget.accent
                                              : AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],

                                SizedBox(width: 6.w),

                                // Dismiss / Close (X) Button
                                GestureDetector(
                                  onTap: _dismissSmoothly,
                                  behavior: HitTestBehavior.opaque,
                                  child: Padding(
                                    padding: EdgeInsets.all(4.w),
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: 16.sp,
                                      color: AppColors.navy.withValues(alpha: 0.65),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
