// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// ============================================================================
/// ❓ UNIFIED QUESTION FILTER WIDGET
/// Center-aligned interactive question filter bar used across Home & Category pages.
///
/// Features:
/// - Question Title & Reset Action centered horizontally.
/// - Option Chip pills centered horizontally with smooth horizontal scrolling.
/// - Selected option highlighted in Pickaboo Brand Blue.
/// ============================================================================
class QuestionFilterWidget extends StatefulWidget {
  final String questionTitle;
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String?> onOptionSelected;
  final bool isSecondary;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const QuestionFilterWidget({
    super.key,
    required this.questionTitle,
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
    this.isSecondary = false,
    this.margin,
    this.padding,
  });

  @override
  State<QuestionFilterWidget> createState() => _QuestionFilterWidgetState();
}

class _QuestionFilterWidgetState extends State<QuestionFilterWidget> {
  late final ScrollController _scrollController;
  bool _canScrollLeft = false;
  bool _canScrollRight = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_checkScrollability);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkScrollability());
  }

  @override
  void didUpdateWidget(covariant QuestionFilterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.options != widget.options) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _checkScrollability());
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkScrollability);
    _scrollController.dispose();
    super.dispose();
  }

  void _checkScrollability() {
    if (!mounted || !_scrollController.hasClients) return;
    final position = _scrollController.position;
    final maxScroll = position.maxScrollExtent;
    final currentScroll = position.pixels;

    final canScrollLeft = currentScroll > 4.0;
    final canScrollRight = maxScroll > 4.0 && currentScroll < (maxScroll - 4.0);

    if (canScrollLeft != _canScrollLeft || canScrollRight != _canScrollRight) {
      setState(() {
        _canScrollLeft = canScrollLeft;
        _canScrollRight = canScrollRight;
      });
    }
  }

  void _scrollBy(double offset) {
    if (!_scrollController.hasClients) return;
    final target = (_scrollController.offset + offset).clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );
    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
    );
  }

  Widget _buildScrollArrow({
    required IconData icon,
    required VoidCallback onTap,
    required bool isVisible,
  }) {
    return IgnorePointer(
      ignoring: !isVisible,
      child: AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 180),
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(14.r),
                child: Container(
                  width: 28.r,
                  height: 28.r,
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.72),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.85),
                      width: 1.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.navy.withValues(alpha: 0.08),
                        blurRadius: 4.r,
                        offset: Offset(0, 1.h),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 16.sp,
                      color: AppColors.pickabooBlue,
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

  @override
  Widget build(BuildContext context) {
    // ============================================================================
    // 🛑 SKIP SINGLE-OPTION QUESTIONS:
    // A question with only 1 choice (e.g. price range "30 - 922990" or a single brand)
    // makes no sense to display as the user cannot make an active selection.
    // Skip price or ANY question that has only 1 option (options.length <= 1).
    // NOTE: This rule must always be maintained in future updates.
    // ============================================================================
    if (widget.options.length <= 1) return const SizedBox.shrink();

    final bool hasSelection = widget.selectedOption != null;

    return Container(
      width: double.infinity,
      color: AppColors.surfaceBlue,
      padding: widget.padding ?? EdgeInsets.symmetric(vertical: 8.h),
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── 1. CENTERED QUESTION TITLE ROW + RESET BUTTON ──
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    widget.questionTitle,
                    textAlign: TextAlign.center,
                    style: AppTypography.titleSmall,
                  ),
                ),
                if (hasSelection) ...[
                  SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
                  InkWell(
                    onTap: () => widget.onOptionSelected(null),
                    borderRadius: AppRadius.cardRadius,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: AppColors.redBg,
                        borderRadius: AppRadius.cardRadius,
                        border: Border.all(
                          color: AppColors.red.withValues(alpha: 0.5),
                          width: 0.8.w,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.close_rounded,
                              size: 11.sp, color: AppColors.red),
                          SizedBox(width: 2.w),
                          Text(
                            'RESET',
                            style: AppTypography.bodyTiny.extraBold().red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          SizedBox(height: 6.h),

          // ── 2. HORIZONTAL OPTION CHIPS WITH BIDIRECTIONAL FADE & ARROWS ──
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRect(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    final fadeWidth = 48.w;
                    final leftStop = (_canScrollLeft && bounds.width > fadeWidth)
                        ? (fadeWidth / bounds.width).clamp(0.0, 0.4)
                        : 0.0;
                    final rightStop = (_canScrollRight && bounds.width > fadeWidth)
                        ? (1.0 - (fadeWidth / bounds.width)).clamp(0.6, 1.0)
                        : 1.0;

                    return LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        if (_canScrollLeft) Colors.transparent else AppColors.black,
                        AppColors.black,
                        AppColors.black,
                        if (_canScrollRight) Colors.transparent else AppColors.black,
                      ],
                      stops: [
                        0.0,
                        leftStop,
                        rightStop,
                        1.0,
                      ],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.sameGroupItemSpacing.w,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(widget.options.length, (index) {
                          final option = widget.options[index];
                          final isSelected = widget.selectedOption == option;

                          return Padding(
                            padding: EdgeInsets.only(
                              right: index == widget.options.length - 1
                                  ? 0
                                  : AppSpacing.sameGroupItemSpacing.w,
                            ),
                            child: InkWell(
                              onTap: () {
                                widget.onOptionSelected(
                                    isSelected ? null : option);
                              },
                              borderRadius: AppRadius.cardRadius,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.w, vertical: 7.h),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.pickabooBlue
                                      : AppColors.white,
                                  borderRadius: AppRadius.cardRadius,
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.pickabooBlue
                                        : AppColors.border,
                                    width: 1.2.w,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: isSelected
                                          ? AppColors.pickabooBlue
                                              .withValues(alpha: 0.25)
                                          : AppColors.navy
                                              .withValues(alpha: 0.02),
                                      blurRadius: 4.r,
                                      offset: Offset(0, 2.h),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    option,
                                    textAlign: TextAlign.center,
                                    style: isSelected
                                        ? AppTypography.button
                                        : AppTypography.titleSmall,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),

              // ── Left Scroll Arrow ──
              Positioned(
                left: 4.w,
                child: _buildScrollArrow(
                  icon: Icons.chevron_left_rounded,
                  onTap: () => _scrollBy(-160.w),
                  isVisible: _canScrollLeft,
                ),
              ),

              // ── Right Scroll Arrow ──
              Positioned(
                right: 4.w,
                child: _buildScrollArrow(
                  icon: Icons.chevron_right_rounded,
                  onTap: () => _scrollBy(160.w),
                  isVisible: _canScrollRight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
