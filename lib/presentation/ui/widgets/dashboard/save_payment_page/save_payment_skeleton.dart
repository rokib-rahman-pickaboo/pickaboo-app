// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [SavePaymentPage].
/// Pre-renders visual placeholders for:
/// 1. Top Header Info Card (Wallet icon, title, and descriptive subtitle)
/// 2. Mobile Wallets & Cards Section Card
///    - Section Title & Icon
///    - 3 Saved Payment Method Rows (Wallet logo box, masked number, delete button)
class SavePaymentSkeleton extends StatelessWidget {
  final int itemCount;

  const SavePaymentSkeleton({
    super.key,
    this.itemCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sameGroupItemSpacing.w,
            vertical: AppSpacing.sameGroupItemSpacing.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── 1. Header Info Card ──
              _buildHeaderInfoCard(),

              AppSpacing.groupToGroupGap,

              // ── 2. Wallets & Cards Card ──
              _buildCardsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderInfoCard() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: AppColors.itemBackground,
              borderRadius: AppRadius.k8,
              border: Border.all(color: AppColors.border),
            ),
            child: Center(
              child: Icon(
                Icons.account_balance_wallet_outlined,
                size: 22.sp,
                color: AppColors.skeletonBase,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 160.w,
                  height: 14.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 220.w,
                  height: 11.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardsSection() {
    return Container(
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Padding(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Row(
              children: [
                Icon(
                  Icons.credit_card_outlined,
                  size: 20.sp,
                  color: AppColors.skeletonBase,
                ),
                SizedBox(width: 10.w),
                Container(
                  width: 150.w,
                  height: 14.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.k4,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: AppColors.border),

          // Payment rows
          for (int i = 0; i < itemCount; i++) ...[
            if (i > 0)
              Padding(
                padding: EdgeInsets.only(left: 68.w),
                child: const Divider(height: 1, thickness: 1, color: AppColors.border),
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.sameGroupItemSpacing.w,
                vertical: 12.h,
              ),
              child: Row(
                children: [
                  // Logo container
                  Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: AppColors.itemBackground,
                      borderRadius: AppRadius.k8,
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.payment_outlined,
                        size: 20.sp,
                        color: AppColors.skeletonBase,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  // Name & Masked digits
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80.w,
                          height: 13.h,
                          decoration: const BoxDecoration(
                            color: AppColors.skeletonBase,
                            borderRadius: AppRadius.k4,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          width: 130.w,
                          height: 11.h,
                          decoration: const BoxDecoration(
                            color: AppColors.skeletonBase,
                            borderRadius: AppRadius.k4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Trash action icon
                  Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: AppColors.itemBackground,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.delete_outline,
                        size: 16.sp,
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
    );
  }
}
