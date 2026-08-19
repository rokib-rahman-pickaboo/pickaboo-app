import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/presentation/bloc/filter_bloc/filter_bloc.dart';

class FilterCategoryList extends StatelessWidget {
  const FilterCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (categories, selectedCategoryCode, selectionCounts) {
            return Container(
              width: 117.w,
              color: const Color(0xFFFBFBFB),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected =
                      category.filterCode == selectedCategoryCode;
                  final selectionCount =
                      selectionCounts[category.filterCode] ?? 0;

                  return InkWell(
                    onTap: () {
                      context.read<FilterBloc>().add(
                        FilterEvent.categoryChanged(
                          filterCode: category.filterCode,
                        ),
                      );
                    },
                    child: Container(
                      color: isSelected
                          ? const Color(0xFFFF5722)
                          : const Color(0xFFFBFBFB),
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 20.h,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              category.filterName,
                              style: context.textStyle.bodyMediumMedium
                                  .withColor(
                                    isSelected ? context.colors.white : context.colors.black,
                                  ),
                            ),
                          ),
                          if (selectionCount > 0)
                            Text(
                              '$selectionCount',
                              style: isSelected
                                  ? context.textStyle.bodyMediumMedium
                                        .withColor(context.colors.white)
                                  : context.textStyle.bodySmallMedium.withColor(
                                context.colors.black,
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
          orElse: () => SizedBox(width: 117.w),
        );
      },
    );
  }
}
