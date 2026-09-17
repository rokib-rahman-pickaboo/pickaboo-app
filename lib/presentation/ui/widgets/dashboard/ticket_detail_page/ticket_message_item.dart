import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/file_download_helper.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';

class TicketMessageItem extends StatelessWidget {
  final TicketMessageEntity message;

  const TicketMessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.03),
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: AppColors.pickabooBlue,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.replyer,
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.text,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      _formatDateTime(message.createdAt),
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            message.body,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.text,
            ),
          ),
          if (message.attachments.isNotEmpty) ...[
            SizedBox(height: 12.h),
            for (var index = 0; index < message.attachments.length; index++) ...[
              Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: InkWell(
                  onTap: () =>
                      _openAttachment(context, message.attachments[index]),
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.pageBg,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _isPdf(message.attachments[index])
                              ? Icons.picture_as_pdf_rounded
                              : Icons.image_outlined,
                          color: _isPdf(message.attachments[index])
                              ? AppColors.red
                              : AppColors.pickabooBlue,
                          size: 20.sp,
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            _displayName(message.attachments[index]),
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.text,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        IconButton(
                          icon: Icon(
                            Icons.download_rounded,
                            color: AppColors.pickabooBlue,
                            size: 20.sp,
                          ),
                          tooltip: 'Download file',
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            final url =
                                _resolveUrl(message.attachments[index].path);
                            FileDownloadHelper.downloadFile(
                              context: context,
                              url: url,
                              fileName:
                                  _displayName(message.attachments[index]),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }

  bool _isPdf(TicketAttachmentEntity attachment) {
    final type = attachment.fileType.toUpperCase();
    if (type.contains('PDF')) return true;
    final name = (attachment.fileName.isNotEmpty
            ? attachment.fileName
            : attachment.path)
        .toLowerCase();
    return name.endsWith('.pdf');
  }

  bool _isImageFileType(TicketAttachmentEntity attachment) {
    final type = attachment.fileType.toUpperCase();
    if (type.contains('JPG') ||
        type.contains('JPEG') ||
        type.contains('PNG') ||
        type.contains('WEBP')) {
      return true;
    }
    final name = (attachment.fileName.isNotEmpty
            ? attachment.fileName
            : attachment.path)
        .toLowerCase();
    return name.endsWith('.jpg') ||
        name.endsWith('.jpeg') ||
        name.endsWith('.png') ||
        name.endsWith('.webp');
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
    return _isImageFileType(attachment) || _isPdf(attachment);
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
    if (url.isEmpty) {
      if (context.mounted) {
        SnackBarUtils.showError(context, "This attachment isn't available.");
      }
      return;
    }

    final fileName = _displayName(attachment);

    // If it's an image, show in-app preview dialog with pinch-to-zoom and download
    if (_isImageFileType(attachment)) {
      FileDownloadHelper.showImagePreview(
        context: context,
        imageUrl: url,
        fileName: fileName,
      );
    } else {
      // If document/PDF, download directly in-app without opening any browser
      await FileDownloadHelper.downloadFile(
        context: context,
        url: url,
        fileName: fileName,
      );
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
