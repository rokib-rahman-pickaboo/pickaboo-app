import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/delivery_time_utils.dart';

/// 6. DELIVERY LOCATION & SHIPPING ESTIMATE SELECTOR
class PdpDeliveryLocationSelector extends StatelessWidget {
  final String? selectedAddress;
  final String? deliveryCharge;
  final bool isExpress;
  final VoidCallback onTap;

  const PdpDeliveryLocationSelector({
    super.key,
    this.selectedAddress,
    this.deliveryCharge,
    this.isExpress = false,
    required this.onTap,
  });

  String _getDeliveryEstimateText() {
    return DeliveryTimeUtils.getLocationSelectorDeliveryText(
      isExpress: isExpress,
    );
  }

  @override
  Widget build(BuildContext context) {
    final addressText = selectedAddress != null && selectedAddress!.trim().isNotEmpty
        ? selectedAddress!
        : 'Select your delivery location';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Options',
              style: AppTypography.titleMedium,
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                'CHANGE',
                style: AppTypography.brandAction.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
        AppSpacing.sameGroupHeightGap,
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            decoration: BoxDecoration(
              color: AppColors.pageBg,
              borderRadius: BorderRadius.circular(AppRadius.card),
              border: Border.all(color: AppColors.border, width: 1.w),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: AppColors.pickabooBlue,
                    size: 18.sp,
                  ),
                ),
                AppSpacing.sameGroupWidthGap,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getDeliveryEstimateText(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.titleSmall,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        addressText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.bodySmall,
                      ),
                    ],
                  ),
                ),
                if (deliveryCharge != null && deliveryCharge!.isNotEmpty) ...[
                  SizedBox(width: 6.w),
                  Text(
                    deliveryCharge!,
                    style: AppTypography.titleSmall,
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
