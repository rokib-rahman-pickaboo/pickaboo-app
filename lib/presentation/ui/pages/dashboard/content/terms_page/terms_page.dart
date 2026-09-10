import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/bloc/support/terms_and_condition_bloc/terms_and_condition_bloc.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_policy_page_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class TermsAndConditionPage extends StatefulWidget {
  final String? title;
  final String? url;

  const TermsAndConditionPage({super.key, this.title, this.url});

  @override
  State<TermsAndConditionPage> createState() => _TermsAndConditionPageState();
}

class _TermsAndConditionPageState extends State<TermsAndConditionPage> {
  @override
  void initState() {
    super.initState();
    context.read<TermsAndConditionBloc>().add(
      const TermsAndConditionEvent.getTermsAndConditions(),
    );
  }

  Future<void> _onRefresh() async {
    context.read<TermsAndConditionBloc>().add(
      const TermsAndConditionEvent.refresh(),
    );
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.title ?? AppStrings.termsAndConditions;

    return BlocConsumer<TermsAndConditionBloc, TermsAndConditionState>(
      listener: (context, state) {
        if (state.status == TermsAndConditionStatus.error) {
          SnackBarUtils.showNegative(
            context,
            state.error?.message ?? 'Failed to load content',
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.status == TermsAndConditionStatus.loading;
        final isEmpty = state.status == TermsAndConditionStatus.empty;
        final isError = state.status == TermsAndConditionStatus.error;
        final contentPages = state.content ?? [];

        return Scaffold(
          backgroundColor: AppColors.pageBg,
          appBar: PickabooAppBar(
            title: title,
          ),
          body: RefreshIndicator(
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
                        onRetry: () => context.read<TermsAndConditionBloc>().add(
                          const TermsAndConditionEvent.getTermsAndConditions(),
                        ),
                      )
                    : isEmpty || contentPages.isEmpty
                        ? const AppErrorView(type: AppErrorType.empty)
                        : AppPolicyPageView(
                            htmlContent: contentPages.first.content,
                          ),
          ),
        );
      },
    );
  }
}
