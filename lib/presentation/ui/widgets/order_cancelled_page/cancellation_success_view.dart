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
import 'package:pickaboo/domain/entity/order/order_cancel_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// Modernized CancellationSuccessView matching Pickaboo-App-UI design language.
class CancellationSuccessView extends StatelessWidget {
  final OrderCancelEntity order;
  final VoidCallback onViewDetails;

  const CancellationSuccessView({
    super.key,
    required this.order,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: AppSpacing.groupToGroupSpacing.h,
      ),
      child: Column(
        children: [
          // ── HEADER CARD ──
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
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
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.green,
                  size: 56.sp,
                ),
                SizedBox(height: 12.h),
                Text(
                  "Cancellation Successful",
                  style: AppTypography.titleLarge,
                ),
                SizedBox(height: 6.h),
                Text(
                  "Your order has been cancelled successfully",
                  textAlign: TextAlign.center,
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),

          SizedBox(height: AppSpacing.groupToGroupSpacing.h),

          // ── TIMELINE ──
          if (order.statusHistories.isNotEmpty)
            Container(
              width: double.infinity,
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
              child: FixedTimeline.tileBuilder(
                theme: TimelineThemeData(
                  nodePosition: 0,
                  color: AppColors.pickabooBlue,
                  indicatorTheme: IndicatorThemeData(position: 0, size: 12.w),
                  connectorTheme: ConnectorThemeData(
                    thickness: 2.w,
                    color: AppColors.pickabooBlue,
                  ),
                ),
                builder: TimelineTileBuilder.connected(
                  connectionDirection: ConnectionDirection.after,
                  itemCount: order.statusHistories.length,
                  contentsBuilder: (_, index) {
                    final history = order.statusHistories.reversed.toList();
                    final status = history[index];
                    final isLatest = index == 0;
                    final date = parseServerDateTime(status.createdAt);

                    return Padding(
                      padding: EdgeInsets.only(left: 12.w, bottom: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _formatStatusText(status.status),
                            style: isLatest ? AppTypography.brandAction : AppTypography.titleSmall,
                          ),
                          if (date != null) ...[
                            SizedBox(height: 3.h),
                            Text(
                              DateFormat('MMM dd, yyyy - hh:mm a').format(date),
                              style: AppTypography.bodySmall.mutedLight,
                            ),
                          ],
                          if (status.comment != null && status.comment!.isNotEmpty) ...[
                            SizedBox(height: 4.h),
                            Text(
                              status.comment!,
                              style: AppTypography.bodySmall.italic(),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                  indicatorBuilder: (_, index) {
                    final isLatest = index == 0;
                    return DotIndicator(
                      color: isLatest ? AppColors.pickabooBlue : AppColors.border,
                      size: 12.w,
                      child: isLatest
                          ? Icon(Icons.check, size: 8.w, color: AppColors.white)
                          : null,
                    );
                  },
                  connectorBuilder: (_, index, _) {
                    return SolidLineConnector(
                      color: index == 0 ? AppColors.pickabooBlue : AppColors.border,
                    );
                  },
                ),
              ),
            ),

          SizedBox(height: AppSpacing.groupToGroupSpacing.h),

          // ── ITEM CARDS ──
          ...order.items.map((item) => _buildItemCard(item)),

          AppSpacing.gapV12,

          // ── VIEW DETAILS BUTTON ──
          AppButton.outline(
            text: "View Details",
            textColor: AppColors.pickabooBlue,
            borderColor: AppColors.pickabooBlue,
            isFullWidth: true,
            height: 48.h,
            borderRadius: AppRadius.cardRadius,
            onPressed: onViewDetails,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  String _formatStatusText(String status) {
    final normalized = status.toLowerCase().replaceAll('_', ' ');

    return normalized
        .split(' ')
        .where((s) => s.isNotEmpty)
        .map((str) {
          if (str.isEmpty) return '';
          return str[0].toUpperCase() +
              (str.length > 1 ? str.substring(1).toLowerCase() : '');
        })
        .join(' ');
  }

  Widget _buildItemCard(OrderCancelItemEntity item) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.03),
            blurRadius: 6.r,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: AppColors.pageBg,
              borderRadius: AppRadius.cardRadius,
              border: Border.all(color: AppColors.border),
            ),
            child: ClipRRect(
              borderRadius: AppRadius.cardRadius,
              child: item.image != null
                  ? AppImage(
                      imageUrl: item.image!,
                      placeholder: const AppLoader.inline(),
                      errorWidget: const Icon(
                        Icons.inventory_2_outlined,
                        color: AppColors.mutedLight,
                      ),
                    )
                  : const Icon(Icons.image_outlined, color: AppColors.mutedLight),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.titleSmall,
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Qty: ${item.qtyOrdered}",
                      style: AppTypography.bodySmall.mutedLight,
                    ),
                    Text(
                      "৳${item.price.toStringAsFixed(0)}",
                      style: AppTypography.priceStandard.withColor(AppColors.pickabooBlue),
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
