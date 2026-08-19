import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';

class SelectedVariantEntity {
  final String optionId;
  final String optionName;
  final String valueId;
  final String valueText;

  SelectedVariantEntity({
    required this.optionId,
    required this.optionName,
    required this.valueId,
    required this.valueText,
  });
}

class ProductVariantSelector extends StatefulWidget {
  final List<VariantEntity> variants;

  final VariantMatrixEntity? matrix;
  final Function(String optionId, String optionValue)? onOptionSelected;
  final Function(List<SelectedVariantEntity> selections)? onChanged;
  final VoidCallback? onTapOverride;
  final Map<String, String>? initialSelections;
  final bool showError;

  const ProductVariantSelector({
    super.key,
    required this.variants,
    this.matrix,
    this.onOptionSelected,
    this.onChanged,
    this.onTapOverride,
    this.initialSelections,
    this.showError = false,
  });

  @override
  State<ProductVariantSelector> createState() => _ProductVariantSelectorState();
}

class _ProductVariantSelectorState extends State<ProductVariantSelector> {
  late Map<String, String> _selectedOptions;

  @override
  void initState() {
    super.initState();
    _selectedOptions = Map.from(widget.initialSelections ?? {});
  }

  @override
  void didUpdateWidget(ProductVariantSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!mapEquals(widget.initialSelections, oldWidget.initialSelections)) {
      setState(() {
        _selectedOptions = Map.from(widget.initialSelections ?? {});
      });
    }
  }

  List<SelectedVariantEntity> _getSelections() {
    final List<SelectedVariantEntity> selections = [];
    for (var variant in widget.variants) {
      final selectedValueId = _selectedOptions[variant.optionId];
      if (selectedValueId != null) {
        try {
          final option = variant.options.firstWhere(
            (opt) => opt.optionValue == selectedValueId,
          );
          selections.add(
            SelectedVariantEntity(
              optionId: variant.optionId,
              optionName: variant.optionName,
              valueId: option.optionValue,
              valueText: option.optionText,
            ),
          );
        } catch (e) {
        }
      }
    }
    return selections;
  }

  VariantMatrixEntity? get _matrix {
    final matrix = widget.matrix;
    return (matrix != null && matrix.isNotEmpty) ? matrix : null;
  }

  List<VariantOptionEntity> _visibleOptions(VariantEntity variant) {
    final matrix = _matrix;
    if (matrix == null) return variant.options;

    final allowed = matrix.selectableValues(variant.optionId, _selectedOptions);
    return variant.options
        .where((option) => allowed.contains(option.optionValue))
        .toList();
  }

  void _toggle(VariantEntity variant, String value) {
    final isSelected = _selectedOptions[variant.optionId] == value;
    setState(() {
      if (isSelected) {
        _selectedOptions.remove(variant.optionId);
      } else {
        _selectedOptions[variant.optionId] = value;
      }
    });
    if (!isSelected) widget.onOptionSelected?.call(variant.optionId, value);
    widget.onChanged?.call(_getSelections());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.variants.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.variants.map((variant) {
        return _buildVariantGroup(context, variant);
      }).toList(),
    );
  }

  Widget _buildVariantGroup(BuildContext context, VariantEntity variant) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final bool hasError =
        widget.showError && !_selectedOptions.containsKey(variant.optionId);

    final options = _visibleOptions(variant);
    if (options.isEmpty) return const SizedBox.shrink();

    bool hasImages = options.any(
      (opt) =>
          opt.configurableProduct?.productImages != null &&
          opt.configurableProduct!.productImages.isNotEmpty,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h),
          child: Row(
            crossAxisAlignment: hasImages
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 80.w,
                child: Row(
                  children: [
                    Text(
                      variant.optionName,
                      style: textStyle.bodyMediumMedium.copyWith(
                        color: hasError ? colors.red : colors.text,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      ':',
                      style: textStyle.bodyMedium.copyWith(
                        color: hasError ? colors.red : colors.text,
                      ),
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
              ),

              Expanded(
                child: hasImages
                    ? _buildImageOptions(variant, options)
                    : _buildTextOptions(variant, options),
              ),
            ],
          ),
        ),
        if (hasError)
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 4.h, bottom: 8.h),
            child: Text(
              'Please select ${variant.optionName}',
              style: textStyle.bodySmall.copyWith(
                color: context.colors.red,
                fontSize: 11.sp,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildImageOptions(
    VariantEntity variant,
    List<VariantOptionEntity> options,
  ) {
    final colors = context.colors;
    final String? selectedValue = _selectedOptions[variant.optionId];
    final bool groupHasError =
        widget.showError && !_selectedOptions.containsKey(variant.optionId);

    return SizedBox(
      height: 95.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final option = options[index];
          final isSelected = selectedValue == option.optionValue;
          final imageUrl =
              (option.configurableProduct?.productImages != null &&
                  option.configurableProduct!.productImages.isNotEmpty)
              ? option.configurableProduct!.productImages.first
              : '';

          final isOutOfStock = option.configurableProduct?.stockAvailable == false;

          return GestureDetector(
            onTap: isOutOfStock ? null : () {
              if (widget.onTapOverride != null) {
                widget.onTapOverride!();
                return;
              }
              _toggle(variant, option.optionValue);
            },
            child: Opacity(
              opacity: isOutOfStock ? 0.4 : 1.0,
              child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 65.w,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: colors.white,
                        border: Border.all(
                          color: isSelected
                              ? colors.linkBlue
                              : groupHasError
                                  ? colors.red
                                  : colors.borderColor,
                          width: isSelected || groupHasError ? 1.5.w : 1.w,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: colors.linkBlue.withValues(alpha: 0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : groupHasError
                                ? [
                                    BoxShadow(
                                      color: colors.red.withValues(alpha: 0.08),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : null,
                      ),
                      padding: EdgeInsets.all(4.w),
                      child: imageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.contain,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  color: colors.linkBlue,
                                  strokeWidth: 2,
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.image_not_supported,
                                size: 20.sp,
                                color: colors.graySmallLight,
                              ),
                            )
                          : Icon(
                              Icons.image_not_supported,
                              size: 20.sp,
                              color: colors.graySmallLight,
                            ),
                    ),
                    if (isSelected)
                      Positioned(
                        right: -4.w,
                        bottom: -4.h,
                        child: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: colors.white, width: 1.w),
                          ),
                          child: Icon(
                            Icons.check,
                            color: colors.white,
                            size: 8.sp,
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Text(
                    option.optionText,
                    style: context.textStyle.bodySmall.copyWith(
                      color: isSelected ? colors.linkBlue : colors.text,
                      fontSize: 10.sp,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextOptions(
    VariantEntity variant,
    List<VariantOptionEntity> options,
  ) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final String? selectedValue = _selectedOptions[variant.optionId];
    final bool groupHasError =
        widget.showError && !_selectedOptions.containsKey(variant.optionId);

    return Wrap(
      spacing: 12.w,
      runSpacing: 10.h,
      children: options.map((option) {
        final isSelected = selectedValue == option.optionValue;

        final isOutOfStock = option.configurableProduct?.stockAvailable == false;

        return GestureDetector(
          onTap: isOutOfStock ? null : () {
            if (widget.onTapOverride != null) {
              widget.onTapOverride!();
              return;
            }
            _toggle(variant, option.optionValue);
          },
          child: Opacity(
            opacity: isOutOfStock ? 0.4 : 1.0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? colors.linkBlue.withValues(alpha: 0.03)
                      : colors.white,
                  border: Border.all(
                    color: isSelected
                        ? colors.linkBlue
                        : groupHasError
                            ? colors.red
                            : colors.borderColor,
                    width: isSelected || groupHasError ? 1.5.w : 1.w,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: colors.linkBlue.withValues(alpha: 0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : groupHasError
                          ? [
                              BoxShadow(
                                color: colors.red.withValues(alpha: 0.06),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                ),
                child: Text(
                  option.optionText,
                  style: textStyle.bodySmall.copyWith(
                    color: isSelected ? colors.linkBlue : colors.text,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              if (isSelected)
                Positioned(
                  right: -4.w,
                  top: -4.h,
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: colors.white, width: 1.w),
                    ),
                    child: Icon(Icons.check, color: colors.white, size: 8.sp),
                  ),
                ),
            ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
