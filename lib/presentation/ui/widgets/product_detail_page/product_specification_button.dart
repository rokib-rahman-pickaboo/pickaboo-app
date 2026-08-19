import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class ProductSpecificationButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ProductSpecificationButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: colors.whiteSmoke,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.all(6.w),
                child: SvgPicture.asset(
                  'assets/new/svg/detail/assured_icon.svg',
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(colors.white, BlendMode.srcIn),
                ),
              ),
              SizedBox(width: 16.w),

              Expanded(
                child: Text(
                  'View All Specification',
                  style: textStyle.bodyMediumMedium.copyWith(
                    color: colors.text,
                  ),
                ),
              ),

              Icon(Icons.chevron_right, color: colors.textMedium, size: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}
