import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class ProductQASection extends StatelessWidget {
  const ProductQASection({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Questions and Answers',
            style: textStyle.headingSmall.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
          ),
          SizedBox(height: 16.h),

          _buildQAItem(context),
          Container(
            height: 2.w,
            color: AppColors.border,
            margin: EdgeInsets.symmetric(vertical: 16.h),
          ),
          _buildQAItem(context),
          Container(
            height: 2.w,
            color: AppColors.border,
            margin: EdgeInsets.symmetric(vertical: 16.h),
          ),
          _buildQAItem(context),
          Container(
            height: 2.w,
            color: AppColors.border,
            margin: EdgeInsets.symmetric(vertical: 16.h),
          ),
          _buildQAItem(context),

          SizedBox(height: 16.h),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.pickabooBlue,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              child: Text(
                'View All Questions and Answers',
                style: textStyle.buttonMedium.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQAItem(BuildContext context) {
    final textStyle = context.textStyle;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/new/svg/detail/question_icon.svg',
              width: 20.w,
              height: 20.w,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'This fridge work to home inverter ?',
                style: textStyle.reviewText.copyWith(color: AppColors.text),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/new/svg/detail/answer_icon.svg',
              width: 20.w,
              height: 20.w,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Yes working for home inverter',
                style: textStyle.reviewText.copyWith(color: AppColors.text),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),

        Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/new/svg/detail/thum_up_icon.svg',
                  width: 16.w,
                  height: 16.w,
                  colorFilter: const ColorFilter.mode(AppColors.muted, BlendMode.srcIn),
                ),
                SizedBox(width: 6.w),
                Text(
                  '305',
                  style: textStyle.ratingCount.copyWith(
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
            SizedBox(width: 24.w),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/new/svg/detail/thum_down.svg',
                  width: 16.w,
                  height: 16.w,
                  colorFilter: const ColorFilter.mode(AppColors.muted, BlendMode.srcIn),
                ),
                SizedBox(width: 6.w),
                Text(
                  '116',
                  style: textStyle.ratingCount.copyWith(
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
