import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class FilterChipData {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  final IconData? trailingIcon;

  const FilterChipData({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.trailingIcon,
  });
}

class FilterChipRow extends StatelessWidget {
  final List<FilterChipData> chips;

  const FilterChipRow({super.key, required this.chips});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    if (chips.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      color: colors.white,
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
      child: SizedBox(
        height: 32.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: chips.length,
          separatorBuilder: (_, _) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            return _buildChip(chips[index], colors, textStyles);
          },
        ),
      ),
    );
  }

  Widget _buildChip(
    FilterChipData chip,
    AppColors colors,
    AppTextStyles textStyles,
  ) {
    final isSelected = chip.isSelected;

    return InkWell(
      onTap: chip.onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary : colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected
                ? colors.primary
                : colors.gray.withValues(alpha: 0.3),
            width: 1.w,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                chip.label,
                style: textStyles.bodyMedium.copyWith(
                  color: isSelected ? colors.white : colors.text,
                ),
              ),
              if (chip.trailingIcon != null) ...[
                SizedBox(width: 6.w),
                Icon(
                  chip.trailingIcon,
                  size: 14.sp,
                  color: isSelected ? colors.white : colors.text,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
