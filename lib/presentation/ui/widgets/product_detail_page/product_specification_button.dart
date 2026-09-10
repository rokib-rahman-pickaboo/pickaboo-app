import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class ProductSpecificationButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ProductSpecificationButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.pageBg,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: AppColors.pickabooBlue,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.all(6.w),
                child: SvgPicture.asset(
                  'assets/new/svg/detail/assured_icon.svg',
                  fit: BoxFit.fill,
                  colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
              ),
              SizedBox(width: 16.w),

              Expanded(
                child: Text(
                  'View All Specification',
                  style: textStyle.bodyMediumMedium.copyWith(
                    color: AppColors.text,
                  ),
                ),
              ),

              Icon(Icons.chevron_right, color: AppColors.muted, size: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}
