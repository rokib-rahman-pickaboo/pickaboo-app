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
    final history = _filterTimelineHistory(statusHistory, formatStatusText);
    if (history.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: 4.h,
      ),
      padding: EdgeInsets.all(16.w),
      decoration: AppDecorations.cardBoxDecoration(),
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
          itemCount: history.length,
          contentsBuilder: (_, index) {
            final status = history[index];
            final isLatest = index == (history.length - 1);
            final titleText = (status.label != null && status.label!.trim().isNotEmpty)
                ? status.label!
                : formatStatusText(status.status);
            final date = parseServerDateTime(status.time ?? status.createdAt);
            final timeDisplay = date != null
                ? DateFormat('MMM dd, yyyy - hh:mm a').format(date)
                : (status.time ?? status.createdAt);

            return Padding(
              padding: EdgeInsets.only(left: 12.w, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    style: isLatest ? AppTypography.brandAction : AppTypography.titleSmall,
                  ),
                  if (timeDisplay.isNotEmpty) ...[
                    SizedBox(height: 3.h),
                    Text(
                      timeDisplay,
                      style: AppTypography.bodySmall.mutedLight,
                    ),
                  ],
                  if (status.comment != null && status.comment!.isNotEmpty) ...[
                    SizedBox(height: 4.h),
                    Text(
                      formatStatusText(status.comment!),
                      style: AppTypography.bodySmall.italic(),
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

  /// Filters out redundant consecutive status updates (backend internal logs)
  /// so that customer order timeline displays distinct milestones.
  List<StatusHistoryEntity> _filterTimelineHistory(
    List<StatusHistoryEntity> rawHistory,
    String Function(String) formatStatusText,
  ) {
    if (rawHistory.isEmpty) return [];

    // Ensure chronological ordering (earliest milestone first, latest last)
    List<StatusHistoryEntity> chronological;
    final parsedDates =
        rawHistory.map((e) => parseServerDateTime(e.time ?? e.createdAt)).toList();
    final allHaveDates = parsedDates.every((d) => d != null);

    if (allHaveDates && parsedDates.length > 1) {
      if (parsedDates.first!.isBefore(parsedDates.last!)) {
        chronological = List.of(rawHistory);
      } else {
        chronological = rawHistory.reversed.toList();
      }
    } else {
      chronological = rawHistory.reversed.toList();
    }

    final filtered = <StatusHistoryEntity>[];
    for (final item in chronological) {
      if (filtered.isEmpty) {
        filtered.add(item);
        continue;
      }

      final prev = filtered.last;
      final prevTitle = (prev.label != null && prev.label!.trim().isNotEmpty)
          ? prev.label!.trim().toLowerCase()
          : formatStatusText(prev.status).trim().toLowerCase();
      final currTitle = (item.label != null && item.label!.trim().isNotEmpty)
          ? item.label!.trim().toLowerCase()
          : formatStatusText(item.status).trim().toLowerCase();

      final isSameStatus = prevTitle == currTitle;
      final itemComment = item.comment?.trim();
      final prevComment = prev.comment?.trim();
      final hasDistinctComment = itemComment != null &&
          itemComment.isNotEmpty &&
          itemComment != prevComment;

      // Skip redundant internal log updates that don't represent a status change or user-visible note
      if (isSameStatus && !hasDistinctComment) {
        continue;
      }

      filtered.add(item);
    }

    return filtered;
  }
}
