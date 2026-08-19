import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/search_page/search_results.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/search_page/filter_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/search_page/filter_button.dart';
import 'package:pickaboo/presentation/ui/widgets/search_page/search_filter_chips.dart';
import 'package:pickaboo/presentation/utils/filter_converter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

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
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.white,
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            _SearchAppBar(
              onBackPress: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
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
                          backgroundColor: colors.black.withValues(alpha: 0.0),
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
    );
  }
}

class _SearchAppBar extends StatefulWidget {
  final VoidCallback onBackPress;

  const _SearchAppBar({required this.onBackPress});

  @override
  State<_SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<_SearchAppBar> {
  final TextEditingController _controller = TextEditingController();

  Timer? _debounce;
  static const Duration _debounceDuration = Duration(milliseconds: 300);

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
    final colors = context.colors;

    return SliverAppBar(
      pinned: true,
      toolbarHeight: 72.h,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            children: [
              AppBarButton(
                iconPath: 'assets/new/svg/back_nav_icon.svg',
                width: 7.w,
                height: 14.h,
                onPressed: widget.onBackPress,
                iconColor: colors.text,
              ),
              SizedBox(width: 8.w),

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

                            return TextFormField(
                              controller: fieldTextEditingController,
                              focusNode: fieldFocusNode,
                              autofocus: true,
                              onChanged: _onQueryChanged,
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
                                hintText:
                                    'Search for Products, Brands and More',
                                hintStyle: context.textStyle.inputPlaceholder.withColor(
                                  colors.gray.withValues(alpha: 0.6),
                                ),
                                filled: true,
                                fillColor: colors.whiteSmoke,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 10.h,
                                ),
                                suffixIconConstraints: BoxConstraints(
                                  minWidth: 40.w,
                                  minHeight: 40.h,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    if (_controller.text.isNotEmpty) {
                                      context.read<SearchBloc>().add(
                                        SearchEvent.searchSubmitted(
                                          query: _controller.text,
                                        ),
                                      );
                                      fieldFocusNode.unfocus();
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(6.w),
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                      color: colors.button,
                                      borderRadius: BorderRadius.circular(6.r),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/new/svg/search_icon.svg',
                                      width: 14.w,
                                      height: 14.h,
                                      fit: BoxFit.fitWidth,
                                      colorFilter: ColorFilter.mode(
                                        colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                    );
                  },
                ),
              ),
              SizedBox(width: 8.w),

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

                  return AppBarButton(
                    onPressed: () {
                      context.push(Routes.cart);
                    },
                    iconPath: 'assets/new/svg/cart_icon.svg',
                    width: 22.w,
                    height: 20.h,
                    iconColor: colors.primary,
                    showBadge: cartCount > 0,
                    badgeCount: cartCount,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
