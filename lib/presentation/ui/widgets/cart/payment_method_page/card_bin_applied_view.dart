// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

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
                    style: AppTypography.pageTitle,
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
                              style: AppTypography.cardTitle,
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              "BIN: ......$binCode",
                              style: AppTypography.bodyMutedLight,
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
                  SizedBox(height: 14.h),
                  SizedBox(
                    width: double.infinity,
                    height: 38.h,
                    child: OutlinedButton(
                      onPressed: isRemoving ? null : onRemove,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.red,
                        side: BorderSide(
                          color: AppColors.red.withValues(alpha: 0.4),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: AppRadius.cardRadius,
                        ),
                        backgroundColor: AppColors.white,
                      ),
                      child: isRemoving
                          ? const AppLoader.button(size: 16, color: AppColors.red)
                          : Text(
                              "Remove Discount",
                              style: AppTypography.brandActionText.withColor(AppColors.red),
                            ),
                    ),
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
