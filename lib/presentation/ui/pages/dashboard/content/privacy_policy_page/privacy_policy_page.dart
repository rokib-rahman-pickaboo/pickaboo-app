import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/bloc/support/privacy_policy_bloc/privacy_policy_bloc.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_policy_page_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class PrivacyPolicyPage extends StatefulWidget {
  final String? title;
  final String? url;

  const PrivacyPolicyPage({super.key, this.title, this.url});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  void initState() {
    super.initState();
    context.read<PrivacyPolicyBloc>().add(
      const PrivacyPolicyEvent.getPrivacyPolicy(),
    );
  }

  Future<void> _onRefresh() async {
    context.read<PrivacyPolicyBloc>().add(const PrivacyPolicyEvent.refresh());
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.title ?? AppStrings.privacyPolicy;

    return BlocConsumer<PrivacyPolicyBloc, PrivacyPolicyState>(
      listener: (context, state) {
        if (state.status == PrivacyPolicyStatus.error) {
          SnackBarUtils.showNegative(
            context,
            state.error?.message ?? 'Failed to load content',
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.status == PrivacyPolicyStatus.loading;
        final isEmpty = state.status == PrivacyPolicyStatus.empty;
        final isError = state.status == PrivacyPolicyStatus.error;
        final contentPages = state.content ?? [];

        return Scaffold(
          backgroundColor: AppColors.pageBg,
          appBar: PickabooAppBar(
            title: title,
          ),
          body: SafeArea(
            top: false,
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              color: AppColors.pickabooBlue,
              child: isLoading
                  ? const AppLoader.fullPage()
                  : isError
                  ? AppErrorView(
                      type: ConnectivityUtils.isNoInternet(state.error, context)
                          ? AppErrorType.noInternet
                          : AppErrorType.server,
                      message: ConnectivityUtils.isNoInternet(state.error, context)
                          ? null
                          : state.error?.message,
                      onRetry: () => context.read<PrivacyPolicyBloc>().add(
                        const PrivacyPolicyEvent.getPrivacyPolicy(),
                      ),
                    )
                  : isEmpty || contentPages.isEmpty
                  ? const AppErrorView(type: AppErrorType.empty)
                  : AppPolicyPageView(
                      htmlContent: contentPages.first.content,
                    ),
            ),
          ),
        );
      },
    );
  }
}
