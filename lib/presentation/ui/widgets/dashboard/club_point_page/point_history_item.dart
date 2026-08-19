import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:timelines_plus/timelines_plus.dart';

class PointHistoryTimeline extends StatelessWidget {
  final List<PointHistoryEntity> history;

  const PointHistoryTimeline({super.key, required this.history});

  static double get _nodeWidth => 76.w;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    if (history.isEmpty) return const SizedBox.shrink();

    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        direction: Axis.vertical,
        nodePosition: 0,
        indicatorPosition: 0,
        indicatorTheme: const IndicatorThemeData(position: 0),
        connectorTheme: ConnectorThemeData(
          thickness: 2.w,
          color: colors.borderColor.withAlpha(128),
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
          color: colors.borderColor.withAlpha(128),
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
    final colors = context.colors;
    final textTheme = context.textStyle;

    final amountVal =
        double.tryParse(history.amount.replaceAll(RegExp(r'[^0-9.-]'), '')) ??
        0;
    final isPositive = amountVal > 0;

    return SizedBox(
      width: width,
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: isPositive
                  ? colors.shamrock.withAlpha(25)
                  : colors.salmon.withAlpha(25),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isPositive ? colors.shamrock : colors.salmon,
                width: 1.5.w,
              ),
            ),
            child: Text(
              isPositive ? '+${history.amount}' : history.amount,
              style: textTheme.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: isPositive ? colors.shamrock : colors.salmon,
              ),
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
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Padding(
      padding: EdgeInsets.only(left: 16.w, bottom: isLast ? 0 : 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            history.comment,
            style: textTheme.bodyMedium.copyWith(
              fontWeight: FontWeight.w500,
              color: colors.text,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            _formatDateTime(history.createdAt),
            style: textTheme.bodySmall.copyWith(color: colors.gray),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final hour = date.hour > 12
        ? date.hour - 12
        : (date.hour == 0 ? 12 : date.hour);
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '${months[date.month - 1]} ${date.day}, ${date.year} at ${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $period';
  }
}
