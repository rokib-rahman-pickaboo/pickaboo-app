// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/date_time_utils.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';

/// Modern ticket card matching Pickaboo-App-UI prototype.
class TicketCard extends StatelessWidget {
  final TicketEntity ticket;
  final VoidCallback onTap;

  const TicketCard({super.key, required this.ticket, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(ticket.status);
    final statusBgColor = _getStatusBgColor(ticket.status);

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.cardRadius,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.cardRadius,
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: AppColors.navy.withValues(alpha: 0.02),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Ticket Title & ID ──
            Text(
              ticket.subject,
              style: AppTypography.titleSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 2.h),
            Text(
              ticket.ticketCode,
              style: AppTypography.bodySmall,
            ),

            SizedBox(height: 12.h),

            // ── Department ──
            Row(
              children: [
                Icon(
                  Icons.apps_rounded,
                  size: 16.sp,
                  color: AppColors.pickabooBlue,
                ),
                SizedBox(width: 8.w),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Department: ',
                        style: AppTypography.bodySmall,
                      ),
                      TextSpan(
                        text: ticket.department,
                        style: AppTypography.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 6.h),

            // ── Last Activity ──
            Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 16.sp,
                  color: AppColors.pickabooBlue,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Last Activity: ',
                          style: AppTypography.bodySmall,
                        ),
                        TextSpan(
                          text: _formatDate(ticket.lastReplyAt),
                          style: AppTypography.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 14.h),

            // ── Footer Row: Status Pill + Author + Chevron ──
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: statusBgColor,
                    borderRadius: AppRadius.buttonRadius,
                    border: Border.all(color: statusBgColor),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        ticket.status,
                        style: AppTypography.titleSmall.withColor(statusColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                if (ticket.lastReplyName.isNotEmpty)
                  Expanded(
                    child: Text(
                      'by ${ticket.lastReplyName}',
                      style: AppTypography.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                const Spacer(),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 18.sp,
                  color: AppColors.muted,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return AppColors.green;
      case 'pending':
        return AppColors.amber;
      case 'closed':
        return AppColors.muted;
      default:
        return AppColors.pickabooBlue;
    }
  }

  Color _getStatusBgColor(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return AppColors.greenBg;
      case 'pending':
        return AppColors.amber.withValues(alpha: 0.12);
      case 'closed':
        return AppColors.navy.withValues(alpha: 0.06);
      default:
        return AppColors.surfaceBlue;
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
