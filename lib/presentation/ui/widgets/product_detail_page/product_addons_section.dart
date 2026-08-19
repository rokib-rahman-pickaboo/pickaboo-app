import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_addon_subsection.dart';

import 'package:pickaboo/domain/entity/product_detail/selected_extra_option_entity.dart';

class ProductAddonsSection extends StatefulWidget {
  const ProductAddonsSection({
    super.key,
    required this.extraOptions,
    this.onChanged,
    this.showError = false,
    this.isInsuranceSection = false,
    this.initialSelections,
  });

  final List<ExtraOptionEntity> extraOptions;
  final Function(List<SelectedExtraOptionEntity>)? onChanged;
  final bool showError;
  final bool isInsuranceSection;
  final List<SelectedExtraOptionEntity>? initialSelections;

  @override
  State<ProductAddonsSection> createState() => _ProductAddonsSectionState();
}

class _ProductAddonsSectionState extends State<ProductAddonsSection> {
  final Map<int, String?> _selectedItemsPerSection = {};

  @override
  void initState() {
    super.initState();
    _seedFromInitialSelections();
  }

  @override
  void didUpdateWidget(covariant ProductAddonsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialSelections != oldWidget.initialSelections) {
      _selectedItemsPerSection.clear();
      _seedFromInitialSelections();
    }
  }

  void _seedFromInitialSelections() {
    final selections = widget.initialSelections;
    if (selections == null) return;
    for (final s in selections) {
      _selectedItemsPerSection[s.optionId] = s.optionTypeId.toString();
    }
  }

  List<SelectedExtraOptionEntity> _getSelections() {
    final List<SelectedExtraOptionEntity> selections = [];

    _selectedItemsPerSection.forEach((optionId, optionTypeIdString) {
      if (optionTypeIdString != null) {
        final optionIdInt = optionId;
        final optionTypeIdInt = int.tryParse(optionTypeIdString);

        if (optionTypeIdInt != null) {
          try {
            final option = widget.extraOptions.firstWhere(
              (o) => o.optionId == optionIdInt,
            );
            final value = option.values.firstWhere(
              (v) => v.optionTypeId == optionTypeIdInt,
            );

            selections.add(
              SelectedExtraOptionEntity(
                optionId: optionIdInt,
                optionTypeId: optionTypeIdInt,
                title: value.title,
                price: value.price,
              ),
            );
          } catch (e) {
          }
        }
      }
    });

    return selections;
  }

  @override
  Widget build(BuildContext context) {
    final filteredOptions = widget.extraOptions
        .where((option) => widget.isInsuranceSection
            ? option.title.toLowerCase().contains('insurance')
            : !option.title.toLowerCase().contains('insurance'))
        .toList();

    if (filteredOptions.isEmpty) return const SizedBox.shrink();

    final colors = context.colors;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
      decoration: BoxDecoration(
        color: colors.whiteSmoke,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: filteredOptions.map((option) {
          final isLast = option == filteredOptions.last;

          return Column(
            children: [
              ProductAddonSubsection(
                title: option.title,
                items: option.values
                    .map(
                      (val) => AddonItem(
                        id: val.optionTypeId.toString(),
                        name: val.title,
                        price: val.price,
                        details: val.details,
                      ),
                    )
                    .toList(),
                selectedItemId: _selectedItemsPerSection[option.optionId],
                onItemSelected: (id) {
                  setState(() {
                    _selectedItemsPerSection[option.optionId] = id;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(_getSelections());
                  }
                },
                initiallyExpanded: option.isRequire,
                showError: widget.showError &&
                    option.isRequire &&
                    _selectedItemsPerSection[option.optionId] == null,
              ),
              if (!isLast) SizedBox(height: 12.h),
            ],
          );
        }).toList(),
      ),
    );
  }
}
