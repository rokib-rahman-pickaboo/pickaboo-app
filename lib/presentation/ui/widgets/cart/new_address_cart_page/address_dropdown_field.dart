import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

class AddressDropdownField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;
  final bool enabled;

  const AddressDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.bodyLarge.copyWith(color: AppColors.text)),
        SizedBox(height: 8.h),
        InkWell(
          onTap: enabled ? onTap : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: enabled ? AppColors.white : AppColors.muted.withValues(alpha: 0.1),
              borderRadius: AppRadius.inputRadius,
              border: Border.all(color: AppColors.muted.withValues(alpha: 0.2)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: AppTypography.bodyLarge.regular().copyWith(
                    color: enabled ? AppColors.text : AppColors.muted,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: AppColors.muted),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
