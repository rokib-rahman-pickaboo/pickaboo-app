import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_info_section.dart';

class OrderPaymentSection extends StatelessWidget {
  final String paymentMethod;
  final String Function(String) formatPaymentMethod;

  const OrderPaymentSection({
    super.key,
    required this.paymentMethod,
    required this.formatPaymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    return OrderInfoSection(
      title: 'Payment Method',
      content: Text(
        formatPaymentMethod(paymentMethod),
        style: textStyles.bodyMedium.copyWith(color: colors.text),
      ),
    );
  }
}
