// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

class FreeDeliveryCouponDialog extends StatelessWidget {
  final String couponCode;

  const FreeDeliveryCouponDialog({super.key, required this.couponCode});

  static Future<void> show(BuildContext context, {required String couponCode}) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => FreeDeliveryCouponDialog(couponCode: couponCode),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      backgroundColor: AppColors.white,
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(context),
              const Divider(height: 1),
              SizedBox(height: 24.h),
              _buildTitle(),
              SizedBox(height: 20.h),
              _buildCouponCodeBox(),
              SizedBox(height: 12.h),
              _buildSubtitle(),
              SizedBox(height: 24.h),
              _buildCopyButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Free Delivery',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.close, color: AppColors.text, size: 22.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Text(
        'To get the free delivery, collect your coupon here',
        textAlign: TextAlign.center,
        style: AppTypography.titleLarge.copyWith(
          color: AppColors.text,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildCouponCodeBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.pageBg,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.pageBg,
            width: 1.w,
            style: BorderStyle.solid,
          ),
        ),
        child: Text(
          couponCode,
          textAlign: TextAlign.center,
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.muted,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Text(
        'Redeem your free delivery by applying this code at checkout.',
        textAlign: TextAlign.center,
        style: AppTypography.bodySmall.copyWith(
          color: AppColors.muted,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildCopyButton(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: AppButton.primary(
        borderRadius: BorderRadius.circular(30.r),
        padding: EdgeInsets.symmetric(vertical: 14.h),
        icon: Icon(Icons.copy_rounded, color: AppColors.white, size: 20.sp),
        text: 'Copy Coupon Code',
        textStyle: AppTypography.bodyLarge.bold().copyWith(color: AppColors.white),
        onPressed: () {
          Clipboard.setData(ClipboardData(text: couponCode));
          SnackBarUtils.showPositive(context, 'Coupon code copied!');
        },
      ),
    );
  }
}
