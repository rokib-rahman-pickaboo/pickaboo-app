import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:share_plus/share_plus.dart';

class FileDownloadHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  /// Resolves the best directory to store downloaded files on Android and iOS.
  static Future<Directory> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      // 1. Try public Download folder for easy user access in file manager
      final publicDownload = Directory('/storage/emulated/0/Download');
      if (publicDownload.existsSync()) {
        return publicDownload;
      }
      // 2. Try external storage directory
      final extDir = await getExternalStorageDirectory();
      if (extDir != null && extDir.existsSync()) {
        return extDir;
      }
    }
    // 3. Fallback to application documents directory
    return await getApplicationDocumentsDirectory();
  }

  /// Ensures a unique file name to avoid overwriting existing files.
  static String _getUniqueFilePath(Directory dir, String originalName) {
    String cleanName = originalName.trim().replaceAll(RegExp(r'[^\w\.\-\(\)]'), '_');
    if (cleanName.isEmpty) cleanName = 'attachment_${DateTime.now().millisecondsSinceEpoch}';

    String nameWithoutExt = cleanName;
    String ext = '';
    final dotIndex = cleanName.lastIndexOf('.');
    if (dotIndex != -1 && dotIndex > 0) {
      nameWithoutExt = cleanName.substring(0, dotIndex);
      ext = cleanName.substring(dotIndex);
    }

    var candidate = '${dir.path}/$cleanName';
    int count = 1;
    while (File(candidate).existsSync()) {
      candidate = '${dir.path}/$nameWithoutExt ($count)$ext';
      count++;
    }
    return candidate;
  }

  /// Downloads a file directly via Dio without launching any external browser.
  static Future<File?> downloadFile({
    required BuildContext context,
    required String url,
    required String fileName,
    void Function(double progress)? onProgress,
  }) async {
    if (url.trim().isEmpty) {
      SnackBarUtils.showError(context, "Invalid attachment URL.");
      return null;
    }

    try {
      final dir = await _getDownloadDirectory();
      final targetPath = _getUniqueFilePath(dir, fileName);

      if (context.mounted) {
        SnackBarUtils.showInfo(context, 'Downloading $fileName...');
      }

      await _dio.download(
        url,
        targetPath,
        onReceiveProgress: (received, total) {
          if (total > 0 && onProgress != null) {
            final progress = (received / total).clamp(0.0, 1.0);
            onProgress(progress);
          }
        },
      );

      final downloadedFile = File(targetPath);
      if (await downloadedFile.exists()) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Downloaded $fileName successfully',
                style: AppTypography.bodyMedium.copyWith(color: AppColors.white),
              ),
              backgroundColor: AppColors.black87,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 5),
              action: SnackBarAction(
                label: 'Open / Share',
                textColor: AppColors.pickabooBlue,
                onPressed: () {
                  SharePlus.instance.share(
                    ShareParams(files: [XFile(downloadedFile.path)]),
                  );
                },
              ),
            ),
          );
        }
        return downloadedFile;
      } else {
        throw Exception("File was not saved successfully.");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Download error: $e");
      }
      if (context.mounted) {
        SnackBarUtils.showError(context, "Failed to download $fileName.");
      }
      return null;
    }
  }

  /// Shows an in-app full-screen image preview with pinch-to-zoom and download action.
  static void showImagePreview({
    required BuildContext context,
    required String imageUrl,
    required String fileName,
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (ctx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Zoomable image
              InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: Center(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    loadingBuilder: (_, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.pickabooBlue,
                        ),
                      );
                    },
                    errorBuilder: (_, __, ___) => Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.broken_image_rounded,
                            color: AppColors.white,
                            size: 48.sp,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Unable to load image",
                            style: AppTypography.bodyMedium
                                .copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Top Bar with Close and Download
              Positioned(
                top: 40.h,
                left: 16.w,
                right: 16.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Icon(
                          Icons.close_rounded,
                          color: AppColors.white,
                          size: 22.sp,
                        ),
                      ),
                      onPressed: () => Navigator.pop(ctx),
                    ),
                    IconButton(
                      icon: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Icon(
                          Icons.download_rounded,
                          color: AppColors.white,
                          size: 22.sp,
                        ),
                      ),
                      tooltip: 'Download image',
                      onPressed: () {
                        Navigator.pop(ctx);
                        downloadFile(
                          context: context,
                          url: imageUrl,
                          fileName: fileName,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
