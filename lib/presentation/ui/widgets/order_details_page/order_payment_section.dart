// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_info_section.dart';

/// Modern OrderPaymentSection matching Pickaboo-App-UI design language.
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
    return OrderInfoSection(
      title: 'Payment Method',
      content: Row(
        children: [
          Icon(
            Icons.payment_outlined,
            size: 18.sp,
            color: AppColors.pickabooBlue,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              formatPaymentMethod(paymentMethod),
              style: AppTypography.bodyRegular,
            ),
          ),
        ],
      ),
    );
  }
}
