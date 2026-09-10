// ============================================================================
// ✍️ ZERO-HARDCODE DESIGN TOKENS ENFORCED
// All styling in this file originates from [AppColors] & [AppTypography].
// No direct [TextStyle] or unbranded Color instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

enum _LoaderType { circular, fullPage, pagination, button, inline, linear }

/// ============================================================================
/// 🔄 UNIFIED LOADER & PROGRESS BAR ARCHITECTURE FOR PICKABOO APP
/// Single source of truth for all loading states across the application.
///
/// 💡 FUTURE-PROOF: To update the loader design (e.g. switch to a Lottie
/// animation, branded animated SVG logo, or custom pulse), modify
/// [_buildCoreIndicator]. The entire application will automatically update.
/// ============================================================================
class AppLoader extends StatelessWidget {
  final _LoaderType _type;
  final double? size;
  final double? strokeWidth;
  final Color? color;
  final Color? backgroundColor;
  final String? message;
  final EdgeInsetsGeometry? padding;
  final double? value;

  // ── 1. Default Circular Loader ──
  const AppLoader({
    super.key,
    this.size,
    this.strokeWidth,
    this.color,
    this.padding,
  })  : _type = _LoaderType.circular,
        backgroundColor = null,
        message = null,
        value = null;

  // ── 2. Full-Page Initial Loader (Centered in view with optional message) ──
  const AppLoader.fullPage({
    super.key,
    this.message,
    this.color,
    this.backgroundColor,
  })  : _type = _LoaderType.fullPage,
        size = null,
        strokeWidth = null,
        padding = null,
        value = null;

  // ── 3. Pagination / Infinite Scroll Loader (List / Grid Bottom) ──
  const AppLoader.pagination({
    super.key,
    this.padding,
    this.color,
    this.size,
    this.strokeWidth,
  })  : _type = _LoaderType.pagination,
        backgroundColor = null,
        message = null,
        value = null;

  // ── 4. Button Loader (Constrained to match button heights) ──
  const AppLoader.button({
    super.key,
    this.size,
    this.strokeWidth,
    this.color = AppColors.white,
  })  : _type = _LoaderType.button,
        padding = null,
        backgroundColor = null,
        message = null,
        value = null;

  // ── 5. Inline / Card Loader (Compact for small containers) ──
  const AppLoader.inline({
    super.key,
    this.size,
    this.strokeWidth,
    this.color,
    this.padding,
    this.value,
  })  : _type = _LoaderType.inline,
        backgroundColor = null,
        message = null;

  // ── 6. Linear Progress Bar (Top bar indeterminate / determinate) ──
  const AppLoader.linear({
    super.key,
    this.color = AppColors.pickabooBlue,
    this.backgroundColor = AppColors.surfaceBlue,
    this.value,
  })  : _type = _LoaderType.linear,
        size = null,
        strokeWidth = null,
        message = null,
        padding = null;

  // ── 7. Sliver Helper for CustomScrollView ──
  static Widget sliver({EdgeInsetsGeometry? padding, Color? color}) {
    return SliverToBoxAdapter(
      child: AppLoader.pagination(padding: padding, color: color),
    );
  }

  // ── 8. Modal Dialog Helper (Blocking async operations) ──
  static void showModal(
    BuildContext context, {
    String? message,
    bool barrierDismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) => PopScope(
        canPop: barrierDismissible,
        child: Dialog(
          backgroundColor: AppColors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppLoader(),
                if (message != null) ...[
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      message,
                      style: AppTypography.bodyLarge,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void hideModal(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  // ── 9. Overlay Wrapper (Dims/blocks child when isLoading is true) ──
  static Widget overlay({
    Widget? child,
    required bool isLoading,
    String? message,
    Color? barrierColor,
    bool showCard = false,
  }) {
    final overlayContent = Positioned.fill(
      child: Stack(
        children: [
          ModalBarrier(
            dismissible: false,
            color: barrierColor ?? AppColors.transparent,
          ),
          Center(
            child: showCard
                ? Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.navy.withValues(alpha: 0.1),
                          blurRadius: 10.r,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppLoader(),
                        if (message != null) ...[
                          SizedBox(height: 10.h),
                          Text(message, style: AppTypography.brandActionText),
                        ],
                      ],
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppLoader(),
                      if (message != null) ...[
                        SizedBox(height: 10.h),
                        Text(message, style: AppTypography.brandActionText),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );

    if (child == null) {
      if (!isLoading) return const SizedBox.shrink();
      return overlayContent;
    }

    return Stack(
      children: [
        child,
        if (isLoading) overlayContent,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case _LoaderType.linear:
        return LinearProgressIndicator(
          value: value,
          color: color ?? AppColors.pickabooBlue,
          backgroundColor: backgroundColor ?? AppColors.surfaceBlue,
          minHeight: 2.5.h,
        );

      case _LoaderType.fullPage:
        return Container(
          color: backgroundColor ?? AppColors.transparent,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCoreIndicator(
                  resolvedSize: 36.sp,
                  resolvedStroke: 2.8.w,
                  resolvedColor: color ?? AppColors.pickabooBlue,
                ),
                if (message != null) ...[
                  SizedBox(height: 14.h),
                  Text(
                    message!,
                    style: AppTypography.bodyMuted,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        );

      case _LoaderType.pagination:
        return Padding(
          padding: padding ?? EdgeInsets.symmetric(vertical: 16.h),
          child: Center(
            child: _buildCoreIndicator(
              resolvedSize: size ?? 24.sp,
              resolvedStroke: strokeWidth ?? 2.2.w,
              resolvedColor: color ?? AppColors.pickabooBlue,
            ),
          ),
        );

      case _LoaderType.button:
        final btnSize = size ?? 18.sp;
        return Center(
          child: SizedBox(
            width: btnSize,
            height: btnSize,
            child: _buildCoreIndicator(
              resolvedSize: btnSize,
              resolvedStroke: strokeWidth ?? 2.0.w,
              resolvedColor: color ?? AppColors.white,
            ),
          ),
        );

      case _LoaderType.inline:
        return Padding(
          padding: padding ?? EdgeInsets.all(8.w),
          child: Center(
            child: _buildCoreIndicator(
              resolvedSize: size ?? 20.sp,
              resolvedStroke: strokeWidth ?? 2.0.w,
              resolvedColor: color ?? AppColors.pickabooBlue,
            ),
          ),
        );

      case _LoaderType.circular:
        final raw = _buildCoreIndicator(
          resolvedSize: size ?? 28.sp,
          resolvedStroke: strokeWidth ?? 2.5.w,
          resolvedColor: color ?? AppColors.pickabooBlue,
        );
        if (padding != null) {
          return Padding(padding: padding!, child: Center(child: raw));
        }
        return Center(child: raw);
    }
  }

  /// ==========================================================================
  /// 🎯 SINGLE SOURCE OF TRUTH FOR THE VISUAL INDICATOR
  /// If you ever want to change from CircularProgressIndicator to:
  /// - Lottie.asset('assets/animations/loader.json')
  /// - Custom Animated Logo / SVG Spinner
  /// - Shimmer Wave
  /// ONLY EDIT THIS METHOD. The entire app will change instantly.
  /// ==========================================================================
  Widget _buildCoreIndicator({
    required double resolvedSize,
    required double resolvedStroke,
    required Color resolvedColor,
  }) {
    return SizedBox(
      width: resolvedSize,
      height: resolvedSize,
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: resolvedStroke,
        valueColor: AlwaysStoppedAnimation<Color>(resolvedColor),
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
