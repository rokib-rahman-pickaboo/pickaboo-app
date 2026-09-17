// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Modern OrderItemCard matching Pickaboo-App-UI design language.
class OrderItemCard extends StatelessWidget {
  final OrderItemDetailEntity item;

  const OrderItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: 4.h,
      ),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.03),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              color: AppColors.pageBg,
              borderRadius: AppRadius.cardRadius,
              border: Border.all(color: AppColors.border),
            ),
            child: ClipRRect(
              borderRadius: AppRadius.cardRadius,
              child: AppImage(
                imageUrl: item.image ?? "",
                width: 70.w,
                height: 70.w,
                fit: BoxFit.cover,
                placeholder: const AppLoader.inline(),
                errorWidget: const Icon(
                  Icons.inventory_2_outlined,
                  color: AppColors.mutedLight,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.itemName,
                  style: AppTypography.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (item.soldBy != null &&
                    item.soldBy!.trim().isNotEmpty &&
                    item.soldBy!.trim().toLowerCase() != 'null') ...[
                  SizedBox(height: 4.h),
                  Text(
                    'Sold by: ${item.soldBy}',
                    style: AppTypography.brandTag,
                  ),
                ],
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '৳${item.finalPrice.toStringAsFixed(0)}',
                      style: AppTypography.priceStandard,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceBlue,
                        borderRadius: AppRadius.badgeRadius,
                      ),
                      child: Text(
                        'Qty: ${item.qty}',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
