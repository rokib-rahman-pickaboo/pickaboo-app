import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// 13. STICKY BOTTOM ACTION BAR (Chat, Add to Cart, Buy Now)
class PdpBottomActionBar extends StatelessWidget {
  final ProductDetailEntity product;
  final int currentPrice;
  final int originalPrice;
  final int quantity;
  final bool isProcessing;
  final VoidCallback onChatTap;
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;
  final ValueChanged<int>? onQuantityChanged;

  const PdpBottomActionBar({
    super.key,
    required this.product,
    required this.currentPrice,
    required this.originalPrice,
    this.quantity = 1,
    this.isProcessing = false,
    required this.onChatTap,
    required this.onAddToCart,
    required this.onBuyNow,
    this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAvailable = product.stockAvailable;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            offset: const Offset(0, -3),
            blurRadius: 8,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: 8.h,
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // ── Chat / Support Button ──
            Container(
              decoration: BoxDecoration(
                color: AppColors.pageBg,
                borderRadius: AppRadius.buttonRadius,
                border: Border.all(color: AppColors.border),
              ),
              child: IconButton(
                icon: Icon(Icons.chat_bubble_outline_rounded, color: AppColors.navy, size: 20.sp),
                onPressed: onChatTap,
              ),
            ),
            SizedBox(width: 8.w),

            // ── Outlined ADD TO CART Button ──
            Expanded(
              child: AppButton.secondary(
                height: 44.h,
                borderRadius: AppRadius.buttonRadius,
                isDisabled: !isAvailable || isProcessing,
                isLoading: isProcessing,
                onPressed: isAvailable && !isProcessing ? onAddToCart : null,
                text: AppStrings.pdpAddToCart.toUpperCase(),
                textStyle: AppTypography.button.copyWith(
                  fontSize: 12.sp,
                  color: isAvailable ? AppColors.pickabooBlue : AppColors.muted,
                ),
              ),
            ),
            SizedBox(width: 8.w),

            // ── Primary Elevated BUY NOW Button ──
            Expanded(
              child: AppButton.primary(
                height: 44.h,
                borderRadius: AppRadius.buttonRadius,
                backgroundColor: isAvailable ? AppColors.pickabooBlue : AppColors.muted,
                isDisabled: !isAvailable || isProcessing,
                onPressed: isAvailable && !isProcessing ? onBuyNow : null,
                text: isAvailable ? AppStrings.pdpBuyNow.toUpperCase() : AppStrings.pdpStockOut.toUpperCase(),
                textStyle: AppTypography.button.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
