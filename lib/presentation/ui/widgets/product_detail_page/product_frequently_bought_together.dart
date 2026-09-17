// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/star_rating_bar.dart';

class ProductFrequentlyBoughtTogether extends StatefulWidget {
  final ProductDetailEntity mainProduct;
  final List<BuyTogetherEntity> items;
  final Function(List<BuyTogetherEntity>)? onAddToCart;
  final Function(List<BuyTogetherEntity>)? onAddBundleToCart;

  const ProductFrequentlyBoughtTogether({
    super.key,
    required this.mainProduct,
    required this.items,
    this.onAddToCart,
    this.onAddBundleToCart,
  });

  @override
  State<ProductFrequentlyBoughtTogether> createState() =>
      _ProductFrequentlyBoughtTogetherState();
}

class _ProductFrequentlyBoughtTogetherState
    extends State<ProductFrequentlyBoughtTogether> {
  late List<bool> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List<bool>.filled(widget.items.length, false);
  }

  @override
  void didUpdateWidget(covariant ProductFrequentlyBoughtTogether oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items.length != _selectedItems.length) {
      _selectedItems = List<bool>.filled(widget.items.length, false);
    }
  }

  bool _isSelectable(int index) => widget.items[index].stockAvailable;

  void _toggle(int index) {
    if (!_isSelectable(index)) return;
    setState(() => _selectedItems[index] = !_selectedItems[index]);
  }

  int get _totalPrice {
    int total = 0;
    for (int i = 0; i < widget.items.length; i++) {
      if (_selectedItems[i]) {
        total += widget.items[i].specialPrice > 0
            ? widget.items[i].specialPrice
            : widget.items[i].price;
      }
    }
    return total;
  }

  int get _originalPrice {
    int total = 0;
    for (int i = 0; i < widget.items.length; i++) {
      if (_selectedItems[i]) {
        total += widget.items[i].price;
      }
    }
    return total;
  }

  int get _mainProductPrice {
    return widget.mainProduct.spacialPrice > 0
        ? widget.mainProduct.spacialPrice
        : widget.mainProduct.regularPrice;
  }

  int get _mainProductOriginalPrice {
    return widget.mainProduct.regularPrice;
  }

  int get _bundlePrice => _mainProductPrice + _totalPrice;
  int get _bundleOriginalPrice => _mainProductOriginalPrice + _originalPrice;
  int get _bundleSavings => _bundleOriginalPrice > _bundlePrice
      ? _bundleOriginalPrice - _bundlePrice
      : 0;

  int get _selectedCount => _selectedItems.where((item) => item).length;

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox.shrink();
    final hasSelected = _selectedCount > 0;
    return AppCard(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(AppRadius.card),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header Inside Card with Surface Blue Background ──
          _buildHeader(),

          // ── Item Cards List ──
          for (int i = 0; i < widget.items.length; i++) ...[
            _buildDetailCard(i),
            if (i < widget.items.length - 1)
              Divider(
                height: 1.h,
                thickness: 1.h,
                indent: 14.w,
                endIndent: 14.w,
                color: AppColors.border.withValues(alpha: 0.5),
              ),
          ],
          // ── Dual Row Bottom Action Bar (Only visible after selecting an item) ──
          if (hasSelected) ...[
            Divider(
              height: 1.h,
              thickness: 1.h,
              color: AppColors.border.withValues(alpha: 0.6),
            ),
            _buildBottomBar(),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceBlue,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppRadius.card),
        ),
        border: Border(
          bottom: BorderSide(
            color: AppColors.border.withValues(alpha: 0.8),
            width: 1.w,
          ),
        ),
      ),
      child: Text(
        'Frequently Added Items',
        style: AppTypography.titleSmall.bold().withColor(AppColors.navy),
      ),
    );
  }

  Widget _buildDetailCard(int index) {
    final item = widget.items[index];
    final isSelected = _selectedItems[index];
    final isSelectable = _isSelectable(index);
    final displayPrice = item.specialPrice > 0 ? item.specialPrice : item.price;
    final hasDiscount = item.specialPrice > 0 && item.specialPrice < item.price;

    return Opacity(
      opacity: isSelectable ? 1.0 : 0.55,
      child: Material(
        color: isSelected
            ? AppColors.surfaceBlue.withValues(alpha: 0.35)
            : AppColors.white,
        child: InkWell(
          onTap: isSelectable ? () => _toggle(index) : null,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 22.w,
                  height: 22.w,
                  child: IgnorePointer(
                    child: Checkbox(
                      value: isSelected,
                      activeColor: AppColors.pickabooBlue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppRadius.badgeRadius,
                      ),
                      side: BorderSide(
                        color: isSelectable ? AppColors.muted : AppColors.border,
                        width: 1.5.w,
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      onChanged: isSelectable ? (_) {} : null,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),

                Container(
                  width: 58.w,
                  height: 58.w,
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.smRadius,
                    color: AppColors.pageBg,
                    border: Border.all(
                      color: AppColors.border.withValues(alpha: 0.5),
                      width: 0.8.w,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: AppRadius.smRadius,
                    child: AppImage(
                      imageUrl: item.image,
                      width: 58.w,
                      height: 58.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            '৳ ${_formatPrice(displayPrice)}',
                            style: AppTypography.priceStandard.blue,
                          ),
                          if (hasDiscount) ...[
                            SizedBox(width: 6.w),
                            Text(
                              '৳ ${_formatPrice(item.price)}',
                              style: AppTypography.priceStrike,
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 3.h),

                      Text(
                        item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.text,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),

                      if (!item.stockAvailable) ...[
                        SizedBox(height: 4.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: AppColors.orange.withValues(alpha: 0.1),
                            borderRadius: AppRadius.badgeRadius,
                          ),
                          child: Text(
                            'Out of stock',
                            style: AppTypography.bodyTiny.bold().withColor(AppColors.orange),
                          ),
                        ),
                      ] else if (item.rating > 0) ...[
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            StarRatingBar(rating: item.rating, starSize: 12),
                            SizedBox(width: 4.w),
                            Text(
                              '${item.rating}',
                              style: AppTypography.bodySmall.bold().withColor(
                                AppColors.pickabooBlue,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              '(${item.ratingCount})',
                              style: AppTypography.bodyTiny,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBundleItemLine(String name, num price) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 4.w,
            decoration: const BoxDecoration(
              color: AppColors.muted,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.bodyTiny.copyWith(
                color: AppColors.text,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            '(৳ ${_formatPrice(price.toInt())})',
            style: AppTypography.bodyTiny.bold().withColor(AppColors.navy),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    final hasSelected = _selectedCount > 0;
    if (!hasSelected) return const SizedBox.shrink();

    final canAddBundle = widget.mainProduct.stockAvailable;

    final bundleButtonText = !widget.mainProduct.stockAvailable
        ? 'Main Out of Stock'
        : 'Add Selected ($_selectedCount) with Main to Cart';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppRadius.card),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── SECTION 1: Selected Accessories Only ──
          // Top Row: Info on Left, Price on Right
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$_selectedCount ${_selectedCount == 1 ? 'item' : 'items'} selected',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.muted,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Text(
                    '৳ ${_formatPrice(_totalPrice)}',
                    style: AppTypography.priceStandard.copyWith(
                      color: AppColors.pickabooBlue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (_originalPrice > _totalPrice) ...[
                    SizedBox(width: 4.w),
                    Text(
                      '৳ ${_formatPrice(_originalPrice)}',
                      style: AppTypography.priceStrike,
                    ),
                  ],
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // Below Row: Full-width Button
          AppButton.outline(
            height: 40.h,
            isFullWidth: true,
            borderRadius: AppRadius.buttonRadius,
            borderColor: AppColors.pickabooBlue,
            textColor: AppColors.pickabooBlue,
            isDisabled: false,
            textStyle: AppTypography.bodySmall.bold().withColor(
              AppColors.pickabooBlue,
            ),
            text: 'Add Selected ($_selectedCount) to Cart',
            onPressed: () {
              final selected = <BuyTogetherEntity>[];
              for (int i = 0; i < widget.items.length; i++) {
                if (_selectedItems[i]) {
                  selected.add(widget.items[i]);
                }
              }
              widget.onAddToCart?.call(selected);
            },
          ),

          // ── Divider between Section 1 and Section 2 ──
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(
              height: 1.h,
              thickness: 1.h,
              color: AppColors.border.withValues(alpha: 0.6),
            ),
          ),

          // ── SECTION 2: Bundle Breakdown & Add with Main Product ──
          // Top Row: Bundle Total & Savings
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Bundle Total: ',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.muted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '৳ ${_formatPrice(_bundlePrice)}',
                    style: AppTypography.priceStandard.copyWith(
                      color: AppColors.navy,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (_bundleOriginalPrice > _bundlePrice) ...[
                    SizedBox(width: 4.w),
                    Text(
                      '৳ ${_formatPrice(_bundleOriginalPrice)}',
                      style: AppTypography.priceStrike,
                    ),
                  ],
                ],
              ),
              if (_bundleSavings > 0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.green.withValues(alpha: 0.1),
                    borderRadius: AppRadius.badgeRadius,
                  ),
                  child: Text(
                    'Save ৳ ${_formatPrice(_bundleSavings)}',
                    style: AppTypography.bodyTiny.bold().withColor(
                      AppColors.green,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 6.h),

          // Bundle items vertical breakdown: prod name (price)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBundleItemLine(
                widget.mainProduct.name,
                _mainProductPrice,
              ),
              for (int i = 0; i < widget.items.length; i++)
                if (_selectedItems[i])
                  _buildBundleItemLine(
                    widget.items[i].name,
                    widget.items[i].specialPrice > 0
                        ? widget.items[i].specialPrice
                        : widget.items[i].price,
                  ),
            ],
          ),
          SizedBox(height: 8.h),

          // Below Row: Full-width Button
          AppButton.primary(
            height: 40.h,
            isFullWidth: true,
            borderRadius: AppRadius.buttonRadius,
            isDisabled: !canAddBundle,
            textStyle: AppTypography.bodySmall.bold().withColor(
              canAddBundle ? AppColors.white : AppColors.muted,
            ),
            text: bundleButtonText,
            onPressed: canAddBundle
                ? () {
                    final selected = <BuyTogetherEntity>[];
                    for (int i = 0; i < widget.items.length; i++) {
                      if (_selectedItems[i]) {
                        selected.add(widget.items[i]);
                      }
                    }
                    widget.onAddBundleToCart?.call(selected);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
