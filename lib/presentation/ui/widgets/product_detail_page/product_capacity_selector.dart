import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class ProductCapacitySelector extends StatefulWidget {
  const ProductCapacitySelector({super.key});

  @override
  State<ProductCapacitySelector> createState() =>
      _ProductCapacitySelectorState();
}

class _ProductCapacitySelectorState extends State<ProductCapacitySelector> {
  int _selectedIndex = 1;

  final List<String> _capacities = ['398 L', '240 L', '260 L'];

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80.w,
            child: Row(
              children: [
                Text(
                  'Capacity',
                  style: textStyle.robotoBlack.copyWith(color: AppColors.text),
                ),
                SizedBox(width: 8.w),
                Text(
                  ':',
                  style: textStyle.robotoBlack.copyWith(color: AppColors.text),
                ),
              ],
            ),
          ),

          Expanded(
            child: Wrap(
              spacing: 12.w,
              runSpacing: 8.h,
              children: List.generate(_capacities.length, (index) {
                final isSelected = _selectedIndex == index;
                final capacity = _capacities[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                        color: isSelected ? AppColors.pickabooBlue : AppColors.border,
                        width: isSelected ? 2.w : 1.w,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      capacity,
                      style: textStyle.bodyMedium.copyWith(
                        color: isSelected ? AppColors.pickabooBlue : AppColors.text,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
