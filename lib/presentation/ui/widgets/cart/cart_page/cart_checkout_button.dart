import 'package:flutter/material.dart';
import 'package:pickaboo/presentation/ui/widgets/common/unified_checkout_bottom_bar.dart';

/// CartCheckoutButton matching the unified checkout bottom bar design system
class CartCheckoutButton extends StatelessWidget {
  final double grandTotal;
  final VoidCallback onCheckout;

  const CartCheckoutButton({
    super.key,
    required this.grandTotal,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return UnifiedCheckoutBottomBar(
      trustText: '100% Safe & Secure Checkout',
      trustIcon: Icons.shield_outlined,
      priceLabel: 'Total Payable',
      totalPrice: grandTotal,
      buttonText: 'Checkout',
      onPressed: onCheckout,
    );
  }
}
