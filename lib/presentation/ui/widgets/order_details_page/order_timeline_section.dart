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
import 'package:timelines_plus/timelines_plus.dart';

/// Modern OrderTimelineSection matching Pickaboo-App-UI design language.
class OrderTimelineSection extends StatelessWidget {
  final List<StatusHistoryEntity> statusHistory;
  final String Function(String) formatStatusText;

  const OrderTimelineSection({
    super.key,
    required this.statusHistory,
    required this.formatStatusText,
  });

  @override
  Widget build(BuildContext context) {
    if (statusHistory.isEmpty) return const SizedBox.shrink();

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
          itemCount: statusHistory.length,
          contentsBuilder: (_, index) {
            final history = statusHistory.reversed.toList();
            final status = history[index];
            final isLatest = index == (statusHistory.length - 1);
            final date = parseServerDateTime(status.createdAt);

            return Padding(
              padding: EdgeInsets.only(left: 12.w, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatStatusText(status.status),
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
                      formatStatusText(status.comment!),
                      style: AppTypography.bodyMuted.italic(),
                    ),
                  ],
                ],
              ),
            );
          },
          indicatorBuilder: (_, index) {
            return DotIndicator(
              color: AppColors.pickabooBlue,
              size: 12.w,
              child: Icon(Icons.check, size: 8.w, color: AppColors.white),
            );
          },
          connectorBuilder: (_, index, _) {
            return const SolidLineConnector(color: AppColors.pickabooBlue);
          },
        ),
      ),
    );
  }
}
