// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_info_section.dart';

/// Modern OrderAddressSection matching Pickaboo-App-UI design language.
class OrderAddressSection extends StatelessWidget {
  final ShippingAddressEntity? address;

  const OrderAddressSection({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    if (address == null) return const SizedBox.shrink();

    return OrderInfoSection(
      title: 'Shipping Address',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person_outline_rounded,
                size: 15.sp,
                color: AppColors.pickabooBlue,
              ),
              SizedBox(width: 6.w),
              Text(
                address!.name,
                style: AppTypography.titleSmall,
              ),
            ],
          ),
          if (address!.mobile.isNotEmpty) ...[
            SizedBox(height: 6.h),
            Row(
              children: [
                Icon(
                  Icons.phone_outlined,
                  size: 15.sp,
                  color: AppColors.pickabooBlue,
                ),
                SizedBox(width: 6.w),
                Text(
                  address!.mobile,
                  style: AppTypography.bodyMedium,
                ),
              ],
            ),
          ],
          if (address!.email.isNotEmpty) ...[
            SizedBox(height: 6.h),
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 15.sp,
                  color: AppColors.pickabooBlue,
                ),
                SizedBox(width: 6.w),
                Text(
                  address!.email,
                  style: AppTypography.bodyMedium,
                ),
              ],
            ),
          ],
          SizedBox(height: 6.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 15.sp,
                color: AppColors.pickabooBlue,
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(
                  address!.address,
                  style: AppTypography.bodyMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
