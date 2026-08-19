import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_info_section.dart';

class OrderAddressSection extends StatelessWidget {
  final ShippingAddressEntity? address;

  const OrderAddressSection({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    if (address == null) return const SizedBox.shrink();

    final colors = context.colors;
    final textStyles = context.textStyle;

    return OrderInfoSection(
      title: 'Shipping Address',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            address!.name,
            style: textStyles.bodyMediumBold.copyWith(color: colors.text),
          ),
          if (address!.mobile.isNotEmpty) ...[
            SizedBox(height: 4.h),
            Text(
              address!.mobile,
              style: textStyles.bodyMedium.copyWith(color: colors.text),
            ),
          ],
          if (address!.email.isNotEmpty) ...[
            SizedBox(height: 4.h),
            Text(
              address!.email,
              style: textStyles.bodyMedium.copyWith(color: colors.text),
            ),
          ],
          SizedBox(height: 4.h),
          Text(
            address!.address,
            style: textStyles.bodyMedium.copyWith(color: colors.text),
          ),
        ],
      ),
    );
  }
}
