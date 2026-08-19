import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/date_time_utils.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:timelines_plus/timelines_plus.dart';

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

    final colors = context.colors;
    final textStyles = context.textStyle;

    return Container(
      color: colors.white,
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(16.w),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          color: colors.primary,
          indicatorTheme: IndicatorThemeData(position: 0, size: 12.w),
          connectorTheme: ConnectorThemeData(
            thickness: 2.w,
            color: colors.primary,
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
              padding: EdgeInsets.only(left: 12.w, bottom: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatStatusText(status.status),
                    style:
                        (isLatest
                                ? textStyles.bodyMediumBold
                                : textStyles.bodyMedium)
                            .copyWith(
                              color: isLatest ? colors.primary : colors.text,
                            ),
                  ),
                  if (date != null) ...[
                    SizedBox(height: 4.h),
                    Text(
                      DateFormat('MMM dd, yyyy - hh:mm a').format(date),
                      style: textStyles.bodySmall.copyWith(
                        color: colors.gray,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                  if (status.comment != null && status.comment!.isNotEmpty) ...[
                    SizedBox(height: 6.h),
                    Text(
                      formatStatusText(status.comment!),
                      style: textStyles.bodySmall.copyWith(
                        color: colors.text.withValues(alpha: 0.8),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
          indicatorBuilder: (_, index) {
            return DotIndicator(
              color: colors.primary,
              size: 12.w,
              child: Icon(Icons.check, size: 8.w, color: colors.white),
            );
          },
          connectorBuilder: (_, index, _) {
            return SolidLineConnector(color: colors.primary);
          },
        ),
      ),
    );
  }
}
