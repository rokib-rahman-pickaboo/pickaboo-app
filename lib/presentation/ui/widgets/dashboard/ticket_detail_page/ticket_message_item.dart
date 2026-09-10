import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketMessageItem extends StatelessWidget {
  final TicketMessageEntity message;

  const TicketMessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textStyle;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.03),
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
                  color: AppColors.pickabooBlue.withAlpha(25),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person, size: 16.sp, color: AppColors.pickabooBlue),
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
                        color: AppColors.text,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      _formatDateTime(message.createdAt),
                      style: textTheme.bodySmall.copyWith(color: AppColors.muted),
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
              color: AppColors.text,
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
                      color: AppColors.pickabooBlue,
                      fontWeight: FontWeight.w500,
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

  bool _isAllowedFileType(TicketAttachmentEntity attachment) {
    final type = attachment.fileType.toUpperCase();
    if (type.contains('JPG') ||
        type.contains('JPEG') ||
        type.contains('PNG') ||
        type.contains('PDF')) {
      return true;
    }
    final name = (attachment.fileName.isNotEmpty
            ? attachment.fileName
            : attachment.path)
        .toLowerCase();
    return name.endsWith('.jpg') ||
        name.endsWith('.jpeg') ||
        name.endsWith('.png') ||
        name.endsWith('.pdf');
  }

  String _resolveUrl(String path) {
    var trimmed = path.trim();
    if (trimmed.isEmpty) return '';

    // If backend returns outdated admin.pickaboo.com, route to active host
    if (trimmed.startsWith('http://admin.pickaboo.com') ||
        trimmed.startsWith('https://admin.pickaboo.com')) {
      trimmed = trimmed.replaceFirst(
        RegExp(r'https?:\/\/admin\.pickaboo\.com'),
        'https://gcpadmin.pickaboo.com',
      );
    }

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
    // Like Pickaboo-App-DC: Check allowed file types; show info toast if not supported
    if (!_isAllowedFileType(attachment)) {
      if (context.mounted) {
        SnackBarUtils.showInfo(
          context,
          'Allows only this file types: jpg, jpeg, png, pdf',
        );
      }
      return;
    }

    final url = _resolveUrl(attachment.path);
    final uri = url.isEmpty ? null : Uri.tryParse(url);

    if (uri == null) {
      if (context.mounted) {
        SnackBarUtils.showError(context, "This attachment isn't available.");
      }
      return;
    }

    // Like Pickaboo-App-DC Linking.openURL: opens the URL in the system browser / viewer
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
