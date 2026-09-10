import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/domain/entity/support_category/support_category_entity.dart';
import 'package:pickaboo/domain/entity/support_category/support_child_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/support/support_article_bloc/support_article_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/support_category_bloc/support_category_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/knowledge_base_details_page/knowledge_base_details_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_search_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/app_menu_tile.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/main_page.dart';
import 'package:pickaboo/presentation/ui/pages/no_internet_page/no_internet_page.dart';
import 'package:pickaboo/presentation/ui/widgets/knowledge_base_page/faq_design.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// HELP & KNOWLEDGE BASE SUPPORT PAGE
class KnowledgeBasePage extends StatefulWidget {
  final bool showBackButton;

  const KnowledgeBasePage({
    super.key,
    this.showBackButton = false,
  });

  @override
  State<KnowledgeBasePage> createState() => _KnowledgeBasePageState();
}

class _KnowledgeBasePageState extends State<KnowledgeBasePage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<SupportCategoryEntity> _categories = [];
  String? _expandedCategoryId;

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
    _scrollController.dispose();
    _searchController.dispose();
    MainPage.hideBottomNav.value = false;
    super.dispose();
  }

  void _handleSearch(String query) {
    final q = query.trim();
    if (q.isEmpty) return;

    if (context.useTwoPane) {
      setState(() {
        _hasSelection = true;
        _selectedCategoryId = null;
        _selectedCategoryName = q;
        _selectedQuery = q;
      });
      return;
    }

    context.pushNamed(
      'knowledgeBaseDetailsStandalone',
      pathParameters: {'id': 'search'},
      extra: {'query': q, 'categoryName': q},
    );
  }

  void _onCategoryTapped(
    SupportCategoryEntity category,
    bool hasSubItems,
    bool isExpanded,
  ) {
    if (hasSubItems) {
      setState(() {
        _expandedCategoryId = isExpanded ? null : category.id;
      });
    } else {
      _navigateToDetails(category);
    }
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

    context.pushNamed(
      'knowledgeBaseDetailsStandalone',
      pathParameters: {'id': categoryId},
      extra: {'categoryId': categoryId, 'categoryName': categoryName},
    );
  }

  Future<void> _onRefresh() async {
    context.read<SupportCategoryBloc>().add(
      const SupportCategoryEvent.refresh(),
    );
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Widget _wrapTwoPane(BuildContext context, Widget list) {
    if (!context.useTwoPane) return list;
    return Row(
      children: [
        SizedBox(width: 360.w, child: list),
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
            color: AppColors.muted,
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
    return BlocListener<InternetBloc, InternetState>(
      listenWhen: (previous, current) =>
          previous.maybeWhen(disconnected: (_) => true, orElse: () => false) &&
          current.maybeWhen(connected: (_) => true, orElse: () => false),
      listener: (context, state) {
        context.read<SupportCategoryBloc>().add(
          const SupportCategoryEvent.getSupportCategories(),
        );
      },
      child: BlocBuilder<SupportCategoryBloc, SupportCategoryState>(
        builder: (context, state) {
          if (state.status == SupportCategoryStatus.success &&
              state.categories != null) {
            _categories = state.categories!;
          }

          final isOfflineError = _categories.isEmpty &&
              ConnectivityUtils.isOffline(context);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (MainPage.hideBottomNav.value != isOfflineError) {
              MainPage.hideBottomNav.value = isOfflineError;
            }
          });

          if (isOfflineError) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  MainPage.hideBottomNav.value = false;
                  context.go(Routes.home);
                }
              },
              child: NoInternetPage(
                showAppBar: true,
                title: AppStrings.helpAndKnowledgeBase,
                onBack: () {
                  MainPage.hideBottomNav.value = false;
                  context.go(Routes.home);
                },
                onRetry: () => context.read<SupportCategoryBloc>().add(
                  const SupportCategoryEvent.getSupportCategories(),
                ),
              ),
            );
          }

          final isLoading = state.status == SupportCategoryStatus.loading;
          final isEmpty = state.status == SupportCategoryStatus.empty;
          final isError =
              state.status == SupportCategoryStatus.error &&
              _categories.isEmpty;

          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop) {
                MainPage.hideBottomNav.value = false;
                context.go(Routes.home);
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.pageBg,
              appBar: PickabooAppBar(
                title: AppStrings.helpAndKnowledgeBase,
                showBackButton: widget.showBackButton,
                onBackTap: () {
                  MainPage.hideBottomNav.value = false;
                  context.go(Routes.home);
                },
              ),
            body: _wrapTwoPane(
              context,
              RefreshIndicator(
                  onRefresh: _onRefresh,
                  color: AppColors.pickabooBlue,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.sameGroupItemSpacing.w,
                      0,
                      AppSpacing.sameGroupItemSpacing.w,
                      AppSpacing.sameGroupItemSpacing.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── 1. MODERN SEARCH BAR (SUBMIT TRIGGERED SEARCH ONLY) ──
                        AppSearchBar(
                          controller: _searchController,
                          hintText: AppStrings.searchKnowledgeBaseHint,
                          showFilterButton: false,
                          onSubmitted: (query) => _handleSearch(query),
                          onClear: () {
                            _searchController.clear();
                          },
                        ),

                        AppSpacing.groupToGroupGap,

                        // ── 2. CATEGORIES LIST ──
                        if (isLoading)
                          AppLoader.inline(
                            padding: EdgeInsets.symmetric(vertical: 48.h),
                          )
                        else if (isError)
                          AppErrorView(
                            type: AppErrorType.server,
                            message: state.error?.message,
                            onRetry: () => context.read<SupportCategoryBloc>().add(
                              const SupportCategoryEvent.getSupportCategories(),
                            ),
                          )
                        else if (isEmpty || (_categories.isEmpty && !isLoading))
                          const AppErrorView(type: AppErrorType.empty)
                        else
                          AppCard(
                            padding: EdgeInsets.zero,
                            child: Column(
                              children: List.generate(
                                _categories.length,
                                (index) {
                                  final category = _categories[index];
                                  final isLast =
                                      index == _categories.length - 1;
                                  final subItems = category.children
                                      .map((c) => c.name)
                                      .toList();
                                  final bool hasSubItems = subItems.isNotEmpty;
                                  final bool isExpanded =
                                      _expandedCategoryId == category.id;
                                  return AppMenuTile(
                                    icon: faqIconForCategory(category.name),
                                    title: category.name,
                                    subtitle: null,
                                    subItems:
                                        hasSubItems ? subItems : null,
                                    isExpanded: isExpanded,
                                    showDivider: !isLast,
                                    onTap: () => _onCategoryTapped(
                                      category,
                                      hasSubItems,
                                      isExpanded,
                                    ),
                                    onSubItemTap: (subTitle) {
                                      final subCategory = category.children
                                          .firstWhere(
                                            (c) => c.name == subTitle,
                                            orElse: () => SupportChildEntity(
                                              id: category.id,
                                              name: subTitle,
                                              childrenCount: 0,
                                            ),
                                          );
                                      _navigateToDetails(category, subCategory);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),

                        // Bottom clearance for floating bottom navigation bar
                        SizedBox(
                          height: 90.h + MediaQuery.paddingOf(context).bottom,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
