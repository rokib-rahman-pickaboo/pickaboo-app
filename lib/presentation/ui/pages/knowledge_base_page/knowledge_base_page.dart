import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/domain/entity/support_category/support_category_entity.dart';
import 'package:pickaboo/domain/entity/support_category/support_child_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/support/support_article_bloc/support_article_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/support_category_bloc/support_category_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/knowledge_base_details_page/knowledge_base_details_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/knowledge_base_page/category_item.dart';
import 'package:pickaboo/presentation/ui/widgets/knowledge_base_page/faq_design.dart';

class KnowledgeBasePage extends StatefulWidget {
  const KnowledgeBasePage({super.key});

  @override
  State<KnowledgeBasePage> createState() => _KnowledgeBasePageState();
}

class _KnowledgeBasePageState extends State<KnowledgeBasePage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<SupportCategoryEntity> _categories = [];
  final Set<String> _expandedCategoryIds = {};

  bool _hasSelection = false;
  String? _selectedCategoryId;
  String _selectedCategoryName = '';
  String? _selectedQuery;

  @override
  void initState() {
    super.initState();
    context.read<SupportCategoryBloc>().add(
      const SupportCategoryEvent.getSupportCategories(),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  bool _isCategoryExpanded(String categoryId) {
    return _expandedCategoryIds.contains(categoryId);
  }

  void _handleSearch() {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;

    if (context.useTwoPane) {
      setState(() {
        _hasSelection = true;
        _selectedCategoryId = null;
        _selectedCategoryName = query;
        _selectedQuery = query;
      });
      return;
    }

    context.go('/help/search', extra: {'query': query, 'categoryName': query});
  }

  void _toggleCategory(String categoryId) {
    setState(() {
      if (_expandedCategoryIds.contains(categoryId)) {
        _expandedCategoryIds.remove(categoryId);
      } else {
        _expandedCategoryIds.add(categoryId);
      }
    });
  }

  void _navigateToDetails(
    SupportCategoryEntity category, [
    SupportChildEntity? subCategory,
  ]) {
    final categoryId = subCategory?.id ?? category.id;
    final categoryName = subCategory?.name ?? category.name;

    if (context.useTwoPane) {
      setState(() {
        _hasSelection = true;
        _selectedCategoryId = categoryId;
        _selectedCategoryName = categoryName;
        _selectedQuery = null;
      });
      return;
    }

    context.go(
      '/help/$categoryId',
      extra: {'categoryId': categoryId, 'categoryName': categoryName},
    );
  }

  Future<void> _onRefresh() async {
    context.read<SupportCategoryBloc>().add(
      const SupportCategoryEvent.refresh(),
    );
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Widget _buildHeader(AppColors colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FaqHero(),
        Container(
          color: colors.white,
          padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 10.h),
          child: FaqSearchField(
            controller: _searchController,
            focusNode: _searchFocusNode,
            onSubmitted: _handleSearch,
          ),
        ),
      ],
    );
  }

  Widget _wrapTwoPane(BuildContext context, Widget list) {
    if (!context.useTwoPane) return list;
    return Row(
      children: [
        SizedBox(width: 360, child: list),
        const VerticalDivider(width: 1, thickness: 1),
        Expanded(child: _buildDetailPane(context)),
      ],
    );
  }

  Widget _buildDetailPane(BuildContext context) {
    if (!_hasSelection) {
      return Center(
        child: Text(
          'Select a category to see its articles',
          style: context.textStyle.bodyMedium.copyWith(
            color: context.colors.gray,
          ),
        ),
      );
    }
    return MultiBlocProvider(
      key: ValueKey(
        _selectedCategoryId ?? '${_selectedCategoryName}_$_selectedQuery',
      ),
      providers: [BlocProvider(create: (_) => getIt<SupportArticleBloc>())],
      child: KnowledgeBaseDetailsPage(
        categoryId: _selectedCategoryId,
        categoryName: _selectedCategoryName,
        query: _selectedQuery,
        embedded: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          context.go(Routes.home);
        }
      },
      child: BlocConsumer<SupportCategoryBloc, SupportCategoryState>(
        listener: (context, state) {
          if (state.status == SupportCategoryStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error?.message ?? 'Failed to load categories',
                ),
                backgroundColor: colors.redBright,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == SupportCategoryStatus.success &&
              state.categories != null) {
            _categories = state.categories!;
          }

          final isLoading = state.status == SupportCategoryStatus.loading;
          final isEmpty = state.status == SupportCategoryStatus.empty;
          final isError =
              state.status == SupportCategoryStatus.error &&
              _categories.isEmpty;

          return Scaffold(
            backgroundColor: FaqTheme.pageBackground(colors),
            appBar: AppBar(title: const Text('Help & Knowledge Base')),
            bottomNavigationBar: const FaqHelpBar(),
            body: _wrapTwoPane(
              context,
              RefreshIndicator(
                onRefresh: _onRefresh,
                color: colors.primary,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      expandedHeight: 166.h,
                      collapsedHeight: 166.h,
                      toolbarHeight: 166.h,
                      backgroundColor: colors.white,
                      surfaceTintColor: colors.white,
                      elevation: 0,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: _buildHeader(colors),
                      ),
                    ),

                    if (isLoading)
                      SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: colors.primary,
                            strokeWidth: 2.w,
                          ),
                        ),
                      )
                    else if (isError)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: AppErrorView(
                          type: AppErrorType.server,
                          message: state.error?.message,
                          onRetry: () => context.read<SupportCategoryBloc>().add(
                            const SupportCategoryEvent.getSupportCategories(),
                          ),
                        ),
                      )
                    else if (isEmpty)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: AppErrorView(type: AppErrorType.empty),
                      )
                    else
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 24.h),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final category = _categories[index];
                            return CategoryItem(
                              key: ValueKey(category.id),
                              category: category,
                              isExpanded: _isCategoryExpanded(category.id),
                              icon: faqIconForCategory(category.name),
                              colors: colors,
                              onTap: () => _toggleCategory(category.id),
                              onSubCategoryTap: (subCategory) {
                                _navigateToDetails(category, subCategory);
                              },
                              onCategoryTap: () {
                                _navigateToDetails(category);
                              },
                            );
                          }, childCount: _categories.length),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
