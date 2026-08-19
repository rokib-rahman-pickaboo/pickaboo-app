import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class SettingListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Color? titleColor;
  final IconData? icon;
  final bool showDivider;

  const SettingListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.titleColor,
    this.icon,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Column(
      children: [
        ListTile(
          leading: icon != null
              ? Icon(icon, color: titleColor ?? colors.gray, size: 22.sp)
              : null,
          title: Text(
            title,
            style: textTheme.bodySmall.copyWith(
              color: titleColor ?? colors.text,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle!,
                  style: textTheme.bodySmall.copyWith(color: colors.gray),
                )
              : null,
          trailing: onTap != null && icon == null
              ? Icon(Icons.chevron_right, color: colors.gray, size: 20.sp)
              : null,
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        ),
        if (showDivider)
          Divider(
            height: 1.h,
            thickness: 1,
            color: colors.borderColor.withValues(alpha: 0.3),
            indent: 16.w,
            endIndent: 16.w,
          ),
      ],
    );
  }
}
