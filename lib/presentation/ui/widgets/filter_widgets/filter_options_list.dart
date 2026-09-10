import 'package:pickaboo/core/color/app_colors.dart';
// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/data/model/filter/filter_models.dart';
import 'package:pickaboo/presentation/bloc/filter_bloc/filter_bloc.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';

class FilterOptionsList extends StatefulWidget {
  const FilterOptionsList({super.key});

  @override
  State<FilterOptionsList> createState() => _FilterOptionsListState();
}

class _FilterOptionsListState extends State<FilterOptionsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        final category = state.selectedCategory;
        if (category == null) {
          return const SizedBox.shrink();
        }

        final items = category.items;

        return Container(
          color: Colors.white,
          child: RawScrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            trackVisibility: false,
            thickness: 4.w,
            radius: Radius.circular(3.r),
            thumbColor: AppColors.pickabooBlue,
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final option = items[index];
                final bool isWhite = (items.length - 1 - index).isEven;
                final Color itemBg = isWhite ? AppColors.white : AppColors.pageBg;
                return _buildFilterOption(
                  context,
                  option,
                  category.filterCode,
                  itemBg,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(
    BuildContext context,
    FilterOption option,
    String filterCode,
    Color backgroundColor,
  ) {
    return InkWell(
      onTap: () {
        context.read<FilterBloc>().add(
              FilterEvent.optionToggled(
                filterCode: filterCode,
                option: option,
              ),
            );
      },
      child: Container(
        color: backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 18.w,
              height: 18.w,
              decoration: BoxDecoration(
                color: option.isSelected ? AppColors.pickabooBlue : Colors.white,
                borderRadius: BorderRadius.circular(3.r),
                border: Border.all(
                  color: option.isSelected
                      ? AppColors.pickabooBlue
                      : AppColors.border,
                  width: 1.4.w,
                ),
              ),
              child: option.isSelected
                  ? Icon(
                      Icons.check,
                      size: 13.sp,
                      color: Colors.white,
                    )
                  : null,
            ),
            SizedBox(width: 12.w),
            if (option.icon != null) ...[
              AppImage(
                imageUrl: option.icon!,
                width: 24.w,
                height: 24.h,
                errorWidget: SizedBox(width: 24.w, height: 24.h),
              ),
              SizedBox(width: 10.w),
            ],
            Expanded(
              child: Text(
                option.label.removeHtmlTags,
                style: option.isSelected
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
  }
}
