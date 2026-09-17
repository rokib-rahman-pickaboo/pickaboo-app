import 'package:pickaboo/core/color/app_colors.dart';
// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/presentation/bloc/filter_bloc/filter_bloc.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/filter_widgets/filter_category_list.dart';
import 'package:pickaboo/presentation/ui/widgets/filter_widgets/filter_options_list.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// ============================================================================
/// 🏷️ COMMON FILTER BOTTOM SHEET
/// 2-Column split layout:
/// - Header: "Filters" title (left) & "Clear All" action (right)
/// - Left Sidebar: Filter Attribute Categories (strict itemExtent: 48.h)
/// - Middle Section Height = Attributes Count * 48.h (zero clipping & zero extra whitespace)
/// - Right Pane: Options Checkbox list with persistent visible scrollbar
/// - Bottom Bar: Full-width "Apply Filters" button directly below middle section
/// ============================================================================
class FilterBottomSheet extends StatelessWidget {
  final Function(Map<String, List<String>>)? onApply;

  const FilterBottomSheet({super.key, this.onApply});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (categories, selectedCategoryCode, selectionCounts) {
            final int attributesCount = categories.length;
            final double itemHeight = 48.h;
            final double screenHeight = MediaQuery.of(context).size.height;
            final double nonMiddleHeight = 118.h;
            final double minMiddleHeight =
                (screenHeight * 0.40 - nonMiddleHeight)
                    .clamp(itemHeight, screenHeight * 0.40);
            final double maxMiddleHeight =
                (screenHeight * 0.80 - nonMiddleHeight)
                    .clamp(minMiddleHeight, screenHeight * 0.80);
            final double computedMiddleHeight = attributesCount * itemHeight;
            final double middleSectionHeight =
                computedMiddleHeight.clamp(minMiddleHeight, maxMiddleHeight);
            final bool isClamped = computedMiddleHeight > maxMiddleHeight;

            final totalSelected = selectionCounts.values.fold<int>(
              0,
              (sum, count) => sum + count,
            );

            return Material(
              color: AppColors.white,
              clipBehavior: Clip.antiAlias,
              borderRadius: AppRadius.sheetTop,
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHeader(context, totalSelected),
                    SizedBox(
                      height: middleSectionHeight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FilterCategoryList(isClamped: isClamped),
                          Container(
                            width: 1.w,
                            color: AppColors.border,
                          ),
                          const Expanded(child: FilterOptionsList()),
                        ],
                      ),
                    ),
                    _buildBottomBar(context, totalSelected),
                  ],
                ),
              ),
            );
          },
          orElse: () => Material(
            color: AppColors.white,
            borderRadius: AppRadius.sheetTop,
            child: SizedBox(
              height: 180.h,
              child: const AppLoader.inline(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, int totalSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filters',
            style: AppTypography.titleLarge,
          ),
          if (totalSelected > 0)
            GestureDetector(
              onTap: () {
                context.read<FilterBloc>().add(const FilterEvent.cleared());
              },
              behavior: HitTestBehavior.opaque,
              child: Text(
                'Clear All',
                style: AppTypography.brandAction,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, int totalSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: AppButton.primary(
        height: 46.h,
        borderRadius: AppRadius.buttonRadius,
        text: totalSelected > 0
            ? 'Apply Filters ($totalSelected)'
            : 'Apply Filters',
        onPressed: () {
          final filterBloc = context.read<FilterBloc>();
          final selectedFilters = filterBloc.getSelectedFilters();
          filterBloc.add(const FilterEvent.applied());
          Navigator.pop(context);
          onApply?.call(selectedFilters);
        },
      ),
    );
  }
}
