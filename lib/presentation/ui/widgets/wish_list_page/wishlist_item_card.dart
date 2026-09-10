// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/wishlist/wishlist_entity.dart';

import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class WishlistItemCard extends StatelessWidget {
  final WishlistEntity item;
  final VoidCallback onRemove;

  final VoidCallback onAddToCart;

  final VoidCallback onTap;

  final bool isAddingToCart;

  const WishlistItemCard({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onAddToCart,
    required this.onTap,
    this.isAddingToCart = false,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSpacing.groupToGroupSpacing.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.cardRadius,
          border: Border.all(width: 1.w, color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              blurRadius: 5.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: item.thumbnail.isEmpty
                        ? Icon(
                            Icons.image,
                            size: 40.sp,
                            color: AppColors.muted,
                          )
                        : AppImage(
                            imageUrl: item.thumbnail,
                            fit: BoxFit.contain,
                          ),
                  ),
                  SizedBox(width: 12.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: textStyle.productName.withColor(AppColors.text),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Sold by: ${item.soldBy ?? 'Pickaboo'}",
                          style: textStyle.caption.withColor(AppColors.muted),
                        ),
                        SizedBox(height: 8.h),

                        if (item.inStock) ...[
                          Row(
                            children: [
                              Text(
                                "৳${_formatPrice(item.price)}",
                                style: textStyle.productPrice.withColor(
                                  AppColors.text,
                                ),
                              ),
                              if ((item.regularPrice ?? 0) > item.price) ...[
                                SizedBox(width: 8.w),
                                Text(
                                  "৳${_formatPrice(item.regularPrice ?? 0)}",
                                  style: textStyle.productPriceStrike.withColor(
                                    AppColors.muted,
                                  ),
                                ),
                              ],
                              if ((item.discount ?? 0) > 0) ...[
                                SizedBox(width: 8.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.orange.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  child: Text(
                                    "-${item.discount}%",
                                    style: textStyle.productDiscount.withColor(
                                      AppColors.orange,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ] else ...[
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.red.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              "Out of Stock",
                              style: textStyle.tag.withColor(AppColors.red),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(height: 1.h, color: AppColors.border),
            Row(
              children: [
                Expanded(child: _buildPrimaryAction(textStyle)),
                Container(
                  width: 1.w,
                  height: 24.h,
                  color: AppColors.border,
                ),
                Expanded(
                  child: Material(
                    color: AppColors.black.withValues(alpha: 0.0),
                    child: InkWell(
                      onTap: onRemove,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.r),
                      ),
                      splashColor: AppColors.red.withAlpha(20),
                      highlightColor: AppColors.red.withAlpha(10),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_outline,
                              size: 18.sp,
                              color: AppColors.muted,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'Remove',
                              style: textStyle.buttonLink.withColor(
                                AppColors.black,
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
        ),
      ),
    );
  }

  Widget _buildPrimaryAction(AppTextStyles textStyle) {
    if (item.isConfigurable) {
      return _actionButton(
        textStyle: textStyle,
        icon: Icons.tune_rounded,
        label: 'View Details',
        onTap: onTap,
      );
    }

    final canAdd = item.inStock && !isAddingToCart;

    return _actionButton(
      textStyle: textStyle,
      icon: Icons.shopping_cart_outlined,
      label: 'Add to Cart',
      onTap: canAdd ? onAddToCart : null,
      busy: isAddingToCart,
    );
  }

  Widget _actionButton({
    required AppTextStyles textStyle,
    required IconData icon,
    required String label,
    required VoidCallback? onTap,
    bool busy = false,
  }) {
    final enabled = onTap != null;
    final foreground = enabled ? AppColors.pickabooBlue : AppColors.muted;

    return Material(
      color: AppColors.black.withValues(alpha: 0.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.r)),
        splashColor: AppColors.pickabooBlue.withAlpha(20),
        highlightColor: AppColors.pickabooBlue.withAlpha(10),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (busy)
                const AppLoader.button(size: 18, color: AppColors.pickabooBlue)
              else
                Icon(icon, size: 18.sp, color: foreground),
              SizedBox(width: 6.w),
              Text(
                label,
                style: textStyle.buttonLink.withColor(foreground),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatPrice(double price) {
    return price
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }
}
