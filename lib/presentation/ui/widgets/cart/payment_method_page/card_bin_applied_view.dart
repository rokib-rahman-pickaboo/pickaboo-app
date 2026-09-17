// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

/// Modernized CardBinAppliedView matching Pickaboo-App-UI design language.
class CardBinAppliedView extends StatelessWidget {
  final int discountAmount;
  final String binCode;
  final VoidCallback onRemove;
  final bool isRemoving;

  const CardBinAppliedView({
    super.key,
    required this.discountAmount,
    required this.binCode,
    required this.onRemove,
    this.isRemoving = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(
          color: AppColors.green.withValues(alpha: 0.4),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(14.w),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  color: AppColors.green,
                  size: 22.sp,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    "Discount Applied",
                    style: AppTypography.titleLarge,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.border, height: 1),
          Padding(
            padding: EdgeInsets.all(14.w),
            child: Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: AppColors.green.withValues(alpha: 0.06),
                borderRadius: AppRadius.cardRadius,
                border: Border.all(
                  color: AppColors.green.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.credit_card_rounded,
                        color: AppColors.green,
                        size: 20.sp,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bank Discount Applied",
                              style: AppTypography.titleSmall,
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              "BIN: ......$binCode",
                              style: AppTypography.bodySmall.mutedLight,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "-৳$discountAmount",
                        style: AppTypography.savingsText.size(14.sp),
                      ),
                    ],
                  ),
                  AppSpacing.gapV14,
                  AppButton.outline(
                    text: "Remove Discount",
                    textColor: AppColors.red,
                    borderColor: AppColors.red.withValues(alpha: 0.4),
                    backgroundColor: AppColors.white,
                    borderRadius: AppRadius.cardRadius,
                    isFullWidth: true,
                    height: 38.h,
                    isLoading: isRemoving,
                    onPressed: isRemoving ? null : onRemove,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
