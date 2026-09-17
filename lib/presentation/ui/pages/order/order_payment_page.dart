import 'package:flutter/material.dart';
import 'package:pickaboo/presentation/ui/pages/cart/payment_method_page/payment_method_page.dart';

/// Compatibility wrapper redirecting to the unified [PaymentMethodPage].
/// Maintains single source of truth and prevents divergence between cart checkout
/// and order repayment flows.
class OrderPaymentPage extends StatelessWidget {
  final String? selectedMethod;
  final String? orderId;
  final double? grandTotal;
  final double? subtotal;
  final double? shippingAmount;
  final double? discountAmount;
  final int? itemsCount;
  final String? quoteId;

  const OrderPaymentPage({
    super.key,
    this.selectedMethod,
    this.orderId,
    this.grandTotal,
    this.subtotal,
    this.shippingAmount,
    this.discountAmount,
    this.itemsCount,
    this.quoteId,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentMethodPage(
      selectedMethod: selectedMethod,
      orderId: orderId,
      cartId: quoteId,
      grandTotal: grandTotal,
      subtotal: subtotal,
      shippingAmount: shippingAmount,
      discountAmount: discountAmount,
      itemsCount: itemsCount,
    );
  }
}
