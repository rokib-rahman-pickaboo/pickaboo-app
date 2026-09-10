// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/presentation/bloc/category_products_bloc/category_products_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/category_product_page/bottom_sheet/category_filter_bottom_sheet.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';

class InlineFilter extends StatelessWidget {
  final int filterIndex;

  const InlineFilter({super.key, this.filterIndex = 0});

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyle;

    final attributes = context
        .select<CategoryProductsBloc, List<FilterAttributeEntity>>(
          (bloc) => bloc.state.facetAttributes,
        );

    final availableFilters = attributes
        .where(
          (filter) => filter.items.isNotEmpty && filter.filterCode.isNotEmpty,
        )
        .toList();

    if (availableFilters.isEmpty) {
      return const SizedBox.shrink();
    }

    final targetFilter =
        availableFilters[filterIndex % availableFilters.length];

    return RepaintBoundary(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceBlue,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              targetFilter.filterCode.toLowerCase() == 'price'
                  ? 'Which budget are you looking for ?'
                  : 'Choose your preferred ${targetFilter.filterName}',
              style: textStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: 12.h),

            _buildFilterGrid(targetFilter, textStyles, context),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterGrid(FilterAttributeEntity targetFilter, AppTextStyles textStyles, BuildContext context) {
    final filterItems = targetFilter.items;
    final bool showSeeMore = filterItems.length > 6;
    final int displayCount = showSeeMore ? 6 : filterItems.length;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridColumnsFor(context, tablet: 3, largeTablet: 3),
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.w,
        childAspectRatio: 5,
      ),
      itemCount: displayCount,
      itemBuilder: (context, index) {
        if (showSeeMore && index == 5) {
          return _buildSeeMoreButton(targetFilter, textStyles, context);
        }
        final item = filterItems[index];
        return _buildFilterButton(targetFilter.filterCode, item, textStyles, context);
      },
    );
  }

  Widget _buildSeeMoreButton(FilterAttributeEntity targetFilter, AppTextStyles textStyles, BuildContext context) {
    return InkWell(
      onTap: () {
        final state = context.read<CategoryProductsBloc>().state;
        final attributes = state.facetAttributes;

        if (attributes.isNotEmpty) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            backgroundColor: AppColors.black.withValues(alpha: 0.0),
            builder: (_) => CategoryFilterBottomSheet(
              filterableAttributes: attributes,
              initialFilters: state.currentFilters,
              initialExpandedFilterCode: targetFilter.filterCode,
              onApply: (filters) {
                context.read<CategoryProductsBloc>().add(
                  CategoryProductsEvent.applyFilters(
                    categoryKey: state.categoryKey,
                    filters: filters,
                  ),
                );
              },
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.pickabooBlue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: AppColors.pickabooBlue, width: 1),
        ),
        child: Center(
          child: Text(
            'See more',
            style: textStyles.bodyTiny.copyWith(
              color: AppColors.pickabooBlue,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(String filterCode, FilterItemEntity filterItem, AppTextStyles textStyles, BuildContext context) {
    return InkWell(
      onTap: () {
        final bloc = context.read<CategoryProductsBloc>();
        final state = bloc.state;

        final filters = <String, List<String>>{
          for (final entry
              in (state.currentFilters ?? const <String, List<String>>{})
                  .entries)
            entry.key: List<String>.from(entry.value),
        };
        filters[filterCode] = [filterItem.value.toString()];

        if (kDebugMode) {
          print(
            'InlineFilter: Applying filter $filterCode - ${filterItem.value}',
          );
        }

        bloc.add(
          CategoryProductsEvent.applyFilters(
            categoryKey: state.categoryKey,
            filters: filters,
          ),
        );
      },
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Text(
            filterItem.label.removeHtmlTags,
            style: textStyles.bodyTiny.copyWith(color: AppColors.text),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
