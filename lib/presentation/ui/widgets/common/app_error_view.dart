import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

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
    final textStyle = context.textStyle;
    final spec = _spec();

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
              style: textStyle.headingMedium.copyWith(color: AppColors.text),
            ),
            SizedBox(height: 10.h),
            Text(
              message ?? spec.message,
              textAlign: TextAlign.center,
              style: textStyle.bodyMedium.copyWith(color: AppColors.mutedLight),
            ),
            if (onRetry != null) ...[
              SizedBox(height: 26.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onRetry,
                  icon: Icon(Icons.refresh, size: 18.w, color: AppColors.white),
                  label: Text(
                    retryLabel ?? spec.retryLabel,
                    style: textStyle.buttonMedium.copyWith(color: AppColors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pickabooBlue,
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
                    side: const BorderSide(color: AppColors.pickabooBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    secondaryLabel ?? AppStrings.goBack,
                    style: textStyle.buttonMedium.copyWith(
                      color: AppColors.pickabooBlue,
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

  _ErrorSpec _spec() {
    switch (type) {
      case AppErrorType.noInternet:
        return const _ErrorSpec(
          icon: Icons.wifi_off_rounded,
          color: AppColors.pickabooBlue,
          title: 'No Internet Connection',
          message: 'Please check your network and try again.',
          retryLabel: AppStrings.retry,
        );
      case AppErrorType.server:
        return const _ErrorSpec(
          icon: Icons.cloud_off_rounded,
          color: AppColors.orange,
          title: AppStrings.somethingWentWrong,
          message: 'Our server hit a snag. Give it another go in a moment.',
          retryLabel: AppStrings.tryAgain,
        );
      case AppErrorType.empty:
        return const _ErrorSpec(
          icon: Icons.inbox_rounded,
          color: AppColors.mutedLight,
          title: 'Nothing Here Yet',
          message: 'There is nothing to show right now.',
          retryLabel: 'Refresh',
        );
      case AppErrorType.generic:
        return const _ErrorSpec(
          icon: Icons.error_outline_rounded,
          color: AppColors.red,
          title: 'Oops, an Error Occurred',
          message: "We couldn't complete your request. Please try again.",
          retryLabel: AppStrings.retry,
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
