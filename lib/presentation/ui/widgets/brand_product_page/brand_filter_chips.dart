// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/brand_products/brand_products_entity.dart';
import 'package:pickaboo/presentation/bloc/brand_products_bloc/brand_products_bloc.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';

class BrandFilterChips extends StatelessWidget {
  final FilterAttributeEntity attribute;
  final Map<String, List<String>> currentFilters;
  final String brandKey;

  const BrandFilterChips({
    super.key,
    required this.attribute,
    required this.currentFilters,
    required this.brandKey,
  });

  @override
  Widget build(BuildContext context) {
    if (attribute.items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
      child: SizedBox(
        height: 32.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: attribute.items.length,
          separatorBuilder: (_, _) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            final item = attribute.items[index];
            return _buildChip(context, item);
          },
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, FilterItemEntity item) {
    final isSelected = currentFilters[attribute.filterCode]?.contains(item.value.toString()) ?? false;

    return InkWell(
      onTap: () {
        final newFilters = Map<String, List<String>>.from(currentFilters);

        if (isSelected) {
          newFilters.remove(attribute.filterCode);
        } else {
          newFilters[attribute.filterCode] = [item.value.toString()];
        }

        context.read<BrandProductsBloc>().add(
          BrandProductsEvent.applyFilters(
            brandKey: brandKey,
            filters: newFilters,
          ),
        );
      },
      borderRadius: AppRadius.pillRadius,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.pickabooBlue : AppColors.white,
          borderRadius: AppRadius.pillRadius,
          border: Border.all(
            color: isSelected ? AppColors.pickabooBlue : AppColors.muted.withValues(alpha: 0.3),
            width: 1.w,
          ),
        ),
        child: Center(
          child: Text(
            item.label.removeHtmlTags,
            style: AppTypography.bodyMedium.copyWith(
              color: isSelected ? AppColors.white : AppColors.text,
            ),
          ),
        ),
      ),
    );
  }
}
