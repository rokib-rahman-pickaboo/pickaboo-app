import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

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

  /// Sliver helper for [CustomScrollView].
  /// When [fillRemaining] is true, centers the error view in the remaining viewport space.
  static Widget sliver({
    Key? key,
    AppErrorType type = AppErrorType.generic,
    String? title,
    String? message,
    VoidCallback? onRetry,
    String? retryLabel,
    VoidCallback? onSecondary,
    String? secondaryLabel,
    bool fillRemaining = true,
  }) {
    final view = AppErrorView(
      key: key,
      type: type,
      title: title,
      message: message,
      onRetry: onRetry,
      retryLabel: retryLabel,
      onSecondary: onSecondary,
      secondaryLabel: secondaryLabel,
    );
    if (fillRemaining) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: view),
      );
    }
    return SliverToBoxAdapter(child: view);
  }

  @override
  Widget build(BuildContext context) {
    final spec = _spec();
    final rawTitle = title ?? spec.title;
    final displayTitle = ApiErrorParser.isTechnicalOrServerCrash(rawTitle)
        ? spec.title
        : rawTitle;
    final rawMessage = message ?? spec.message;
    final displayMessage = ApiErrorParser.isTechnicalOrServerCrash(rawMessage)
        ? spec.message
        : rawMessage;

    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
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
              displayTitle,
              textAlign: TextAlign.center,
              style: AppTypography.titleMedium.copyWith(color: AppColors.text),
            ),
            SizedBox(height: 10.h),
            Text(
              displayMessage,
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.mutedLight),
            ),
            if (onRetry != null) ...[
              SizedBox(height: 26.h),
              AppButton.primary(
                height: 48.h,
                borderRadius: AppRadius.buttonRadius,
                icon: Icon(Icons.refresh, size: 18.w, color: AppColors.white),
                text: retryLabel ?? spec.retryLabel,
                onPressed: onRetry,
              ),
            ],
            if (onSecondary != null) ...[
              SizedBox(height: 10.h),
              AppButton.secondary(
                height: 48.h,
                borderRadius: AppRadius.buttonRadius,
                text: secondaryLabel ?? AppStrings.goBack,
                onPressed: onSecondary,
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
