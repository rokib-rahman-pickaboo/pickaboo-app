import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_state.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class TicketReplySection extends StatelessWidget {
  final TextEditingController replyController;
  final FocusNode replyFocusNode;
  final VoidCallback onAddPhotos;
  final Function(int) onDeletePhoto;
  final VoidCallback onCloseTicket;
  final VoidCallback onPostReply;
  final bool isSubmitting;

  const TicketReplySection({
    super.key,
    required this.replyController,
    required this.replyFocusNode,
    required this.onAddPhotos,
    required this.onDeletePhoto,
    required this.onCloseTicket,
    required this.onPostReply,
    required this.isSubmitting,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
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
            style: context.textStyle.bodyMedium.copyWith(color: AppColors.text),
          ),
          SizedBox(height: 16.h),

          TextField(
            controller: replyController,
            focusNode: replyFocusNode,
            maxLines: 5,
            style: context.textStyle.bodyMedium.copyWith(color: AppColors.text),
            decoration: InputDecoration(
              hintText: 'Enter your message here',
              hintStyle: context.textStyle.bodyMedium.copyWith(
                color: AppColors.muted,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: AppColors.border.withAlpha(128),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: AppColors.border.withAlpha(128),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: AppColors.pickabooBlue, width: 1.5),
              ),
              contentPadding: EdgeInsets.all(16.w),
            ),
          ),
          SizedBox(height: 16.h),

          OutlinedButton.icon(
            onPressed: onAddPhotos,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.pickabooBlue, width: 1.5),
              minimumSize: Size(double.infinity, 48.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            icon: Icon(
              Icons.add_photo_alternate_outlined,
              color: AppColors.pickabooBlue,
              size: 22.sp,
            ),
            label: Text(
              'Add Photos',
              style: context.textStyle.buttonMedium.copyWith(
                color: AppColors.pickabooBlue,
              ),
            ),
          ),

          BlocBuilder<PhotoPickerBloc, PhotoPickerState>(
            builder: (context, state) {
              final images = state.images ?? [];
              if (images.isEmpty) return const SizedBox.shrink();

              return Column(
                children: [
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 100.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 8.w),
                      itemBuilder: (context, index) {
                        final image = images[index];
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.file(
                                File(image.path),
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 6.h,
                              right: 6.w,
                              child: GestureDetector(
                                onTap: () => onDeletePhoto(index),
                                child: Container(
                                  padding: EdgeInsets.all(4.w),
                                  decoration: const BoxDecoration(
                                    color: AppColors.orange,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.white,
                                    size: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),

          SizedBox(height: 16.h),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: isSubmitting ? null : onPostReply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pickabooBlue,
                    minimumSize: Size(0, 48.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    disabledBackgroundColor: AppColors.pageBg,
                  ),
                  child: isSubmitting
                      ? const AppLoader.button()
                      : Text(
                          'Submit Reply',
                          style: context.textStyle.buttonMedium.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
