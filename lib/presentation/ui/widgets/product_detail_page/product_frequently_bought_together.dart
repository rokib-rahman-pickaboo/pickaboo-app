// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/star_rating_bar.dart';

class ProductFrequentlyBoughtTogether extends StatefulWidget {
  final List<BuyTogetherEntity> items;
  final Function(List<BuyTogetherEntity>)? onAddToCart;

  const ProductFrequentlyBoughtTogether({
    super.key,
    required this.items,
    this.onAddToCart,
  });

  @override
  State<ProductFrequentlyBoughtTogether> createState() =>
      _ProductFrequentlyBoughtTogetherState();
}

class _ProductFrequentlyBoughtTogetherState
    extends State<ProductFrequentlyBoughtTogether> {
  late List<bool> _selectedItems;
  bool _isExpanded = false;

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
    final textStyle = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Frequently Bought Together',
            style: textStyle.bodyMediumBold.copyWith(
              color: AppColors.text,
            ),
          ),
        ),
        SizedBox(height: 16.h),

        _buildProductImagesRow(),
        SizedBox(height: 8.h),

        Center(
          child: TextButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.pickabooBlue,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _isExpanded ? 'Hide Details' : 'Show Details',
                  style: textStyle.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.pickabooBlue,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 18.sp,
                  color: AppColors.pickabooBlue,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.h),

        if (_isExpanded) _buildDetailCards(textStyle),

        _buildBottomBar(textStyle),
      ],
    );
  }

  Widget _buildProductImagesRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          for (int i = 0; i < widget.items.length; i++) ...[
            GestureDetector(
              onTap: () => _toggle(i),
              child: Opacity(
                opacity: _isSelectable(i) ? 1 : 0.4,
                child: Container(
                  width: 72.w,
                  height: 72.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _selectedItems[i]
                          ? AppColors.pickabooBlue
                          : AppColors.border,
                      width: _selectedItems[i] ? 2.w : 1.w,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.r),
                    child: Stack(
                      children: [
                        AppImage(
                          imageUrl: widget.items[i].image,
                          width: 80.w,
                          height: 80.w,
                          fit: BoxFit.cover,
                        ),
                        if (_selectedItems[i])
                          Positioned(
                            bottom: 4.h,
                            left: 4.w,
                            child: Container(
                              padding: EdgeInsets.all(2.w),
                              decoration: const BoxDecoration(
                                color: AppColors.pickabooBlue,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: AppColors.white,
                                size: 12.sp,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            if (i < widget.items.length - 1)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Icon(Icons.add, color: AppColors.muted, size: 20.sp),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailCards(AppTextStyles textStyle) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          for (int i = 0; i < widget.items.length; i++)
            _buildDetailCard(i, textStyle),
        ],
      ),
    );
  }

  Widget _buildDetailCard(
    int index,
    AppTextStyles textStyle,
  ) {
    final item = widget.items[index];
    final isSelected = _selectedItems[index];
    final displayPrice = item.specialPrice > 0 ? item.specialPrice : item.price;
    final hasDiscount = item.specialPrice > 0 && item.specialPrice < item.price;

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.border.withValues(alpha: 0.4),
          width: 1.w,
        ),
      ),
      child: InkWell(
        onTap: () => _toggle(index),
        borderRadius: BorderRadius.circular(8.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.r),
                    ),
                    side: BorderSide(color: AppColors.muted, width: 1.5.w),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    onChanged: _isSelectable(index) ? (_) {} : null,
                  ),
                ),
              ),
              SizedBox(width: 8.w),

              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.pageBg,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.r),
                  child: AppImage(
                    imageUrl: item.image,
                    width: 60.w,
                    height: 60.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          '৳ ${_formatPrice(displayPrice)}',
                          style: textStyle.bodyMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.pickabooBlue,
                          ),
                        ),
                        if (hasDiscount) ...[
                          SizedBox(width: 6.w),
                          Text(
                            '৳ ${_formatPrice(item.price)}',
                            style: textStyle.bodySmall.copyWith(
                              color: AppColors.muted,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColors.muted,
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: 4.h),

                    Text(
                      item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle.bodySmall.copyWith(
                        color: AppColors.text,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),

                    if (!item.stockAvailable) ...[
                      SizedBox(height: 4.h),
                      Text(
                        'Out of stock',
                        style: textStyle.caption.withColor(AppColors.orange),
                      ),
                    ],

                    ...[
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          StarRatingBar(rating: item.rating, starSize: 12),
                          SizedBox(width: 4.w),
                          Text(
                            '${item.rating}',
                            style: textStyle.bodySmallBold.withColor(
                              AppColors.pickabooBlue,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            '(${item.ratingCount})',
                            style: textStyle.caption.withColor(AppColors.muted),
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
    );
  }

  Widget _buildBottomBar(AppTextStyles textStyle) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.border.withValues(alpha: 0.3),
            width: 1.w,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      '৳ ${_formatPrice(_totalPrice)}',
                      style: textStyle.bodyLargeBold.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.text,
                      ),
                    ),
                    if (_originalPrice > _totalPrice) ...[
                      SizedBox(width: 8.w),
                      Text(
                        '৳ ${_formatPrice(_originalPrice)}',
                        style: textStyle.bodySmall.copyWith(
                          color: AppColors.muted,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.muted,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: _selectedCount > 0
                ? () {
                    if (widget.onAddToCart != null) {
                      final selectedEntities = <BuyTogetherEntity>[];
                      for (int i = 0; i < widget.items.length; i++) {
                        if (_selectedItems[i]) {
                          selectedEntities.add(widget.items[i]);
                        }
                      }
                      widget.onAddToCart!(selectedEntities);
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.pickabooBlue,
              foregroundColor: AppColors.white,
              disabledBackgroundColor: AppColors.muted.withValues(alpha: 0.3),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              elevation: 0,
            ),
            child: Text(
              _selectedCount == 0
                  ? 'Add to cart'
                  : _selectedCount == 1
                  ? 'Add 1 item to cart'
                  : 'Add $_selectedCount items to cart',
              style: textStyle.bodyMedium.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
