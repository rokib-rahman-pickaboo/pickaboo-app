import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';

class AddressItem extends StatelessWidget {
  final AddressEntity address;
  final bool isSelected;
  final VoidCallback onTap;

  const AddressItem({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final street = address.street.isNotEmpty ? address.street.join(", ") : "";

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.cardRadius,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.pickabooBlue.withValues(alpha: 0.05) : AppColors.white,
          borderRadius: AppRadius.cardRadius,
          border: Border.all(
            color: isSelected ? AppColors.pickabooBlue : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 2.h),
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.pickabooBlue : AppColors.mutedLight,
                  width: 2.w,
                ),
                color: isSelected ? AppColors.pickabooBlue : AppColors.black.withValues(alpha: 0.0),
              ),
              child: isSelected
                  ? Center(
                      child: Icon(
                        Icons.check,
                        size: 12.sp,
                        color: AppColors.white,
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 16.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${address.firstname} ${address.lastname}",
                          style: AppTypography.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.text,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    address.telephone ?? "N/A",
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.muted),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "$street, ${address.city}",
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.muted.withValues(alpha: 0.8),
                      height: 1.4.h,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
