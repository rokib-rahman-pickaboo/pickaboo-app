import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

/// Centralized Reusable Search Bar Component for Pickaboo App.
class AppSearchBar extends StatelessWidget {
  final String? hintText;
  final List<String>? rotatingHints;
  final Duration? rotationInterval;
  final Duration? rotationInitialDelay;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool showFilterButton;
  final VoidCallback? onFilterTap;
  final EdgeInsetsGeometry padding;
  final double? height;
  final double? borderRadius;

  const AppSearchBar({
    super.key,
    this.hintText,
    this.rotatingHints,
    this.rotationInterval,
    this.rotationInitialDelay,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onTap,
    this.readOnly = false,
    this.showFilterButton = false,
    this.onFilterTap,
    this.padding = EdgeInsets.zero,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveHint = hintText ?? 'Search what you are looking for...';
    final effectiveHeight = height ?? 36.h;
    final effectiveRadius = borderRadius ?? 10.r;

    final bool hasRotatingHints =
        readOnly && rotatingHints != null && rotatingHints!.isNotEmpty;

    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: readOnly ? onTap : null,
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: effectiveHeight,
          decoration: BoxDecoration(
            color: AppColors.surfaceBlue,
            borderRadius: BorderRadius.circular(effectiveRadius),
            border: Border.all(
              color: AppColors.pickabooBlue.withValues(alpha: 0.35),
              width: 1.w,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10.w),
              Icon(
                Icons.search_rounded,
                color: AppColors.pickabooBlue,
                size: 18.sp,
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: readOnly
                    ? (hasRotatingHints
                        ? _RotatingSearchHint(
                            hints: rotatingHints!,
                            style: AppTypography.bodyMuted,
                            interval: rotationInterval ??
                                const Duration(milliseconds: 3000),
                            initialDelay: rotationInitialDelay ??
                                const Duration(milliseconds: 2000),
                          )
                        : Text(
                            effectiveHint,
                            style: AppTypography.bodyMuted,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ))
                    : TextField(
                        controller: controller,
                        onChanged: onChanged,
                        onSubmitted: onSubmitted,
                        textInputAction: TextInputAction.search,
                        cursorColor: AppColors.pickabooBlue,
                        style: AppTypography.bodyRegular,
                        decoration: InputDecoration(
                          hintText: effectiveHint,
                          hintStyle: AppTypography.inputHint,
                          filled: true,
                          fillColor: Colors.transparent,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 6.h),
                        ),
                      ),
              ),

              // ── Clear button ──
              if (!readOnly && controller != null && controller!.text.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    controller?.clear();
                    onClear?.call();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Icon(
                      Icons.close_rounded,
                      color: AppColors.muted,
                      size: 16.sp,
                    ),
                  ),
                ),

              // ── Optional filter button ──
              if (showFilterButton)
                GestureDetector(
                  onTap: onFilterTap,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w, left: 4.w),
                    child: Icon(
                      Icons.tune_rounded,
                      color: AppColors.pickabooBlue,
                      size: 18.sp,
                    ),
                  ),
                )
              else if (readOnly ||
                  controller == null ||
                  controller!.text.isEmpty)
                SizedBox(width: 10.w),
            ],
          ),
        ),
      ),
    );
  }
}

/// Dynamic Animated Rotating Text Widget
/// Cycles through search hint suggestions every 3s starting 2s after initialization
class _RotatingSearchHint extends StatefulWidget {
  final List<String> hints;
  final TextStyle style;
  final Duration interval;
  final Duration initialDelay;

  const _RotatingSearchHint({
    required this.hints,
    required this.style,
    this.interval = const Duration(milliseconds: 3000),
    this.initialDelay = const Duration(milliseconds: 2000),
  });

  @override
  State<_RotatingSearchHint> createState() => _RotatingSearchHintState();
}

class _RotatingSearchHintState extends State<_RotatingSearchHint> {
  Timer? _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.hints.length > 1) {
      _scheduleNext();
    }
  }

  @override
  void didUpdateWidget(covariant _RotatingSearchHint oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.hints != widget.hints) {
      _timer?.cancel();
      _currentIndex = 0;
      if (widget.hints.length > 1) {
        _scheduleNext();
      }
    }
  }

  void _scheduleNext() {
    _timer?.cancel();
    final delay = _currentIndex == 0 ? widget.initialDelay : widget.interval;
    _timer = Timer(delay, () {
      if (!mounted) return;
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.hints.length;
      });
      _scheduleNext();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentHint = widget.hints.isNotEmpty
        ? widget.hints[_currentIndex % widget.hints.length]
        : '';

    return ClipRect(
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
        child: Align(
          key: ValueKey<String>(currentHint),
          alignment: Alignment.centerLeft,
          child: Text(
            currentHint,
            style: widget.style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
