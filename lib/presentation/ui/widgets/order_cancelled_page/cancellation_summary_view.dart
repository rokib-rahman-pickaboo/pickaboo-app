// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/order/order_cancel_entity.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_details_page/order_details_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// Modernized CancellationSummaryView matching Pickaboo-App-UI design language.
class CancellationSummaryView extends StatelessWidget {
  final OrderCancelEntity order;
  final String cancelDate;

  const CancellationSummaryView({
    super.key,
    required this.order,
    required this.cancelDate,
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
          // ── ORDER HEADER CARD ──
          Container(
            padding: EdgeInsets.all(16.w),
            width: double.infinity,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order #${order.incrementId}",
                      style: AppTypography.pageTitle,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Cancelled on $cancelDate",
                      style: AppTypography.bodyMutedLight,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.red.withValues(alpha: 0.1),
                    borderRadius: AppRadius.badgeRadius,
                    border: Border.all(
                      color: AppColors.red.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Text(
                    _getStatusAttributes(order.status).text,
                    style: AppTypography.badgeStockOut,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppSpacing.groupToGroupSpacing.h),

          // ── TIMELINE ──
          if (order.statusHistories.isNotEmpty)
            Container(
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
                    final date = DateTime.tryParse(status.createdAt);

                    return Padding(
                      padding: EdgeInsets.only(left: 12.w, bottom: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _formatStatusText(status.status),
                            style: isLatest ? AppTypography.brandActionText : AppTypography.cardTitle,
                          ),
                          if (date != null) ...[
                            SizedBox(height: 3.h),
                            Text(
                              DateFormat('MMM dd, yyyy - hh:mm a').format(date),
                              style: AppTypography.bodyMutedLight,
                            ),
                          ],
                          if (status.comment != null && status.comment!.isNotEmpty) ...[
                            SizedBox(height: 4.h),
                            Text(
                              status.comment!,
                              style: AppTypography.bodyMuted.italic(),
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
              child: AppImage(
                imageUrl: item.image,
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
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.cardTitle,
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Qty: ${item.qtyOrdered}",
                      style: AppTypography.bodyMutedLight,
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

  OrderStatusAttributes _getStatusAttributes(String status) {
    const Color defaultColor = AppColors.pickabooBlue;
    const Color cancelColor = AppColors.red;

    if (status.toLowerCase().contains('canceled') ||
        status.toLowerCase().contains('cancelled') ||
        status.toLowerCase() == 'closed' ||
        status.toLowerCase() == 'returned') {
      return OrderStatusAttributes(
        text: 'Canceled',
        backgroundColor: cancelColor,
      );
    }

    return OrderStatusAttributes(
      text: status,
      backgroundColor: defaultColor,
    );
  }
}
