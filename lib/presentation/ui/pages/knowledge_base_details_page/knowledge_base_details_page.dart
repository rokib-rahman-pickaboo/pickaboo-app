import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/support_article/support_article_entity.dart';
import 'package:pickaboo/presentation/bloc/support/support_article_bloc/support_article_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/bloc/support/support_category_bloc/support_category_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/knowledge_base_page/faq_design.dart';

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
  final Set<String> _expandedArticleIds = {};

  String? _categoryId;
  late String _categoryName;

  @override
  void initState() {
    super.initState();
    _categoryId = widget.categoryId;
    _categoryName = widget.categoryName;
    _load();
  }

  bool get _isSearch => widget.query != null && widget.query!.isNotEmpty;

  void _load() {
    if (_isSearch && _categoryId == null) {
      context.read<SupportArticleBloc>().add(
        SupportArticleEvent.searchSupportArticle(query: widget.query!),
      );
    } else if (_categoryId != null && _categoryId!.isNotEmpty) {
      context.read<SupportArticleBloc>().add(
        SupportArticleEvent.getSupportArticle(categoryId: _categoryId!),
      );
    } else if (_isSearch) {
      context.read<SupportArticleBloc>().add(
        SupportArticleEvent.searchSupportArticle(query: widget.query!),
      );
    }
  }

  Future<void> _pickCategory() async {
    final state = context.read<SupportCategoryBloc>().state;
    final categories = state.categories ?? const [];
    if (categories.isEmpty) return;

    final picked = await FaqCategorySheet.show(
      context,
      categories: categories,
      selectedId: _categoryId,
    );
    if (picked == null || !mounted) return;

    setState(() {
      _categoryId = picked.id;
      _categoryName = picked.name;
      _expandedArticleIds.clear();
    });
    _load();
  }

  void _toggleArticle(String articleId) {
    setState(() {
      if (_expandedArticleIds.contains(articleId)) {
        _expandedArticleIds.remove(articleId);
      } else {
        _expandedArticleIds.add(articleId);
      }
    });
  }

  bool _isArticleExpanded(String articleId) {
    return _expandedArticleIds.contains(articleId);
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
    final colors = context.colors;

    return BlocConsumer<SupportArticleBloc, SupportArticleState>(
      listener: (context, state) {
        if (state.status == SupportArticleStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error?.message ?? 'Failed to load articles'),
              backgroundColor: colors.redBright,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.status == SupportArticleStatus.loading;
        final isEmpty = state.status == SupportArticleStatus.empty;
        final isError = state.status == SupportArticleStatus.error;
        final articles = state.articles ?? [];

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: widget.embedded
                ? null
                : AppBarButton(
                    iconPath: 'assets/new/svg/back_nav_icon.svg',
                    width: 7.w,
                    height: 14.h,
                    onPressed: () => Navigator.of(context).pop(),
                    iconColor: colors.text,
                  ),
            title: Text(_categoryName, style: context.textStyle.appBarTitle),
          ),
          backgroundColor: FaqTheme.pageBackground(colors),
          bottomNavigationBar: widget.embedded ? null : const FaqHelpBar(),
          body: Column(
            children: [
              if (!widget.embedded && !_isSearch)
                Container(
                  color: colors.white,
                  padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 10.h),
                  child: FaqCategoryTrigger(
                    label: _categoryName,
                    onTap: _pickCategory,
                  ),
                ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _onRefresh,
                  color: colors.primary,
                  child: isLoading
                      ? _buildLoadingState(colors)
                      : isError
                      ? AppErrorView(
                          type: AppErrorType.server,
                          message: state.error?.message,
                          onRetry: _retryLoad,
                        )
                      : isEmpty || articles.isEmpty
                      ? const AppErrorView(type: AppErrorType.empty)
                      : ListView.builder(
                          padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 24.h),
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            final article = articles[index];
                            final isExpanded = _isArticleExpanded(article.id);
                            return _buildArticleItem(
                              article,
                              isExpanded,
                              colors,
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingState(AppColors colors) {
    return Center(
      child: CircularProgressIndicator(color: colors.primary, strokeWidth: 2.w),
    );
  }

  void _retryLoad() => _load();

  Widget _buildArticleItem(
    SupportArticleEntity article,
    bool isExpanded,
    AppColors colors,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(FaqTheme.radiusSmall),
        border: Border.all(
          color: isExpanded
              ? FaqTheme.primaryTint(colors)
              : FaqTheme.hairline(colors),
          width: 1.w,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
      color: Colors.transparent,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => _toggleArticle(article.id),
          child: Container(
            constraints: BoxConstraints(minHeight: 44.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    article.title,
                    style: context.textStyle.bodyMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.35,
                      color: colors.text,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: isExpanded ? 0.5 : 0,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 18.sp,
                    color: isExpanded ? colors.primary : colors.gray,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isExpanded ? 1.0 : 0.0,
            child: isExpanded
                ? Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 13.h),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _formatDate(article.createdAt),
                        style: context.textStyle.caption.copyWith(
                          fontSize: 11.sp,
                          color: colors.gray,
                        ),
                      ),
                      SizedBox(height: 6.h),
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
                        extensions: [
                          TagExtension(
                            tagsToExtend: {"table"},
                            builder: (extensionContext) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: AppHtml(
                                  data:
                                      extensionContext.element?.outerHtml ?? '',
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
                                  extensions: [const TableHtmlExtension()],
                                  style: {
                                    "table": Style(
                                      backgroundColor: colors.white,
                                      border: Border.all(
                                        color: colors.borderColor,
                                        width: 0.5.w,
                                      ),
                                      margin: Margins.only(
                                        top: 8.h,
                                        bottom: 8.h,
                                      ),
                                      verticalAlign: VerticalAlign.top,
                                    ),
                                    "th": Style(
                                      padding: HtmlPaddings.all(8.w),
                                      backgroundColor: colors.silverChalice
                                          .withValues(alpha: 0.1),
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.center,
                                      verticalAlign: VerticalAlign.top,
                                      border: Border.all(
                                        color: colors.borderColor,
                                        width: 0.5.w,
                                      ),
                                      color: colors.text,
                                    ),
                                    "td": Style(
                                      padding: HtmlPaddings.all(8.w),
                                      textAlign: TextAlign.start,
                                      verticalAlign: VerticalAlign.top,
                                      border: Border.all(
                                        color: colors.borderColor,
                                        width: 0.5.w,
                                      ),
                                      color: colors.text,
                                    ),
                                    "td p": Style(
                                      margin: Margins.zero,
                                      padding: HtmlPaddings.zero,
                                    ),
                                  },
                                ),
                              );
                            },
                          ),
                          const TableHtmlExtension(),
                        ],
                      ),

                      SizedBox(height: 10.h),
                      _DashedRule(color: FaqTheme.hairline(colors)),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          _AnswerAction(
                            icon: Icons.mail_outline,
                            label: 'Still need help?',
                            emphasised: true,
                            onTap: () => context.push(Routes.contactUs),
                          ),
                        ],
                      ),
                    ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ],
      ),
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

class _AnswerAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool emphasised;
  final VoidCallback onTap;

  const _AnswerAction({
    required this.icon,
    required this.label,
    required this.onTap,
    this.emphasised = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = emphasised ? colors.primary : colors.gray;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(FaqTheme.radiusSmall),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13.sp, color: color),
            SizedBox(width: 4.w),
            Text(
              label,
              style: context.textStyle.caption.copyWith(
                fontSize: 12.sp,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
