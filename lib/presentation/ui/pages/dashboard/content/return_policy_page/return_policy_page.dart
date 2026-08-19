import 'package:flutter/material.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/bloc/support/return_policy_bloc/return_policy_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ReturnPolicyPage extends StatefulWidget {
  final String? title;
  final String? url;

  const ReturnPolicyPage({super.key, this.title, this.url});

  @override
  State<ReturnPolicyPage> createState() => _ReturnPolicyPageState();
}

class _ReturnPolicyPageState extends State<ReturnPolicyPage> {
  @override
  void initState() {
    super.initState();
    context.read<ReturnPolicyBloc>().add(
      const ReturnPolicyEvent.getReturnPolicy(),
    );
  }

  Future<void> _onRefresh() async {
    context.read<ReturnPolicyBloc>().add(const ReturnPolicyEvent.refresh());
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final title = widget.title ?? 'Return Policy';

    return BlocConsumer<ReturnPolicyBloc, ReturnPolicyState>(
      listener: (context, state) {
        if (state.status == ReturnPolicyStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error?.message ?? 'Failed to load content'),
              backgroundColor: colors.redBright,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.status == ReturnPolicyStatus.loading;
        final isEmpty = state.status == ReturnPolicyStatus.empty;
        final isError = state.status == ReturnPolicyStatus.error;
        final contentPages = state.content ?? [];

        return Scaffold(
          appBar: AppBar(
            leading: AppBarButton(
              iconPath: 'assets/new/svg/close_icon.svg',
              width: 14.w,
              height: 14.h,
              onPressed: () => context.pop(),
              iconColor: colors.text,
            ),
            title: Text(title, style: context.textStyle.appBarTitle),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(2.h),
              child: Container(
                height: 2.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colors.primary, colors.scampi],
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            top: false,
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              color: colors.primary,
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: colors.primary,
                        strokeWidth: 2.w,
                      ),
                    )
                  : isError
                  ? AppErrorView(
                      type: AppErrorType.server,
                      message: state.error?.message,
                      onRetry: () => context.read<ReturnPolicyBloc>().add(
                        const ReturnPolicyEvent.getReturnPolicy(),
                      ),
                    )
                  : isEmpty || contentPages.isEmpty
                  ? const AppErrorView(type: AppErrorType.empty)
                  : Container(
                      color: colors.white,
                      padding: EdgeInsets.all(16.w),
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: AppHtml(
                          data: contentPages.first.content,
                          onLinkTap: (url, attributes, element) async {
                            debugPrint('Link clicked: ${element?.text}');
                            debugPrint('Link URL: $url');

                            if (url != null) {
                              final trimmedUrl = url.trim();
                              if (trimmedUrl.contains('privacy-policy')) {
                                context.go(Routes.privacyPolicy);
                              } else if (trimmedUrl.contains('slug=')) {
                                final uri = Uri.parse(trimmedUrl);
                                final slug = uri.queryParameters['slug'];
                                if (slug != null) {
                                  context.pushNamed(
                                    'knowledgeBaseDetailsStandalone',
                                    pathParameters: {'id': slug},
                                    extra: {
                                      'categoryId': slug,
                                      'categoryName':
                                          element?.text ?? 'Help Articles',
                                    },
                                  );
                                }
                              } else {
                                try {
                                  await launchUrl(
                                    Uri.parse(trimmedUrl),
                                    mode: LaunchMode.externalApplication,
                                  );
                                } catch (e) {
                                  debugPrint('Could not launch $url: $e');
                                }
                              }
                            }
                          },
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
