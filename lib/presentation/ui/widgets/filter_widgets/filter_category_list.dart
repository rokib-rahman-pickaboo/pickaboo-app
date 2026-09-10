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

class FilterCategoryList extends StatelessWidget {
  final bool isClamped;

  const FilterCategoryList({super.key, this.isClamped = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (categories, selectedCategoryCode, selectionCounts) {
            return Container(
              width: 125.w,
              color: AppColors.pageBg,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemExtent: 48.h,
                itemCount: categories.length,
                physics: isClamped
                    ? const ClampingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected =
                      category.filterCode == selectedCategoryCode;
                  final selectionCount =
                      selectionCounts[category.filterCode] ?? 0;

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
                                  : AppTypography.bodyRegular.withColor(AppColors.muted),
                            ),
                          ),
                          if (selectionCount > 0)
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
                                '$selectionCount',
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
          },
          orElse: () => SizedBox(width: 125.w),
        );
      },
    );
  }
}
