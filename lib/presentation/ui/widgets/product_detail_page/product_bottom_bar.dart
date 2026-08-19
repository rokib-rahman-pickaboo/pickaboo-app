import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/product_options_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/protection_plan_sheet.dart';

class ProductBottomBar extends StatefulWidget {
  final ProductDetailEntity product;
  final int quantity;
  final List<ConfigurableItemOptionEntity> selectedVariantsStatus;
  final List<ConfigurableItemOptionEntity> selectedAddonOptions;
  final int totalAddonPrice;
  final bool Function()? onValidate;

  final void Function(
    List<ConfigurableItemOptionEntity> variants,
    List<ConfigurableItemOptionEntity> addons,
  )? onSheetSelectionsChanged;

  const ProductBottomBar({
    super.key,
    required this.product,
    required this.quantity,
    required this.selectedVariantsStatus,
    required this.selectedAddonOptions,
    required this.totalAddonPrice,
    this.onValidate,
    this.onSheetSelectionsChanged,
  });

  @override
  State<ProductBottomBar> createState() => ProductBottomBarState();
}

class ProductBottomBarState extends State<ProductBottomBar> {
  bool _isBuyNowRequested = false;

  void _performAddToCart(bool isBuyNow, List<ConfigurableItemOptionEntity> finalVariants, List<ConfigurableItemOptionEntity> finalAddonOptions) {
    if (isBuyNow) {
      setState(() => _isBuyNowRequested = true);
    }

    final isConfigurable =
        widget.product.typeId == 'configurable' ||
        widget.selectedVariantsStatus.isNotEmpty ||
        widget.product.variantGroups.isNotEmpty;

    final allOptions = [
      ...finalVariants,
      ...finalAddonOptions,
    ];

    context.read<CartBloc>().add(
      CartEvent.addItemSmart(
        sku: widget.product.sku.isNotEmpty ? widget.product.sku : 'demo-sku',
        qty: widget.quantity,
        productType: isConfigurable
            ? 'configurable'
            : (widget.product.typeId.isNotEmpty
                  ? widget.product.typeId
                  : 'simple'),
        configurableOptions: allOptions.isNotEmpty ? allOptions : null,
      ),
    );
  }

  Future<void> _proceedWithInsuranceCheck(bool isBuyNow, List<ConfigurableItemOptionEntity> currentVariants, List<ConfigurableItemOptionEntity> currentAddons) async {
    final insuranceOptions = widget.product.extraOptions
        .where((o) => o.title.toLowerCase().contains('insurance'))
        .toList();

    if (insuranceOptions.isNotEmpty) {
      final shouldProceed = await showModalBottomSheet<bool>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: Colors.transparent,
        builder: (context) => ProtectionPlanSheet(
          insuranceOptions: insuranceOptions,
          onPlanSelected: (selections) {
            final newSelectedAddons = [...currentAddons];
            for (var s in selections) {
              newSelectedAddons.add(ConfigurableItemOptionEntity(
                optionId: s.optionId.toString(),
                optionValue: s.optionTypeId.toString(),
                isCustomOption: true,
              ));
            }
            _performAddToCart(isBuyNow, currentVariants, newSelectedAddons);
          },
          onNoThanks: () {
            _performAddToCart(isBuyNow, currentVariants, currentAddons);
          },
        ),
      );

      if (shouldProceed != true) {
        return;
      }
      return;
    }

    _performAddToCart(isBuyNow, currentVariants, currentAddons);
  }

  Future<void> openOptionsSheet({
    bool isBuyNow = false,
    bool isSelectionOnly = false,
  }) async {
    final result = await ProductOptionsSheet.show(
      context,
      product: widget.product,
      quantity: widget.quantity,
      initialVariants: widget.selectedVariantsStatus,
      initialAddons: widget.selectedAddonOptions,
      initialAddonPrice: widget.totalAddonPrice,
      isBuyNow: isBuyNow,
      isSelectionOnly: isSelectionOnly,
      onSelectionsChanged: (variants, addons) =>
          widget.onSheetSelectionsChanged?.call(variants, addons),
    );

    if (result == null) return;
    widget.onSheetSelectionsChanged?.call(result.variants, result.addons);
    if (isSelectionOnly) return;
    await _proceedWithInsuranceCheck(isBuyNow, result.variants, result.addons);
  }

  void _handleAddToCart({bool isBuyNow = false}) async {
    final isConfigurable =
        widget.product.typeId == 'configurable' ||
        widget.selectedVariantsStatus.isNotEmpty ||
        widget.product.variantGroups.isNotEmpty;

    if (isConfigurable) {
      final isValid = widget.onValidate == null || widget.onValidate!();
      if (!isValid || widget.selectedVariantsStatus.isEmpty) {
        await openOptionsSheet(isBuyNow: isBuyNow);
        return;
      }
    }

    _proceedWithInsuranceCheck(isBuyNow, widget.selectedVariantsStatus, widget.selectedAddonOptions);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        state.maybeWhen(
          itemAdded: (cart, message) {
            if (_isBuyNowRequested) {
              setState(() => _isBuyNowRequested = false);
              context.push(Routes.cart);
            } else {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
                  backgroundColor: colors.primary,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(message)),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          context.push(Routes.cart);
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                          child: Text(
                            'VIEW CART',
                            style: TextStyle(color: colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          error: (error, lastCart) {
            if (_isBuyNowRequested) {
              setState(() => _isBuyNowRequested = false);
            }
          },
          orElse: () {},
        );
      },
      child: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: colors.white,
            boxShadow: [
              BoxShadow(
                color: colors.black.withAlpha(15),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    operationInProgress: (_, __) => true,
                    loading: () => true,
                    orElse: () => false,
                  );

                  if (!widget.product.stockAvailable) {
                    return Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.grayLight,
                              disabledBackgroundColor: colors.grayLight,
                              disabledForegroundColor: colors.textMedium,
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Out of Stock',
                              style: textStyle.buttonMedium.copyWith(color: colors.textMedium),
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: isLoading ? null : () => _handleAddToCart(isBuyNow: false),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: colors.primary,
                            disabledForegroundColor: colors.primary.withValues(alpha: 0.5),
                            side: BorderSide(
                                color: isLoading ? colors.primary.withValues(alpha: 0.5) : colors.primary,
                                width: 1.5),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: textStyle.buttonMedium.copyWith(
                              color: isLoading ? colors.primary.withValues(alpha: 0.5) : colors.primary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: isLoading ? null : () => _handleAddToCart(isBuyNow: true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.primary,
                            foregroundColor: colors.white,
                            disabledBackgroundColor: colors.primary.withValues(alpha: 0.5),
                            disabledForegroundColor: colors.white.withValues(alpha: 0.8),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Buy Now',
                            style: textStyle.buttonMedium.copyWith(
                              color: isLoading ? colors.white.withValues(alpha: 0.8) : colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
        ),
      ),
    );
  }
}
