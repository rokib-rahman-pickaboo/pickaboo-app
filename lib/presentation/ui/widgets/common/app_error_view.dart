import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

enum AppErrorType { noInternet, server, empty, generic }

class AppErrorView extends StatelessWidget {
  final AppErrorType type;

  final String? title;

  final String? message;

  final VoidCallback? onRetry;

  final String? retryLabel;

  final VoidCallback? onSecondary;
  final String? secondaryLabel;

  const AppErrorView({
    super.key,
    this.type = AppErrorType.generic,
    this.title,
    this.message,
    this.onRetry,
    this.retryLabel,
    this.onSecondary,
    this.secondaryLabel,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final spec = _spec(colors);

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                color: spec.color.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              child: Icon(spec.icon, size: 56.w, color: spec.color),
            ),
            SizedBox(height: 24.h),
            Text(
              title ?? spec.title,
              textAlign: TextAlign.center,
              style: textStyle.headingMedium.copyWith(color: colors.text),
            ),
            SizedBox(height: 10.h),
            Text(
              message ?? spec.message,
              textAlign: TextAlign.center,
              style: textStyle.bodyMedium.copyWith(color: colors.textLight),
            ),
            if (onRetry != null) ...[
              SizedBox(height: 26.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onRetry,
                  icon: Icon(Icons.refresh, size: 18.w, color: colors.white),
                  label: Text(
                    retryLabel ?? spec.retryLabel,
                    style: textStyle.buttonMedium.copyWith(color: colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    minimumSize: Size(double.maxFinite, 48.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ],
            if (onSecondary != null) ...[
              SizedBox(height: 10.h),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onSecondary,
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.maxFinite, 48.h),
                    side: BorderSide(color: colors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    secondaryLabel ?? 'Go Back',
                    style: textStyle.buttonMedium.copyWith(
                      color: colors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  _ErrorSpec _spec(AppColors colors) {
    switch (type) {
      case AppErrorType.noInternet:
        return _ErrorSpec(
          icon: Icons.wifi_off_rounded,
          color: colors.primary,
          title: 'No Internet Connection',
          message: 'Please check your network and try again.',
          retryLabel: 'Retry',
        );
      case AppErrorType.server:
        return _ErrorSpec(
          icon: Icons.cloud_off_rounded,
          color: colors.orange,
          title: 'Something Went Wrong',
          message: 'Our server hit a snag. Give it another go in a moment.',
          retryLabel: 'Try Again',
        );
      case AppErrorType.empty:
        return _ErrorSpec(
          icon: Icons.inbox_rounded,
          color: colors.textLight,
          title: 'Nothing Here Yet',
          message: 'There is nothing to show right now.',
          retryLabel: 'Refresh',
        );
      case AppErrorType.generic:
        return _ErrorSpec(
          icon: Icons.error_outline_rounded,
          color: colors.red,
          title: 'Oops, an Error Occurred',
          message: "We couldn't complete your request. Please try again.",
          retryLabel: 'Retry',
        );
    }
  }
}

class _ErrorSpec {
  final IconData icon;
  final Color color;
  final String title;
  final String message;
  final String retryLabel;

  const _ErrorSpec({
    required this.icon,
    required this.color,
    required this.title,
    required this.message,
    required this.retryLabel,
  });
}
