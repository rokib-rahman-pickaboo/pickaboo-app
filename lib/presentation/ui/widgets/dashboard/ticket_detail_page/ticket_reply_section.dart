import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/ticket_attachment_picker.dart';

class TicketReplySection extends StatelessWidget {
  final TextEditingController replyController;
  final FocusNode replyFocusNode;
  final List<File> selectedFiles;
  final ValueChanged<List<File>> onFilesChanged;
  final VoidCallback onPostReply;
  final bool isSubmitting;
  final VoidCallback? onCloseTicket;

  const TicketReplySection({
    super.key,
    required this.replyController,
    required this.replyFocusNode,
    required this.selectedFiles,
    required this.onFilesChanged,
    required this.onPostReply,
    required this.isSubmitting,
    this.onCloseTicket,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
          Text(
            'Post a Reply',
            style: AppTypography.bodyMedium.copyWith(color: AppColors.text),
          ),
          SizedBox(height: 16.h),

          TextField(
            controller: replyController,
            focusNode: replyFocusNode,
            maxLines: 5,
            style: AppTypography.bodyMedium.copyWith(color: AppColors.text),
            decoration: InputDecoration(
              hintText: 'Enter your message here',
              hintStyle: AppTypography.bodyMedium.copyWith(
                color: AppColors.muted,
              ),
              border: OutlineInputBorder(
                borderRadius: AppRadius.cardRadius,
                borderSide: BorderSide(
                  color: AppColors.border.withAlpha(128),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: AppRadius.cardRadius,
                borderSide: BorderSide(
                  color: AppColors.border.withAlpha(128),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: AppRadius.cardRadius,
                borderSide: BorderSide(color: AppColors.pickabooBlue, width: 1.5),
              ),
              contentPadding: EdgeInsets.all(16.w),
            ),
          ),
          SizedBox(height: 16.h),

          TicketAttachmentPicker(
            files: selectedFiles,
            onFilesChanged: onFilesChanged,
            containerBgColor: AppColors.white,
            itemBgColor: AppColors.pageBg,
          ),

          SizedBox(height: 16.h),

          AppButton.primary(
            height: 48.h,
            borderRadius: AppRadius.cardRadius,
            isLoading: isSubmitting,
            text: 'Submit Reply',
            onPressed: isSubmitting ? null : onPostReply,
          ),
        ],
      ),
    );
  }
}
