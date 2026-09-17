// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
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
      backgroundColor: AppColors.transparent,
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

    for (final group in widget.product.variantGroups) {
      if (group.options.length == 1) {
        final opt = group.options.first;
        final idx = _selectedVariants.indexWhere((e) => e.optionId == group.optionId);
        if (idx == -1) {
          _selectedVariants.add(
            ConfigurableItemOptionEntity(
              optionId: group.optionId,
              optionValue: opt.optionValue,
            ),
          );
        }
      }
    }
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
              ? AppColors.surfaceBlue
              : AppColors.white,
          border: Border.all(
            color: isSelected
                ? AppColors.pickabooBlue
                : hasOptionError
                    ? AppColors.red
                    : AppColors.border,
            width: isSelected || hasOptionError ? 1.4.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.pickabooBlue.withValues(alpha: 0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : hasOptionError
                  ? [
                      BoxShadow(
                        color: AppColors.red.withValues(alpha: 0.06),
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
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? AppColors.surfaceBlue : AppColors.white,
                      border: Border.all(
                        color:
                            isSelected ? AppColors.pickabooBlue : AppColors.border,
                        width: 1.w,
                      ),
                    ),
                    child: Icon(
                      Icons.settings_outlined,
                      color:
                          isSelected ? AppColors.pickabooBlue : AppColors.mutedLight,
                      size: 12.sp,
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      right: -2.w,
                      bottom: -2.h,
                      child: Container(
                        padding: EdgeInsets.all(1.5.w),
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white, width: 1.w),
                        ),
                        child: Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 7.sp,
                        ),
                      ),
                    ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                width: 1.2.w,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.pickabooBlue : AppColors.border,
                  borderRadius: BorderRadius.circular(1.w),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${val.price} ৳',
                      style: AppTypography.bodyMedium.bold().copyWith(
                        color: isSelected ? AppColors.pickabooBlue : AppColors.navy,
                        fontSize: 11.5.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      val.title,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.navy,
                        fontSize: 10.5.sp,
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
          backgroundColor: AppColors.transparent,
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
    final matrix = widget.product.variantMatrix;
    final selectedMap = {
      for (final v in _selectedVariants)
        if (v.optionValue.isNotEmpty) v.optionId: v.optionValue,
    };
    final matchedProduct = matrix.isNotEmpty ? matrix.productFor(selectedMap) : null;

    final int baseSpecialPrice = (matchedProduct != null && matchedProduct.productSpecialPrice > 0)
        ? matchedProduct.productSpecialPrice
        : widget.product.spacialPrice;
    final int baseRegularPrice = (matchedProduct != null && matchedProduct.productPrice > 0)
        ? matchedProduct.productPrice
        : widget.product.regularPrice;
    final int basePrice = (widget.product.discount > 0 || baseSpecialPrice > 0)
        ? (baseSpecialPrice > 0 ? baseSpecialPrice : baseRegularPrice)
        : baseRegularPrice;

    final currentPrice = basePrice + _totalAddonPrice;

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
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
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
                color: AppColors.border,
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
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.navy,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close_rounded,
                    color: AppColors.muted,
                    size: 22.sp,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.border, thickness: 1.h, height: 1.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: AppTypography.bodyMedium.bold().copyWith(
                    color: AppColors.navy,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.5.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '৳$formattedPrice',
                  style: AppTypography.bodyLarge.bold().copyWith(
                    color: AppColors.pickabooBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.border, thickness: 1.h, height: 1.h),

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
                        color: AppColors.border,
                        thickness: 1.h,
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 8.h),
                        child: Text(
                          'Options',
                          style: AppTypography.titleMedium.copyWith(
                            color: AppColors.navy,
                            fontWeight: FontWeight.w700,
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
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: option.title,
                                        style: AppTypography.bodyMedium.medium().copyWith(
                                          color: hasOptionError
                                              ? AppColors.red
                                              : AppColors.navy,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      if (option.isRequire)
                                        TextSpan(
                                          text: ' *',
                                          style: AppTypography.bodyLarge.red.bold(),
                                        )
                                      else
                                        TextSpan(
                                          text: ' (Optional)',
                                          style: AppTypography.bodySmall.copyWith(
                                            color: AppColors.muted,
                                            fontSize: 11.5.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      TextSpan(
                                        text: ':',
                                        style: AppTypography.bodyMedium.medium().copyWith(
                                          color: hasOptionError
                                              ? AppColors.red
                                              : AppColors.navy,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (hasOptionError) ...[
                                  SizedBox(width: 6.w),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.redBg,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Text(
                                      'Required',
                                      style: AppTypography.bodySmall.copyWith(
                                        color: AppColors.red,
                                        fontSize: 10.5.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
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
            child: AppButton.primary(
              height: 48.h,
              borderRadius: BorderRadius.circular(10.r),
              text: widget.isBuyNow && !widget.isSelectionOnly
                  ? 'BUY NOW'
                  : 'CONTINUE',
              textStyle: AppTypography.button.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
              onPressed: () {
                if (!_validate(messengerContext: context)) return;
                Navigator.pop(
                  context,
                  ProductOptionsSheetResult(_selectedVariants, _selectedAddons),
                );
              },
            ),
          ),
        ],
      ),
      ),
    );
  }
}
