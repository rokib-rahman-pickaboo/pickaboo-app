import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/constants/app_constants.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';

class CartItemCard extends StatelessWidget {
  final CartItemEntity item;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;
  final VoidCallback onSaveForLater;
  final bool showActions;
  final bool isQuantityModifiable;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
    required this.onSaveForLater,
    this.showActions = true,
    this.isQuantityModifiable = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1.w, color: context.colors.borderColor),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: context.textStyle.cartItemName.withColor(
                          colors.text,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5.h),

                      if (item.configOptions.isNotEmpty)
                        ...item.configOptions.map(
                          (option) => Padding(
                            padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                            child: RichText(
                              text: TextSpan(
                                style: context.textStyle.productBrand,
                                children: [
                                  TextSpan(
                                    text: '${option.title}: ',
                                    style: context.textStyle.productBrand
                                        .withColor(colors.black)
                                  ),
                                  TextSpan(
                                    text: option.value,
                                    style: context.textStyle.productBrand
                                        .withColor(colors.primary)
                                        .copyWith(fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      if (item.customOptions.isNotEmpty)
                        ...item.customOptions.map(
                          (option) => Padding(
                            padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                            child: RichText(
                              text: TextSpan(
                                style: context.textStyle.productBrand,
                                children: [
                                  TextSpan(
                                    text: '${option.title}: ',
                                    style: context.textStyle.productBrand
                                        .withColor(colors.black)
                                  ),
                                  TextSpan(
                                    text: option.value,
                                    style: context.textStyle.productBrand
                                        .withColor(colors.primary)
                                        .copyWith(fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      if (item.soldBy.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                          child: RichText(
                            text: TextSpan(
                              style: context.textStyle.productBrand.copyWith(
                                color: colors.gray,
                              ),
                              children: [
                                const TextSpan(text: 'Sold by: '),
                                TextSpan(
                                  text: item.soldBy,
                                  style: context.textStyle.productBrand
                                      .withColor(colors.primary)
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),

                      if (!item.stockAvailable)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          margin: EdgeInsets.only(top: 4.h),
                          color: colors.whiteSmoke,
                          child: Text(
                            'Out of Stock',
                            style: context.textStyle.badgeSmall.withColor(
                              colors.red,
                            ),
                          ),
                        ),

                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            '৳${item.customOptions.isNotEmpty ? item.price.toStringAsFixed(0) : (item.specialPrice > 0 ? item.specialPrice.toStringAsFixed(0) : item.price.toStringAsFixed(0))}',
                            style: context.textStyle.cartItemPrice.withColor(
                              colors.primary,
                            ),
                          ),
                          if (item.specialPrice > 0 &&
                              item.specialPrice != item.regularPrice)
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                '৳${item.regularPrice.toStringAsFixed(0)}',
                                style: context.textStyle.priceStrikethrough
                                    .withColor(colors.gray),
                              ),
                            ),
                          if (item.discount.isNotEmpty &&
                              double.tryParse(item.discount) != null &&
                              double.parse(item.discount) > 0)
                            Container(
                              margin: EdgeInsets.only(left: 8.w),
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                color: colors.grayLight,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                '-${item.discount}%',
                                style: context.textStyle.productDiscount
                                    .withColor(colors.orange),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        height: 90.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.borderColor),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: item.imageUrl.isNotEmpty
                            ? Image.network(
                                item.imageUrl,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(
                                      Icons.broken_image,
                                      color: colors.gray,
                                    ),
                              )
                            : Icon(Icons.image, color: colors.gray),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 90.w,
                        height: 32.h,
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.borderColor),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        alignment: Alignment.center,
                        child: isQuantityModifiable
                            ? DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  value: item.qty,
                                  isDense: true,
                                  isExpanded: true,
                                  alignment: Alignment.center,
                                  icon: Icon(Icons.keyboard_arrow_down, size: 16.sp),
                                  style: context.textStyle.bodySmall.copyWith(
                                    color: colors.text,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  onChanged: (newValue) {
                                    if (newValue != null) {
                                      onQuantityChanged(newValue);
                                    }
                                  },
                                  items: (<int>{
                                    for (var i = AppConstants.minCartQuantity;
                                        i <= AppConstants.maxCartQuantity;
                                        i++)
                                      i,
                                    item.qty,
                                  }.toList()..sort()).map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      alignment: Alignment.center,
                                      child: Text('Qty: $value'),
                                    );
                                  }).toList(),
                                ),
                              )
                            : Text(
                                'Qty: ${item.qty}',
                                style: context.textStyle.bodySmall.copyWith(
                                  color: colors.text,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (showActions) ...[
            Divider(height: 1.h, color: colors.borderColor),
            Row(
              children: [
                Expanded(
                  child: Material(
                    color: colors.black.withValues(alpha: 0.0),
                    child: InkWell(
                      onTap: onSaveForLater,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.r),
                      ),
                      splashColor: colors.primary.withAlpha(20),
                      highlightColor: colors.primary.withAlpha(10),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.bookmark_border,
                              size: 18.sp,
                              color: colors.gray,
                            ),
                            SizedBox(width: 6.w),
                            Flexible(
                              child: Text(
                                'Save for later',
                                style: context.textStyle.buttonLink.withColor(
                                  colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width: 1.w, height: 40.h, color: colors.borderColor),
                Expanded(
                  child: Material(
                    color: colors.black.withValues(alpha: 0.0),
                    child: InkWell(
                      onTap: onRemove,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16.r),
                      ),
                      splashColor: colors.red.withAlpha(20),
                      highlightColor: colors.red.withAlpha(10),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_outline,
                              size: 18.sp,
                              color: colors.gray,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'Remove',
                              style: context.textStyle.buttonLink.withColor(
                                colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
