// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling in this file originates from [AppTypography] & [AppColors] tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// High-contrast animated shimmer skeleton loader for [TicketDetailPage].
/// Pre-renders visual placeholders for:
/// 1. Ticket Info Summary Card (Subject, ticket code, priority badge, details)
/// 2. Message Thread (User message bubble + support agent response bubble)
/// 3. Sticky Bottom Reply Input Bar
class TicketDetailSkeleton extends StatelessWidget {
  const TicketDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: AppDecorations.shimmerEffect,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // ── 1. Ticket Info Summary Card ──
                  _buildTicketInfoCard(),

                  // ── 2. Message Thread Bubbles ──
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        _buildMessageBubble(isUser: true),
                        SizedBox(height: 16.h),
                        _buildMessageBubble(isUser: false),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),

          // ── 3. Bottom Sticky Reply Bar ──
          _buildReplyBar(),
        ],
      ),
    );
  }

  Widget _buildTicketInfoCard() {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(16.w),
      decoration: AppDecorations.cardBoxDecoration(
        borderRadius: AppRadius.k16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 14.h,
                      decoration: const BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      width: 140.w,
                      height: 14.h,
                      decoration: const BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      width: 80.w,
                      height: 11.h,
                      decoration: const BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                width: 60.w,
                height: 22.h,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  borderRadius: AppRadius.kFull,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Details container
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.itemBackground,
              borderRadius: AppRadius.k8,
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      width: 85.w,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        color: AppColors.skeletonBase,
                        borderRadius: AppRadius.k4,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 65.w,
                  height: 22.h,
                  decoration: const BoxDecoration(
                    color: AppColors.skeletonBase,
                    borderRadius: AppRadius.kFull,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble({required bool isUser}) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34.r,
                height: 34.r,
                decoration: const BoxDecoration(
                  color: AppColors.skeletonBase,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: isUser ? 100.w : 130.w,
                    height: 12.h,
                    decoration: const BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: 70.w,
                    height: 10.h,
                    decoration: const BoxDecoration(
                      color: AppColors.skeletonBase,
                      borderRadius: AppRadius.k4,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Message text lines
          Container(
            width: double.infinity,
            height: 11.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            width: isUser ? 200.w : 240.w,
            height: 11.h,
            decoration: const BoxDecoration(
              color: AppColors.skeletonBase,
              borderRadius: AppRadius.k4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReplyBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1.w),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Container(
              width: 36.r,
              height: 36.r,
              decoration: BoxDecoration(
                color: AppColors.itemBackground,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.border),
              ),
              child: Center(
                child: Icon(
                  Icons.attach_file,
                  size: 18.sp,
                  color: AppColors.skeletonBase,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Container(
                height: 42.h,
                decoration: BoxDecoration(
                  color: AppColors.itemBackground,
                  borderRadius: AppRadius.k8,
                  border: Border.all(color: AppColors.border),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              width: 38.r,
              height: 38.r,
              decoration: const BoxDecoration(
                color: AppColors.skeletonBase,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
