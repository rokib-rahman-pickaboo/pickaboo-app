import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/data/model/filter/filter_models.dart';
import 'package:pickaboo/domain/entity/search/search_facet_entity.dart';
import 'package:pickaboo/domain/entity/search/search_result_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/filter_bloc/filter_bloc.dart';
import 'package:pickaboo/presentation/utils/filter_converter.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';

class FilterBottomSheet extends StatelessWidget {
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

  List<FilterCategory> _categories() {
    final categories = FilterConverter.fromSearchFacets(
      facets,
      categories: searchCategories,
    );
    final applied = initialFilters;
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

  bool _isInitiallyExpanded(String filterCode) =>
      initialFilters?[filterCode]?.isNotEmpty ?? false;

  void _apply(BuildContext context, Map<String, String> filters) {
    Navigator.of(context).pop();
    Future.delayed(const Duration(milliseconds: 100), () => onApply(filters));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;
    final filterCategories = _categories();

    return BlocProvider(
      create: (_) =>
          getIt<FilterBloc>()
            ..add(FilterEvent.loadRequested(categories: filterCategories)),
      child: Builder(
        builder: (context) => Material(
          color: colors.white,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: colors.gray.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filters',
                        style: textStyles.appBarTitle.copyWith(
                          color: colors.text,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<FilterBloc>().add(
                            const FilterEvent.cleared(),
                          );
                          _apply(context, const {});
                        },
                        child: Text(
                          'Clear All',
                          style: textStyles.bodyMedium.copyWith(
                            color: colors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: BlocBuilder<FilterBloc, FilterState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (categories, _, selectionCounts) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              return _buildFilterCategory(
                                context,
                                category,
                                selectionCounts[category.filterCode] ?? 0,
                                colors,
                                textStyles,
                              );
                            },
                          );
                        },
                        orElse: () => filterCategories.isEmpty
                            ? _buildNoFilters(colors, textStyles)
                            : Center(
                                child: CircularProgressIndicator(
                                  color: colors.primary,
                                  strokeWidth: 2.w,
                                ),
                              ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: BlocBuilder<FilterBloc, FilterState>(
                      builder: (context, state) {
                        final totalSelected = state.maybeWhen(
                          loaded: (_, _, selectionCounts) => selectionCounts
                              .values
                              .fold<int>(0, (sum, count) => sum + count),
                          orElse: () => 0,
                        );

                        return _buildApplyButton(
                          context,
                          totalSelected,
                          colors,
                          textStyles,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNoFilters(AppColors colors, AppTextStyles textStyles) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.filter_list_off, size: 64.sp, color: colors.gray),
          SizedBox(height: 16.h),
          Text(
            'No filters available',
            textAlign: TextAlign.center,
            style: textStyles.bodyLarge.withColor(colors.text),
          ),
          SizedBox(height: 8.h),
          Text(
            'This search has nothing left to narrow down.',
            textAlign: TextAlign.center,
            style: textStyles.bodySmall.withColor(colors.gray),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCategory(
    BuildContext context,
    FilterCategory category,
    int selectedCount,
    AppColors colors,
    AppTextStyles textStyles,
  ) {
    return ExpansionTile(
      key: PageStorageKey<String>('filter_${category.filterCode}'),
      initiallyExpanded: _isInitiallyExpanded(category.filterCode),
      tilePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.w),
      childrenPadding: EdgeInsets.symmetric(horizontal: 20.w),
      leading: _getFilterIcon(category.filterCode, colors),
      title: Row(
        children: [
          Expanded(
            child: Text(
              category.filterName,
              style: textStyles.bodyMediumBold.copyWith(color: colors.text),
            ),
          ),
          if (selectedCount > 0)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                '$selectedCount',
                style: textStyles.caption.copyWith(
                  color: colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                ),
              ),
            ),
        ],
      ),
      children: category.items.map((option) {
        return CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          activeColor: colors.primary,
          value: option.isSelected,
          onChanged: (_) {
            context.read<FilterBloc>().add(
              FilterEvent.optionToggled(
                filterCode: category.filterCode,
                option: option,
              ),
            );
          },
          title: Row(
            children: [
              Expanded(
                child: Text(
                  option.label.removeHtmlTags,
                  style: textStyles.bodyMedium.copyWith(color: colors.text),
                ),
              ),
              if (option.count != null)
                Text(
                  '(${option.count})',
                  style: textStyles.caption.copyWith(color: colors.gray),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _getFilterIcon(String filterCode, AppColors colors) {
    IconData icon;
    switch (filterCode.toLowerCase()) {
      case 'brand':
      case 'manufacturer':
        icon = Icons.business;
        break;
      case 'price':
        icon = Icons.attach_money;
        break;
      case 'color':
      case 'colour':
        icon = Icons.palette;
        break;
      case 'size':
        icon = Icons.straighten;
        break;
      default:
        icon = Icons.filter_list;
    }

    return Icon(icon, color: colors.primary, size: 24.sp);
  }

  Widget _buildApplyButton(
    BuildContext context,
    int totalSelected,
    AppColors colors,
    AppTextStyles textStyles,
  ) {
    return ElevatedButton(
      onPressed: () {
        final selectedFilters = context.read<FilterBloc>().getSelectedFilters();
        _apply(
          context,
          FilterConverter.toSearchaniseFilters(selectedFilters),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.primary,
        elevation: 2,
        shadowColor: colors.primary.withValues(alpha: 0.3),
        minimumSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Text(
        totalSelected > 0 ? 'Apply Filters ($totalSelected)' : 'Apply Filters',
        style: textStyles.buttonMedium.copyWith(color: colors.white),
      ),
    );
  }
}
