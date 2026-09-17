// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_info_section.dart';

/// Modern OrderShippingMethodSection matching Pickaboo-App-UI design language.
class OrderShippingMethodSection extends StatelessWidget {
  final String shippingMethod;

  const OrderShippingMethodSection({super.key, required this.shippingMethod});

  @override
  Widget build(BuildContext context) {
    return OrderInfoSection(
      title: 'Shipping Method',
      content: Row(
        children: [
          Icon(
            Icons.local_shipping_outlined,
            size: 18.sp,
            color: AppColors.pickabooBlue,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              shippingMethod,
              style: AppTypography.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
