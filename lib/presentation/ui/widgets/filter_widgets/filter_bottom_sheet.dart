import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/presentation/bloc/filter_bloc/filter_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/filter_widgets/filter_category_list.dart';
import 'package:pickaboo/presentation/ui/widgets/filter_widgets/filter_options_list.dart';

class FilterBottomSheet extends StatelessWidget {
  final Function(Map<String, List<String>>)? onApply;

  const FilterBottomSheet({super.key, this.onApply});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FilterCategoryList(),
                  Expanded(child: FilterOptionsList()),
                ],
              ),
            ),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      color: const Color(0xFF1299E8),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: context.colors.white),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Text(
                'Filter',
                style: context.textStyle.bodyLargeMedium.withColor(
                  context.colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      height: 72.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: context.colors.white,
        border: Border(
          top: BorderSide(color: context.colors.black.withValues(alpha: 0.025), width: 4.w),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                context.read<FilterBloc>().add(const FilterEvent.cleared());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Filter cleared. Press Apply Now.'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFA1A1A1)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.h),
              ),
              child: Text(
                'Clear Filter',
                style: context.textStyle.bodyLargeMedium.withColor(
                  context.colors.black,
                ),
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                final filterBloc = context.read<FilterBloc>();
                final selectedFilters = filterBloc.getSelectedFilters();
                context.read<FilterBloc>().add(const FilterEvent.applied());
                Navigator.pop(context);
                onApply?.call(selectedFilters);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5722),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.h),
              ),
              child: Text(
                'Done',
                style: context.textStyle.bodyLargeMedium.withColor(
                  context.colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
