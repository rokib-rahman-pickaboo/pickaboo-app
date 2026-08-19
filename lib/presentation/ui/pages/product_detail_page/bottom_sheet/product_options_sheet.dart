import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';

import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_variant_selector.dart';

class ProductOptionsSheetResult {
  final List<ConfigurableItemOptionEntity> variants;
  final List<ConfigurableItemOptionEntity> addons;
  ProductOptionsSheetResult(this.variants, this.addons);
}

class ProductOptionsSheet extends StatefulWidget {
  final ProductDetailEntity product;
  final int quantity;
  final List<ConfigurableItemOptionEntity> initialVariants;
  final List<ConfigurableItemOptionEntity> initialAddons;
  final int initialAddonPrice;
  final bool isBuyNow;

  final bool isSelectionOnly;

  final void Function(
    List<ConfigurableItemOptionEntity> variants,
    List<ConfigurableItemOptionEntity> addons,
  )? onSelectionsChanged;

  const ProductOptionsSheet({
    super.key,
    required this.product,
    required this.quantity,
    this.initialVariants = const [],
    this.initialAddons = const [],
    this.initialAddonPrice = 0,
    this.isBuyNow = false,
    this.isSelectionOnly = false,
    this.onSelectionsChanged,
  });

  static Future<ProductOptionsSheetResult?> show(
    BuildContext context, {
    required ProductDetailEntity product,
    required int quantity,
    required List<ConfigurableItemOptionEntity> initialVariants,
    required List<ConfigurableItemOptionEntity> initialAddons,
    required int initialAddonPrice,
    bool isBuyNow = false,
    bool isSelectionOnly = false,
    void Function(
      List<ConfigurableItemOptionEntity> variants,
      List<ConfigurableItemOptionEntity> addons,
    )? onSelectionsChanged,
  }) {
    return showModalBottomSheet<ProductOptionsSheetResult>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ProductOptionsSheet(
        product: product,
        quantity: quantity,
        initialVariants: initialVariants,
        initialAddons: initialAddons,
        initialAddonPrice: initialAddonPrice,
        isBuyNow: isBuyNow,
        isSelectionOnly: isSelectionOnly,
        onSelectionsChanged: onSelectionsChanged,
      ),
    );
  }

  @override
  State<ProductOptionsSheet> createState() => _ProductOptionsSheetState();
}

class _ProductOptionsSheetState extends State<ProductOptionsSheet> {
  late List<ConfigurableItemOptionEntity> _selectedVariants;
  late List<ConfigurableItemOptionEntity> _selectedAddons;
  late int _totalAddonPrice;
  bool _showVariantError = false;
  bool _showAddonError = false;

  @override
  void initState() {
    super.initState();
    _selectedVariants = List.from(widget.initialVariants);
    _selectedAddons = List.from(widget.initialAddons);
    _totalAddonPrice = widget.initialAddonPrice;
  }

  bool _validate({BuildContext? messengerContext}) {
    bool isValid = true;
    final List<String> missing = [];

    if (widget.product.variantGroups.isNotEmpty) {
      final selectedIds = _selectedVariants.map((e) => e.optionId).toSet();
      final unselected = widget.product.variantGroups
          .where((v) => !selectedIds.contains(v.optionId))
          .toList();
      if (unselected.isNotEmpty) {
        missing.addAll(unselected.map((v) => v.optionName));
        setState(() => _showVariantError = true);
        isValid = false;
      }
    }

    final filteredOptions = widget.product.extraOptions
        .where((option) => !option.title.toLowerCase().contains('insurance'))
        .toList();
    final requiredOptions =
        filteredOptions.where((o) => o.isRequire).toList();
    if (requiredOptions.isNotEmpty) {
      final selectedAddonIds = _selectedAddons
          .where((e) => e.isCustomOption)
          .map((e) => e.optionId)
          .toSet();
      final unfulfilled = requiredOptions
          .where((o) => !selectedAddonIds.contains(o.optionId.toString()))
          .toList();
      if (unfulfilled.isNotEmpty) {
        missing.addAll(unfulfilled.map((o) => o.title));
        setState(() => _showAddonError = true);
        isValid = false;
      }
    }

    if (!isValid && messengerContext != null && missing.isNotEmpty) {
      SnackBarUtils.showWarning(
        messengerContext,
        'Please select any ${missing.first}',
      );
    }

    return isValid;
  }

  void _onAddonTap(ExtraOptionEntity option, ExtraOptionValueEntity val,
      bool isSelected) {
    final currentSelections =
        List<ConfigurableItemOptionEntity>.from(_selectedAddons);
    currentSelections.removeWhere(
      (e) => e.optionId == option.optionId.toString(),
    );
    if (!isSelected) {
      currentSelections.add(
        ConfigurableItemOptionEntity(
          optionId: option.optionId.toString(),
          optionValue: val.optionTypeId.toString(),
          isCustomOption: true,
        ),
      );
    }

    int newTotalAddonPrice = 0;
    for (var sel in currentSelections) {
      try {
        final opt = widget.product.extraOptions.firstWhere(
          (o) => o.optionId.toString() == sel.optionId,
        );
        final v = opt.values.firstWhere(
          (v) => v.optionTypeId.toString() == sel.optionValue,
        );
        newTotalAddonPrice += v.price;
      } catch (_) {}
    }

    final requiredOptions =
        widget.product.extraOptions.where((o) => o.isRequire).toList();
    final selectedIds = currentSelections
        .where((e) => e.isCustomOption)
        .map((e) => e.optionId)
        .toSet();
    final allRequiredFulfilled = requiredOptions
        .every((o) => selectedIds.contains(o.optionId.toString()));

    setState(() {
      _selectedAddons = currentSelections;
      _totalAddonPrice = newTotalAddonPrice;
      if (allRequiredFulfilled) {
        _showAddonError = false;
      }
    });
    _publishSelections();
  }

  void _publishSelections() {
    widget.onSelectionsChanged?.call(
      List.unmodifiable(_selectedVariants),
      List.unmodifiable(_selectedAddons),
    );
  }

  Widget _buildAddonItem({
    required ExtraOptionEntity option,
    required ExtraOptionValueEntity val,
    required bool hasOptionError,
    required AppColors colors,
    required AppTextStyles textStyle,
  }) {
    final isSelected = _selectedAddons.any(
      (e) =>
          e.optionId == option.optionId.toString() &&
          e.optionValue == val.optionTypeId.toString(),
    );

    return GestureDetector(
      onTap: () => _onAddonTap(option, val, isSelected),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected
              ? colors.linkBlue.withValues(alpha: 0.03)
              : colors.white,
          border: Border.all(
            color: isSelected
                ? colors.linkBlue
                : hasOptionError
                    ? colors.red
                    : colors.borderColor,
            width: isSelected || hasOptionError ? 1.2.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colors.linkBlue.withValues(alpha: 0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : hasOptionError
                  ? [
                      BoxShadow(
                        color: colors.red.withValues(alpha: 0.06),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.white,
                      border: Border.all(
                        color:
                            isSelected ? colors.linkBlue : colors.borderColor,
                        width: 1.w,
                      ),
                    ),
                    child: Icon(
                      Icons.settings_outlined,
                      color:
                          isSelected ? colors.linkBlue : colors.graySmallLight,
                      size: 12.sp,
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      right: -1.w,
                      bottom: -1.h,
                      child: Container(
                        padding: EdgeInsets.all(1.5.w),
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                width: 1.2.w,
                decoration: BoxDecoration(
                  color: isSelected ? colors.linkBlue : colors.borderColor,
                  borderRadius: BorderRadius.circular(1.w),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+${val.price} ৳',
                      style: textStyle.bodyMediumBold.copyWith(
                        color: isSelected ? colors.linkBlue : colors.textMedium,
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      val.title,
                      style: textStyle.bodySmall.copyWith(
                        color: colors.text,
                        fontSize: 10.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Builder(
        builder: (messengerContext) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(messengerContext).pop(),
                  child: const SizedBox.expand(),
                ),
              ),
              _buildSheet(messengerContext),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSheet(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    final currentPrice =
        (widget.product.discount > 0
            ? widget.product.spacialPrice
            : widget.product.regularPrice) +
        _totalAddonPrice;

    final formattedPrice = currentPrice.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      padding: EdgeInsets.only(
        top: 0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: colors.borderColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.variantGroups.isNotEmpty
                      ? 'Select options'
                      : 'Select add-ons',
                  style: textStyle.bodyMediumBold.copyWith(color: colors.text),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: colors.graySmallLight,
                    size: 24.sp,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          Divider(color: colors.borderColor, thickness: 1.h, height: 1.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: textStyle.bodyMediumBold.copyWith(
                    color: colors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  '৳$formattedPrice',
                  style: textStyle.bodyLargeBold.copyWith(
                    color: colors.linkBlue,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: colors.borderColor, thickness: 1.h, height: 1.h),

          Flexible(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.product.variantGroups.isNotEmpty) ...[
                    ProductVariantSelector(
                      variants: widget.product.variantGroups,
                      matrix: widget.product.variantMatrix,
                      showError: _showVariantError,
                      initialSelections: {
                        for (final v in _selectedVariants)
                          v.optionId: v.optionValue,
                      },
                      onChanged: (selections) {
                        setState(() {
                          _showVariantError = false;
                          _selectedVariants = selections
                              .map(
                                (s) => ConfigurableItemOptionEntity(
                                  optionId: s.optionId,
                                  optionValue: s.valueId,
                                ),
                              )
                              .toList();
                        });
                        _publishSelections();
                      },
                    ),
                    SizedBox(height: 8.h),
                  ],

                  ...(() {
                    final filteredOptions = widget.product.extraOptions
                        .where((option) => !option.title.toLowerCase().contains('insurance'))
                        .toList();

                    if (filteredOptions.isEmpty) return <Widget>[];

                    return <Widget>[
                      Divider(
                        color: colors.borderColor,
                        thickness: 1.h,
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 8.w, 16.w, 12.w),
                        child: Text(
                          'Options',
                          style: textStyle.subheading.copyWith(
                            color: colors.text,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...filteredOptions.map((option) {
                      final hasOptionSelected = _selectedAddons.any(
                        (e) => e.optionId == option.optionId.toString(),
                      );
                      final hasOptionError = _showAddonError &&
                          option.isRequire &&
                          !hasOptionSelected;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 6.h,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${option.title}:',
                                  style: textStyle.bodyMediumMedium.copyWith(
                                    color: hasOptionError
                                        ? colors.red
                                        : colors.textMedium,
                                  ),
                                ),
                                if (hasOptionError) ...[
                                  SizedBox(width: 6.w),
                                  Text(
                                    'Required',
                                    style: textStyle.bodySmall.copyWith(
                                      color: context.colors.red,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              16.w,
                              0,
                              16.w,
                              12.h,
                            ),
                            child: Column(
                              children: [
                                for (int i = 0;
                                    i < option.values.length;
                                    i += 2) ...[
                                  if (i > 0) SizedBox(height: 8.h),
                                  IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: _buildAddonItem(
                                            option: option,
                                            val: option.values[i],
                                            hasOptionError: hasOptionError,
                                            colors: colors,
                                            textStyle: textStyle,
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Expanded(
                                          child: i + 1 < option.values.length
                                              ? _buildAddonItem(
                                                  option: option,
                                                  val: option.values[i + 1],
                                                  hasOptionError:
                                                      hasOptionError,
                                                  colors: colors,
                                                  textStyle: textStyle,
                                                )
                                              : const SizedBox.shrink(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                    ];
                  })(),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.w),
            child: ElevatedButton(
              onPressed: () {
                if (!_validate(messengerContext: context)) return;
                Navigator.pop(context, ProductOptionsSheetResult(_selectedVariants, _selectedAddons));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.darkBlueNav,
                minimumSize: Size(double.infinity, 48.h),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                widget.isBuyNow && !widget.isSelectionOnly
                    ? 'BUY NOW'
                    : 'CONTINUE',
                style: textStyle.buttonMedium.copyWith(color: colors.white),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
