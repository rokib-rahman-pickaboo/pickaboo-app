// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/search_page/search_results.dart';
import 'package:pickaboo/presentation/ui/widgets/search_page/filter_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/search_page/filter_button.dart';
import 'package:pickaboo/presentation/ui/widgets/search_page/search_filter_chips.dart';
import 'package:pickaboo/presentation/utils/filter_converter.dart';

class SearchPage extends StatefulWidget {
  final String? initialQuery;

  const SearchPage({super.key, this.initialQuery});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isGridView = true;

  Map<String, List<String>> _appliedFilters = const {};

  SortOptionItem? _activeSort;

  int get _activeFilterCount =>
      _appliedFilters.values.fold<int>(0, (sum, values) => sum + values.length);

  @override
  void initState() {
    super.initState();
    FilterButton.getSavedViewMode().then((isGrid) {
      if (mounted && isGrid != _isGridView) {
        setState(() {
          _isGridView = isGrid;
        });
      }
    });
  }

  void _applyFilters(Map<String, List<String>> selection) =>
      _applyRestrictBy(FilterConverter.toSearchaniseFilters(selection));

  void _applyRestrictBy(Map<String, String> filters) {
    if (!mounted) return;
    setState(() {
      _appliedFilters = FilterConverter.fromSearchaniseFilters(filters);
    });
    context.read<SearchBloc>().add(
      SearchEvent.searchFilterApplied(filters: filters),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(Routes.home);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.pageBg,
        body: SafeArea(
          top: false,
          child: CustomScrollView(
            slivers: [
              SearchAppBar(
                initialQuery: widget.initialQuery,
                onBackPress: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    context.go(Routes.home);
                  }
                },
              ),

            BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (previous, current) =>
                  !identical(previous.facets, current.facets) ||
                  !identical(previous.categories, current.categories),
              builder: (context, state) {
                return SliverToBoxAdapter(
                  child: SearchFilterChips(
                    appliedFilters: _appliedFilters,
                    facets: state.facets,
                    searchCategories: state.categories,
                    onChanged: _applyFilters,
                  ),
                );
              },
            ),

            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                final pagingState = state.pagingState;
                final hasSearched =
                    pagingState.pages != null || pagingState.isLoading;

                if (hasSearched ||
                    _appliedFilters.isNotEmpty ||
                    _activeSort != null) {
                  return SliverToBoxAdapter(
                    child: FilterButton(
                      activeFilterCount: _activeFilterCount,
                      activeSortLabel: _activeSort?.title,
                      onFilterTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          useSafeArea: true,
                          backgroundColor: AppColors.black.withValues(alpha: 0.0),
                          builder: (_) => FilterBottomSheet(
                            facets: state.facets,
                            initialFilters: _appliedFilters,
                            searchCategories: state.categories,
                            onApply: _applyRestrictBy,
                          ),
                        );
                      },
                      onSortSelected: (option) {
                        setState(() {
                          _activeSort = option;
                        });
                      },
                      onViewModeChanged: (isGridView) {
                        setState(() {
                          _isGridView = isGridView;
                        });
                      },
                    ),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),

            SearchResults(
              isGridView: _isGridView,
              hasActiveFilters: _appliedFilters.isNotEmpty,
              onClearFilters: () => _applyFilters(const {}),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

class SearchAppBar extends StatefulWidget {
  final VoidCallback onBackPress;
  final String? initialQuery;

  const SearchAppBar({
    super.key,
    required this.onBackPress,
    this.initialQuery,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  late final TextEditingController _controller;

  Timer? _debounce;
  static const Duration _debounceDuration = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery ?? '');
    if (widget.initialQuery != null && widget.initialQuery!.trim().isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        context.read<SearchBloc>().add(
          SearchEvent.searchSubmitted(query: widget.initialQuery!.trim()),
        );
      });
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onQueryChanged(String text) {
    _controller.text = text;

    _debounce?.cancel();
    _debounce = Timer(_debounceDuration, () {
      if (!mounted) return;
      context.read<SearchBloc>().add(
        SearchEvent.searchQueryChanged(query: text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 50.h,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.pageBg,
      surfaceTintColor: AppColors.pageBg,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            // ── Back Button ──
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.navy,
                size: 18.sp,
              ),
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.h),
              onPressed: widget.onBackPress,
            ),
            SizedBox(width: 6.w),

            // ── Search Input Field (Unified AppSearchBar Styling) ──
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      return const Iterable<String>.empty();
                    },
                    onSelected: (String selection) {
                      _controller.text = selection;
                      context.read<SearchBloc>().add(
                        SearchEvent.searchSubmitted(query: selection),
                      );
                    },
                    fieldViewBuilder:
                        (
                          BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted,
                        ) {
                          if (_controller.text !=
                              fieldTextEditingController.text) {
                            fieldTextEditingController.text =
                                _controller.text;
                          }

                          return Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: AppColors.surfaceBlue,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: AppColors.pickabooBlue.withValues(alpha: 0.35),
                                width: 1.w,
                              ),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w, right: 6.w),
                                  child: Icon(
                                    Icons.search_rounded,
                                    color: AppColors.pickabooBlue,
                                    size: 18.sp,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: fieldTextEditingController,
                                    focusNode: fieldFocusNode,
                                    autofocus: true,
                                    cursorColor: AppColors.pickabooBlue,
                                    style: AppTypography.bodyMedium,
                                    onChanged: (val) {
                                      _onQueryChanged(val);
                                      setState(() {});
                                    },
                                    onFieldSubmitted: (text) {
                                      if (text.isNotEmpty) {
                                        _debounce?.cancel();
                                        context.read<SearchBloc>().add(
                                          SearchEvent.searchSubmitted(query: text),
                                        );
                                        fieldFocusNode.unfocus();
                                      }
                                    },
                                    textInputAction: TextInputAction.search,
                                    decoration: InputDecoration(
                                      hintText: 'Search what you are looking for...',
                                      hintStyle: AppTypography.inputHint,
                                      filled: true,
                                      fillColor: AppColors.transparent,
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 6.h),
                                    ),
                                  ),
                                ),
                                if (fieldTextEditingController.text.isNotEmpty)
                                  GestureDetector(
                                    onTap: () {
                                      fieldTextEditingController.clear();
                                      _controller.clear();
                                      _onQueryChanged('');
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Icon(
                                        Icons.close_rounded,
                                        color: AppColors.muted,
                                        size: 16.sp,
                                      ),
                                    ),
                                  )
                                else
                                  SizedBox(width: 8.w),
                              ],
                            ),
                          );
                        },
                  );
                },
              ),
            ),
            SizedBox(width: 6.w),

            // ── Cart Icon Button ──
            BlocBuilder<CartBloc, CartState>(
              builder: (context, cartState) {
                final cartCount = cartState.maybeWhen(
                  loaded: (cart) => cart.itemsCount,
                  itemAdded: (cart, _) => cart.itemsCount,
                  couponApplied: (cart, _) => cart.itemsCount,
                  rewardPointsApplied: (cart, _) => cart.itemsCount,
                  operationInProgress: (cart, _) => cart.itemsCount,
                  orElse: () => 0,
                );

                return IconButton(
                  icon: Badge(
                    isLabelVisible: cartCount > 0,
                    label: Text(
                      '$cartCount',
                      style: AppTypography.bodyTiny.bold().withColor(AppColors.white),
                    ),
                    backgroundColor: AppColors.pickabooBlue,
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.navy,
                      size: 22.sp,
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.h),
                  onPressed: () => context.push(Routes.cart),
                );
              },
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0.h),
        child: Container(
          height: 1.0.h,
          color: AppColors.border,
        ),
      ),
    );
  }
}
