import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final String? svgIcon;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final Color? iconColor;

  const SocialLoginButton({
    super.key,
    required this.onPressed,
    this.icon,
    this.svgIcon,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.iconColor,
  }) : assert(
         icon != null || svgIcon != null,
         'Either icon or svgIcon must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          side: BorderSide(
            color: borderColor ?? backgroundColor.withValues(alpha: 0.3),
            width: 1.5.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgIcon != null)
              SvgPicture.asset(
                svgIcon!,
                width: 24.w,
                height: 24.h,
                fit: BoxFit.fill,
                colorFilter: iconColor != null
                    ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                    : null,
              )
            else if (icon != null)
              Icon(icon, size: 24.sp),

            SizedBox(width: 12.w),

            Text(
              label,
              style: context.textStyle.buttonText
                  .withColor(textColor)
            ),
          ],
        ),
      ),
    );
  }
}
