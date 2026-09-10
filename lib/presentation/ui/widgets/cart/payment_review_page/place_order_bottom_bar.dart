// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_typography.dart';
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
      footnote: GestureDetector(
        onTap: () => context.push(Routes.terms),
        behavior: HitTestBehavior.opaque,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "By placing order, I agree to Pickaboo's ",
                style: AppTypography.bodyTiny,
              ),
              TextSpan(
                text: "Terms & Conditions",
                style: AppTypography.linkText.size(10.5.sp),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
