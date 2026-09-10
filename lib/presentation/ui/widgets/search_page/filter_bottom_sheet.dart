import 'package:pickaboo/core/color/app_colors.dart';
// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/data/model/filter/filter_models.dart';
import 'package:pickaboo/domain/entity/search/search_facet_entity.dart';
import 'package:pickaboo/domain/entity/search/search_result_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/filter_bloc/filter_bloc.dart';
import 'package:pickaboo/presentation/utils/filter_converter.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// ============================================================================
/// 🏷️ SEARCH FILTER BOTTOM SHEET
/// 2-Column split layout:
/// - Header: "Filters" title (left) & "Clear All" action (right)
/// - Left Sidebar: Filter Attribute Categories (strict itemExtent: 48.h)
/// - Middle Section Height = Attributes Count * 48.h (zero clipping & zero extra whitespace)
/// - Right Pane: Options Checkbox list with persistent visible scrollbar
/// - Bottom Bar: Full-width "Apply Filters" button directly below middle section
/// ============================================================================
class FilterBottomSheet extends StatefulWidget {
  final List<SearchFacetEntity> facets;
  final Function(Map<String, String>) onApply;
  final Map<String, List<String>>? initialFilters;
  final List<SearchCategoryEntity> searchCategories;

  const FilterBottomSheet({
    super.key,
    required this.facets,
    required this.onApply,
    this.initialFilters,
    this.searchCategories = const [],
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final ScrollController _optionsScrollController = ScrollController();
  final ScrollController _categoryScrollController = ScrollController();

  @override
  void dispose() {
    _optionsScrollController.dispose();
    _categoryScrollController.dispose();
    super.dispose();
  }

  List<FilterCategory> _categories() {
    final categories = FilterConverter.fromSearchFacets(
      widget.facets,
      categories: widget.searchCategories,
    );
    final applied = widget.initialFilters;
    if (applied == null || applied.isEmpty) return categories;

    return categories.map((category) {
      final selected = applied[category.filterCode];
      if (selected == null || selected.isEmpty) return category;
      return category.copyWith(
        items: category.items
            .map((item) => item.copyWith(isSelected: selected.contains(item.value)))
            .toList(),
      );
    }).toList();
  }

  void _apply(BuildContext context, Map<String, String> filters) {
    Navigator.of(context).pop();
    Future.delayed(const Duration(milliseconds: 100), () => widget.onApply(filters));
  }

  @override
  Widget build(BuildContext context) {
    final filterCategories = _categories();

    return BlocProvider(
      create: (_) => getIt<FilterBloc>()
        ..add(FilterEvent.loadRequested(categories: filterCategories)),
      child: Builder(
        builder: (context) => Material(
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          child: SafeArea(
            top: false,
            child: BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (categories, selectedCategoryCode, selectionCounts) {
                    if (categories.isEmpty) {
                      return _buildNoFilters(context);
                    }

                    final int attributesCount = categories.length;
                    final double itemHeight = 48.h;
                    final double screenHeight =
                        MediaQuery.of(context).size.height;
                    final double nonMiddleHeight = 118.h;
                    final double minMiddleHeight =
                        (screenHeight * 0.40 - nonMiddleHeight)
                            .clamp(itemHeight, screenHeight * 0.40);
                    final double maxMiddleHeight =
                        (screenHeight * 0.80 - nonMiddleHeight)
                            .clamp(minMiddleHeight, screenHeight * 0.80);
                    final double computedMiddleHeight =
                        attributesCount * itemHeight;
                    final double middleSectionHeight =
                        computedMiddleHeight.clamp(
                          minMiddleHeight,
                          maxMiddleHeight,
                        );
                    final bool isClamped =
                        computedMiddleHeight > maxMiddleHeight;

                    final totalSelected = selectionCounts.values.fold<int>(
                      0,
                      (sum, count) => sum + count,
                    );

                    final activeCategory = categories.firstWhere(
                      (c) => c.filterCode == selectedCategoryCode,
                      orElse: () => categories.first,
                    );

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ── 1. HEADER (Filters / Clear All) ──
                        _buildHeader(context, totalSelected),

                        // ── 2. MIDDLE TWO-COLUMN SECTION (Attributes Count * 48.h) ──
                        SizedBox(
                          height: middleSectionHeight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // ── LEFT SIDEBAR (Tabs with itemExtent: 48.h) ──
                              _buildLeftSidebar(
                                context,
                                categories,
                                selectedCategoryCode,
                                selectionCounts,
                                isClamped,
                              ),

                              // Divider between columns
                              Container(
                                width: 1.w,
                                color: AppColors.border,
                              ),

                              // ── RIGHT PANE (Checkboxes with persistent visible scrollbar) ──
                              Expanded(
                                child: _buildRightOptionsPane(
                                  context,
                                  activeCategory,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ── 3. BOTTOM BAR (Apply Filters Button) ──
                        _buildBottomBar(context, totalSelected),
                      ],
                    );
                  },
                  orElse: () => filterCategories.isEmpty
                      ? _buildNoFilters(context)
                      : SizedBox(
                          height: 180.h,
                          child: const Center(
                            child: AppLoader.inline(),
                          ),
                        ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNoFilters(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.filter_list_off, size: 48.sp, color: AppColors.mutedLight),
          SizedBox(height: 12.h),
          Text(
            'No filters available',
            style: AppTypography.bodyLarge,
          ),
          SizedBox(height: 6.h),
          Text(
            'This search has nothing left to narrow down.',
            textAlign: TextAlign.center,
            style: AppTypography.bodyRegular,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int totalSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filters',
            style: AppTypography.pageTitle,
          ),
          if (totalSelected > 0)
            GestureDetector(
              onTap: () {
                context.read<FilterBloc>().add(const FilterEvent.cleared());
              },
              behavior: HitTestBehavior.opaque,
              child: Text(
                'Clear All',
                style: AppTypography.brandActionText,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLeftSidebar(
    BuildContext context,
    List<FilterCategory> categories,
    String? selectedCategoryCode,
    Map<String, int> selectionCounts,
    bool isClamped,
  ) {
    return Container(
      width: 125.w,
      color: AppColors.white,
      child: ListView.builder(
        controller: _categoryScrollController,
        padding: EdgeInsets.zero,
        itemExtent: 48.h,
        itemCount: categories.length,
        physics: isClamped
            ? const ClampingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category.filterCode == selectedCategoryCode;
          final count = selectionCounts[category.filterCode] ?? 0;
          final bool isWhite = (categories.length - 1 - index).isEven;
          final Color backgroundColor = isSelected
              ? AppColors.surfaceBlue
              : (isWhite ? AppColors.white : AppColors.pageBg);

          return InkWell(
            onTap: () {
              context.read<FilterBloc>().add(
                    FilterEvent.categoryChanged(
                      filterCode: category.filterCode,
                    ),
                  );
              if (_optionsScrollController.hasClients) {
                _optionsScrollController.jumpTo(0);
              }
            },
            child: Container(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border(
                  left: BorderSide(
                    color: isSelected
                        ? AppColors.pickabooBlue
                        : Colors.transparent,
                    width: 3.5.w,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      category.filterName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: isSelected
                          ? AppTypography.cardTitle.withColor(AppColors.pickabooBlue)
                          : AppTypography.bodyRegular.withColor(AppColors.navy),
                    ),
                  ),
                  if (count > 0)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.pickabooBlue,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        '$count',
                        style: AppTypography.buttonPrimary,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRightOptionsPane(
    BuildContext context,
    FilterCategory category,
  ) {
    return Container(
      color: Colors.white,
      child: RawScrollbar(
        controller: _optionsScrollController,
        thumbVisibility: true,
        trackVisibility: false,
        thickness: 4.w,
        radius: Radius.circular(3.r),
        thumbColor: AppColors.pickabooBlue,
        child: ListView.builder(
          controller: _optionsScrollController,
          padding: EdgeInsets.zero,
          itemCount: category.items.length,
          itemBuilder: (context, index) {
            final option = category.items[index];
            final isChecked = option.isSelected;
            final bool isWhite =
                (category.items.length - 1 - index).isEven;
            final Color itemBg =
                isWhite ? AppColors.white : AppColors.pageBg;

            return InkWell(
              onTap: () {
                context.read<FilterBloc>().add(
                      FilterEvent.optionToggled(
                        filterCode: category.filterCode,
                        option: option,
                      ),
                    );
              },
              child: Container(
                color: itemBg,
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 12.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Checkbox
                    Container(
                      width: 18.w,
                      height: 18.w,
                      decoration: BoxDecoration(
                        color: isChecked
                            ? AppColors.pickabooBlue
                            : Colors.white,
                        borderRadius: BorderRadius.circular(3.r),
                        border: Border.all(
                          color: isChecked
                              ? AppColors.pickabooBlue
                              : AppColors.border,
                          width: 1.4.w,
                        ),
                      ),
                      child: isChecked
                          ? Icon(
                              Icons.check,
                              size: 13.sp,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    SizedBox(width: 12.w),
                    // Option label
                    Expanded(
                      child: Text(
                        option.label.removeHtmlTags,
                        style: isChecked
                            ? AppTypography.cardTitle.withColor(AppColors.pickabooBlue)
                            : AppTypography.bodyRegular.withColor(AppColors.navy),
                      ),
                    ),
                    if (option.count != null &&
                        option.count.toString().isNotEmpty &&
                        option.count.toString() != '0')
                      Text(
                        '(${option.count})',
                        style: AppTypography.bodyTiny,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, int totalSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 46.h,
        child: ElevatedButton(
          onPressed: () {
            final selectedFilters =
                context.read<FilterBloc>().getSelectedFilters();
            _apply(
              context,
              FilterConverter.toSearchaniseFilters(selectedFilters),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pickabooBlue,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            totalSelected > 0
                ? 'Apply Filters ($totalSelected)'
                : 'Apply Filters',
            style: AppTypography.buttonPrimary,
          ),
        ),
      ),
    );
  }
}
