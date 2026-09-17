import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

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
        borderRadius: AppRadius.cardRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AppButton(
        type: AppButtonType.outline,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        textColor: textColor,
        borderColor: borderColor ?? backgroundColor.withValues(alpha: 0.3),
        borderRadius: AppRadius.cardRadius,
        height: 48.h,
        isFullWidth: true,
        text: label,
        textStyle: AppTypography.button.withColor(textColor),
        icon: svgIcon != null
            ? SvgPicture.asset(
                svgIcon!,
                width: 24.w,
                height: 24.h,
                fit: BoxFit.fill,
                colorFilter: iconColor != null
                    ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                    : null,
              )
            : (icon != null
                ? Icon(icon, size: 24.sp, color: iconColor ?? textColor)
                : null),
      ),
    );
  }
}
