// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [KnowledgeBaseDetailsPage].
/// Pre-renders visual placeholders for FAQ accordion rows in an AppCard.
class KnowledgeBaseDetailsSkeleton extends StatelessWidget {
  final int itemCount;

  const KnowledgeBaseDetailsSkeleton({
    super.key,
    this.itemCount = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          AppSpacing.sameGroupItemSpacing.w,
          0,
          AppSpacing.sameGroupItemSpacing.w,
          AppSpacing.sameGroupItemSpacing.h + 16.h,
        ),
        child: Container(
          decoration: AppDecorations.cardBoxDecoration(),
          child: Column(
            children: [
              for (int i = 0; i < itemCount; i++) ...[
                if (i > 0)
                  const Divider(height: 1, thickness: 1, color: AppColors.border),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200.w,
                        height: 13.h,
                        decoration: const BoxDecoration(
                          color: AppColors.skeletonBase,
                          borderRadius: AppRadius.k4,
                        ),
                      ),
                      Container(
                        width: 16.r,
                        height: 16.r,
                        decoration: BoxDecoration(
                          color: AppColors.itemBackground,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 14.sp,
                            color: AppColors.skeletonBase,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
