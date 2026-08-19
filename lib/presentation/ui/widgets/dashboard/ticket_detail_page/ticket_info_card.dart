import 'package:flutter/material.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';

class TicketInfoCard extends StatelessWidget {
  final TicketDetailEntity ticket;

  const TicketInfoCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ticket.subject,
                      style: textTheme.bodyLargeMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.text,
                        height: 1.3.h,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      ticket.ticketCode,
                      style: textTheme.bodySmall.copyWith(
                        color: colors.gray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              _PriorityBadge(priority: ticket.priority),
            ],
          ),

          SizedBox(height: 16.h),

          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: colors.background,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                if (ticket.orderIncrementId != null) ...[
                  _InfoRow(
                    icon: Icons.shopping_bag_outlined,
                    label: 'Order',
                    value: ticket.orderIncrementId!,
                  ),
                  SizedBox(height: 8.h),
                ],
                _InfoRow(
                  icon: Icons.category_outlined,
                  label: 'Department',
                  value: ticket.issueType,
                ),
                SizedBox(height: 8.h),
                _InfoRow(
                  icon: Icons.access_time,
                  label: 'Last Activity',
                  value: _formatDate(ticket.lastReplyAt),
                ),
                SizedBox(height: 8.h),
                if (ticket.lastReplyName != null)
                  _InfoRow(
                    icon: Icons.person_outline,
                    label: 'Last Reply',
                    value: ticket.lastReplyName!,
                  ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: _getStatusColor(ticket.status, colors).withAlpha(25),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: _getStatusColor(ticket.status, colors),
                width: 1.w,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: _getStatusColor(ticket.status, colors),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  ticket.status,
                  style: textTheme.bodySmall.copyWith(
                    color: _getStatusColor(ticket.status, colors),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status, AppColors colors) {
    switch (status.toLowerCase()) {
      case 'open':
        return colors.shamrock;
      case 'pending':
        return colors.salmon;
      case 'closed':
        return colors.red;
      default:
        return colors.primary;
    }
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return 'N/A';
    try {
      final date = DateTime.parse(dateStr);
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
      return '${date.day} ${months[date.month - 1]}, ${date.year}';
    } catch (e) {
      return dateStr;
    }
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Row(
      children: [
        Icon(icon, size: 16.sp, color: colors.primary),
        SizedBox(width: 8.w),
        Text(
          '$label:',
          style: textTheme.bodySmall.copyWith(
            color: colors.gray,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(
            value,
            style: textTheme.bodySmall.copyWith(
              color: colors.text,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _PriorityBadge extends StatelessWidget {
  final String priority;

  const _PriorityBadge({required this.priority});

  Color _getBackgroundColor(BuildContext context) {
    final colors = context.colors;
    switch (priority.toLowerCase()) {
      case 'high':
        return colors.ticketNew;
      case 'low':
        return colors.ticketOpen;
      case 'critical':
        return colors.ticketClosed;
      case 'medium':
        return colors.ticketHold;
      default:
        return colors.gray;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        priority,
        style: context.textStyle.bodySmallBold.withColor(context.colors.white),
      ),
    );
  }
}
