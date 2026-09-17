// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';

/// Skeleton loader matching the geometry of the payment methods list container.
class PaymentMethodListSkeleton extends StatelessWidget {
  final int itemCount;

  const PaymentMethodListSkeleton({
    super.key,
    this.itemCount = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: AppCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Text(
                'Select Payment Method',
                style: AppTypography.titleMedium,
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 1.h,
              color: AppColors.border,
            ),
            for (int i = 0; i < itemCount; i++) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                child: Row(
                  children: [
                    // Icon placeholder (36x36)
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: AppColors.pageBg,
                        borderRadius: AppRadius.buttonRadius,
                        border: Border.all(color: AppColors.border),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    // Title and subtitle placeholders
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: (i.isEven ? 130 : 95).w,
                            height: 14.h,
                            decoration: BoxDecoration(
                              color: AppColors.pageBg,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Container(
                            width: (i % 3 == 0 ? 190 : 140).w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              color: AppColors.pageBg,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    // Radio dot placeholder (20x20)
                    Container(
                      width: 20.r,
                      height: 20.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.pageBg,
                      ),
                    ),
                  ],
                ),
              ),
              if (i < itemCount - 1)
                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  indent: 62.w,
                  color: AppColors.border,
                ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Skeleton loader matching the geometry of [PaymentOrderSummary].
class PaymentSummarySkeleton extends StatelessWidget {
  const PaymentSummarySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.cardRadius,
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: AppColors.navy.withValues(alpha: 0.02),
              blurRadius: 6.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow(width: 130.w, valWidth: 65.w),
            SizedBox(height: 10.h),
            _buildRow(width: 100.w, valWidth: 45.w),
            SizedBox(height: 12.h),
            Divider(height: 1.h, thickness: 1.h, color: AppColors.border),
            SizedBox(height: 12.h),
            _buildRow(width: 110.w, valWidth: 80.w, isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({
    required double width,
    required double valWidth,
    bool isTotal = false,
  }) {
    return Row(
      children: [
        if (!isTotal) ...[
          Container(
            width: 20.r,
            height: 20.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.pageBg,
            ),
          ),
          SizedBox(width: 8.w),
        ],
        Container(
          width: width,
          height: isTotal ? 16.h : 13.h,
          decoration: BoxDecoration(
            color: AppColors.pageBg,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        const Spacer(),
        Container(
          width: valWidth,
          height: isTotal ? 16.h : 13.h,
          decoration: BoxDecoration(
            color: AppColors.pageBg,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ],
    );
  }
}
