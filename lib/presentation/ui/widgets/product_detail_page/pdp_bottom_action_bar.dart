import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';

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
            color: Colors.black.withValues(alpha: 0.06),
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
                borderRadius: BorderRadius.circular(8.r),
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
              child: SizedBox(
                height: 44.h,
                child: OutlinedButton(
                  onPressed: isAvailable && !isProcessing ? onAddToCart : null,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    side: BorderSide(
                      color: isAvailable ? AppColors.pickabooBlue : AppColors.border,
                      width: 1.5.w,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                  ),
                  child: isProcessing
                      ? const AppLoader.button(color: AppColors.pickabooBlue)
                      : Text(
                          'ADD TO CART',
                          style: AppTypography.buttonPrimary.copyWith(
                            fontSize: 12.sp,
                            color: isAvailable ? AppColors.pickabooBlue : AppColors.muted,
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(width: 8.w),

            // ── Primary Elevated BUY NOW Button ──
            Expanded(
              child: SizedBox(
                height: 44.h,
                child: ElevatedButton(
                  onPressed: isAvailable && !isProcessing ? onBuyNow : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    backgroundColor: isAvailable ? AppColors.pickabooBlue : AppColors.muted,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    elevation: 0,
                  ),
                  child: Text(
                    isAvailable ? 'BUY NOW' : 'STOCK OUT',
                    style: AppTypography.buttonPrimary.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
