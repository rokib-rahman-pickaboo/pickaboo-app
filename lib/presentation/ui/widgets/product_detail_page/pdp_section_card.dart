import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// Centralized Reusable PDP Section Container Wrapper.
/// Provides full-width neutral canvas section container with standard padding
/// and subtle section spacing, preserving the approved page hierarchy.
class PdpSectionCard extends StatelessWidget {
  final Widget child;
  final bool hasBottomGutter;
  final EdgeInsetsGeometry? customPadding;

  const PdpSectionCard({
    super.key,
    required this.child,
    this.hasBottomGutter = false,
    this.customPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          color: AppColors.white,
          padding: customPadding ??
              EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
          child: child,
        ),
        if (hasBottomGutter)
          SizedBox(height: 8.h),
      ],
    );
  }
}
