import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class SnackBarUtils {
  static void showSuccess(BuildContext context, String message) {
    _show(
      context,
      title: 'Success',
      message: message,
      icon: Icons.check_circle_outline,
      accent: context.colors.green,
      duration: const Duration(seconds: 2),
    );
  }

  static void showError(BuildContext context, String message) {
    _show(
      context,
      title: 'Error',
      message: message,
      icon: Icons.error_outline,
      accent: context.colors.red,
      duration: const Duration(seconds: 3),
    );
  }

  static void showInfo(BuildContext context, String message) {
    _show(
      context,
      title: 'Notice',
      message: message,
      icon: Icons.info_outline,
      accent: context.colors.primary,
      duration: const Duration(seconds: 2),
    );
  }

  static void showWarning(BuildContext context, String message) {
    _show(
      context,
      title: 'Warning',
      message: message,
      icon: Icons.warning_amber_rounded,
      accent: context.colors.yellow,
      iconColor: context.colors.text,
      duration: const Duration(seconds: 2),
    );
  }

  static String? _lastKey;
  static DateTime? _lastShownAt;
  static const _dedupeWindow = Duration(milliseconds: 1500);

  static void _show(
    BuildContext context, {
    required String title,
    required String message,
    required IconData icon,
    required Color accent,
    Color? iconColor,
    required Duration duration,
  }) {
    final key = '$title|$message';
    final now = DateTime.now();
    if (_lastKey == key &&
        _lastShownAt != null &&
        now.difference(_lastShownAt!) < _dedupeWindow) {
      return;
    }
    _lastKey = key;
    _lastShownAt = now;

    final colors = context.colors;
    final textStyle = context.textStyle;
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        content: Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                color: colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 20.sp, color: iconColor ?? accent),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textStyle.bodyMediumBold.copyWith(
                        color: colors.text,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      message,
                      style: textStyle.bodySmall.copyWith(
                        color: colors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              InkWell(
                onTap: () => messenger.hideCurrentSnackBar(),
                borderRadius: BorderRadius.circular(12.r),
                child: Padding(
                  padding: EdgeInsets.all(2.w),
                  child: Icon(
                    Icons.close,
                    size: 16.sp,
                    color: colors.textLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
