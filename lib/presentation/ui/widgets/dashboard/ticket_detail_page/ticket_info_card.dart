import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/date_time_utils.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';

class TicketInfoCard extends StatelessWidget {
  final TicketDetailEntity ticket;

  const TicketInfoCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.dialogRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
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
                      style: AppTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.text,
                        height: 1.3.h,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      ticket.ticketCode,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.muted,
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
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: AppRadius.cardRadius,
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
              color: _getStatusColor(ticket.status).withAlpha(25),
              borderRadius: AppRadius.buttonRadius,
              border: Border.all(
                color: _getStatusColor(ticket.status),
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
                    color: _getStatusColor(ticket.status),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  ticket.status,
                  style: AppTypography.bodySmall.copyWith(
                    color: _getStatusColor(ticket.status),
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

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return AppColors.green;
      case 'pending':
        return AppColors.orange;
      case 'closed':
        return AppColors.red;
      default:
        return AppColors.pickabooBlue;
    }
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return 'N/A';
    try {
      final hasTime = dateStr.contains(':');
      if (hasTime) {
        final date = parseServerDateTime(dateStr) ?? DateTime.parse(dateStr);
        final formatted = DateFormat('d MMM, yyyy, hh:mm a').format(date);
        return formatted.replaceAllMapped(
          RegExp(r'\b(AM|PM)\b'),
          (match) => match.group(0)!.toLowerCase(),
        );
      } else {
        final date = DateTime.parse(dateStr);
        return DateFormat('d MMM, yyyy').format(date);
      }
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
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: AppColors.pickabooBlue),
        SizedBox(width: 8.w),
        Text(
          '$label:',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.muted,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(
            value,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.text,
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
    switch (priority.toLowerCase()) {
      case 'high':
        return AppColors.red;
      case 'low':
        return AppColors.pickabooBlue;
      case 'critical':
        return AppColors.muted;
      case 'medium':
        return AppColors.amber;
      default:
        return AppColors.muted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: AppRadius.smRadius,
      ),
      child: Text(
        priority,
        style: AppTypography.bodySmall.bold().withColor(AppColors.white),
      ),
    );
  }
}
