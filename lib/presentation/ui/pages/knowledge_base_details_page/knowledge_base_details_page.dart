// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/support_article/support_article_entity.dart';
import 'package:pickaboo/presentation/bloc/support/support_article_bloc/support_article_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_faq_tile.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class KnowledgeBaseDetailsPage extends StatefulWidget {
  final String? categoryId;
  final String categoryName;
  final String? query;

  final bool embedded;

  const KnowledgeBaseDetailsPage({
    super.key,
    this.categoryId,
    required this.categoryName,
    this.query,
    this.embedded = false,
  });

  @override
  State<KnowledgeBaseDetailsPage> createState() =>
      _KnowledgeBaseDetailsPageState();
}

class _KnowledgeBaseDetailsPageState extends State<KnowledgeBaseDetailsPage> {
  String? _expandedArticleId;

  String? _categoryId;
  late String _categoryName;

  @override
  void initState() {
    super.initState();
    final isSearchQuery = widget.query != null && widget.query!.isNotEmpty;
    _categoryId = isSearchQuery || widget.categoryId == 'search'
        ? null
        : widget.categoryId;
    _categoryName = widget.categoryName;
    _load();
  }

  bool get _isSearch => widget.query != null && widget.query!.isNotEmpty;

  void _load() {
    if (_isSearch) {
      context.read<SupportArticleBloc>().add(
        SupportArticleEvent.searchSupportArticle(query: widget.query!),
      );
    } else if (_categoryId != null &&
        _categoryId!.isNotEmpty &&
        _categoryId != 'search') {
      context.read<SupportArticleBloc>().add(
        SupportArticleEvent.getSupportArticle(categoryId: _categoryId!),
      );
    }
  }

  void _toggleArticle(String articleId) {
    setState(() {
      if (_expandedArticleId == articleId) {
        _expandedArticleId = null;
      } else {
        _expandedArticleId = articleId;
      }
    });
  }

  bool _isArticleExpanded(String articleId) {
    return _expandedArticleId == articleId;
  }

  String _formatDate(DateTime date) {
    final adjustedDate = date.add(const Duration(hours: 6));
    return DateFormat('MMM d, yyyy').format(adjustedDate);
  }

  Future<void> _onRefresh() async {
    context.read<SupportArticleBloc>().add(
      SupportArticleEvent.refresh(
        categoryId: (_isSearch && _categoryId == null) ? null : _categoryId,
        query: widget.query,
      ),
    );
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SupportArticleBloc, SupportArticleState>(
      listener: (context, state) {
        if (state.status == SupportArticleStatus.error) {
          SnackBarUtils.showNegative(
            context,
            state.error?.message ?? 'Failed to load articles',
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.status == SupportArticleStatus.loading;
        final isEmpty = state.status == SupportArticleStatus.empty;
        final isError = state.status == SupportArticleStatus.error;
        final articles = state.articles ?? [];

        return Scaffold(
          backgroundColor: AppColors.pageBg,
          appBar: widget.embedded
              ? null
              : PickabooAppBar(
                  title: _categoryName,
                ),
          body: SafeArea(
            top: false,
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              color: AppColors.pickabooBlue,
              child: isLoading
                  ? _buildLoadingState()
                  : isError
                  ? LayoutBuilder(
                      builder: (context, constraints) => SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Center(
                            child: AppErrorView(
                              type: AppErrorType.server,
                              message: state.error?.message,
                              onRetry: _retryLoad,
                            ),
                          ),
                        ),
                      ),
                    )
                  : isEmpty || articles.isEmpty
                  ? LayoutBuilder(
                      builder: (context, constraints) => SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: const Center(
                            child: AppErrorView(type: AppErrorType.empty),
                          ),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      padding: EdgeInsets.fromLTRB(
                        AppSpacing.sameGroupItemSpacing.w,
                        0,
                        AppSpacing.sameGroupItemSpacing.w,
                        AppSpacing.sameGroupItemSpacing.h + 16.h,
                      ),
                      child: AppCard(
                        child: Column(
                          children: [
                            for (int i = 0; i < articles.length; i++)
                              AppFaqTile(
                                title: articles[i].title,
                                isExpanded: _isArticleExpanded(articles[i].id),
                                onTap: () => _toggleArticle(articles[i].id),
                                showDivider: i < articles.length - 1,
                                expandedContent: _buildArticleContent(articles[i]),
                              ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return const AppLoader.fullPage();
  }

  void _retryLoad() => _load();

  Widget _buildArticleContent(SupportArticleEntity article) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceBlue,
        borderRadius: BorderRadius.circular(AppRadius.button),
        border: Border.all(
          color: AppColors.border,
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                Text(
                  _formatDate(article.createdAt),
                  style: AppTypography.bodySmall,
                ),
                AppSpacing.sameGroupHeightGap,
                AppHtml(
                  data: article.content,
                  onLinkTap: (url, attributes, element) async {
                    debugPrint('Link clicked: $url');
                    debugPrint('Attributes: $attributes');

                    if (url != null) {
                      final trimmedUrl = url.trim();
                      if (trimmedUrl.contains('privacy-policy')) {
                        context.push(Routes.privacyPolicy);
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
                          final uri = Uri.parse(trimmedUrl);
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        } catch (e) {
                          debugPrint('Could not launch $url: $e');
                        }
                      }
                    }
                  },
                  style: {
                    "body": Style(
                      margin: Margins.zero,
                      padding: HtmlPaddings.zero,
                      fontSize: FontSize(AppTypography.bodyMedium.fontSize?.sp ?? 12.sp),
                      color: AppTypography.bodyMedium.color ?? AppColors.navy,
                      fontWeight: AppTypography.bodyMedium.fontWeight,
                      lineHeight: LineHeight(AppTypography.bodyMedium.height ?? 1.5),
                    ),
                    "p": Style(
                      margin: Margins.only(bottom: 6.h),
                      padding: HtmlPaddings.zero,
                      fontSize: FontSize(AppTypography.bodyMedium.fontSize?.sp ?? 12.sp),
                      color: AppTypography.bodyMedium.color ?? AppColors.navy,
                      fontWeight: AppTypography.bodyMedium.fontWeight,
                      lineHeight: LineHeight(AppTypography.bodyMedium.height ?? 1.5),
                    ),
                    "ul": Style(
                      margin: Margins.only(left: 0, top: 4.h, bottom: 6.h),
                      padding: HtmlPaddings.zero,
                    ),
                    "li": Style(
                      margin: Margins.only(bottom: 4.h),
                      fontSize: FontSize(AppTypography.bodyMedium.fontSize?.sp ?? 12.sp),
                      color: AppTypography.bodyMedium.color ?? AppColors.navy,
                      fontWeight: AppTypography.bodyMedium.fontWeight,
                      lineHeight: const LineHeight(1.45),
                    ),
                    "span": Style(
                      fontSize: FontSize(AppTypography.bodyMedium.fontSize?.sp ?? 12.sp),
                      color: AppTypography.bodyMedium.color ?? AppColors.navy,
                      fontWeight: AppTypography.bodyMedium.fontWeight,
                    ),
                  },
                  extensions: [
                    TagExtension(
                      tagsToExtend: {"table"},
                      builder: (extensionContext) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: AppHtml(
                            data: extensionContext.element?.outerHtml ?? '',
                            onLinkTap: (url, attributes, element) async {
                              if (url != null) {
                                try {
                                  await launchUrl(
                                    Uri.parse(url.trim()),
                                    mode: LaunchMode.externalApplication,
                                  );
                                } catch (e) {
                                  debugPrint('Could not launch $url: $e');
                                }
                              }
                            },
                            extensions: const [TableHtmlExtension()],
                            style: {
                              "table": Style(
                                backgroundColor: AppColors.white,
                                border: Border.all(
                                  color: AppColors.border,
                                  width: 0.5.w,
                                ),
                                margin: Margins.only(
                                  top: 8.h,
                                  bottom: 8.h,
                                ),
                                verticalAlign: VerticalAlign.top,
                              ),
                              "th": Style(
                                padding: HtmlPaddings.all(6.w),
                                backgroundColor: AppColors.surfaceBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: FontSize(11.5.sp),
                                textAlign: TextAlign.center,
                                verticalAlign: VerticalAlign.top,
                                border: Border.all(
                                  color: AppColors.border,
                                  width: 0.5.w,
                                ),
                                color: AppColors.navy,
                              ),
                              "td": Style(
                                padding: HtmlPaddings.all(6.w),
                                textAlign: TextAlign.start,
                                fontSize: FontSize(11.5.sp),
                                verticalAlign: VerticalAlign.top,
                                border: Border.all(
                                  color: AppColors.border,
                                  width: 0.5.w,
                                ),
                                color: AppColors.navy,
                              ),
                              "td p": Style(
                                margin: Margins.zero,
                                padding: HtmlPaddings.zero,
                                fontSize: FontSize(11.5.sp),
                              ),
                            },
                          ),
                        );
                      },
                    ),
                    const TableHtmlExtension(),
                  ],
                ),
                AppSpacing.sameGroupHeightGap,
                const _DashedRule(color: AppColors.border),
                AppSpacing.sameGroupHeightGap,
                InkWell(
                  onTap: () => context.push(Routes.contactUs),
                  borderRadius: BorderRadius.circular(AppRadius.badge),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.mail_outline_rounded,
                        size: 16.sp,
                        color: AppColors.pickabooBlue,
                      ),
                      SizedBox(width: AppSpacing.sameGroupItemSpacing.w / 2),
                      Text(
                        'Still need help?',
                        style: AppTypography.brandAction,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

class _DashedRule extends StatelessWidget {
  final Color color;

  const _DashedRule({required this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dash = 4.0;
        const gap = 3.0;
        final count = (constraints.maxWidth / (dash + gap)).floor();
        return Row(
          children: List.generate(
            count,
            (_) => Container(
              width: dash,
              height: 1,
              margin: const EdgeInsets.only(right: gap),
              color: color,
            ),
          ),
        );
      },
    );
  }
}
