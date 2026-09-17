import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

/// ============================================================================
/// 📍 ADDRESS CARD (Modern, Clean & Standardized)
/// Uses centralized design tokens & typography.
/// ============================================================================
class AddressCard extends StatelessWidget {
  final AddressEntity? address;
  final VoidCallback onChange;
  final VoidCallback onAddNew;

  const AddressCard({
    super.key,
    this.address,
    required this.onChange,
    required this.onAddNew,
  });

  bool get _hasValidAddress {
    if (address == null) return false;
    final name = '${address!.firstname ?? ''} ${address!.lastname ?? ''}'.trim();
    final street = address!.street.where((s) => s.isNotEmpty).join(', ');
    return name.isNotEmpty || street.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasValidAddress) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.surfaceBlue,
              borderRadius: AppRadius.buttonRadius,
              border: Border.all(
                color: AppColors.pickabooBlue.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_off_outlined,
                  color: AppColors.pickabooBlue,
                  size: 18.sp,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'Please select or add a shipping address to proceed.',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.navy,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          AppButton.primary(
            height: 38.h,
            borderRadius: AppRadius.buttonRadius,
            padding: EdgeInsets.zero,
            onPressed: onAddNew,
            icon: Icon(Icons.add_location_alt_outlined, size: 16.sp, color: AppColors.white),
            text: "Add Address",
            textStyle: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ],
      );
    }

    final name = '${address!.firstname ?? ''} ${address!.lastname ?? ''}'.trim();
    final street = address!.street.where((s) => s.isNotEmpty).join(', ');
    final city = address!.city ?? '';
    final fullAddress = [street, city].where((s) => s.isNotEmpty).join(', ');
    final phone = address!.telephone ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Deliver To Name & Phone Row ──
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: const BoxDecoration(
                color: AppColors.surfaceBlue,
                borderRadius: AppRadius.badgeRadius,
              ),
              child: Icon(
                Icons.person_outline_rounded,
                size: 14.sp,
                color: AppColors.pickabooBlue,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                name.isNotEmpty ? name : 'Recipient',
                style: AppTypography.titleSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (phone.isNotEmpty) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.5.h),
                decoration: BoxDecoration(
                  color: AppColors.pageBg,
                  borderRadius: AppRadius.smRadius,
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      size: 13.sp,
                      color: AppColors.navy,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      phone,
                      style: AppTypography.titleSmall.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.navy,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),

        SizedBox(height: 8.h),

        // ── Address Text Row (No icon, with Address: prefix) ──
        if (fullAddress.isNotEmpty)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: const BoxDecoration(
              color: AppColors.pageBg,
              borderRadius: AppRadius.buttonRadius,
            ),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Address: ',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.muted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: fullAddress,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.navy,
                      fontWeight: FontWeight.w500,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

        SizedBox(height: 10.h),

        // ── Action Buttons Row ──
        Row(
          children: [
            Expanded(
              child: AppButton.secondary(
                height: 34.h,
                borderRadius: AppRadius.buttonRadius,
                padding: EdgeInsets.zero,
                onPressed: onChange,
                icon: Icon(
                  Icons.edit_location_alt_outlined,
                  size: 14.sp,
                  color: AppColors.pickabooBlue,
                ),
                text: "Change Address",
                textStyle: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.pickabooBlue,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: AppButton(
                height: 34.h,
                borderRadius: AppRadius.buttonRadius,
                padding: EdgeInsets.zero,
                backgroundColor: AppColors.navy,
                textColor: AppColors.white,
                onPressed: onAddNew,
                icon: Icon(
                  Icons.add_location_alt_outlined,
                  size: 14.sp,
                  color: AppColors.white,
                ),
                text: "Add New Address",
                textStyle: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
