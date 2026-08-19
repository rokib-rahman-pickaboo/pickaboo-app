import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/data/model/filter/filter_models.dart';
import 'package:pickaboo/presentation/bloc/filter_bloc/filter_bloc.dart';

class FilterOptionsList extends StatefulWidget {
  const FilterOptionsList({super.key});

  @override
  State<FilterOptionsList> createState() => _FilterOptionsListState();
}

class _FilterOptionsListState extends State<FilterOptionsList> {
  bool _showMore = false;

  @override
  void didUpdateWidget(FilterOptionsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _showMore = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        final category = state.selectedCategory;
        if (category == null) {
          return SizedBox.shrink();
        }

        final items = category.items;
        final displayItems = _showMore || items.length <= 10
            ? items
            : items.take(10).toList();

        return Container(
          color: context.colors.white,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: displayItems.length + (items.length > 10 ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == displayItems.length) {
                return _buildShowMoreButton();
              }

              final option = displayItems[index];
              return _buildFilterOption(context, option, category.filterCode);
            },
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(
    BuildContext context,
    FilterOption option,
    String filterCode,
  ) {
    final colors = context.colors;
    return InkWell(
      onTap: () {
        context.read<FilterBloc>().add(
          FilterEvent.optionToggled(filterCode: filterCode, option: option),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Container(
              width: 18.w,
              height: 18.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: option.isSelected
                      ? colors.highlighter
                      : colors.silverChalice,
                ),
                color: option.isSelected
                    ? colors.highlighter.withValues(alpha: 0.2)
                    : colors.black.withValues(alpha: 0.0),
                borderRadius: BorderRadius.circular(1.r),
              ),
              child: option.isSelected
                  ? Center(
                      child: Icon(
                        Icons.check,
                        size: 12.sp,
                        color: colors.highlighter,
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 10.w),
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
                option.label,
                style: context.textStyle.bodyMedium.copyWith(fontSize: 13.sp),
              ),
            ),
            if (option.count != null)
              Text(
                '(${option.count})',
                style: context.textStyle.bodySmall.withColor(colors.gray),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildShowMoreButton() {
    return InkWell(
      onTap: () {
        setState(() {
          _showMore = !_showMore;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(
          _showMore ? 'Show Less' : 'Show More',
          style: context.textStyle.bodyMedium.withColor(Color(0xFF1299E8)),
        ),
      ),
    );
  }
}
