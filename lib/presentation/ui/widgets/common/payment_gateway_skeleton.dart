import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Global Universal Payment Gateway Skeleton Loader.
/// Displays a simple, elegant placeholder while any payment gateway
/// (bKash, Nagad, Pathao Pay, Cards, Bank Portals) is loading.
class PaymentGatewaySkeleton extends StatelessWidget {
  const PaymentGatewaySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: Container(
        color: AppColors.white,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Security Header Badge
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.itemBackground,
                    borderRadius: AppRadius.k16,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock_outline_rounded,
                        size: 14.sp,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Secure Payment Gateway',
                        style: AppTypography.bodyTiny.bold().withColor(AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // 2. Order Summary Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.itemBackground,
                  borderRadius: AppRadius.k16,
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Payable Amount',
                          style: AppTypography.bodySmall.muted,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                          decoration: const BoxDecoration(
                            color: AppColors.surfaceBlue,
                            borderRadius: AppRadius.k4,
                          ),
                          child: Text(
                            'ORDER #1710711744',
                            style: AppTypography.bodyTiny.semiBold().blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '৳ 2,850.00',
                      style: AppTypography.titleLarge.bold().blue,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // 3. Gateway Provider Banner Placeholder
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: AppColors.itemBackground,
                  borderRadius: AppRadius.k16,
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: AppRadius.k8,
                      ),
                      child: Icon(
                        Icons.account_balance_wallet_outlined,
                        size: 26.sp,
                        color: AppColors.muted,
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140.w,
                            height: 14.h,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: AppRadius.k4,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 190.w,
                            height: 10.h,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: AppRadius.k4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // 4. Form / Input Fields Placeholder
              Text('Account / Payment Details', style: AppTypography.bodySmall.semiBold()),
              SizedBox(height: 8.h),
              Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.itemBackground,
                  borderRadius: AppRadius.k8,
                  border: Border.all(color: AppColors.border),
                ),
              ),
              SizedBox(height: 14.h),

              Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.itemBackground,
                  borderRadius: AppRadius.k8,
                  border: Border.all(color: AppColors.border),
                ),
              ),
              SizedBox(height: 28.h),

              // 5. Action Button Placeholder
              Container(
                width: double.infinity,
                height: 48.h,
                decoration: const BoxDecoration(
                  color: AppColors.pickabooBlue,
                  borderRadius: AppRadius.k8,
                ),
                child: Center(
                  child: Text(
                    'Proceed to Pay',
                    style: AppTypography.bodyMedium.bold().withColor(AppColors.white),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // 6. Universal Security Assurance Footer
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      size: 15.sp,
                      color: AppColors.muted,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      '100% Safe & Secure Payment Checkout',
                      style: AppTypography.bodyTiny.muted,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
