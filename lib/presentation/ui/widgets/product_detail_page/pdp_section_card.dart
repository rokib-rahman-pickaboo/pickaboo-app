import 'package:flutter/material.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// Centralized Reusable PDP Section Container Wrapper.
/// Unifies background color, internal padding, and bottom gutter separation across all PDP modules.
class PdpSectionCard extends StatelessWidget {
  final Widget child;
  final bool hasBottomGutter;
  final EdgeInsetsGeometry? customPadding;

  const PdpSectionCard({
    super.key,
    required this.child,
    this.hasBottomGutter = true,
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
          padding: customPadding ?? const EdgeInsets.all(AppSpacing.sameGroupItemSpacing),
          child: child,
        ),
        if (hasBottomGutter)
          Container(
            height: AppSpacing.groupToGroupSpacing * 0.5,
            color: AppColors.pageBg,
          ),
      ],
    );
  }
}
