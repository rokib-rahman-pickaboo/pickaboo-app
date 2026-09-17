// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/core/utils/product_image_resolver.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

/// ─────────────────────────────────────────────────────────────
/// 🛒 REFINED CART ITEM CARD
/// Theme inspired by [AppMenuTile] with soft-tinted action bubbles,
/// structured typography hierarchy, and consistent card tokens.
/// ─────────────────────────────────────────────────────────────
class CartItemCard extends StatelessWidget {
  final CartItemEntity item;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;
  final VoidCallback onSaveForLater;
  final bool showActions;
  final bool isQuantityModifiable;
  final bool showDivider;
  final bool showOuterCard;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
    required this.onSaveForLater,
    this.showActions = true,
    this.isQuantityModifiable = false,
    this.showDivider = false,
    this.showOuterCard = false,
  });

  String _formatPrice(double price) {
    final formatted = price.toStringAsFixed(0);
    return formatted.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    final price = item.customOptions.isNotEmpty
        ? item.price
        : (item.specialPrice > 0 ? item.specialPrice : item.price);
    final originalPrice = item.regularPrice;
    final hasDiscount =
        item.specialPrice > 0 && item.specialPrice < item.regularPrice;

    final itemContent = Padding(
      padding: EdgeInsets.all(10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── 1. LEFT: ROUNDED PRODUCT THUMBNAIL (80x80px) ──
          CartItemThumbnail(item: item, size: 80.w),
          SizedBox(width: 10.w),

          // ── 2. RIGHT: PRODUCT DETAILS (TITLE, SELLER, PRICE+QTY, ACTIONS) ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Full Name
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.titleSmall.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.navy,
                    height: 1.25,
                  ),
                ),

                // Sold By
                if (item.soldBy.isNotEmpty) ...[
                  SizedBox(height: 3.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Sold by ',
                          style: AppTypography.bodySmall,
                        ),
                        TextSpan(
                          text: item.soldBy,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.navy,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],

                // ── Variant Config & Custom Add-on Attributes (Micro-Chips) ──
                if (item.configOptions.isNotEmpty || item.customOptions.isNotEmpty) ...[
                  SizedBox(height: 5.h),
                  Wrap(
                    spacing: 6.w,
                    runSpacing: 4.h,
                    children: [
                      // 1. Configurable Variants (Color, Storage, Size, etc.)
                      ...item.configOptions.map((o) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.pageBg,
                            borderRadius: AppRadius.badgeRadius,
                            border: Border.all(
                              color: AppColors.border,
                              width: 0.8.w,
                            ),
                          ),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${o.title}: ',
                                  style: AppTypography.bodySmall.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.muted,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: o.value,
                                  style: AppTypography.bodyMedium.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.navy,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                      // 2. Custom Options / Add-ons (Gift, Warranty, Accessories, etc.)
                      ...item.customOptions.map((o) {
                        final addonPriceNum = double.tryParse(o.price) ?? 0;
                        final priceTag = addonPriceNum > 0
                            ? ' (+৳${addonPriceNum.toStringAsFixed(0)})'
                            : (o.price.isNotEmpty && o.price != '0'
                                ? ' (+৳${o.price})'
                                : '');

                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceBlue,
                            borderRadius: AppRadius.badgeRadius,
                            border: Border.all(
                              color: AppColors.pickabooBlue.withValues(alpha: 0.25),
                              width: 0.8.w,
                            ),
                          ),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${o.title}: ',
                                  style: AppTypography.bodySmall.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.pickabooBlue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '${o.value}$priceTag',
                                  style: AppTypography.bodyMedium.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.navy,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],

                // Stock status tag
                if (!item.stockAvailable) ...[
                  SizedBox(height: 3.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.red.withValues(alpha: 0.1),
                      borderRadius: AppRadius.badgeRadius,
                    ),
                    child: Text(
                      'Out of Stock',
                      style: AppTypography.bodyTiny.extraBold().red,
                    ),
                  ),
                ],

                SizedBox(height: 6.h),

                // ── PRICE (LEFT) & QUANTITY SELECTOR (RIGHT) ROW ──
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Price on the Left (+ Strikethrough if discounted)
                    Expanded(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 6.w,
                        children: [
                          Text(
                            '৳${_formatPrice(price)}',
                            style: AppTypography.priceStandard.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.navy,
                            ),
                          ),
                          if (hasDiscount)
                            Text(
                              '৳${_formatPrice(originalPrice)}',
                              style: AppTypography.priceStrike.copyWith(
                                fontSize: 10.5.sp,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),

                    // Qty Dropdown Pill on the Right (Dropdown opens just below)
                    if (isQuantityModifiable)
                      PopupMenuButton<int>(
                        initialValue: item.qty,
                        onSelected: onQuantityChanged,
                        position: PopupMenuPosition.under,
                        offset: Offset(0, 4.h),
                        constraints: BoxConstraints(minWidth: 68.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.buttonRadius,
                          side: BorderSide(
                            color: AppColors.border,
                            width: 1.w,
                          ),
                        ),
                        color: AppColors.white,
                        elevation: 3,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context) => List.generate(10, (i) {
                          final qty = i + 1;
                          final isSelected = item.qty == qty;
                          return PopupMenuItem<int>(
                            value: qty,
                            height: 32.h,
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Center(
                              child: Text(
                                '$qty',
                                style: isSelected
                                    ? AppTypography.titleSmall.copyWith(
                                        color: AppColors.pickabooBlue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp,
                                      )
                                    : AppTypography.bodyMedium.copyWith(
                                        color: AppColors.navy,
                                        fontSize: 12.sp,
                                      ),
                              ),
                            ),
                          );
                        }),
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: 54.w,
                            minHeight: 28.h,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 4.h,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.pageBg,
                            borderRadius: AppRadius.smRadius,
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Qty: ${item.qty}',
                                style: AppTypography.titleSmall.copyWith(
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                size: 16.sp,
                                color: AppColors.navy,
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      Container(
                        constraints: BoxConstraints(
                          minWidth: 54.w,
                          minHeight: 28.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 4.h,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.pageBg,
                          borderRadius: AppRadius.smRadius,
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Text(
                          'Qty: ${item.qty}',
                          style: AppTypography.titleSmall.copyWith(
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),

                // ── BOTTOM ROW: FULL WIDTH INLINE ACTION BUTTONS (Save for later & Remove) ──
                if (showActions) ...[
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Save for later
                      InkWell(
                        onTap: onSaveForLater,
                        borderRadius: AppRadius.badgeRadius,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.bookmark_border_rounded,
                                size: 16.sp,
                                color: AppColors.navy,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'Save for later',
                                style: AppTypography.bodyMedium.copyWith(
                                  fontSize: 11.5.sp,
                                  color: AppColors.navy,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Remove
                      InkWell(
                        onTap: onRemove,
                        borderRadius: AppRadius.badgeRadius,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.delete_outline_rounded,
                                size: 16.sp,
                                color: AppColors.red,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'Remove',
                                style: AppTypography.bodyMedium.copyWith(
                                  fontSize: 11.5.sp,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );

    if (showOuterCard) {
      return Container(
        margin: EdgeInsets.only(bottom: AppSpacing.sameGroupItemSpacing.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.cardRadius,
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: AppColors.navy.withValues(alpha: 0.03),
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            itemContent,
            if (showDivider)
              Divider(
                height: 1.h,
                thickness: 1.h,
                indent: 95.w,
                color: AppColors.border,
              ),
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        itemContent,
        if (showDivider)
          Divider(
            height: 1.h,
            thickness: 1.h,
            indent: 95.w,
            color: AppColors.border,
          ),
      ],
    );
  }
}

/// ─────────────────────────────────────────────────────────────
/// 🖼️ CART ITEM THUMBNAIL
/// Robustly renders cart item thumbnails with auto-resolution from
/// [ProductImageResolver] when backend returns empty or broken placeholder URLs.
/// ─────────────────────────────────────────────────────────────
class CartItemThumbnail extends StatefulWidget {
  final CartItemEntity item;
  final double size;

  const CartItemThumbnail({
    super.key,
    required this.item,
    required this.size,
  });

  @override
  State<CartItemThumbnail> createState() => _CartItemThumbnailState();
}

class _CartItemThumbnailState extends State<CartItemThumbnail> {
  String? _resolvedImageUrl;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkAndResolve();
  }

  @override
  void didUpdateWidget(covariant CartItemThumbnail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item.itemId != widget.item.itemId ||
        oldWidget.item.productId != widget.item.productId ||
        oldWidget.item.imageUrl != widget.item.imageUrl) {
      _checkAndResolve();
    }
  }

  void _checkAndResolve() {
    final rawUrl = widget.item.imageUrl;

    // 1. If item.imageUrl is a valid real image URL (not placeholder / broken)
    if (!ProductImageResolver.isPlaceholderOrBroken(rawUrl)) {
      _resolvedImageUrl = rawUrl;
      ProductImageResolver.cacheImage(widget.item.productId, rawUrl);
      return;
    }

    // 2. Check if already cached in ProductImageResolver
    final cached = ProductImageResolver.getCachedImage(widget.item.productId);
    if (cached != null && !ProductImageResolver.isPlaceholderOrBroken(cached)) {
      _resolvedImageUrl = cached;
      return;
    }

    // 3. Resolve asynchronously if productId is valid
    if (widget.item.productId > 0) {
      _isLoading = true;
      ProductImageResolver.resolveImage(
        productId: widget.item.productId,
        currentUrl: rawUrl,
      ).then((resolved) {
        if (mounted) {
          setState(() {
            _resolvedImageUrl = resolved;
            _isLoading = false;
          });
        }
      }).catchError((_) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.buttonRadius,
      child: Container(
        width: widget.size,
        height: widget.size,
        color: AppColors.pageBg,
        child: _buildImageContent(),
      ),
    );
  }

  Widget _buildImageContent() {
    if (_resolvedImageUrl != null &&
        !ProductImageResolver.isPlaceholderOrBroken(_resolvedImageUrl)) {
      return AppImage(
        imageUrl: _resolvedImageUrl!,
        fit: BoxFit.contain,
      );
    }

    if (_isLoading) {
      return const Center(
        child: SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.primary,
          ),
        ),
      );
    }

    return const Center(
      child: Icon(
        Icons.image_outlined,
        color: AppColors.mutedLight,
      ),
    );
  }
}