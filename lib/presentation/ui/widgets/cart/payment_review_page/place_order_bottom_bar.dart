// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/unified_checkout_bottom_bar.dart';

/// PlaceOrderBottomBar matching the unified checkout bottom bar design system
class PlaceOrderBottomBar extends StatelessWidget {
  final double total;
  final VoidCallback onPlaceOrder;

  const PlaceOrderBottomBar({
    super.key,
    required this.total,
    required this.onPlaceOrder,
  });

  @override
  Widget build(BuildContext context) {
    return UnifiedCheckoutBottomBar(
      trustText: 'Secure Checkout · Verified Sellers',
      trustIcon: Icons.verified_user_outlined,
      priceLabel: 'Order Total',
      totalPrice: total,
      buttonText: 'Place Order',
      onPressed: onPlaceOrder,
      footnote: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: () => context.push(Routes.terms),
          borderRadius: AppRadius.k8,
          child: Container(
            constraints: BoxConstraints(minHeight: 44.h),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "By placing order, I agree to Pickaboo's ",
                    style: AppTypography.bodySmall.size(11.5.sp),
                  ),
                  TextSpan(
                    text: "Terms & Conditions",
                    style: AppTypography.link.size(11.5.sp).semiBold(),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
