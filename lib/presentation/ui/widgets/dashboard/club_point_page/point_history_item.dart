// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';
import 'package:timelines_plus/timelines_plus.dart';

class PointHistoryTimeline extends StatelessWidget {
  final List<PointHistoryEntity> history;

  const PointHistoryTimeline({super.key, required this.history});

  static double get _nodeWidth => 76.w;

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) return const SizedBox.shrink();

    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        direction: Axis.vertical,
        nodePosition: 0,
        indicatorPosition: 0,
        indicatorTheme: const IndicatorThemeData(position: 0),
        connectorTheme: ConnectorThemeData(
          thickness: 2.w,
          color: AppColors.border,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: history.length,
        connectionDirection: ConnectionDirection.after,
        nodePositionBuilder: (context, index) => 0,
        indicatorPositionBuilder: (context, index) => 0,
        indicatorBuilder: (context, index) =>
            _PointBadge(history: history[index], width: _nodeWidth),
        connectorBuilder: (context, index, type) => SolidLineConnector(
          thickness: 2.w,
          color: AppColors.border,
          indent: 8.h,
          endIndent: 8.h,
        ),
        contentsBuilder: (context, index) => _PointContents(
          history: history[index],
          isLast: index == history.length - 1,
        ),
      ),
    );
  }
}

class _PointBadge extends StatelessWidget {
  final PointHistoryEntity history;
  final double width;

  const _PointBadge({required this.history, required this.width});

  @override
  Widget build(BuildContext context) {
    final amountVal =
        double.tryParse(history.amount.replaceAll(RegExp(r'[^0-9.-]'), '')) ??
        0;
    final isPositive = amountVal >= 0;

    return SizedBox(
      width: width,
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: isPositive
                  ? AppColors.greenBg
                  : AppColors.redBg,
              borderRadius: AppRadius.chipRadius,
              border: Border.all(
                color: isPositive
                    ? AppColors.green.withValues(alpha: 0.4)
                    : AppColors.red.withValues(alpha: 0.4),
                width: 1.w,
              ),
            ),
            child: Text(
              isPositive ? '+${history.amount}' : history.amount,
              style: isPositive ? AppTypography.bodyTiny.extraBold().green : AppTypography.bodyTiny.extraBold().red,
            ),
          ),
        ),
      ),
    );
  }
}

class _PointContents extends StatelessWidget {
  final PointHistoryEntity history;
  final bool isLast;

  const _PointContents({required this.history, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w, bottom: isLast ? 0 : 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            history.comment,
            style: AppTypography.titleSmall,
          ),
          SizedBox(height: 3.h),
          Text(
            _formatDateTime(history.createdAt),
            style: AppTypography.bodyTiny,
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime date) {
    return DateFormat('MMM dd, yyyy  •  hh:mm a').format(date.toLocal());
  }
}
