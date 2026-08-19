import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';

class CategoryFilterBottomSheet extends StatefulWidget {
  final List<FilterAttributeEntity> filterableAttributes;
  final Function(Map<String, List<String>>) onApply;
  final Map<String, List<String>>? initialFilters;
  final String? initialExpandedFilterCode;

  const CategoryFilterBottomSheet({
    super.key,
    required this.filterableAttributes,
    required this.onApply,
    this.initialFilters,
    this.initialExpandedFilterCode,
  });

  @override
  State<CategoryFilterBottomSheet> createState() =>
      _CategoryFilterBottomSheetState();
}

class _CategoryFilterBottomSheetState extends State<CategoryFilterBottomSheet> {
  static const double _fallbackMinPrice = 0.0;
  static const double _fallbackMaxPrice = 500000.0;

  late final Map<String, List<String>> _selectedFilters;

  late final double _minPrice;
  late final double _maxPrice;

  late SfRangeValues _priceRange;

  late final Set<String> _initiallySelectedCodes;

  void _apply() {
    widget.onApply({
      for (final entry in _selectedFilters.entries)
        entry.key: List<String>.from(entry.value),
    });
    Navigator.of(context).pop();
  }

  void _resolvePriceBounds() {
    var min = _fallbackMinPrice;
    var max = _fallbackMaxPrice;

    for (final attribute in widget.filterableAttributes) {
      if (attribute.filterCode.toLowerCase() != 'price') continue;

      final ranges = attribute.items
          .map((item) => item.rangeBounds)
          .nonNulls
          .toList();
      if (ranges.isEmpty) break;

      min = ranges.first.min;
      max = ranges.last.max;
      break;
    }

    if (max <= min) {
      min = _fallbackMinPrice;
      max = _fallbackMaxPrice;
    }

    _minPrice = min;
    _maxPrice = max;
  }

  @override
  void initState() {
    super.initState();

    _resolvePriceBounds();
    _priceRange = SfRangeValues(_minPrice, _maxPrice);

    _selectedFilters = {};
    if (widget.initialFilters != null) {
      widget.initialFilters!.forEach((key, value) {
        _selectedFilters[key] = List.from(value);
        if (key.toLowerCase() == 'price' && value.isNotEmpty) {
          final parts = value.first.split('-');
          if (parts.length == 2) {
            _priceRange = SfRangeValues(
              (double.tryParse(parts[0]) ?? _minPrice).clamp(
                _minPrice,
                _maxPrice,
              ),
              (double.tryParse(parts[1]) ?? _maxPrice).clamp(
                _minPrice,
                _maxPrice,
              ),
            );
          }
        }
      });
    }

    _initiallySelectedCodes = {
      for (final entry in _selectedFilters.entries)
        if (entry.value.isNotEmpty) entry.key,
    };
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    return Material(
      color: colors.white,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: colors.gray.withValues(alpha: 0.2)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filters',
                  style: textStyles.appBarTitle.copyWith(color: colors.text),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedFilters.clear();
                      _priceRange = SfRangeValues(_minPrice, _maxPrice);
                    });
                    _apply();
                  },
                  child: Text(
                    'Clear All',
                    style: textStyles.bodyMedium.copyWith(
                      color: colors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.filterableAttributes.length,
              itemBuilder: (context, index) {
                final attribute = widget.filterableAttributes[index];
                if (attribute.filterCode.toLowerCase() == 'price') {
                  return _buildPriceSlider(attribute, colors, textStyles);
                }
                return _buildFilterCategory(attribute, colors, textStyles);
              },
            ),
          ),

          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: colors.white,
              boxShadow: [
                BoxShadow(
                  color: colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(child: _buildApplyButton(colors, textStyles)),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildPriceSlider(
    FilterAttributeEntity attribute,
    AppColors colors,
    AppTextStyles textStyles,
  ) {
    final double minPrice = _minPrice;
    final double maxPrice = _maxPrice;

    final bool expand =
        widget.initialExpandedFilterCode == attribute.filterCode ||
        _initiallySelectedCodes.contains(attribute.filterCode) ||
        (widget.initialExpandedFilterCode == null &&
            _initiallySelectedCodes.isEmpty);

    return ExpansionTile(
      key: PageStorageKey<String>('filter_${attribute.filterCode}'),
      initiallyExpanded: expand,
      tilePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.w),
      childrenPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      leading: _getFilterIcon(attribute.filterCode, colors),
      title: Text(
        attribute.filterName,
        style: textStyles.bodyMediumBold.copyWith(color: colors.text),
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPriceValueChip(
                value: (_priceRange.start as num).toDouble(),
                colors: colors,
                textStyles: textStyles,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  '—',
                  style: textStyles.bodyMedium.copyWith(color: colors.gray),
                ),
              ),
              _buildPriceValueChip(
                value: (_priceRange.end as num).toDouble(),
                colors: colors,
                textStyles: textStyles,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: SfRangeSliderTheme(
            data: SfRangeSliderThemeData(
              thumbColor: colors.white,
              thumbStrokeWidth: 2,
              thumbStrokeColor: colors.primary,
              tooltipBackgroundColor: colors.white,
              tooltipTextStyle: textStyles.caption.copyWith(
                color: colors.text,
                fontWeight: FontWeight.bold,
              ),
              activeTrackColor: colors.primary,
              inactiveTrackColor: colors.gray.withValues(alpha: 0.2),
            ),
            child: SfRangeSlider(
              min: minPrice,
              max: maxPrice,
              values: _priceRange,
              showTicks: false,
              showLabels: false,
              enableTooltip: true,
              tooltipShape: const SfRectangularTooltipShape(),
              tooltipTextFormatterCallback: (
                dynamic actualValue,
                String formattedText,
              ) {
                return 'TK ${NumberFormat('#,##0').format(actualValue)}';
              },
              onChanged: (SfRangeValues newValues) {
                setState(() {
                  _priceRange = newValues;
                  final minStr = newValues.start.toInt().toString();
                  final maxStr = newValues.end.toInt().toString();

                  if (newValues.start > minPrice || newValues.end < maxPrice) {
                    _selectedFilters[attribute.filterCode] = ['$minStr-$maxStr'];
                  } else {
                    _selectedFilters.remove(attribute.filterCode);
                  }
                });
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '৳ ${NumberFormat('#,##0').format(minPrice)}',
                style: textStyles.caption.copyWith(color: colors.gray),
              ),
              Text(
                '৳ ${NumberFormat('#,##0').format(maxPrice)}',
                style: textStyles.caption.copyWith(color: colors.gray),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceValueChip({
    required double value,
    required AppColors colors,
    required AppTextStyles textStyles,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.06),
        border: Border.all(color: colors.primary.withValues(alpha: 0.4)),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        '৳ ${NumberFormat('#,##0').format(value)}',
        style: textStyles.caption.copyWith(
          color: colors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 11.sp,
        ),
      ),
    );
  }

  Widget _buildFilterCategory(
    FilterAttributeEntity attribute,
    AppColors colors,
    AppTextStyles textStyles,
  ) {
    final selectedCount = _selectedFilters[attribute.filterCode]?.length ?? 0;

    final isExpanded =
        widget.initialExpandedFilterCode == attribute.filterCode ||
        _initiallySelectedCodes.contains(attribute.filterCode);

    return ExpansionTile(
      key: PageStorageKey<String>('filter_${attribute.filterCode}'),
      initiallyExpanded: isExpanded,
      tilePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.w),
      childrenPadding: EdgeInsets.symmetric(horizontal: 20.w),
      leading: _getFilterIcon(attribute.filterCode, colors),
      title: Row(
        children: [
          Expanded(
            child: Text(
              attribute.filterName,
              style: textStyles.bodyMediumBold.copyWith(color: colors.text),
            ),
          ),
          if (selectedCount > 0)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                '$selectedCount',
                style: textStyles.caption.copyWith(
                  color: colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                ),
              ),
            ),
        ],
      ),
      children: attribute.items.map((item) {
        final isSelected =
            _selectedFilters[attribute.filterCode]?.contains(item.value.toString()) ??
            false;

        return CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          activeColor: colors.primary,
          value: isSelected,
          onChanged: (bool? value) {
            setState(() {
              if (value == true) {
                _selectedFilters.putIfAbsent(attribute.filterCode, () => []);
                _selectedFilters[attribute.filterCode]!.add(item.value.toString());
              } else {
                _selectedFilters[attribute.filterCode]?.remove(item.value.toString());
                if (_selectedFilters[attribute.filterCode]?.isEmpty ?? false) {
                  _selectedFilters.remove(attribute.filterCode);
                }
              }
            });
          },
          title: Row(
            children: [
              Expanded(
                child: Text(
                  item.label.removeHtmlTags,
                  style: textStyles.bodyMedium.copyWith(color: colors.text),
                ),
              ),
              Text(
                '(${item.count})',
                style: textStyles.caption.copyWith(color: colors.gray),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _getFilterIcon(String filterCode, AppColors colors) {
    IconData icon;
    switch (filterCode.toLowerCase()) {
      case 'brand':
      case 'manufacturer':
        icon = Icons.business;
        break;
      case 'price':
        icon = Icons.attach_money;
        break;
      case 'color':
      case 'colour':
        icon = Icons.palette;
        break;
      case 'size':
        icon = Icons.straighten;
        break;
      default:
        icon = Icons.filter_list;
    }

    return Icon(icon, color: colors.primary, size: 24.sp);
  }

  Widget _buildApplyButton(AppColors colors, AppTextStyles textStyles) {
    final totalSelected = _selectedFilters.values.fold<int>(
      0,
      (sum, list) => sum + list.length,
    );

    return ElevatedButton(
      onPressed: _apply,
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.primary,
        elevation: 2,
        shadowColor: colors.primary.withValues(alpha: 0.3),
        minimumSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Text(
        totalSelected > 0 ? 'Apply Filters ($totalSelected)' : 'Apply Filters',
        style: textStyles.buttonMedium.copyWith(color: colors.white),
      ),
    );
  }
}
