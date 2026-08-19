import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/presentation/bloc/filter_bloc/filter_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/filter_widgets/filter_bottom_sheet.dart';

class FilterButtonWidget extends StatelessWidget {
  final VoidCallback? onSortPressed;
  final Function(Map<String, List<String>>)? onFiltersApplied;

  const FilterButtonWidget({
    super.key,
    this.onSortPressed,
    this.onFiltersApplied,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: context.colors.black.withValues(alpha: 0.05),
            width: 1.w,
          ),
        ),
      ),
      child: Row(
        children: [
          _buildButton(
            context: context,
            icon: Icons.sort,
            label: 'Sort',
            onPressed: onSortPressed ?? () {},
          ),
          _buildButton(
            context: context,
            icon: Icons.filter_list,
            label: 'Filter',
            onPressed: () => _openFilterSheet(context),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: context.colors.black.withValues(alpha: 0.2),
                width: 0.2.w,
              ),
              right: BorderSide(
                color: context.colors.black.withValues(alpha: 0.2),
                width: 0.2.w,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18.sp),
              SizedBox(width: 6.w),
              Text(label, style: context.textStyle.bodyMediumMedium),
            ],
          ),
        ),
      ),
    );
  }

  void _openFilterSheet(BuildContext context) {
    final filterBloc = context.read<FilterBloc>();
    final state = filterBloc.state;

    final hasFilters = state.maybeWhen(
      loaded: (categories, _, _) => categories.isNotEmpty,
      orElse: () => false,
    );

    if (!hasFilters) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No filter available')));
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.colors.black.withValues(alpha: 0.0),
      builder: (context) => BlocProvider.value(
        value: filterBloc,
        child: FilterBottomSheet(
          onApply: (filters) {
            onFiltersApplied?.call(filters);
          },
        ),
      ),
    );
  }
}
