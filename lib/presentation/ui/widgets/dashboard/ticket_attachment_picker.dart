// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';

/// Reusable attachment picker for Support Tickets (Create Ticket & Ticket Details reply).
class TicketAttachmentPicker extends StatelessWidget {
  final List<File> files;
  final ValueChanged<List<File>> onFilesChanged;
  final int maxFiles;
  final int maxFileSizeBytes;
  final int maxTotalSizeBytes;
  final Color containerBgColor;
  final Color itemBgColor;

  const TicketAttachmentPicker({
    super.key,
    required this.files,
    required this.onFilesChanged,
    this.maxFiles = 5,
    this.maxFileSizeBytes = 10 * 1024 * 1024, // 10MB limit per file
    this.maxTotalSizeBytes = 25 * 1024 * 1024, // 25MB total limit
    this.containerBgColor = AppColors.white,
    this.itemBgColor = AppColors.pageBg,
  });

  int get remainingSlots => maxFiles - files.length;

  Future<File> _processPickedFile(File file) async {
    final ext = file.path.split('.').last.toLowerCase();
    final isImage = ['jpg', 'jpeg', 'png', 'webp'].contains(ext);

    if (isImage) {
      try {
        final bytes = await file.readAsBytes();
        if (bytes.length > 500 * 1024) {
          final compressed = await compute(_compressImageBytes, bytes);
          if (compressed != null && compressed.length < bytes.length) {
            final fileName = file.path.split('/').last.split('.').first;
            final tempPath =
                '${Directory.systemTemp.path}/${fileName}_${DateTime.now().millisecondsSinceEpoch}.jpg';
            final tempFile = File(tempPath);
            await tempFile.writeAsBytes(compressed);
            return tempFile;
          }
        }
      } catch (e) {
        debugPrint('Failed to compress image: $e');
      }
    }
    return file;
  }

  void _showAttachmentPickerOptions(BuildContext context) {
    if (files.length >= maxFiles) {
      SnackBarUtils.showWarning(context, AppStrings.maxFilesAllowed);
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Attachment',
                  style: AppTypography.titleMedium,
                ),
                SizedBox(height: 16.h),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.photo_library_outlined,
                      color: AppColors.pickabooBlue,
                      size: 22.sp,
                    ),
                  ),
                  title: Text(
                    'Choose from Gallery',
                    style: AppTypography.bodyLarge.regular(),
                  ),
                  subtitle: Text(
                    'JPG, JPEG, PNG (Auto-compressed)',
                    style: AppTypography.bodySmall.copyWith(fontSize: 12.sp),
                  ),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.pop(ctx);
                    _pickImagesFromGallery(context);
                  },
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.pickabooBlue,
                      size: 22.sp,
                    ),
                  ),
                  title: Text(
                    'Take a Photo',
                    style: AppTypography.bodyLarge.regular(),
                  ),
                  subtitle: Text(
                    'Capture with camera',
                    style: AppTypography.bodySmall.copyWith(fontSize: 12.sp),
                  ),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.pop(ctx);
                    _pickImageFromCamera(context);
                  },
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.insert_drive_file_outlined,
                      color: AppColors.pickabooBlue,
                      size: 22.sp,
                    ),
                  ),
                  title: Text(
                    'Choose Document / File',
                    style: AppTypography.bodyLarge.regular(),
                  ),
                  subtitle: Text(
                    'PDF, JPG, PNG (Max 10MB)',
                    style: AppTypography.bodySmall.copyWith(fontSize: 12.sp),
                  ),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.pop(ctx);
                    _pickFilesFromStorage(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImagesFromGallery(BuildContext context) async {
    final slots = remainingSlots;
    if (slots <= 0) return;

    try {
      final picker = ImagePicker();
      final pickedFiles = await picker.pickMultiImage(
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
        requestFullMetadata: false,
      );

      if (pickedFiles.isNotEmpty) {
        final List<File> filesToAdd = [];
        for (final xFile in pickedFiles.take(slots)) {
          final file = File(xFile.path);
          final fileSize = await file.length();
          if (fileSize > maxFileSizeBytes) {
            if (context.mounted) {
              final fileName = file.path.split('/').last;
              SnackBarUtils.showWarning(
                context,
                '$fileName exceeds 10MB limit. Please choose a smaller file.',
              );
            }
            continue;
          }
          filesToAdd.add(file);
        }

        if (filesToAdd.isNotEmpty) {
          final updated = List<File>.from(files)..addAll(filesToAdd);
          onFilesChanged(updated);
        }

        if (pickedFiles.length > slots && context.mounted) {
          SnackBarUtils.showInfo(
            context,
            'Only $slots file(s) added (max $maxFiles files allowed)',
          );
        }
      }
    } catch (e) {
      debugPrint('Error picking from gallery: $e');
    }
  }

  Future<void> _pickImageFromCamera(BuildContext context) async {
    if (files.length >= maxFiles) return;

    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
        requestFullMetadata: false,
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final fileSize = await file.length();
        if (fileSize > maxFileSizeBytes) {
          if (context.mounted) {
            SnackBarUtils.showWarning(
              context,
              'Image exceeds 10MB limit. Please choose a smaller file.',
            );
          }
          return;
        }

        final updated = List<File>.from(files)..add(file);
        onFilesChanged(updated);
      }
    } catch (e) {
      debugPrint('Error capturing photo: $e');
    }
  }

  Future<void> _pickFilesFromStorage(BuildContext context) async {
    if (files.length >= maxFiles) {
      SnackBarUtils.showWarning(context, AppStrings.maxFilesAllowed);
      return;
    }

    final slots = remainingSlots;

    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        final rawFiles = result.paths
            .where((path) => path != null)
            .map((path) => File(path!))
            .take(slots)
            .toList();

        final List<File> processedFiles = [];
        for (final file in rawFiles) {
          final processed = await _processPickedFile(file);
          final fileSize = await processed.length();
          if (fileSize > maxFileSizeBytes) {
            if (context.mounted) {
              final fileName = file.path.split('/').last;
              SnackBarUtils.showWarning(
                context,
                '$fileName exceeds 10MB limit. Please choose a smaller file.',
              );
            }
            continue;
          }
          processedFiles.add(processed);
        }

        if (processedFiles.isNotEmpty) {
          final updated = List<File>.from(files)..addAll(processedFiles);
          onFilesChanged(updated);
        }

        if (result.files.length > slots && context.mounted) {
          SnackBarUtils.showInfo(
            context,
            'Only $slots file(s) added (max $maxFiles files allowed)',
          );
        }
      }
    } catch (e) {
      debugPrint('Error picking files: $e');
    }
  }

  void _removeFile(int index) {
    final updated = List<File>.from(files)..removeAt(index);
    onFilesChanged(updated);
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          'Attachments (jpg, jpeg, png, pdf) - Max $maxFiles files',
          style: AppTypography.bodyLarge,
        ),
        SizedBox(height: 8.h),

        // Dashed upload container
        InkWell(
          onTap: remainingSlots > 0
              ? () => _showAttachmentPickerOptions(context)
              : null,
          borderRadius: BorderRadius.circular(10.r),
          child: CustomPaint(
            painter: _DashedRectPainter(
              color: remainingSlots > 0
                  ? AppColors.pickabooBlue
                  : AppColors.border,
              strokeWidth: 1.2.w,
              dash: 5.0,
              gap: 4.0,
              radius: 10.r,
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 24.h,
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                color: containerBgColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    color: remainingSlots > 0
                        ? AppColors.pickabooBlue
                        : AppColors.muted,
                    size: 32.sp,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    remainingSlots > 0
                        ? 'Choose Files ($remainingSlots slots remaining)'
                        : 'Maximum $maxFiles files selected',
                    style: AppTypography.titleSmall.withColor(
                      remainingSlots > 0
                          ? AppColors.pickabooBlue
                          : AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Attachments preview list
        if (files.isNotEmpty) ...[
          SizedBox(height: 12.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: files.length,
            separatorBuilder: (_, _) => SizedBox(height: 8.h),
            itemBuilder: (context, index) {
              final file = files[index];
              final isPdf = file.path.toLowerCase().endsWith('.pdf');
              final fileName = file.path.split('/').last;
              final fileSize =
                  file.existsSync() ? _formatFileSize(file.lengthSync()) : '';

              return InkWell(
                onTap: () => _removeFile(index),
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: itemBgColor,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.border,
                    ),
                  ),
                  child: Row(
                    children: [
                      if (isPdf)
                        Container(
                          width: 38.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            color: AppColors.red.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Icon(
                            Icons.picture_as_pdf_rounded,
                            color: AppColors.red,
                            size: 20.sp,
                          ),
                        )
                      else
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.r),
                          child: Image.file(
                            file,
                            width: 38.w,
                            height: 38.h,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              width: 38.w,
                              height: 38.h,
                              color: AppColors.border,
                              child: const Icon(
                                Icons.image_not_supported,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fileName,
                              style: AppTypography.bodyLarge.regular(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (fileSize.isNotEmpty) ...[
                              SizedBox(height: 2.h),
                              Text(
                                fileSize,
                                style: AppTypography.bodySmall
                                    .copyWith(fontSize: 11.sp),
                              ),
                            ],
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => _removeFile(index),
                        icon: Icon(
                          Icons.close_rounded,
                          color: AppColors.muted,
                          size: 18.sp,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}

/// Custom painter to draw a smooth dashed border with rounded corners.
class _DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dash;
  final double gap;
  final double radius;

  _DashedRectPainter({
    required this.color,
    this.strokeWidth = 1.2,
    this.dash = 5.0,
    this.gap = 4.0,
    this.radius = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            strokeWidth / 2,
            strokeWidth / 2,
            size.width - strokeWidth,
            size.height - strokeWidth,
          ),
          Radius.circular(radius),
        ),
      );

    final Path dashedPath = Path();
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double len = (distance + dash < metric.length)
            ? dash
            : metric.length - distance;
        dashedPath.addPath(
          metric.extractPath(distance, distance + len),
          Offset.zero,
        );
        distance += dash + gap;
      }
    }
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(_DashedRectPainter oldDelegate) =>
      color != oldDelegate.color ||
      strokeWidth != oldDelegate.strokeWidth ||
      dash != oldDelegate.dash ||
      gap != oldDelegate.gap ||
      radius != oldDelegate.radius;
}

Uint8List? _compressImageBytes(Uint8List inputBytes) {
  try {
    final image = img.decodeImage(inputBytes);
    if (image == null) return null;

    img.Image resized = image;
    const maxDim = 1280;
    if (image.width > maxDim || image.height > maxDim) {
      if (image.width > image.height) {
        resized = img.copyResize(image, width: maxDim);
      } else {
        resized = img.copyResize(image, height: maxDim);
      }
    }
    return Uint8List.fromList(img.encodeJpg(resized, quality: 80));
  } catch (_) {
    return null;
  }
}
