import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';

/// Unified global "No Internet" screen and view component.
///
/// Can be rendered as:
/// 1. A standalone full-screen page with an AppBar and back button.
/// 2. An embedded widget inside an existing scaffold/page layout ([showAppBar] = false).
/// 3. A sliver via [NoInternetPage.sliver].
///
/// Automatically listens to [InternetBloc] and triggers [onRetry] when connection is restored.
class NoInternetPage extends StatelessWidget {
  final AppErrorType type;
  final String? title;
  final String? message;
  final VoidCallback? onRetry;
  final VoidCallback? onBack;
  final bool showAppBar;
  final bool autoRetryOnReconnect;

  const NoInternetPage({
    super.key,
    this.type = AppErrorType.noInternet,
    this.title,
    this.message,
    this.onRetry,
    this.onBack,
    this.showAppBar = true,
    this.autoRetryOnReconnect = true,
  });

  /// Factory helper for sliver-based layouts (e.g. CustomScrollView).
  static Widget sliver({
    Key? key,
    AppErrorType type = AppErrorType.noInternet,
    String? title,
    String? message,
    VoidCallback? onRetry,
    VoidCallback? onBack,
    bool autoRetryOnReconnect = true,
  }) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: NoInternetPage(
        key: key,
        type: type,
        title: title,
        message: message,
        onRetry: onRetry,
        onBack: onBack,
        showAppBar: false,
        autoRetryOnReconnect: autoRetryOnReconnect,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    final effectiveOnBack = onBack ?? (canPop ? () => Navigator.of(context).pop() : null);

    Widget content = AppErrorView(
      type: type,
      title: title ?? (type == AppErrorType.noInternet ? 'No Internet Connection' : null),
      message: message ?? (type == AppErrorType.noInternet ? 'Please check your network and try again.' : null),
      onRetry: onRetry,
      onSecondary: effectiveOnBack,
      secondaryLabel: effectiveOnBack != null ? 'Go Back' : null,
    );

    if (autoRetryOnReconnect && onRetry != null) {
      content = BlocListener<InternetBloc, InternetState>(
        listenWhen: (previous, current) =>
            previous.maybeWhen(
              disconnected: (_) => true,
              orElse: () => false,
            ) &&
            current.maybeWhen(
              connected: (_) => true,
              orElse: () => false,
            ),
        listener: (context, state) {
          onRetry?.call();
        },
        child: content,
      );
    }

    if (!showAppBar) {
      return content;
    }

    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: PickabooAppBar(
        title: title ?? 'Pickaboo',
        showBackButton: canPop || onBack != null,
        onBackTap: effectiveOnBack,
      ),
      body: SafeArea(
        child: content,
      ),
    );
  }
}
