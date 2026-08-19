import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class ProductQASection extends StatelessWidget {
  const ProductQASection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Container(
      color: colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Questions and Answers',
            style: textStyle.headingSmall.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.text,
            ),
          ),
          SizedBox(height: 16.h),

          _buildQAItem(context),
          Container(
            height: 2.w,
            color: colors.borderColor,
            margin: EdgeInsets.symmetric(vertical: 16.h),
          ),
          _buildQAItem(context),
          Container(
            height: 2.w,
            color: colors.borderColor,
            margin: EdgeInsets.symmetric(vertical: 16.h),
          ),
          _buildQAItem(context),
          Container(
            height: 2.w,
            color: colors.borderColor,
            margin: EdgeInsets.symmetric(vertical: 16.h),
          ),
          _buildQAItem(context),

          SizedBox(height: 16.h),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              child: Text(
                'View All Questions and Answers',
                style: textStyle.buttonMedium.copyWith(color: colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQAItem(BuildContext context) {
    final colors = context.colors;
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
                style: textStyle.reviewText.copyWith(color: colors.text),
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
                style: textStyle.reviewText.copyWith(color: colors.text),
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
                  colorFilter: ColorFilter.mode(colors.gray, BlendMode.srcIn),
                ),
                SizedBox(width: 6.w),
                Text(
                  '305',
                  style: textStyle.ratingCount.copyWith(
                    color: colors.textMedium,
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
                  colorFilter: ColorFilter.mode(colors.gray, BlendMode.srcIn),
                ),
                SizedBox(width: 6.w),
                Text(
                  '116',
                  style: textStyle.ratingCount.copyWith(
                    color: colors.textMedium,
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
