import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_info_section.dart';

class OrderShippingMethodSection extends StatelessWidget {
  final String shippingMethod;

  const OrderShippingMethodSection({super.key, required this.shippingMethod});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    return OrderInfoSection(
      title: 'Shipping Method',
      content: Text(
        shippingMethod,
        style: textStyles.bodyMedium.copyWith(color: colors.text),
      ),
    );
  }
}
