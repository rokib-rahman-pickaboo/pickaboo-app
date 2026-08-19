import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketMessageItem extends StatelessWidget {
  final TicketMessageEntity message;

  const TicketMessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.03),
            blurRadius: 6.r,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: colors.primary.withAlpha(25),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person, size: 16.sp, color: colors.primary),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.replyer,
                      style: textTheme.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.text,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      _formatDateTime(message.createdAt),
                      style: textTheme.bodySmall.copyWith(color: colors.gray),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            message.body,
            style: textTheme.bodyMedium.copyWith(
              color: colors.text,
            ),
          ),
          if (message.attachments.isNotEmpty) ...[
            SizedBox(height: 12.h),
            for (var index = 0; index < message.attachments.length; index++)
              Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: InkWell(
                  onTap: () =>
                      _openAttachment(context, message.attachments[index]),
                  child: Text(
                    '${index + 1}. ${_displayName(message.attachments[index])}',
                    style: textTheme.bodyMedium.copyWith(
                      color: colors.text,
                      decoration: TextDecoration.underline,
                      decorationColor: colors.text,
                    ),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  String _displayName(TicketAttachmentEntity attachment) {
    if (attachment.fileName.trim().isNotEmpty) return attachment.fileName;
    final segments = attachment.path
        .split('?')
        .first
        .split('/')
        .where((s) => s.isNotEmpty)
        .toList();
    return segments.isEmpty ? 'Attachment' : segments.last;
  }

  String _resolveUrl(String path) {
    final trimmed = path.trim();
    if (trimmed.isEmpty) return '';
    if (trimmed.startsWith('http')) return trimmed;
    if (trimmed.startsWith('//')) return 'https:$trimmed';

    final base = ApiEndpoints.baseUrl.endsWith('/')
        ? ApiEndpoints.baseUrl.substring(0, ApiEndpoints.baseUrl.length - 1)
        : ApiEndpoints.baseUrl;
    return '$base${trimmed.startsWith('/') ? trimmed : '/$trimmed'}';
  }

  Future<void> _openAttachment(
    BuildContext context,
    TicketAttachmentEntity attachment,
  ) async {
    final url = _resolveUrl(attachment.path);
    final uri = url.isEmpty ? null : Uri.tryParse(url);

    if (uri == null) {
      if (context.mounted) {
        SnackBarUtils.showError(context, "This attachment isn't available.");
      }
      return;
    }

    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && context.mounted) {
      SnackBarUtils.showError(context, "Couldn't open this attachment.");
    }
  }

  String _formatDateTime(String? dateStr) {
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
      return '${date.day} ${months[date.month - 1]}, ${date.year} at ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateStr;
    }
  }
}
