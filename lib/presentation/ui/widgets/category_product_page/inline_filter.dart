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
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/presentation/bloc/category_products_bloc/category_products_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/category_product_page/bottom_sheet/category_filter_bottom_sheet.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';

class InlineFilter extends StatelessWidget {
  final int filterIndex;

  const InlineFilter({super.key, this.filterIndex = 0});

  @override
  Widget build(BuildContext context) {
    final attributes = context
        .select<CategoryProductsBloc, List<FilterAttributeEntity>>(
          (bloc) => bloc.state.facetAttributes,
        );

    // ============================================================================
    // 🛑 SKIP SINGLE-OPTION QUESTIONS:
    // A question with only 1 choice (e.g. price range "30 - 922990") makes no sense.
    // Skip price or ANY filter attribute that has only 1 option (items.length <= 1).
    // NOTE: This rule must always be maintained in future updates.
    // ============================================================================
    final availableFilters = attributes
        .where(
          (filter) => filter.items.length > 1 && filter.filterCode.isNotEmpty,
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
        decoration: const BoxDecoration(
          color: AppColors.surfaceBlue,
          borderRadius: AppRadius.buttonRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              targetFilter.filterCode.toLowerCase() == 'price'
                  ? 'Which budget are you looking for ?'
                  : 'Choose your preferred ${targetFilter.filterName}',
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: 12.h),

            _buildFilterGrid(targetFilter, context),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterGrid(FilterAttributeEntity targetFilter, BuildContext context) {
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
          return _buildSeeMoreButton(targetFilter, context);
        }
        final item = filterItems[index];
        return _buildFilterButton(targetFilter.filterCode, item, context);
      },
    );
  }

  Widget _buildSeeMoreButton(FilterAttributeEntity targetFilter, BuildContext context) {
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
      borderRadius: AppRadius.smRadius,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.pickabooBlue.withValues(alpha: 0.1),
          borderRadius: AppRadius.smRadius,
          border: Border.all(color: AppColors.pickabooBlue, width: 1),
        ),
        child: Center(
          child: Text(
            'See more',
            style: AppTypography.bodyTiny.copyWith(
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

  Widget _buildFilterButton(String filterCode, FilterItemEntity filterItem, BuildContext context) {
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
      borderRadius: AppRadius.smRadius,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.smRadius,
        ),
        child: Center(
          child: Text(
            filterItem.label.removeHtmlTags,
            style: AppTypography.bodyTiny.copyWith(color: AppColors.text),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
