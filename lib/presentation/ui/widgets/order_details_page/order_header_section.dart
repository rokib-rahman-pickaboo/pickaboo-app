// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/date_time_utils.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/core/color/app_colors.dart';

/// Modern OrderHeaderSection matching Pickaboo-App-UI design language.
class OrderHeaderSection extends StatelessWidget {
  final OrderDetailEntity order;
  final Function(String) getStatusAttributes;
  final VoidCallback? onBuyAgain;
  final VoidCallback onReview;
  final VoidCallback? onCancel;
  final bool showCancel;
  final bool showReview;
  final bool showPayNow;
  final VoidCallback? onPayNow;

  const OrderHeaderSection({
    super.key,
    required this.order,
    required this.getStatusAttributes,
    this.onBuyAgain,
    required this.onReview,
    this.onCancel,
    this.showCancel = false,
    this.showReview = true,
    this.showPayNow = false,
    this.onPayNow,
  });

  @override
  Widget build(BuildContext context) {
    final statusAttr = getStatusAttributes(order.status);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: 4.h,
      ),
      padding: EdgeInsets.all(16.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order #${order.orderNumber}",
                    style: AppTypography.titleLarge,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _formatDate(order.createdAt),
                    style: AppTypography.bodySmall.mutedLight,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: statusAttr.backgroundColor.withValues(alpha: 0.1),
                  borderRadius: AppRadius.badgeRadius,
                  border: Border.all(
                    color: statusAttr.backgroundColor.withValues(alpha: 0.2),
                    width: 1.w,
                  ),
                ),
                child: Text(
                  statusAttr.text,
                  style: AppTypography.bodyTiny.extraBold().red.withColor(statusAttr.backgroundColor),
                ),
              ),
            ],
          ),
          if (showReview) ...[
            SizedBox(height: 16.h),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.pickabooBlue, width: 1.w),
                borderRadius: AppRadius.cardRadius,
              ),
              child: Material(
                color: AppColors.transparent,
                child: InkWell(
                  onTap: onReview,
                  borderRadius: AppRadius.cardRadius,
                  splashColor: AppColors.pickabooBlue.withValues(alpha: 0.1),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border_rounded,
                          size: 16.sp,
                          color: AppColors.pickabooBlue,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Review',
                          style: AppTypography.brandAction,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (showPayNow && onPayNow != null) ...[
            SizedBox(height: showReview ? 10.h : 16.h),
            AppButton.primary(
              height: 44.h,
              borderRadius: AppRadius.cardRadius,
              text: 'Pay Now',
              onPressed: onPayNow,
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    final date = parseServerDateTime(dateString);
    if (date == null) return dateString;
    final formatted = DateFormat('dd MMMM yyyy, hh:mm a').format(date);
    return formatted.replaceAllMapped(
      RegExp(r'\b(AM|PM)\b'),
      (match) => match.group(0)!.toLowerCase(),
    );
  }
}
