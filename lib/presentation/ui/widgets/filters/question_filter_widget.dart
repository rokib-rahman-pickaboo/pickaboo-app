// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

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
class QuestionFilterWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    if (options.isEmpty) return const SizedBox.shrink();

    final bool hasSelection = selectedOption != null;

    return Container(
      width: double.infinity,
      color: AppColors.surfaceBlue,
      padding: padding ?? EdgeInsets.symmetric(vertical: 8.h),
      margin: margin,
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
                    questionTitle,
                    textAlign: TextAlign.center,
                    style: AppTypography.cardTitle,
                  ),
                ),
                if (hasSelection) ...[
                  SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
                  InkWell(
                    onTap: () => onOptionSelected(null),
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
                            style: AppTypography.badgeStockOut,
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

          // ── 2. CENTERED HORIZONTAL OPTION CHIPS ──
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(options.length, (index) {
                  final option = options[index];
                  final isSelected = selectedOption == option;

                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == options.length - 1
                          ? 0
                          : AppSpacing.sameGroupItemSpacing.w,
                    ),
                    child: InkWell(
                      onTap: () {
                        onOptionSelected(isSelected ? null : option);
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
                                  : AppColors.navy.withValues(alpha: 0.02),
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
                                ? AppTypography.buttonPrimary
                                : AppTypography.cardTitle,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
