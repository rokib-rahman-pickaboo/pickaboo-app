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
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_customize_order_section.dart';
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
  void _publishSelections() {
    widget.onSelectionsChanged?.call(
      List.unmodifiable(_selectedVariants),
      List.unmodifiable(_selectedAddons),
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

    final formattedPrice = basePrice.toString().replaceAllMapped(
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
        borderRadius: AppRadius.top16,
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
              decoration: const BoxDecoration(
                color: AppColors.border,
                borderRadius: AppRadius.k4,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.product.variantGroups.isNotEmpty
                        ? 'Select options'
                        : 'Customize your order',
                    style: AppTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                      if (widget.product.variantGroups.isNotEmpty)
                        Divider(
                          color: AppColors.border,
                          thickness: 1.h,
                          height: 1.h,
                        ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: PdpCustomizeOrderSection(
                          extraOptions: filteredOptions,
                          selectedAddons: _selectedAddons,
                          totalAddonPrice: _totalAddonPrice,
                          mainPrice: basePrice,
                          showHeader: false,
                          showError: _showAddonError,
                          onAddonsChanged: (addons, totalPrice) {
                            final requiredOptions =
                                filteredOptions.where((o) => o.isRequire).toList();
                            final selectedIds = addons
                                .where((e) => e.isCustomOption)
                                .map((e) => e.optionId)
                                .toSet();
                            final allRequiredFulfilled = requiredOptions
                                .every((o) => selectedIds.contains(o.optionId.toString()));

                            setState(() {
                              _selectedAddons = addons;
                              _totalAddonPrice = totalPrice;
                              if (allRequiredFulfilled) {
                                _showAddonError = false;
                              }
                            });
                            _publishSelections();
                          },
                        ),
                      ),
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
              borderRadius: AppRadius.k8,
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
