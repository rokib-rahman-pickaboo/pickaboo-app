import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

/// ============================================================================
/// 🔄 BILLING ADDRESS TOGGLE
/// Clean toggle switch matching the app's settings & preferences design language.
/// ============================================================================
class BillingAddressToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const BillingAddressToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Same as shipping address",
            style: AppTypography.cardTitle.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Switch(
            value: value,
            activeTrackColor: AppColors.pickabooBlue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
